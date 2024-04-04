.global _start

.section .text
_start:
    // Reserve space for variables and set up frame pointer
    STP X29, X30, [SP, #-16]!  // Store the current X29 (FP) and X30 (LR) on the stack and update SP
    MOV X29, SP                // Set up base frame pointer

    // Space for 3 integers (a, y, z)
    SUB SP, SP, #16  // Reserve space (3 integers * 4 bytes each = 12, rounded to 16 for alignment)

    // Initialize y = 100 at FP-12
    MOV W0, #100
    STR W0, [X29, #-12]

    // z := 5 at FP-16
    MOV W0, #5
    STR W0, [X29, #-16]

    // y := 3 at FP-12
    MOV W0, #3
    STR W0, [X29, #-12]

    // a := 3 + 4 at FP-8
    ADD W0, W0, #4  // W0 already contains 3
    STR W0, [X29, #-8]

    // Restore the original SP and FP before exiting
    ADD SP, SP, #16
    LDP X29, X30, [SP], #16  // Restore X29 (FP) and X30 (LR) and update SP

    // Exit
    MOV X8, #93     // syscall number for exit in AArch64
    MOV X0, #0      // status 0
    SVC #0          // make syscall
