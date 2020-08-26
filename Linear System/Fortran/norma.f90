program norma
        implicit none
        
        INTEGER :: i
        INTEGER, DIMENSION(:), ALLOCATABLE :: a

        ALLOCATE (a(2))

        a(1) = 3
        a(2) = 7

        print *, maxval(a)


end program norma



