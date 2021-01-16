import numpy as np
from numpy import linalg as La
import matplotlib.pyplot as plt
import time




def samplemat(dims):
    """Make a matrix with all zeros and increasing elements on the diagonal"""
    n = 9
    K = np.sqrt(n)
    k = int(K)


    a = np.random.rand(1,n)

    print(a)

    b = np.reshape(a,(k,k))

    print(b)

plt.matshow(samplemat((3, 3)))

plt.show()