#!/bin/bash

echo "$(curl wttr.in/Stafford?0T)" | python3 -c "
from sys import stdin;
lines = [line [15 :].rstrip().lstrip() for line in stdin.read().split('\n') [2 :-1]]
print(' '.join(lines))
"

