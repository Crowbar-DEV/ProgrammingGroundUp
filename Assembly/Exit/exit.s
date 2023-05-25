#INPUT:     None

#OUTPUT:    returns a status code. This can be viewed
#           by typing
#
#           echo $?
#
#           after running the program

#VARIABLES:
#           %eax holds the system call number
#           (always the case)
#
#           %ebx holds the return status

.section .data

.section .text

.globl _start
_start:
    movl $0, %eax
    movl $0, %ebx
    int $0x80
