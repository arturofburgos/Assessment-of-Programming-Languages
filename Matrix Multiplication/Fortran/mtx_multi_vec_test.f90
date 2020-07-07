program mtx_multi_vec_test

    !Undergraduate Student: Arturo Burgos
    !Professor: João Rodrigo Andrade
    !Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory
    !MFLab, Block 5P, Uberlândia, MG, Brazil


    implicit none !To avoid variable definition problems, checking if they are correctly defined
    integer :: i
    real, DIMENSION(3,3) :: mtx1, mtx2, mtx3, mtx4, mtx5
    DOUBLE PRECISION :: start, finish
    
    call random_number(mtx1)
    call random_number(mtx2)
    

    !Here I initialize the first matrix
    print *, 'The random mtx1 matrix is : '

    write (*,1) '---------------- New Slice ------------------'
    1 format(a47)

    do i = 1,3
                    
        print*, mtx1(i,:)  
        
    end do

    write (*,2) '---------------- New Slice ------------------'
    2 format(a47)
    
    write(*,'(//A//)')

    !Here I initialize the second matrix
    print *, 'The random mtx2 matrix is : '

    write (*,3) '---------------- New Slice ------------------'
    3 format(a47)

    do i = 1,3
                    
        print*, mtx2(i,:)  
        
    end do

    write (*,4) '---------------- New Slice ------------------'
    4 format(a47)


    write(*,'(////A///)')


    !Here I print the multiplication matrix result point by point 
    !(the same as mtx1.*mtx2 in Julia or MATLAB)
    mtx3 = mtx1*mtx2
    
    print *, 'The point by point multiplication matrix result mtx3 is : '

    write (*,5) '---------------- New Slice ------------------'
    5 format(a47)

    do i = 1,3
                    
        print*, mtx3(i,:)  
        
    end do

    write (*,6) '---------------- New Slice ------------------'
    6 format(a47)

    write(*,'(////A///)')

    !Here I print the multiplication matrix result using matmul 
    !(the same as mtx1.mtx2 in Julia or MATLAB)
    mtx5 = matmul(mtx1,mtx2)

    print *, 'The point by point multiplication matrix result mtx5 is : '

    write (*,9) '---------------- New Slice ------------------'
    9 format(a47)

    do i = 1,3
                    
        print*, mtx5(i,:)  
        
    end do

    write (*,10) '---------------- New Slice ------------------'
    10 format(a47)

    call cpu_time(start)

    mtx4 = matmul(mtx1,mtx2)

    call cpu_time(finish)

    write(*,'(////A///)')

    print *, 'The multiplication matrix result mtx4 is : '

    write (*,7) '---------------- New Slice ------------------'
    7 format(a47)

    do i = 1,3
                    
        print*, mtx4(i,:)  
        
    end do

    write (*,8) '---------------- New Slice ------------------'
    8 format(a47)

    write(*,'(A/)') 
    print '("Elapsed time is: ",f6.5," seconds")', finish - start

end program mtx_multi_vec_test