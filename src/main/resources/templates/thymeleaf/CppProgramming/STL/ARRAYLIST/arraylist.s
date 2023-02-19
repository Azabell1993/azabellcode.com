	.file	"arraylist.c"
	.text
	.def	ArrayList_push_back;	.scl	3;	.type	32;	.endef
	.seh_proc	ArrayList_push_back
ArrayList_push_back:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rdx
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L2
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	addq	%rax, %rax
	addq	$1, %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	0(,%rax,4), %rdx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	realloc
	movq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 16(%rax)
.L2:
	movq	16(%rbp), %rax
	movq	(%rax), %r8
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdx
	movq	16(%rbp), %rcx
	movq	%rdx, 8(%rcx)
	salq	$2, %rax
	addq	%r8, %rax
	movl	24(%rbp), %edx
	movl	%edx, (%rax)
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	ArrayList_pop_back;	.scl	3;	.type	32;	.endef
	.seh_proc	ArrayList_pop_back
ArrayList_pop_back:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L5
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	leaq	-1(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 8(%rax)
.L5:
	nop
	popq	%rbp
	ret
	.seh_endproc
	.def	ArrayList_at;	.scl	3;	.type	32;	.endef
	.seh_proc	ArrayList_at
ArrayList_at:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	cmpq	%rax, 24(%rbp)
	jb	.L7
	movl	$0, %eax
	jmp	.L8
.L7:
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
.L8:
	popq	%rbp
	ret
	.seh_endproc
	.def	ArrayList_data;	.scl	3;	.type	32;	.endef
	.seh_proc	ArrayList_data
ArrayList_data:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	popq	%rbp
	ret
	.seh_endproc
	.def	ArrayList_size;	.scl	3;	.type	32;	.endef
	.seh_proc	ArrayList_size
ArrayList_size:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	popq	%rbp
	ret
	.seh_endproc
	.def	ArrayList_capacity;	.scl	3;	.type	32;	.endef
	.seh_proc	ArrayList_capacity
ArrayList_capacity:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	popq	%rbp
	ret
	.seh_endproc
	.def	ArrayList_reserve;	.scl	3;	.type	32;	.endef
	.seh_proc	ArrayList_reserve
ArrayList_reserve:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	cmpq	%rax, 24(%rbp)
	jbe	.L17
	movq	24(%rbp), %rax
	leaq	0(,%rax,4), %rdx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	realloc
	movq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 16(%rax)
.L17:
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	ArrayList_resize;	.scl	3;	.type	32;	.endef
	.seh_proc	ArrayList_resize
ArrayList_resize:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	cmpq	%rax, 24(%rbp)
	jbe	.L19
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	ArrayList_reserve
.L19:
	movq	16(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	ArrayList_clear;	.scl	3;	.type	32;	.endef
	.seh_proc	ArrayList_clear
ArrayList_clear:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	$0, 8(%rax)
	nop
	popq	%rbp
	ret
	.seh_endproc
	.def	ArrayList_free;	.scl	3;	.type	32;	.endef
	.seh_proc	ArrayList_free
ArrayList_free:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	free
	movq	16(%rbp), %rax
	movq	$0, (%rax)
	movq	16(%rbp), %rax
	movq	$0, 16(%rax)
	movq	16(%rbp), %rax
	movq	16(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 8(%rax)
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	new_ArrayList;	.scl	3;	.type	32;	.endef
	.seh_proc	new_ArrayList
new_ArrayList:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	$0, (%rax)
	movq	16(%rbp), %rax
	movq	$0, 8(%rax)
	movq	16(%rbp), %rax
	movq	$0, 16(%rax)
	movq	16(%rbp), %rax
	leaq	ArrayList_push_back(%rip), %rdx
	movq	%rdx, 24(%rax)
	movq	16(%rbp), %rax
	leaq	ArrayList_pop_back(%rip), %rdx
	movq	%rdx, 32(%rax)
	movq	16(%rbp), %rax
	leaq	ArrayList_at(%rip), %rdx
	movq	%rdx, 40(%rax)
	movq	16(%rbp), %rax
	leaq	ArrayList_data(%rip), %rdx
	movq	%rdx, 48(%rax)
	movq	16(%rbp), %rax
	leaq	ArrayList_size(%rip), %rdx
	movq	%rdx, 56(%rax)
	movq	16(%rbp), %rax
	leaq	ArrayList_capacity(%rip), %rdx
	movq	%rdx, 64(%rax)
	movq	16(%rbp), %rax
	leaq	ArrayList_reserve(%rip), %rdx
	movq	%rdx, 72(%rax)
	movq	16(%rbp), %rax
	leaq	ArrayList_resize(%rip), %rdx
	movq	%rdx, 80(%rax)
	movq	16(%rbp), %rax
	leaq	ArrayList_clear(%rip), %rdx
	movq	%rdx, 88(%rax)
	movq	16(%rbp), %rax
	leaq	ArrayList_free(%rip), %rdx
	movq	%rdx, 96(%rax)
	movq	16(%rbp), %rax
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "List contents:\0"
.LC1:
	.ascii "%d\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$160, %rsp
	.seh_stackalloc	160
	.seh_endprologue
	call	__main
	leaq	-128(%rbp), %rax
	movq	%rax, %rcx
	call	new_ArrayList
	movq	-104(%rbp), %r8
	leaq	-128(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	*%r8
	movq	-104(%rbp), %r8
	leaq	-128(%rbp), %rax
	movl	$2, %edx
	movq	%rax, %rcx
	call	*%r8
	movq	-104(%rbp), %r8
	leaq	-128(%rbp), %rax
	movl	$3, %edx
	movq	%rax, %rcx
	call	*%r8
	leaq	.LC0(%rip), %rcx
	call	puts
	movq	$0, -8(%rbp)
	jmp	.L25
.L26:
	movq	-88(%rbp), %r8
	movq	-8(%rbp), %rdx
	leaq	-128(%rbp), %rax
	movq	%rax, %rcx
	call	*%r8
	movl	%eax, %edx
	leaq	.LC1(%rip), %rcx
	call	printf
	addq	$1, -8(%rbp)
.L25:
	movq	-72(%rbp), %rdx
	leaq	-128(%rbp), %rax
	movq	%rax, %rcx
	call	*%rdx
	cmpq	%rax, -8(%rbp)
	jb	.L26
	movq	-40(%rbp), %rdx
	leaq	-128(%rbp), %rax
	movq	%rax, %rcx
	call	*%rdx
	movq	-104(%rbp), %r8
	leaq	-128(%rbp), %rax
	movl	$4, %edx
	movq	%rax, %rcx
	call	*%r8
	movq	-104(%rbp), %r8
	leaq	-128(%rbp), %rax
	movl	$5, %edx
	movq	%rax, %rcx
	call	*%r8
	leaq	.LC0(%rip), %rcx
	call	puts
	movq	$0, -16(%rbp)
	jmp	.L27
.L28:
	movq	-88(%rbp), %r8
	movq	-16(%rbp), %rdx
	leaq	-128(%rbp), %rax
	movq	%rax, %rcx
	call	*%r8
	movl	%eax, %edx
	leaq	.LC1(%rip), %rcx
	call	printf
	addq	$1, -16(%rbp)
.L27:
	movq	-72(%rbp), %rdx
	leaq	-128(%rbp), %rax
	movq	%rax, %rcx
	call	*%rdx
	cmpq	%rax, -16(%rbp)
	jb	.L28
	movq	-32(%rbp), %rdx
	leaq	-128(%rbp), %rax
	movq	%rax, %rcx
	call	*%rdx
	movl	$0, %eax
	addq	$160, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	realloc;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
