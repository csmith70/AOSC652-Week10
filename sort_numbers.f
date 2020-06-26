! Christopher Smith
! Part of HW14: FORTRAN Data Sorting
! 11/04/19
        parameter (narray_max=1000000)
        integer iarray_in(narray_max),iarray_out(narray_max)

        character*80 namein
        character*1 cdum

        write(6,700)
700     format('Enter input filename : ',$)
        read(5,702)namein
702     format(A)
        call charlen(namein,80,len_namein)
        open(1,file=namein)
        !open(1,name=namein,form='formatted',type='old',err=800)

        read(1,*)icol,ihead
!710     format(I,I)
        read(1,702)cdum
        read(1,702)cdum

        icount=1
100     continue
        read(1,*,end=102,err=802)i1,i2
        iarray_in(icount)=i2
        icount=icount+1
        goto 100

102     continue        
        npts=icount-1

        write(99,790)namein(1:len_namein)
790     format('2,3',/,'Sequence,Integer Value',/,
     +  'Sorted data read from file ',A)

        write(6,708)npts,namein(1:len_namein)
708     format('Read ',I7,' points from file ',A)

        call piksrt(iarray_in,iarray_out,npts)

        !call heapsort(iarray_in,iarray_out,npts)
        do i=1,npts
           write(99,799)i,iarray_out(i)
        enddo
799     format(I6,3X,I6)        
        write(*,*)'Output written to unit 99'

        goto 999

800     write(6,801)namein(1:len_namein)
801     format('Can not open input file ',A,' : Program Stop')
        goto 999
802     write(6,803)namein(1:len_namein)
803     format('File read error file ',A,'  : Program Stop')

999     continue

        stop
        end


        subroutine charlen(char,nchar,ilen)
C      
C       Input: char, nchar
C       Output: ilen
C
C          ilen records place of first blank character
C          i.e., length of character string
C
        character*(*) char
        character*1 cc,blnK
        data blnk/' '/
        do ilen=nchar,1,-1
           cc=char(ilen:ilen)
           if(cc.ne.blnk) goto 100
        enddo
100     continue
        return
        end

