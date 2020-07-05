# Undergraduate Student: Arturo Burgos
# Professor: João Rodrigo Andrade
# Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory - MFLab, Block 5P, Uberlândia, MG, Brazil


# Third exercise: Fibonacci sequence - by a common loop

import numpy as np
import time
from numba import jit

n = int(input("Enter the n indices: "))
Fbn=0 # Value of the first box
A = 0 # Values of the second  
B = 1 # Value of the third box

##############################
# Variable iterative fibonacci  --> Better performance, why?
##############################

@jit(nopython=True)
def varloop_fibonacci(k,F1,F2,S):

    for i in range(0,k):
        F1=S
        S = F1+F2
        F2 = F1

    return S

t_initial1 = time.time()
Fbn = varloop_fibonacci(n,A,B,Fbn)

print('\n')
print("--- %s seconds ---\n" % (time.time() - t_initial1))
print("The correspond indices number is: ",Fbn)
print('\n')
Fbn=0
t_initial = time.time()  # I set here the initial time.
Fbn = varloop_fibonacci(n,A,B,Fbn)
print("--- %s seconds after compilation---\n" % (time.time() - t_initial1))
print("The correspond indices number is: ",Fbn)

