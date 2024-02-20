.section .data

input_x_prompt : .asciz "Enter x: "
input_y_prompt : .asciz "Enter y: "
input_spec : .asciz "%d"
result : .asciz "x^y = %d\n"

.section .text

.balign 4 
.global main

main :
    stp fp, lr, [sp, -16]! // Save the frame pointer and link register in stack
    mov fp, sp // create a new stack frame
    sub sp, sp, -16 // allocate space for local variables

    ldr x0, =input_x_prompt // print the prompt for x
    bl printf

    ldr x0, =input_spec // load format to read integer
    mov x1, sp //save read value in stack
    bl scanf // read integer from user

    ldr x0, =input_y_prompt // print the prompt for y
    bl printf

    ldr x0, =input_spec // load format to read integer
    add x1, sp, 8 //save read value in stack
    bl scanf // read integer from user

    ldr w0, [sp] // load x from stack
    sxtw x0, w0 // sign extend x
    ldr w1, [sp, 8] // load y from stack
    sxtw x1, w1 // sign extend y
    bl power // function call power(x,y)

    ldr x0, =result // load format to print result
    mov x1,x2   // load result for printing
    bl printf // print result

    mov sp, fp // deallocate stack space
    ldp fp, lr, [sp], 16 // restore frame pointer and link register

exit :
    mov x0, 0 // return 0
    mov x8, 93 // syscall number for exit
    svc 0 // make the syscall
    ret // return from main

//power function
//x0 = x, x1 = y
//return x^y=x2
power :
    stp fp, lr, [sp, -16]! // Save the frame pointer and link register in stack
    mov fp, sp // create a new stack frame
    str x19, [sp, -16]! // save x19 in stack

    adds x2, x0, x1 
    beq return1 // if y=0 and x=0, return 1

    cmp x0, 0 // if x==0
    beq return0 // return 0
    cmp x1, 0 // if y==0
    bge else1 // return 1

return0 :
    mov x2, 0 // return 0
    b powerEnd // end of function
else1 :
    cmp x1,0
    bne else2
return1 : 
    mov x2, 1 // return 1
    b powerEnd
else2 :
    mov x19, x0 // save x in x19
    sub x1, x1, 1 // y=y-1
    bl power // call power(x,y-1)
    mul x2, x2, x19 // x2=x2*x
powerEnd :
    ldr x19, [sp], 16 // restore x19
    ldp fp, lr, [sp], 16 // restore frame pointer and link register
    ret // return from function
