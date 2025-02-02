#!/bin/bash

# This script demonstrates a solution to the race condition bug using a lock file.

count=0
lock_file="count.lock"

# Function to increment the counter
increment_counter() {
  flock $lock_file
  local new_count=$((count + 1))
  count=$new_count
  echo "Counter incremented to: $count" >> lock_file
flock -u $lock_file
}

# Function to print the counter
print_counter() {
  flock $lock_file
  echo "Counter: $count"
flock -u $lock_file
}

# Create two processes to increment and print the counter simultaneously
(increment_counter; increment_counter; print_counter) &
(increment_counter; increment_counter; print_counter) &
wait
rm -f $lock_file

# Expected output: 4