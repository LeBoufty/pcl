.section .text
.global _start

// Function to sum two numbers from the stack and print a message
_start:
    // Reserve stack space for two integers
    sub sp, sp, #16
    
    // Push two integers onto the stack
    mov x0, #5
    str x0, [sp]
    mov x0, #10
    str x0, [sp, #8]
    
    // Pop the two integers into x0 and x1
    ldr x0, [sp]
    ldr x1, [sp, #8]
    
    // Add the two integers
    add x0, x0, x1
    
    // Restore the original stack pointer position
    add sp, sp, #16
    
    // Prepare to print the result message
    mov x0, #1                      // File descriptor 1 (stdout)
    ldr x1, =result_msg             // Address of the message
    ldr x2, =result_msg_len         // Message length
    mov x8, #64                     // System call number for 'write' in AArch64
    svc 0                           // System call to print the message
    
    // Exit
    mov x0, #0                      // Use 0 as the exit status
    mov x8, #93                     // System call number for 'exit'
    svc 0                           // System call to exit

.section .data
result_msg: .asciz "Operation completed successfully.\n"
result_msg_len = . - result_msg
