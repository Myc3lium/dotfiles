from sys import stdin

def getVol():
    return list(line for line in stdin)[0][:-2]

def cVol():
    vol = int(getVol()) // 10
    return '[' + '=' * vol + '|' + ('-' * (10 - vol)) + ']'

print(cVol(), end = '', flush = True)
