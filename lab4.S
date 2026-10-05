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