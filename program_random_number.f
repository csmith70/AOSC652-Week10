        program random number
        character*5 c_coin

	c_coin='zzzzz'	! c_coin=heads for heads and tails for tails

        write(6,700)
700     format('Enter Negative Integer for Random Number Generator: ',$)
        read(5,702)idum
702     format(I)
C
C     First to initialize random number generator
        random_number=ran0(idum)

        itoss=0		! tracks number of tosses
	nheads=0	! tracks number of successive heads

100     continue

C     Random number, between 0 and 1: assume random number between
C     0 & 0.5 corresponds to heads
        random_number=ran0(idum)
        write(*,*)'random_number=',random_number
C
C     Students: enter code here to:
C
C	a) keep track of how many heads in a row have been tossed
C	b) assign proper value to c_coin
C
	if(random_number.lt.0.5) then
           nheads=nheads+1
           c_coin='heads'
	else
           nheads=0
           c_coin='tails' 
	endif
	itoss=itoss+1

	write(6,704)itoss,c_coin
704	format('Toss ',I2,': ',A5,' it is')
C     New code you enter should stop here

	if(itoss.eq.10) then	! 
		write(*,*)'10 toss limit: try again'
		goto 999	
	endif
	if(nheads.lt.3) then
		goto 100	! Toss again unless three heads in a row
	else
		if(itoss.eq.3) then
		  write(*,*)'3 heads in a row on first 3 tosses: winner!'	
		else
		  write(*,*)'3 heads in a row but not on first 3 tosses: try again'
		endif
	endif

999     continue

        stop
        end

        function ran0(idum)
C
C     Input  : idum - negative integer
C     Output : ran0 - random number between 0 and 1
C              idum - updated by this function
C
C     Minimal Random Number Generator of Park and Miller
C     Page 270, Press et al., Numerical Recipes
C
        integer idum,ia,im,iq,ir,mask
        real ran0,am
        parameter(ia=16807,im=2147483647,iq=127773,ir=2826,
     +          mask=123459876)
        integer k
        am=1./float(im)
        idum=ieor(idum,mask)
        k=idum/iq
        idum=ia*(idum-k*iq)-ir*k
        if(idum.lt.0.) idum=idum+im
        ran0=am*float(idum)
        idum=ieor(idum,mask)
        return
        end
