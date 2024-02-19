section .data

section .text
	global ft_strlen

	;char *s => RDI
ft_strlen:
	xor	rax, rax
ft_strlen.loop:
	cmp byte [rdi], 0
	je ft_strlen.end
	inc rax
	inc rdi
	jmp ft_strlen.loop
ft_strlen.end:
	ret