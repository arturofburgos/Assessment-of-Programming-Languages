# Undergraduate Student: Arturo Burgos
# Professor: João Rodrigo Andrade
# Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory - MFLab, Block 5P, Uberlândia, MG, Brazil

using Printf # Just the same as import a module
using Statistics
using CPUTime # Look for Pkg.add("CPUTime")


println("Choose a N value: ")
N = chomp(readline()) # Here I get the char from the user
n = parse(Int32,N)  # Here I convert the char into an integer(32bits)

A = rand(1:20000,n,n,3)

println("\n\nThe A[1,1,1] is: ",A[1,1,1])
println("\nThe A[1,1,2] is: ",A[1,1,2])
println("\nThe A[1,1,3] is: ",A[1,1,3])
println("\n\nThe A[n,n,1] is: ",A[n,n,1])
println("The A[n,n,2] is: ",A[n,n,2])
println("The A[n,n,3] is: ",A[n,n,3])

function vectorized(mtx)

    mtx[:, :, 1] = mtx[:, :, 2]
    mtx[:, :, 3] = mtx[:, :, 1]
    sleep(1)
    return mtx # retornar algo à variavel alocada, no caso "A"
end

A = vectorized(A)

println("\n\nThe new A[1,1,1] is: ",A[1,1,1])
println("\nThe new A[1,1,2] is: ",A[1,1,2])
println("\nThe new A[1,1,3] is: ",A[1,1,3])
println("\n\nThe A[n,n,1] is: ",A[n,n,1])
println("The A[n,n,2] is: ",A[n,n,2])
println("The A[n,n,3] is: ",A[n,n,3])

@time @CPUtime vectorized(A)

# @time, @elapsed, time_ns() ,time()