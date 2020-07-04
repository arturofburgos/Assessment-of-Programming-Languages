# Undergraduate Student: Arturo Burgos
# Professor: João Rodrigo Andrade
# Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory - MFLab, Block 5P, Uberlândia, MG, Brazil


# Third exercise: Fibonacci sequence - by a common loop

import numpy as np
import time
n(1) = 1
x = np.zeros(35)
x[0] = 1
x[1] = 1

i = 1
print(x)
print(len(x))


while i<30:
    i=i+1
    x[i] = x[i-1] + x[i-2]

print(x)


return n(i-1)