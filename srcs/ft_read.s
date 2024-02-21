section .data

section .text
	global ft_read

	;ssize_t ft_read(int fd, void *buf, size_t count);

	;int fd			=>	RDI
	;void *buf		=>	RSI
	;size_t count	=>	RDX

extern	__errno_location

ft_read:
    mov	rax, 0
    syscall

	cmp	rax, 0
	js		ft_read.error

    jmp ft_read.end

ft_read.error:
	neg rax
	mov rdi, rax
	
	call __errno_location

	mov [rax], rdi
	mov rax, -1
	
	jmp ft_read.end

ft_read.end:
	ret