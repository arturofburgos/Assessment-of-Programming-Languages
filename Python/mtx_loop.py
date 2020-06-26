# Undergraduate Student: Arturo Burgos
# Professor: João Rodrigo Andrade
# Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory - MFLab, Block 5P, Uberlândia, MG, Brazil

# First exercise: Consider an arbitrary Matrix NxNx3 - vectorized


import numpy as np  # Here I import the array/matrix module from python
import time  # Here I import this python module in order to calculate the precise time that the function works



n = 5000  # The numbers of elements in each matrix dimension

A = np.random.rand(n, n, 3)  # Here I just import numpy to create an arbitrary matrix

print('The matrix is \n', A)
print('\n')
print('The element A[1][2][2] of the matrix is ', A[1][2][2])  # Here I certified that this number is in the right
# position according to the matrix A
print('\n')


def loop(mtx, k):
    for i in range(k):
        for j in range(k):
            mtx[i, j, 0] = mtx[i, j, 1]
            mtx[i, j, 2] = mtx[i, j, 0]

    return mtx

t_initial = time.time()  # I set here the initial time.
A = loop(A, n)
print('\n')
print("--- %s seconds ---" % (time.time() - t_initial))
print('\nThe new matrix is ')
print(A)

