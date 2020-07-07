# Undergraduate Student: Arturo Burgos
# Professor: João Rodrigo Andrade
# Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory - MFLab, Block 5P, Uberlândia, MG, Brazil


# Second exercise: Consider two arbitrary Matrix NxN - by a common loop

from numba import jit
import numpy as np  # Here I'm importing the array/matrix module from python
import time  # Here I'm importing this python module in order to calculate the precise time that the function works



n = 2  # The numbers of elements in each matrix dimension

A = np.random.randint(5, size = (n,n))  # Here I just import numpy to create an arbitrary matrix
B = np.random.randint(5, size = (n,n))

D = np.matmul(A,B) # Actual vectorizing function that does the same as the for loop below
R = np.zeros((n,n))

print('The matrix A is \n', A)
print('\n')
print('The matrix B is \n', B)
print('\n')
print('The matrix D is \n', D) # Print on the screen the result of the regular matmul function
# to compare both results
print('\n')

# i represents lines and j represents columns. k represents the line or column 11element11 indices

@jit(nopython=True)
def multiloop(mtx1, mtx2, z, mtx3):
    for i in range(z):
        for j in range(z):
            soma = 0
            for k in range(z):
                soma = soma + mtx1[i, k]*mtx2[k, j]
                mtx3[i, j] = soma
    # def ex1(mtx, k):
    #   for i in range(k):
    #       for j in range(z):
    #           soma = 0
    #           for k in range(z):
    #               soma = soma + mtx1[i, k]*mtx2[k, j]
    #               soma = soma + mtx1[i][k]*mtx2[k][j]
    #               mtx3[i][j] = soma


    return mtx3

t_initial = time.time()  # I set here the initial time.
R = multiloop(A, B, n, R)

print('\nThe result matrix of the multiplication is ')
print(R)

print('\n')
print("--- %s seconds ---\n" % (time.time() - t_initial))
print('\n')
# First we compile the code, then now we execute from cache.

t_initial = time.time()  # I set here the initial time.
R = multiloop(A, B, n, R)
print("--- %s seconds after compilation---\n" % (time.time() - t_initial))