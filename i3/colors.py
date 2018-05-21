#!/usr/bin/python3

(
    print('\n  ', end = ''),
    [print('\x1b[48;5;{}m    \x1b[0m\x1b[38;5;{}m▄\x1b[0m  '.format(i, i+8), end = '') for i in range(8)],
     print('\n  ', end = ''),
    [print('\x1b[48;5;{}m    \x1b[48;5;{}m \x1b[0m  '.format(i, i+8), end = '') for i in range(8)],
     print('\n  ', end = ''),
    [print('\x1b[38;5;{}m▝▀▀▀▀\x1b[0m  '.format(i), end = '') for i in range(8, 16)],
     print()

)

