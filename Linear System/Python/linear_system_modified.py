# Undergraduate Student: Arturo Burgos
# Professor: João Rodrigo Andrade
# Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory - MFLab, Block 5P, Uberlândia, MG, Brazil


# Fourth exercise: Solving a Linear System --> ax = b

# Here I first set conditions

import numpy as np
from numpy import linalg as lin
np.seterr(divide='ignore', invalid='ignore')

print('\n')

# Basic definitions
initialLineValue = 0
initialColumnValue = 0

pointsAmount = 9
pointsRoot = int(np.sqrt(pointsAmount))
#K = np.sqrt(pointsAmount)
#k = int(K)

# Initial x_k = old and x_k1 = current value
old = 0
current = 1

valuesVector = np.zeros((2,pointsAmount))

valuesVector[old] = np.zeros(pointsAmount)
valuesVector[current] = np.ones(pointsAmount)

# Here I set the Matrix

indexMatrix = np.zeros((pointsAmount, pointsAmount))

for matrixRow in range(initialLineValue, pointsAmount):
    for matrixCol in range(initialLineValue, pointsAmount):
        if matrixRow == matrixCol:
            indexMatrix[matrixRow, matrixCol] = -4
        elif matrixRow == matrixCol - 3 or matrixRow ==matrixCol + 3:
            indexMatrix[matrixRow, matrixCol] = 1
        elif ((matrixRow + 1) % 3 != 0 and matrixRow == matrixCol - 1) or ((matrixRow + 1) % 3 != 1 and matrixRow == matrixCol + 1): # (i+1) because in Python we start from 0
            indexMatrix[matrixRow, matrixCol] = 1

print('The coefficient Matrix is:')
print(indexMatrix)
print('\n')
        


resultMatrix = np.zeros(pointsAmount)


for matrixRow in range(initialLineValue, pointsRoot):
    if matrixRow < pointsRoot - 1: # (k-1) because in Python we start from 0
        resultMatrix[matrixRow] = -50
    else:
        resultMatrix[matrixRow] = -150

for matrixRow in range(pointsRoot, pointsAmount - pointsRoot):
    if (matrixRow + 1) % 6 != 0: # (i+1) because in Python we start from 0
        resultMatrix[matrixRow] = 0
    else:
        resultMatrix[matrixRow] = -100

for matrixRow in range(pointsAmount - pointsRoot, pointsAmount):
    if matrixRow < pointsAmount - 1: # (k-1) because in Python we start from 0
        resultMatrix[matrixRow] = -50
    else:
        resultMatrix[matrixRow] = -150

print('The result Matrix is:')
print(resultMatrix)
print('\n')



# Here I set the tolerance
tolerance = 0.0000001
# Here I set the iterations
iterationsCounter = 0
  


# Here I set the error based in the Infinite norm  
error = (valuesVector[current] - valuesVector[old]) / valuesVector[current]

while error.all() > tolerance:
    for matrixRow in range(initialLineValue, pointsAmount):
        
        #x_k1[i] = b[i].copy()
        valuesVector[current][matrixRow] = resultMatrix[matrixRow]

        for matrixCol in range(initialColumnValue, pointsAmount):
            if(matrixCol != matrixRow):
                valuesVector[current][matrixRow] = valuesVector[current][matrixRow] - indexMatrix[matrixRow, matrixCol] * valuesVector[old][matrixCol]
        #x_k1[i] =  x_k1[i].copy() / a[i,i].copy()
        valuesVector[current][matrixRow] = valuesVector[current][matrixRow] / indexMatrix[matrixRow, matrixRow]

    error = (valuesVector[current] - valuesVector[old]) / valuesVector[current]
    valuesVector[old] = valuesVector[current]
    iterationsCounter = iterationsCounter + 1


print('The number of iterations is: ')
print(iterationsCounter)

print('The solution is:')
print(valuesVector[current])