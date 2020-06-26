program mtx_vector_test

    !Undergraduate Student: Arturo Burgos
    !Professor: João Rodrigo Andrade
    !Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory
    !MFLab, Block 5P, Uberlândia, MG, Brazil

    !This program will read the data in the txt file

    implicit none !To avoid variable definition problems, checking if they are correctly defined
    integer :: i, j
    real, DIMENSION(3,3,3) :: mtx
    DOUBLE PRECISION :: start, finish

    call random_number(mtx)


    print *, 'The random matrix is : '

    do i = 1,3
        do j = 1,3
            
            write(*,3) mtx(i,j,:)
            3 format(3f20.4)
            
        end do 
        write (*,4) '---------- New Slice ----------'
        4 format(a52)
    end do

    write(*,'(A/)') 
    print *,'the mtx(1,1,1) is: ', mtx(1,1,1)
    print *,'the mtx(1,1,2) is: ', mtx(1,1,2)
    write(*,'(//A/)')

    call cpu_time(start)
               
    mtx(:, :, 1) = mtx(:, :, 2)
    mtx(:, :, 3) = mtx(:, :, 1)

    call cpu_time(finish)

    print *, 'The new matrix is : '

    do i = 1,3
        do j = 1,3
            
            write(*,6) mtx(i,j,:)
            6 format(3f20.4)
            
        end do 
        write (*,7) '---------- New Slice ----------'
        7 format(a52)
    end do

    write(*,'(A/)') 
    print *,'the mtx(1,1,1) now is: ', mtx(1,1,1)
    print *,'the mtx(1,1,2) now is: ', mtx(1,1,2)
    write(*,'(A/)') 
    print '("Time of operation is: ",f6.5," seconds")', finish - start


    open(5, file = 'mtx_loop_test.txt') !Print in file.txt
    write(5,*) mtx(:,:,:)

end program mtx_vector_test