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

# i represents lines and j represents columns. k represents
# the line or column 11element11 indices

function multiloop(mtx1,mtx2,mtx3)

    for i = 1:n
        for j = 1:n
            soma = 0;
            for k = 1:n
                soma = soma + mtx1[i,k]*mtx2[k,j];
                mtx3[i,j] = soma;
            end
        end
    end
    return mtx3 # Returns a value to the variable
end

R = multiloop(A,B,R);
# println("\n\nThe R Matrix is: \n\n",R) # Compare with low n values

println("\n")

@time @CPUtime multiloop(A,B,R)
# Test done!