section .data

section .text
	global ft_strcmp

	;int ft_strcmp(const char *s1, const char *s2);

	;const char *s1	=>	RDI
	;const char *s2	=>	RSI
ft_strcmp:
    xor rcx, rcx ; rcx = 0
    not rcx ; invert rcx

	xor al, al ; al = 0
    cld ; clear direction flag
    repne scasb ; scan byte in rdi to find al

	not rcx ; invert rcx
    dec rcx ; rcx = rcx - 1

	sub rdi, rcx ; reset rdi
	dec rdi

	repe cmpsb ; compare each byte
	
	mov al, byte [ rdi - 1 ] 
	sub al, byte [ rsi - 1 ]

	movsx eax, al ; set negative byte

	ret