program file
    !==================================================================
    !Undergraduate Student: Arturo Burgos
    !Professor: João Rodrigo Andrade
    !Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory
    !MFLab, Block 5P, Uberlândia, MG, Brazil
    !==================================================================
    
    !This program will read the data in the txt file

    implicit none !To avoid variable definition problems, checking if they are correctly defined
    integer :: i
    real, DIMENSION(1000000) :: x,y
    DOUBLE PRECISION :: start, finish
    


    

    do i=1,1000000
        x(i) = i
    end do


    do i=1,1000000

        y(i)=cos(real(i))
    
    end do
  

    


    call cpu_time(start)
    open(5, file = 'file.txt') !Print in file.txt
    write(5,*) x
    write(*,'(A/)')
    write(5,*) y
    close(5)
    call cpu_time(finish)


    print *,'Elapsed time is:',finish - start
    
end program file