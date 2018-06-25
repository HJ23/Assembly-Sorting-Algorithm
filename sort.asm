;  The Little script for sorting messed data 
;  and it will locate sorted data in dataloc
;  datalong for datalenght


dataloc equ 010h
datalong equ 0Ch
mov dptr,#table

mov r2,#00h
mov r3,#00h
mov r4,#dataloc

sorting: 
        mov a,r2 
        movc a,@a+dptr
        mov r5,a
    x:  clr c
        mov a,r3
        movc a,@a+dptr
        mov b,a
        mov a,r5
        subb a,b
        jb c,y 
    pp: inc r3
        clr c
        cjne r3,#datalong,x
        
        mov 40h,r4
        mov r0,40h
        mov 40h,r5
        mov @r0,40h
        inc r2
        mov r4,#dataloc
        mov r3,#00h
        cjne r2,#datalong,sorting

        jmp en
       
    y:  inc r4  
        jmp pp
          
table:db 64,245,11,111,1,23,121,56,78,34,12,90
    en: end