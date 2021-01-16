import matplotlib.pyplot as plt
import numpy as np


def samplemat(dims):
    

    aa = np.zeros(dims)
    b  = np.random.randn(1,324)
    
    print(b)

    aa = np.reshape(b,(dims))

    
    return aa


# Display matrix
plt.matshow(samplemat((18, 18)))

plt.show()

