! Christopher Smith
! Part of HW14: FORTRAN Data Sorting
! 11/04/19
	
	!retain our preference for retaining values of input and output arrays (ra_in, ra_out)
        subroutine heapsort (ra_in,ra_out,n)

        integer n
        integer i,ir,j,k

        integer ra_in(n), ra_out(n), rra

        do i=1,n
		ra_out(i)=ra_in(i)
	enddo
C
C            Sorts an array ra(1:n) into ascending numerical order using
C            the Heapsort algorithm.
C            n is input
C            ra is replaced on output by its sorted rearrangement.
C
C            Page 329, Press et al., Numerical Recipes in Fortran, 2nd Ed.

        if(n.lt.2) return       ! Nothing to sort
C
C            The index k will be decremented from its initial value down
C            to 1 during the "hiring" (heap creation) phase.  Once it
C            reaches 1, the index ir will be decremented from its
C            initial value down to 1 during the "retirement and
C            promotion" (heap selection) phase
C

        k=n/2+1
        ir=n
10      continue
          if(k.gt.1) then !Hiring phase
                k=k-1
                rra=ra_out(k)
          else
                rra=ra_out(ir) !retirement and promotion phase
                ra_out(ir)=ra_out(1)
                ir=ir-1
                if(ir.eq.1) then
                   ra_out(1)=rra
                   return
                endif
          endif         
          i=k
          j=k+k
20        if(j.le.ir) then
             if(j.lt.ir) then
                if(ra_out(j).lt.ra_out(j+1)) j=j+1 !demote rra
             endif
             if(rra.lt.ra_out(j)) then
                ra_out(i)=ra_out(j)
                i=j
                j=j+j
             else !rra's level, Set j to to terminate the sift down
                j=ir+1
             endif
          goto 20
          endif
          ra_out(i)=rra !Put rra into its slot
        goto 10
        return
        end
