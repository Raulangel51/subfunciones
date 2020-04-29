.text
.align 2
.global main
.type main,%function

main:

	stmfd sp!, {lr}	/* SP = R13 link register */
	/* valor1 */
	
	
	
	
fin:
	mov r0, #0
	mov r3,#0
	ldmfd sp!,{lr}
	bx lr
	
/*variables*/
.data
.align 2