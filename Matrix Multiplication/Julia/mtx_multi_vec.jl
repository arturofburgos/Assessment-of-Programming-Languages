# Undergraduate Student: Arturo Burgos
# Professor: João Rodrigo Andrade
# Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory - MFLab, Block 5P, Uberlândia, MG, Brazil

using Printf # Just the same as import a module
using Statistics
using CPUTime

println("Choose a N value: ")
N = chomp(readline()) # Here I get the char from the user
n = parse(Int32,N)  # Here I convert the char into an integer(32bits)

A = rand(1:200,n,n);
B = rand(1:200,n,n);

D = A*B; # This is the vectorized way for this problem, like MATLAB
C = A.*B; # This multiplies point by point

R = zeros(n,n) # Here I create a zero matrix just to get the multiply of A and B

# println("\n\nThe D Matrix is: \n\n",D) # Compare with low n values 


function multivec(mtx1,mtx2,mtx3)

    mtx3 = mtx1*mtx2

    return mtx3 # Returns a value to the variable
end


R = multivec(A,B,R);
# println("\n\nThe R Matrix is: \n\n",R) # Compare with low n values

println("\n")

@time @CPUtime multivec(A,B,R)
# Test done!