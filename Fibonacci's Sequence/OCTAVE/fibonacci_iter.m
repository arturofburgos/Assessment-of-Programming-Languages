# Undergraduate Student: Arturo Burgos
# Professor: João Rodrigo Andrade
# Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory - MFLab, Block 5P, Uberlândia, MG, Brazil


# Third exercise: Fibonacci sequence - by a common loop
n = 9;
F(1) = 0;
F(2) = 1;
S = 0;

function R = loop_fibonacci(A,R,k)
    for i= 1:k
  
      A(1) = R;
      R = sum(A);
      A(2) = A(1);
  
  
     endfor

end

tic
S = loop_fibonacci(F,S,n)
toc
