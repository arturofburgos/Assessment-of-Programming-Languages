# Undergraduate Student: Arturo Burgos
# Professor: João Rodrigo Andrade
# Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory - MFLab, Block 5P, Uberlândia, MG, Brazil

using Printf # Just the same as import a module
using Statistics
using CPUTime

A = rand(1:50,3,3,3)


println("\n\nThe A[1,1,1] is: ",A[1,1,1])
println("The A[1,1,2] is: ",A[1,1,2])
println("The A[1,1,3] is: ",A[1,1,3])
println("\n\nThe A[3,3,1] is: ",A[3,3,1])
println("The A[3,3,2] is: ",A[3,3,2])
println("The A[3,3,3] is: ",A[3,3,3])

function loop(mtx)

    for i = 1:3
        for j=1:3
            mtx[i, j, 1] = mtx[i, j, 2]
            mtx[i, j, 3] = mtx[i, j, 1]
        end
    end
    return mtx # retornar algo à variavel alocada, no caso "A"
end

A = loop(A)

println("\n\n\nThe new Matrix is: \n\n")

println("\n\nThe A[1,1,1] is: ",A[1,1,1])
println("The A[1,1,2] is: ",A[1,1,2])
println("The A[1,1,3] is: ",A[1,1,3])

println("\n\nThe A[3,3,1] is: ",A[3,3,1])
println("The A[3,3,2] is: ",A[3,3,2])
println("The A[3,3,3] is: ",A[3,3,3])

@time @CPUtime loop(A)