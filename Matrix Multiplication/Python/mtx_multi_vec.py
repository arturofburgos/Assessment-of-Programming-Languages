# Undergraduate Student: Arturo Burgos
# Professor: João Rodrigo Andrade
# Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory - MFLab, Block 5P, Uberlândia, MG, Brazil


# Second exercise: Consider two arbitrary Matrix NxN - by a common loop


import numpy as np  # Here I'm importing the array/matrix module from python
import time  # Here I'm importing this python module in order to calculate the precise time that the function works



n = 1500 # The numbers of elements in each matrix dimension

A = np.random.randint(150, size = (n,n))  # Here I just import numpy to create an arbitrary matrix
B = np.random.randint(150, size = (n,n))

D = np.matmul(A,B) # Actual vectorizing function that does the same as the for loop below
R = np.zeros((n,n))


# i represents lines and j represents columns. k represents the line or column 11element11 indices

def multivec(mtx1, mtx2, z, mtx3):

    mtx3 = np.matmul(A,B)

    return mtx3

t_initial = time.time()  # I set here the initial time.
R = multivec(A, B, n, R)

print('\n')
print("--- %s seconds ---\n" % (time.time() - t_initial))

print("\n\nAre both results equal to each other?\n")
comparison = (R == D).all() # Here I verify if the R matrix is equal to D matrix
print(comparison)