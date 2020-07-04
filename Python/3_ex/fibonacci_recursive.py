# Undergraduate Student: Arturo Burgos
# Professor: João Rodrigo Andrade
# Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory - MFLab, Block 5P, Uberlândia, MG, Brazil


# Third exercise: Fibonacci sequence - by a common loop

#####################
# Recursive fibonacci  --> Here I call the function itself in the same function
#####################

import time


n = int(input("Enter the n indices: "))



def recur_fibonacci(k):
    """
      Find the Fibonacci number of order n by recursion
    """
    if k < 2:
        return k
    else:
        return recur_fibonacci(k-1) + recur_fibonacci(k-2)

initial_time = time.time()
Fbn = recur_fibonacci(n)

print("The elapsed time is: %s seconds" % (time.time()-initial_time))
print("The correspond indices number is: ",Fbn)

