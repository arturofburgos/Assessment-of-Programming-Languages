from __future__ import print_function

import sys


#------------------------------
# Function: iterative_fibonacci
#------------------------------

def iterative_fibonacci(n):
    """
      Find the Fibonacci number of order n by iteration
    """
    if n < 2:
        return n
    previous_fibonacci = 1
    current_fibonacci = 1
    for num in range(2, n):
        previous_fibonacci, current_fibonacci = current_fibonacci, \
            current_fibonacci + previous_fibonacci
    return current_fibonacci

#------------------------------
# Function: recursive_fibonacci
#------------------------------

def recursive_fibonacci(n):
    """
      Find the Fibonacci number of order n by recursion
    """
    if n < 2:
        return n
    else:
        return recursive_fibonacci(n-1) + recursive_fibonacci(n-2)


if len(sys.argv) < 1:
    print('Usage:')
    print('     python ' + sys.argv[0] + ' N')
    print('Please specify the number of iterations.')
    sys.exit()





n1 = iterative_fibonacci(5)

n2 = recursive_fibonacci(25)

print(n2)