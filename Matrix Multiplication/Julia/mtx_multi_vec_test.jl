# Undergraduate Student: Arturo Burgos
# Professor: João Rodrigo Andrade
# Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory - MFLab, Block 5P, Uberlândia, MG, Brazil

using Printf # Just the same as import a module
using Statistics
using CPUTime

# A = rand(1:50,3,3)
# B = rand(1:50,3,3)

A = [1 2; 3 4]
println("\n\n\nThe A Matrix is: \n\n",A)

B = [1 2; 3 4]
println("\n\nThe B Matrix is: \n\n",B)

R = zeros(2,2) # Here I create a zero matrix just to get the multiply of A and B


D = A*B # This is the vectorized way for this problem, like MATLAB
C = A.*B # This multiplies point by point

println("\n\nThe D Matrix is: \n\n",D)
println("\n\nThe C Matrix is: \n\n",C)

# println("\n\n",D[:,1])


function multivec(mtx1,mtx2,mtx3)

    mtx3 = mtx1*mtx2

    return mtx3 # Returns a value to the variable
end


R = multivec(A,B,R);
println("\n\nThe R Matrix is: \n\n",R)
println("\n\n")

@time @CPUtime multivec(A,B,R)