# Pascal's Triangle (To Row 1000)

binom = {};
for n in range(0,1000):
    for k in range(0, n + 1):
        if k == 0 or k == n:
            binom[(n, k)] = 1
        else:
            binom[(n, k)] = binom[(n - 1, k)] + binom[(n - 1, k - 1)]
            
# Compute win probability
def prob(n, p):
    total = 0
    for x in range(0, n):
        total += ((1 - p) ** x) * binom[(n - 1 + x, x)]
    total *= (p ** n)
    return total 
