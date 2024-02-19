section .data

section .text
	global ft_strcmp

	;const char *s1	=>	RDI
	;const char *s2	=>	RSI
ft_strcmp:
	mov rax, 0
	xor rcx, rcx

ft_strcmp.loop:
	mov bl, byte [rdi + rcx]

	cmp bh, byte [rsi + rcx]
	jne ft_strcmp.end

	cmp bh, 0
	je ft_strcmp.end
	
	inc rcx

	jmp ft_strcmp.loop

ft_strcmp.end:
	sub bh, byte [rsi + rcx]
	mov ah, bh
	ret