import numpy as np
import matplotlib.pyplot as plt


def CFL_condition_sigma_nonlinear(nx):

    L = 2
    dx = L/(nx-1)
    nt = 20
    sigma = 0.5 # Experimente trocar o valor de sigma
    
    dt = sigma*dx
    
    
    
    
    u = np.ones(nx)


    u[int(0.5/dx):int(1/dx+1)] = 2 # Condição de Dirichlet

    plt.plot(np.linspace(0,2,nx),u)



    un = np.ones(nx)

    for n in range(nt):
        un = u.copy()
        for i in range(1,nx):
            u[i] = un[i] - un[i] * (dt/dx) * (un[i]-un[i-1])
  
        
    plt.plot(np.linspace(0,2,nx),u)
    plt.show()


CFL_condition_sigma_nonlinear(41)