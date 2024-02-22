.global main
.extern printf

.section .data
message: .asciz "Hello world!\n"

.section .text
main:
    ldr x0, =message  // Load the address of the message string
    bl printf         // Call printf to print the message

    bl exit

exit :
    mov x0, 0 // return 0
    mov x8, 93 // syscall number for exit
    svc 0 // make the syscall
    ret // return from main
    