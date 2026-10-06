.section .note.GNU-stack,""
    .text
    .global is_prime

is_prime:
    mov $2, %rsi

loop:
    cmp %rdi, %rsi
    jae prime

    mov $0, %rdx
    mov %rdi, %rax
    div %rsi

    cmp $0, %rdx
    je not_prime

    add $1, %rsi

    jmp loop

not_prime:
    # return 0
    mov $0, %rax
    ret

prime:
    # return 1
    mov $1, %rax
    ret


.global largest_power_unsigned

largest_power_unsigned:
    mov $1, %rax

loop:
    mov %rax, %rcx
    mul %rdi

    jc overflow
    jmp loop

overflow:
    mov %rcx, %rax
    ret

.global overflowing_subtract

overflowing_subtract:
    # a is in %rdi
    # b is in %rsi
    mov %rdi, %rax
    sub %rsi, %rax

    jo overflow

    ret

overflow:
    mov $0, %rax
    ret

.global dumb

dumb:
    cmp $0, %rdi
    je a_zero

    cmp $0, %rsi
    je b_zero

    # Save original a and b.
    push %rdi
    push %rsi
    # 8 bytes -> 16-byte alignment
    sub $8, %rsp

    sub $1, %rdi
    sub $1, %rsi

    call dumb

    # Undo alignment adjustment.
    add $8, %rsp

    pop %rsi
    pop %rdi

    add %rdi, %rax
    add %rdi, %rax
    add %rsi, %rax

    ret

a_zero:
    mov %rsi, %rax
    add $1, %rax
    ret

b_zero:
    mov %rdi, %rax
    ret