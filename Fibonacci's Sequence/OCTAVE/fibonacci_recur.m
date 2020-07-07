# Undergraduate Student: Arturo Burgos
# Professor: João Rodrigo Andrade
# Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory - MFLab, Block 5P, Uberlândia, MG, Brazil


# Third exercise: Fibonacci sequence - by a recursive function
n = 50;

S = 0;

function R = recursive_fibonacci(k)
  if k<=2 # After all, the sequence truly start at two
    R = 1;

  else
    R = recursive_fibonacci(k-1) + recursive_fibonacci(k-2);
  end
end

tic
S = recursive_fibonacci(n)
toc