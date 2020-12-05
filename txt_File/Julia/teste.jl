using Printf # Just the same as import a module
using Statistics
using CPUTime

x = collect(1:0.1:100)

y = cos.(x)

println(x)

println(y)

open("teste.txt","w") do io

    
    println(io,x)
    

    for i in y
        println(io,i)
    end
    
end

