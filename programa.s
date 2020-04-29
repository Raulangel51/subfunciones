.text
.align 2
.global main
.type main,%function

main:

	stmfd sp!, {lr}	/* SP = R13 link register */
	/* valor1 */
	
	/*Bienvenida*/
	ldr r1, =menu
	ldr r0, =entradaS
	bl printf
	
	/*pide opcion*/
	ldr r0,=entradaC
	ldr r1,=opcion
	bl scanf
	
	/*compara para la opcione*/
	ldrb r10, =opcion
	
	cmp r10, #'+'
	beq sumo
	
	cmp r10, #'*'
	beq multip
	
	b fin
	
	
	
sumo:
	ldr r1, =suma
	ldr r0, =entradaS
	bl printf
	b fin
	
multip:
	ldr r1, =mul
	ldr r0, =entradaS
	bl printf
	b fin
	
fin:
	mov r0, #0
	mov r3,#0
	ldmfd sp!,{lr}
	bx lr
	
/*variables*/
.data
.align 2
menu:			.asciz "Eliga una de estas opciones:\nIngrese '+' para Suma\nIngrese '*' para Multiplicación\nIngrese 'M' para Módulo (devolver el residuo en formato int de una división )\nIngrese 'P' para Potencia de un número (primer número ingresado es la base, segundo la potencia)\nIngrese '=' para Muestra el resultado almacenado\nIngrese 'q' para Mostrar mensaje de despedida y salir al sistema operativo"
entradaS: 		.asciz "%s \n"
entradaC:		.asciz "%c \n"
opcion: 		.word 0
suma:			.asciz "Tu opcion es suma\n"
mul:			.asciz "Tu opcion es multi\n"
p:				.asciz "Tu opcion es potencia\n"
mod:			.asciz "Tu opcion es modulo\n"
igual:			.asciz "Tu opcion es igual\n"
q:				.asciz "Tu opcion es salida\n"




