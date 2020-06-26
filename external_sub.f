	subroutine average(x1,x2,x3,x4,x5,av)
C
C	Inputs: x1, x2, x3, x4, x5
C
C	Output :av
C
	real*8 x1,x2,x3,x4,x5,av,sum

	sum=x1+x2+x3+x4+x5
	av=sum/5.0

	return
	end
