section .data

section .text
	global ft_strlen

	; size_t ft_strlen(const char *s);
	; char *s => RDI
ft_strlen:
    xor rcx, rcx ; rcx = 0
    not rcx ; invert rcx

	xor al, al ; al = 0
    cld ; clear direction flag
    repne scasb ; scan byte in rdi to find al

	not rcx ; invert rcx
    dec rcx ; rcx = rcx - 1
	
	je ft_strlen.end

ft_strlen.end:
	mov rax, rcx ; rax = rcx
	ret