# Undergraduate Student: Arturo Burgos
# Professor: João Rodrigo Andrade
# Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory - MFLab, Block 5P, Uberlândia, MG, Brazil


# Fourth exercise: Solving a Linear System --> ax = b



using Printf # Just the same as import a module
using Statistics
using LinearAlgebra # Import this module to use the norm function
using CPUTime

n = 144
k = Int32(sqrt(144)) 


# Here I set the A matrix



a = rand([0,0],(n,n))

for i = 1:n
  for j = 1:n
    if i==j

      a[i,j] = -4
    
      elseif i == (j-3) || i == (j+3)

        a[i,j] = 1

      elseif (mod(i,3) != 0 && j == (i+1)) 

        a[i,j] = 1

      elseif (mod(i,3) != 1 && j == (i-1))

        a[i,j] = 1
    
      end
  end
end



# Here I set the b matrix   

b = ones(n)


for i = 1:k
  if  i < k

    b[i] = -50

  else

    b[i] = -150
  
  end
end


for i = k+1:n-k
  if i%k != 0
    
    b[i] = 0
  
  else
    
    b[i] = -100
  
  end
end

for i = n-k+1:n
  if  i < n

    b[i] = -50
  
  else
  
    b[i] = -150
  
  end
end 

println("\n")

println("The B matrix is: ")
println(b)

R = zeros(n)

function  linearsystem(a,b,x_k1)
  # Initial x_k and x_k1 value
  x_k = zeros(n)

  x_k1 = ones(n)

  # Here I set the tolerance

  e = 1e-9



  # Here I set the iterations 
  ite = 0


  # Here I set the error based in the Infinite norm
  #erro = (x_k1 - x_k)/x_k1; # ---> Why the relative error has the same result? 
  global erro = norm((x_k1 - x_k),Inf)



  while erro>e
    for i = 1:n
    
      global x_k1[i] = b[i]
    
      for j = 1:n
        if j != i

          global x_k1[i] =  x_k1[i] - a[i,j]*x_k[j]
    
        end
      end
    
    
  
      global x_k1[i] = x_k1[i]/a[i,i]
  
    end
 
    global erro = norm((x_k1 - x_k),Inf)
    global x_k[:] = x_k1[:]

    ite = ite + 1

  end

  return x_k1

end

R = linearsystem(a,b,R);
println("\n\nThe R Matrix is: \n\n",R)
println("\n\n")

@time @CPUtime linearsystem(a,b,R)



    
