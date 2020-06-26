        subroutine piksrt(n,arr)
        integer n,i,j
        real a,arr(n)
C
C     Input array is "sorted" using PIKSRT method, given on page 321
C     of Press et al., Numerical Recipes in Fortran, 2nd Editon
C
C       Sorts an array into ascending numerical order, by straight
C       insertion.
C
        do j=2,n                        ! Pick out each element in turn
           a=arr(j)
           do i=j-1,1,-1                ! Look for the place to insert it
              if(arr(i).le.a) goto 10
              arr(i+1)=arr(i)
           enddo
           i=0
10         arr(i+1)=a                   ! Insert it
        enddo

        return
        end
