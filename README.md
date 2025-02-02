# Race Condition Bug in Bash

This repository demonstrates a race condition bug in a simple bash script.  The script uses a shared variable (`count`) that is incremented by two concurrent processes.  Due to the race condition, the final value of the counter may not be the expected value (4 in this case). This showcases a common concurrency issue in shell scripting.

## How to reproduce

1. Clone this repository.
2. Run `./bug.sh`.
3. Observe that the output is not always 4, demonstrating the unpredictable nature of the race condition.

## Solution

The solution involves using appropriate synchronization mechanisms (like locks) to ensure that only one process can access and modify the shared variable at a time. The solution is provided in the `bugSolution.sh` file.