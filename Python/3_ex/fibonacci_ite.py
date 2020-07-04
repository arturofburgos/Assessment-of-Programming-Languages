# Undergraduate Student: Arturo Burgos
# Professor: João Rodrigo Andrade
# Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory - MFLab, Block 5P, Uberlândia, MG, Brazil


# Third exercise: Fibonacci sequence - by a common loop

import numpy as np
import time

n = int(input("Enter the n indices: "))
Fbn=0 # Value of the first box
A = 0 # Values of the second  
B = 1 # Value of the third box

##############################
# Variable iterative fibonacci  --> Better performance, why?
##############################


def varloop_fibonacci(k,F1,F2,S):

    for i in range(0,k):
        F1=S
        S = F1+F2
        F2 = F1

    return S

t_initial1 = time.time()
Fbn = varloop_fibonacci(n,A,B,Fbn)

print("Elapsed time is: %s seconds" % (time.time()-t_initial1))
print("The correspond indices number is: ",Fbn)

print("\n")

###########################
# Array iterative fibonacci  --> Worse performance, why?
###########################

Fbn=0 # Value of the first box
A = np.array([0, 1]) # Values of the second an third boxes 

def arrayloop_fibonacci(k,F,S):

    for i in range(0,k):
        F[0]=S
        S = sum(F)
        F[1] = F[0]
    return S

t_initial2 = time.time()
Fbn = arrayloop_fibonacci(n,A,Fbn)

print("Elapsed time is: %s seconds" % (time.time()-t_initial2))
print("The correspond indices number is: ",Fbn)
