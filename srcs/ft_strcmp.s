section .data

section .text
	global ft_strcmp

	;int ft_strcmp(const char *s1, const char *s2);

	;const char *s1	=>	RDI
	;const char *s2	=>	RSI
ft_strcmp:
	mov rax, 0
	xor rcx, rcx

ft_strcmp.loop:
	mov bl, byte [rdi + rcx]

	cmp bl, byte [rsi + rcx]
	jne ft_strcmp.end

	cmp bl, 0
	je ft_strcmp.end
	
	inc rcx

	jmp ft_strcmp.loop

ft_strcmp.end:
	sub bl, byte [rsi + rcx]
	mov al, bl
	movsx eax, al
	ret