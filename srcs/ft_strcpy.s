section .data

section .text
	global ft_strcpy

	;char *dest			=>	RDI
	;const char *src	=>	RSI
ft_strcpy:
	mov rax, rdi
	xor rcx, rcx

ft_strcpy.loop:
	mov byte bl, byte [rsi + rcx]
	mov byte [rdi + rcx], bl
	
	cmp byte [rsi + rcx], 0
	je ft_strcpy.end
	
	inc rcx

	jmp ft_strcpy.loop

ft_strcpy.end:
	ret