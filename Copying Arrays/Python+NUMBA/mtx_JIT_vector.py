# Undergraduate Student: Arturo Burgos
# Professor: João Rodrigo Andrade
# Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory - MFLab, Block 5P, Uberlândia, MG, Brazil

# First exercise: Consider an arbitrary Matrix NxNx3 - vectorized

from numba import jit
import numpy as np
import time  # Here I import this python module in order to calculate the precise time that the function works

n = 5000  # The numbers of elements in each matrix dimension

A = np.random.rand(n, n, 3)  # Here I just import numpy to create an arbitrary matrix

print('The matrix is \n', A)
print('\n')
print('The element A[1][2][2] of the matrix is ', A[1][2][2])  # Here I certified that this number is in the right
# position according to the matrix A
print('\n')

# print(A[:][1][1])

# A[:][:][0] = A[1][:][1] # Here there is a big confusion: Apparently when I set the first row (A[0][...])
# A[:][:][2] = A[:][:][0] # It is the same as if I was doing like A[:][0][...] which doesn't make any sense
# So I already knew that there are two different ways to represent an multi-dimensional array: A[n,n,n] or A[n][n][n]
# And the strange thing is that only the

@jit(nopython=True) # Set "nopython" mode for best performance, equivalent to @njit
def vectorized(mtx):
    mtx[:, :, 0] = mtx[:, :, 1]
    mtx[:, :, 2] = mtx[:, :, 0]
    return mtx


t_initial = time.time()  # I set here the initial time.
A = vectorized(A)

print('\nThe new matrix is ')
print(A)

print('\n')
print("--- %s seconds with compilation---\n" % (time.time() - t_initial))

# First we compile the code, then now we execute from cache.

t_initial = time.time()  # I set here the initial time.
A = vectorized(A)
print("--- %s seconds after compilation---\n" % (time.time() - t_initial))