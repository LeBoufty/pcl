.text
.global _start

_start:
    // Write system call (write)
    mov x0, #1               // file descriptor 1 (stdout)
    ldr x1, =message         // pointer to the message
    ldr x2, =len             // message length
    mov x8, #64              // system call number for 'write' in AArch64 Linux
    svc 0                    // invoke system call

    // Exit system call (exit)
    mov x0, #0               // exit status 0
    mov x8, #93              // system call number for 'exit' in AArch64 Linux
    svc 0                    // invoke system call

.data
message:
    .asciz "hello world\n"
len = . - message           // calculate message length
