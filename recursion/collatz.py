def collatz(n):
    if n == 1:
        return 0 
    elif n % 2 == 0:
        return collatz(n / 2) + 1
    else:
        return collatz(3 * n + 1) + 1

print(collatz(27))