! Christopher Smith
! Part of HW14: FORTRAN Data Sorting
! 11/04/19
        subroutine piksrt(arr_in,arr_out,n)
        Integer n,i,j
        Integer a,arr_in(n),arr_out(n)
C
C     Input array is "sorted" using PIKSRT method, given on page 321
C     of Press et al., Numerical Recipes in Fortran, 2nd Editon
	do i=1,n
		arr_out(i)=arr_in(i)
	enddo
C
C       Sorts an array into ascending numerical order, by straight
C       insertion.
C
        do j=2,n                        ! Pick out each element in turn
           a=arr_out(j)
           do i=j-1,1,-1                ! Look for the place to insert it
              if(arr_out(i).le.a) goto 10
              arr_out(i+1)=arr_out(i)
           enddo
           i=0
10         arr_out(i+1)=a                   ! Insert it
        enddo

        return
        end
