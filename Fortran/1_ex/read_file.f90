program read_file

    !Undergraduate Student: Arturo Burgos
    !Professor: João Rodrigo Andrade
    !Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory
    !MFLab, Block 5P, Uberlândia, MG, Brazil

    !This program will read the data in the txt file

    implicit none !To avoid variable definition problems, checking if they are correctly defined
    real, dimension(3,3,3) :: matrix !Define the 3D array to get the file info
    integer :: k, i, j !Defining the iterators to iterate through the file


    open(1, file = 'mtx_loop_test.txt')!Open the file 
  
    read(1,*) (((matrix(i,j,k), i=1,3), j=1,3), k=1,3)!Read the file iterating through it

    print *, 'The matrix extracted from the file is: '

    do i = 1,3
        do j = 1,3
            
            write(*,6) matrix(i,j,:)
            6 format(3f20.4)
            
        end do 
        write (*,9) '---------- New Slice ----------'
        9 format(a52)
    end do
    write(*,'(///A/)')

    write(*,7) matrix(1,1,1)
    7 format(f20.4)
    write(*,8) matrix(1,1,2)
    8 format(f20.4)

end program read_file