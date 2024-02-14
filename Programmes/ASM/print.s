.global _start

.section .bss
str_buffer: .space 21         // Reserve space for 20 characters + null terminator

.section .text

// Function: Convert integer in x0 to string
// Input: x0 = integer
// Output: x0 = address of the string representation (null-terminated)
int_to_str:
    ldr x1, =str_buffer + 20 // Point x1 to the end of the buffer (before null terminator)
    strb wzr, [x1]           // Null-terminate the string
    mov x3, #10              // Constant 10 for division
    mov x9, #48              // ASCII offset for '0'

process_digit:
    // Handle edge case of 0 explicitly
    cbz x0, zero_case

    udiv x4, x0, x3          // x4 = x0 / 10
    msub x5, x4, x3, x0      // x5 = x0 - (x4 * 10), remainder
    add x5, x5, x9           // Convert remainder to ASCII
    strb w5, [x1, #-1]!      // Store ASCII character and decrement pointer
    mov x0, x4               // Prepare for next iteration
    cbnz x4, process_digit   // If quotient is not zero, continue

    mov x0, x1               // Set x0 to point to the start of the string
    ret

zero_case:
    mov w5, #48              // ASCII for '0'
    strb w5, [x1, #-1]!      // Store '0'
    mov x0, x1               // Set x0 to point to the start of the string
    ret

_start:
    // Example usage
    mov x0, #617          // Number to convert and print
    bl int_to_str            // Convert integer to string; address of string in x0

    // Calculate string length for syscall
    ldr x2, =str_buffer + 20 // End of buffer
    sub x2, x2, x0           // Length of the generated string

    // Print the string
    mov x1, x0               // String to print
    mov x0, #1               // File descriptor 1 (stdout)
    mov x8, #64              // syscall: write
    svc #0                   // Make syscall

    // Exit
    mov x0, #0               // Exit status
    mov x8, #93              // syscall: exit
    svc #0                   // Make syscall
