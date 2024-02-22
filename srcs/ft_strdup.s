section .data

section .text
	global ft_strdup
	extern malloc
	extern memmove

	;char *ft_strdup(const char *s);

	;const char *s => RDI
ft_strdup:
	xor	rcx, rcx
	mov rbx, rdi

	call ft_strlen
	; mov rcx, [rax+1]

	; call malloc
	; test rax, rax
	; je ft_strdup.end

	; mov rdi, rax
	; mov rsi, rbx
	; mov rdx, rcx

	; call memmove

	jmp ft_strdup.end

ft_strdup.end:
	ret