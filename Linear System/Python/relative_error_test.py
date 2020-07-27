# Undergraduate Student: Arturo Burgos
# Professor: João Rodrigo Andrade
# Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory - MFLab, Block 5P, Uberlândia, MG, Brazil


# Fourth exercise: Solving a Linear System --> ax = b

# Here I first set conditions

import numpy as np
from numpy import linalg as lin
np.seterr(divide='ignore', invalid='ignore')

a = np.array([
    [-4, 1, 0, 1, 0, 0, 0, 0, 0],
    [1, -4, 1, 0, 1, 0, 0, 0, 0], 
    [0, 1, -4, 0, 0, 1, 0, 0, 0], 
    [1, 0, 0, -4, 1, 0, 1, 0, 0], 
    [0, 1, 0, 1, -4, 1, 0, 1, 0], 
    [0, 0, 1, 0, 1, -4, 0, 0, 1], 
    [0, 0, 0, 1, 0, 0, -4, 1, 0], 
    [0, 0, 0, 0, 1, 0, 1, -4, 1], 
    [0, 0, 0, 0, 0, 1, 0, 1, -4] 
    ])

print('The coefficient Matrix is:')
print(a)
print('\n')

b = np.array([-50, -50, -150, 0, 0, -100, -50, -50, -150])

print('The result Matrix is:')
print(b)
print('\n')

x_k = np.zeros(9)
x_k1 = np.ones(9)




# Here I set the tolerance

tolerance = 0.0000000001


# Here I set the iterations

ite = 0
  


# Here I set the error based in the relative error -> error array 

erro = np.ones(9)
erro = (x_k1 - x_k)/x_k1 # the relative error is not normalized so I must use .any() in order to compare with the tolerance

while (erro>tolerance).any() : # use this condition (erro.all()>tolerance) and you will see that the error array is wrong and also
    # the iteration counter gets a way bigger value
    for i in range(0,9):
        
        x_k1[i] = b[i]

        for j in range(0,9):

            if j!=i:

                x_k1[i] =  x_k1[i] - a[i,j]*x_k[j]


    
        x_k1[i] =  x_k1[i]/ a[i,i]

    erro = (x_k1 - x_k)/x_k1
    x_k = x_k1.copy()
    ite = ite + 1


print('The number of iterations is: ')
print(ite)
print('\n')

print('The solution is:')
print(x_k1)
print('\n')

print('The error array is given by:')
print(erro)
print('\n')


print(np.max(erro))