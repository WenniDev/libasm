section .data

section .text
    global ft_strdup
    extern malloc

    ; char *ft_strdup(const char *s);
    ; char *s => RDI
ft_strdup:
    mov rsi, rdi ; save str in rsi

    xor rcx, rcx ; rcx = 0
    not rcx ; invert rcx
    
    xor al, al ; al = 0
    cld ; clear direction flag
    repne scasb ; scan for null byte
    
    not rcx ; invert rcx
    dec rcx ; rc = rcx - 1

    mov rdi, rcx ; rdi = rcx
    inc rdi ; rdi = rdi + 1

    push rsi ; save rsi
    call malloc 
    pop rsi ; restore rsi
    
    test rax, rax  ; Check if malloc succeeded
    je end_ft_strdup

    mov rdi, rax ; rdi = rax
    cld ; clear direction flag
    rep movsb ; copy rsi to rdi
    
    je end_ft_strdup

end_ft_strdup:
    ret