# Undergraduate Student: Arturo Burgos
# Professor: João Rodrigo Andrade
# Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory - MFLab, Block 5P, Uberlândia, MG, Brazil


# Fourth exercise: Solving a Linear System --> ax = b

# Here I first set conditions

import numpy as np
from numpy import linalg as La
import time
np.seterr(divide='ignore', invalid='ignore')

print('\n')

n = 324
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


t_initial = time.time()
X = La.inv(a).dot(b)

t_final = time.time()


print(X)

print("\n\n--- %s seconds ---\n" % (t_final - t_initial))