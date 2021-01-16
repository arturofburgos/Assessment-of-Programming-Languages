# Undergraduate Student: Arturo Burgos
# Professor: João Rodrigo Andrade
# Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory - MFLab, Block 5P, Uberlândia, MG, Brazil


# Fourth exercise: Solving a Linear System --> ax = b

# Here I first set conditions

import numpy as np
from numpy import linalg as La
import matplotlib.pyplot as plt
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
    if (i+1)%6 != 0: # (i+1) because in Python we start from 0
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



def linearsystem(coeff,resul,size):

    # Initial x_k and x_k1 value

    x_k = np.zeros(size)
    x_k1 = np.ones(size)

    # Here I set the tolerance
    tolerance = 1e-9
    # Here I set the iterations
    ite = 0
  

    # Here I set the error based in the Infinite norm  
    erro = La.norm((x_k1 - x_k),np.inf)
    #erro = (x_k1 - x_k)/x_k1


    while (erro > tolerance): #
        for i in range(0,size):
        
            x_k1[i] = resul[i]

            for j in range(0,n):
                if j!=i:
                    x_k1[i] =  x_k1[i] - coeff[i,j]*x_k[j]


    
            x_k1[i] =  x_k1[i]/ coeff[i,i]


        #erro = (x_k1 - x_k)/x_k1
        erro = La.norm((x_k1 - x_k),np.inf)

        x_k = x_k1.copy()
        #x_k[:] = x_k1[:] # -> the same as above

        ite = ite + 1

    

    print('The number of iterations is: ')
    print(ite)
    print('\n')

    print('Note that now the error is not an array anymore, but is normalized :')
    print(erro)
    print('\n')

    return x_k1


t_initial = time.time()
res = linearsystem(a,b,n)
t_final = time.time()


print('The solution is:')
print(res)
print('\n')


print("\n\n--- %s seconds ---\n" % (t_final - t_initial))

# PLOT OF THE MATRIX

def samplemat(dims,bb):
    

    aa = np.zeros(dims)
    
    
    print(bb)

    aa = np.reshape(bb,(dims))

    
    return aa


# Display matrix
plt.matshow(samplemat((k, k),res))

plt.show()