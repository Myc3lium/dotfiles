from sys import stdin

vol = round(int(stdin.read()[:-2]), -1) // 10
print('[%s]' % ('=' * vol + '|' + ('--' * (10 - vol))))

