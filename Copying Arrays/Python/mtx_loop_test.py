# Undergraduate Student: Arturo Burgos
# Professor: João Rodrigo Andrade
# Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory - MFLab, Block 5P, Uberlândia, MG, Brazil

# First exercise: Consider an arbitrary Matrix NxNx3 - by a common loop


import numpy as np  # Here I'm importing the array/matrix module from python
import time  # Here I'm importing this python module in order to calculate the precise time that the function works



n = 3  # The numbers of elements in each matrix dimension

A = np.random.rand(n, n, 3)  # Here I just import numpy to create an arbitrary matrix

print('The matrix is \n', A)
print('\n')
print('The element A[1][1][1] of the matrix is ', A[0][0][0])
print('The element A[1][1][2] of the matrix is ', A[0][0][1])
print('The element A[1][1][3] of the matrix is ', A[0][0][2])
print('The element A[1][2][1] of the matrix is ', A[0][1][0])
print('The element A[1][2][2] of the matrix is ', A[0][1][1])
print('The element A[1][2][3] of the matrix is ', A[0][1][2])
print('The element A[n][n][2] of the matrix is ', A[2][2][1])
print('The element A[n][n][3] of the matrix is ', A[2][2][2])# Here I certified that this number is in the right
# position according to the matrix A
print('\n')


def loop(mtx, k):
    for i in range(k):
        for j in range(k):
            mtx[i][j][0] = mtx[i][j][1]  # It took more time in function way than just mtx[i, j, n], why?
            mtx[i][j][2] = mtx[i][j][0]
    # def ex1(mtx, k):
    #   for i in range(k):
    #       for j in range(k):
    #           mtx[i, j, 0] = mtx[i, j, 1]
    #           mtx[i, j, 2] = mtx[i, j, 0]

    return mtx

t_initial = time.time()  # I set here the initial time.
A = loop(A, n)

print('\nThe new matrix is ')
print(A)

print('\n')
print("--- %s seconds ---\n" % (time.time() - t_initial))

# Write the 3D array to disk
with open('mtx_loop_test.txt', 'w') as outfile:
    # Here I'm writing the header just to sake of readability Any line starting with "#" will
    # be ignored by numpy.loadtxt
    outfile.write('# Array shape: {0}\n'.format(A.shape))
    outfile.write('# Sample with n = 3\n')
    # Iterating through a n-dimensional array produces slices along the last axis.
    # It is the same as data[i,:,:] in this case
    for data_slice in A:
        # The formatting string indicates that I'm writing out the values in left-justified
        # columns 7 characters in width with 2 decimal places.
        np.savetxt(outfile, data_slice, fmt='%-7.2f')

        # Writing out a break to indicate different slices...
        outfile.write('# New slice\n')
print(np.loadtxt('mtx_loop_test.txt'))

print(A[0, 0, 0])
print(A[0, 0, 1])
print('The element A[1][1][1] of the matrix is ', A[0][0][0])
print('The element A[1][1][2] of the matrix is ', A[0][0][1])
print('The element A[1][1][3] of the matrix is ', A[0][0][2])
print('The element A[n][n][1] of the matrix is ', A[2][2][0])
print('The element A[n][n][2] of the matrix is ', A[2][2][1])
print('The element A[n][n][3] of the matrix is ', A[2][2][2])