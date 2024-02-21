section .data

section .text
	global ft_write

	;ssize_t ft_write(int fildes, const void *buf, size_t nbyte);

	;int fildes			=>	RDI
	;const void *buf	=>	RSI
	;size_t nbyte		=>	RDX

extern	__errno_location

ft_write:
    mov	rax, 1
    syscall

	cmp	rax, 0
	js		ft_write.error

    jmp ft_write.end

ft_write.error:
	neg rax
	mov rdi, rax
	
	call __errno_location

	mov [rax], rdi
	mov rax, -1
	
	jmp ft_write.end

ft_write.end:
	ret