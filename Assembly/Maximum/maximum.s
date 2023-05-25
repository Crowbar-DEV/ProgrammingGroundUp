#PURPOSE:    This program finds the maximum number of 
#            a set of data items.
#
#VARIABLES:  The registers have the following uses:
#
#            %edi - hold index of the data item being examined
#            %ebx - largest data item found
#            %eax - current data item
#
#    The following memory locations are used:
#
#    data_items - contains the item data. A 0 signifies the end
#                    of the data.

.section .data

data_items:
    .long 3,67,34,222,45,75,54,34,44,33,22,11,66,0

.section .text

.globl _start
    _start:
        movl $0, %edi                   # move 0 into the index register
        movl data_items(,%edi,4), %eax  # load the first byte of data 
        movl %eax, %ebx                 # first item, current biggest, so store in ebx

    start_loop:
        cmpl $0, %eax                   # check to see if we have reached end of data
        je loop_exit                    
        incl %edi                       # load next value
        movl data_items(,%edi,4), %eax  
        cmpl %ebx, %eax                 # compare values
        jle start_loop                  # jump to loop beginning if the new value
                                        # is not bigger
        movl %eax, %ebx                 # move the value as the largest
        jmp start_loop                  # jump to loop beginning

    loop_exit:
        movl $1, %eax
        int $0x80
