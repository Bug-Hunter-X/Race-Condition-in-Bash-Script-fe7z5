#!/bin/bash

# This script demonstrates a race condition bug.

count=0

# Function to increment the counter
increment_counter() {
  local new_count=$((count + 1))
  count=$new_count
}

# Function to print the counter
print_counter() {
  echo "Counter: $count"
}

# Create two processes to increment and print the counter simultaneously
(increment_counter; increment_counter; print_counter) &
(increment_counter; increment_counter; print_counter) &
wait

# Expected output: 4, But it might show incorrect output because of race conditions