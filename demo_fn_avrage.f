	function avrage(x1,x2,x3,x4,x5)
C
C	Inputs: x1, x2, x3, x4, x5
C
C	Output is average of 5 input variables
C
	real*8 x1,x2,x3,x4,x5,sum

	sum=x1+x2+x3+x4+x5
	avrage=sum/5.0

	return
	end
