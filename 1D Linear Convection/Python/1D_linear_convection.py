# Undergraduate Student: Arturo Burgos
# Professor: João Rodrigo Andrade
# Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory - MFLab, Block 5P, Uberlândia, MG, Brazil


# Fifth exercise: 1D Linear Convection

import numpy as np
import matplotlib.pyplot as plt



# First define the:

X = 5 # Length of the grid
nx = 81 # Number of nodes
dx = X/(nx-1) # The distance between consecutive nodes

nt = 100 # The elapsed time
dt = 0.025 # The amount of time each timestep cover

c = 1 # Wavespeed

# Initial velocity condition:
u = np.ones(nx)

u[int(0.5/dx):int(1/dx+1)] = 2

un = np.ones(nx)

plt.plot(np.linspace(0,2,nx),u)
plt.show() 

for n in range(nt):
    un = u.copy()
    for i in range(1,nx):
        u[i] = un[i] - c * (dt/dx) * (un[i]-un[i-1])

plt.plot(np.linspace(0,5,nx),u)
plt.show()    
