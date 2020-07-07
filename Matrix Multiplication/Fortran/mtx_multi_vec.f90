program mtx_multi_loop_test

    !Undergraduate Student: Arturo Burgos
    !Professor: João Rodrigo Andrade
    !Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory
    !MFLab, Block 5P, Uberlândia, MG, Brazil


    implicit none !To avoid variable definition problems, checking if they are correctly defined
    real, DIMENSION(1500,1500) :: mtx1, mtx2, mtx3
    DOUBLE PRECISION :: start, finish
    
    call random_number(mtx1)
    call random_number(mtx2)


    call cpu_time(start)

    mtx3 = matmul(mtx1,mtx2)

    call cpu_time(finish)


    write(*,'(A/)') 
    print '("Elapsed time is: ",f6.5," seconds")', finish - start

end program mtx_multi_loop_test