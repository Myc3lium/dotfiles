from sys import stdin

string = ('▁▂▃▄▅▆▇█' [:int(stdin.read()[:-2]) // 10])
print(string + ('_' * (8 - len(string))))
