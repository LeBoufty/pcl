.section .text
.global _start

_start:
    // Example calculation: let's say we want to print the value 123 in x0
    mov x0, #123
    
    // Placeholder: Convert x0 to a string representation
    // This would involve a custom routine. For simplicity, let's assume it's done
    // and the result is stored at a memory location with label 'number_str'
    
    // Prepare to print the converted number
    mov x0, #1                         // File descriptor 1 (stdout)
    ldr x1, [x0]             // Address of the string representation of the number
    ldr x2, #64            // Length of the string representation
    mov x8, #64                        // System call number for 'write' in AArch64
    svc 0                              // System call to print the message
    
    // Exit
    mov x0, #0                         // Use 0 as the exit status
    mov x8, #93                        // System call number for 'exit'
    svc 0                              // System call to exit

