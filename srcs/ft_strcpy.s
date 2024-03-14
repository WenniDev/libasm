section .data

section .text
	global ft_strcpy

	;char *ft_strcpy(char *dest, const char *src);

	;char *dest			=>	RDI
	;const char *src	=>	RSI
ft_strcpy:
	xor rcx, rcx ; rcx = 0
    not rcx ; invert rcx
    
	push rdi
    xor al, al ; al = 0
    cld ; clear direction flag
    repne scasb ; scan for null byte
	pop rdi

	mov rax, rdi

	not rcx ; invert rcx
    dec rcx ; rcx = rcx - 1
	
	cld ; clear direction flag
    rep movsb ; copy rsi to rdi

	ret

