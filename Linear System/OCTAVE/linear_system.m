# Undergraduate Student: Arturo Burgos
# Professor: João Rodrigo Andrade
# Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory - MFLab, Block 5P, Uberlândia, MG, Brazil

clear all;
clc;

# Fourth exercise: Solving a Linear System --> ax = b

# Here I first set conditions

clear all
clc
n = 9
k = sqrt(n)
a = zeros(n,n);
b = zeros(1,n);


# Initial x_k and x_k1 value

x_k = zeros(1,n);
x_k1 = ones(1,n);


# Here I set the Matrix A

for i = 1:n
  
  for j = 1:n
    
    if i==j
      a(i,j)=-4;
      elseif i==j-3||i==j+3
        a(i,j)=1;
      elseif mod(i,3)!=0 && j==i+1
        a(i,j)=1;
      elseif mod(i,3)!=1 && j==i-1
        a(i,j)=1;
    else
      a(i,j)=0;
    endif
        
  endfor
  
endfor

a


# Here I set the b matrix 

for i = 1:k
    if  i<k
      b(i) = -50;
    elseif
      b(i)=-150;
    
    endif
  endfor
  
for i = k+1:n-k
    if mod(i,k)!=0
      b(i) = 0;
    elseif
      b(i) = -100;
    endif
  endfor

for i = n-k+1:n
    if  i<n
      b(i) = -50;
    elseif
      b(i)=-150;
    
    endif
  endfor  
b

x_k
x_k1

# Here I set the tolerance
e = 1e-10;
# Here I set the iterations
ite = 0;
  

# Here I set the error based in the Infinite norm  
#erro = (x_k1 - x_k)/x_k1; # ---> Why the relative error has the same final result? 
erro = norm((x_k1 - x_k),inf);
  
tic
while erro > e #|| iterations <100
  for i = 1:n
    
    x_k1(i) = b(i);
    
    for j = 1:n
      if j!=i
    
        x_k1(i) =  x_k1(i) - a(i,j)*x_k(j);
        
      endif
    endfor
    
 
    x_k1(i) = x_k1(i)/a(i,i);
  
  endfor
 
  erro = norm((x_k1 - x_k),inf);
  x_k = x_k1;
  ite = ite +1;

endwhile
toc

fprintf("the number of iterations of the system is: ");
disp(ite);
disp(x_k1);
