.text
.align 2
.global main
.type main,%function

main:

	stmfd sp!, {lr}	/* SP = R13 link register */
	/* valor1 */
	
	ldr r2, =num1
	ldr r2, [r2]
	ldr r3, = num2
	ldr r3, [r3]
	bl rutina
	
	
fin:
	mov r0, #0
	mov r3,#0
	ldmfd sp!,{lr}
	bx lr
	
/*variables*/
.data
.align 2