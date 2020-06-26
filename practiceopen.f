     ! Declare variables
      integer window, i, rdopst, num1, num2, rdst
      real :: sum = 0.0
      character(30) :: rdfile, wrfile
      character(132) :: line, lin1
      character*80 namein
      character*1 cdum
      do
      write (*,'(a)', advance="no") "Input File Name: "
      read (*,*) rdfile
      open(14, file=rdfile, status="old", 
     +action="read", position="rewind")
      read(14,*)icol, ihead
      write(*,*)icol, ihead
      read(14,'(a3x)')lin1
      write(*,*)lin1
      if (rdopst==0) exit
      end do
      !do
      !open(32, file='data49.dat', status='old')
      !end do
      i = 1
      do 
      read(14,'(a)', iostat=rdst)line
      if (rdst >0) stop "read error"
      if (rdst <0) exit
      write(93,'(I6,3X,I6)')
      i = i+1
      end do   
      !i = 1
      !do i =1,149
      !write(22,*)i,line
      !end do
      close(14)
      close(32)
      end



