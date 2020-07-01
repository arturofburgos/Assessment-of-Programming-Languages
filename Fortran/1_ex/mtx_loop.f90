program mtx_loop

    !Undergraduate Student: Arturo Burgos
    !Professor: João Rodrigo Andrade
    !Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory
    !MFLab, Block 5P, Uberlândia, MG, Brazil

    !This program will read the data in the txt file

    implicit none !To avoid variable definition problems, checking if they are correctly defined
    integer :: i, j
    real, DIMENSION(5000,5000,3) :: mtx
    DOUBLE PRECISION :: start, finish

    call random_number(mtx)

    write(*,'(A/)') 
    print *,'the mtx(1,1,1) now is: ', mtx(1,1,1)
    print *,'the mtx(1,1,2) now is: ', mtx(1,1,2)
    print *,'the mtx(1,1,3) now is: ', mtx(1,1,3)
    print *,'the mtx(n,n,1) now is: ', mtx(5000,5000,1)
    print *,'the mtx(n,n,2) now is: ', mtx(5000,5000,2)
    print *,'the mtx(n,n,3) now is: ', mtx(5000,5000,3)
    write(*,'(//A/)')

    call cpu_time(start)

    do i = 1,5000

        do j =1,5000
            
            mtx(i, j, 1) = mtx(i, j, 2)
            mtx(i, j, 3) = mtx(i, j, 1)

        end do

    end do

    call cpu_time(finish)

    write(*,'(A/)') 
    print *,'the mtx(1,1,1) now is: ', mtx(1,1,1)
    print *,'the mtx(1,1,2) now is: ', mtx(1,1,2)
    print *,'the mtx(1,1,3) now is: ', mtx(1,1,3)
    print *,'the mtx(n,n,1) now is: ', mtx(5000,5000,1)
    print *,'the mtx(n,n,2) now is: ', mtx(5000,5000,2)
    print *,'the mtx(n,n,3) now is: ', mtx(5000,5000,3)
    write(*,'(A/)') 
    print '("Time of operation is: ",f6.5," seconds")', finish - start


end program mtx_loop