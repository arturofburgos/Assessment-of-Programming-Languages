# Undergraduate Student: Arturo Burgos
# Professor: João Rodrigo Andrade
# Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory - MFLab, Block 5P, Uberlândia, MG, Brazil


# Fifth exercise: txt File 


using Printf # Just the same as import a module
using Statistics
using CPUTime

x = collect(1:1:10000)

y = cos.(x)

#println(x)

#println(y)

t1 = time_ns()
@elapsed open("teste.txt","w") do io

    for i in x
        println(io,i)
    end

    for i in y
        println(io,i)
    end
    
end
t2 = time_ns()
timeo = (t2-t1)/1.0e9

println(timeo)



