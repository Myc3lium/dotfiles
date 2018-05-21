#!/bin/bash

clear && screenfetch && python3 -c "print('\t'*5, end = '');[print('\x1b[48;5;{}m    \x1b[0m'.format(i), end = '') for i in range(8)];print();print('\t'*5, end = '');[print('\x1b[48;5;{}m    \x1b[0m'.format(i), end = '') for i in range(8, 16)];print()"
