import numpy as np
from numpy import linalg as La
import matplotlib.pyplot as plt
import time

n =225
K = np.sqrt(n)
k = int(K)


# Here I set the Matrix

a = np.zeros((n,n))


for i in range(n):
    for j in range(n):
        if i == j:
            a[i,j] = -4
        elif i == j-3 or i ==j+3:
            a[i,j] = 1
        elif ((i+1) % 3 != 0 and i == j-1) or ((i+1) % 3 != 1 and i == j+1): # (i+1) because in Python we start from 0
            a[i,j] = 1


print('The coefficient Matrix is:')
print(a)
print('\n')
        

b = np.zeros(n)


for i in range(k):
    if i < k-1: # (k-1) because in Python we start from 0
        b[i] = -50
    else:
        b[i] = -150

for i in range(k,n-k):
    if (i+1)%k != 0: # (i+1) because in Python we start from 0
        b[i] = 0
    else:
        b[i] = -100

for i in range(n-k,n):
    if i < n-1: # (k-1) because in Python we start from 0
        b[i] = -50
    else:
        b[i] = -150

print('The result Matrix is:')
print(b)
print('\n')