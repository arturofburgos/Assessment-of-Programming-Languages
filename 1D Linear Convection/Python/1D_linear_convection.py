# Undergraduate Student: Arturo Burgos
# Professor: João Rodrigo Andrade
# Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory - MFLab, Block 5P, Uberlândia, MG, Brazil


# Fifth exercise: 1D Linear Convection

import numpy as np
import matplotlib.pyplot as plt


# First define the:

X = 5 # Length of the grid
nx = 41 # Number of nodes
dx = X/(nx-1) # The distance between consecutive nodes

nt = 50 # The number of timesteps I want to calculate
dt = 0.05 # The amount of time each timestep cover

c = 1 # Wavespeed

# Initial velocity condition:
u = np.ones(nx)

u[int(0.5/dx):int(1/dx+1)] = 2

un = np.ones(nx) # Auxiliar array 


fig , ax = plt.subplots(figsize=(10 , 5),ncols=2)

ax[0].set_title('Wave velocity through time passing in a 1-D grid ')
ax[1].set_title('Comparing the wave in first and the last timestep')

ax[0].set_xlabel('Length of the grid')
ax[1].set_xlabel('Length of the grid')

ax[0].set_ylabel('Velocity u')
ax[1].set_ylabel('Velocity u')

ax[0].plot(np.linspace(0,5,nx),u)
ax[1].plot(np.linspace(0,5,nx),u)

for n in range(1,nt):
    un[:] = u[:]
    #un = u.copy()

    for i in range(1,nx):
        u[i] = un[i] - c * (dt/dx) * (un[i]-un[i-1])
    
    ax[0].plot(np.linspace(0,5,nx),u) # This shows what happens through time -> first plot only

ax[1].plot(np.linspace(0,5,nx),u) 
plt.show()

print('The velocity last timestep velocity values are: ')
print(u)    
