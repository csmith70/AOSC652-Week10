      PROGRAM main
      real*8 a,b,c,d,e,sum
C      real avrage
      DATA A,B,C,D,E/5.0,2.0,3.0,4.0,1.0/
C      AV = AVRAGE(A,B,C,D,E)
C      PRINT *,'The average of the numbers is:',AV
      call average(A,B,C,D,E)
    
      END
      
C
C	Inputs: x1, x2, x3, x4, x5
C
C	Output is average of 5 input variables
C
C      function avrage(x1,x2,x3,x4,x5)
C      real*8 x1,x2,x3,x4,x5,sum

C     sum=x1+x2+x3+x4+x5
C     avrage=sum/5.0
C      return
C      end
     
