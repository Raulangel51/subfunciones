.text
.align 2
.global main
.type main,%function

main:

	stmfd sp!, {lr}	/* SP = R13 link register */
	/* valor1 */
	
	/*Bienvenida*/
	ldr r0, =menu
	bl printf
	
	/*pide opcion*/
	ldr r0,=entradaS
	ldr r1,=opcion
	bl scanf
	
	/*Muestra la opcion elegida*/
	ldr r1, =opcion
	ldr r0, =opciong
	bl printf
	
	/*compara para la opcione*/
	ldr r10, =opcion
	ldrb r10, [r10]
	
	cmp r10, #'+'
	beq sumo
	
	cmp r10, #'*'
	beq multip
	
	cmp r10, #'M'
	beq multip
	
	cmp r10, #'P'
	beq multip
	
	cmp r10, #'='
	beq multip
	
	cmp r10, #'q'
	beq multip
	
	b fin
	
	
	
sumo:
/*prueba para ver si entraba*/
	/*ldr r1, =su
	ldr r0, =entradaS
	bl printf*/
	
	ldr r0, =valor
	bl printf
	
	ldr r0, =entradaD
	ldr r1, =valor1
	bl scanf
	
	ldr r1, =valor1
	ldr r1, [r1]
	ldr r0, =respuesta
	ldr r0, [r0]
	
	bl suma
	
	ldr r8, =respuesta
	str r0, [r8]
	
	mov r1, r0
	ldr r0, =entradaD
	bl printf
	
	b main
	
multip:
	ldr r1, =mul
	ldr r0, =entradaS
	bl printf
	b fin
	
	/* salida correcta */
	fin:
		@@ r0, r3 <- 0 como sennal de no error al sistema operativo
		mov	r3, #0
		mov	r0, r3

		@ colocar registro de enlace para desactivar la pila y retorna al SO
		ldmfd	sp!, {lr}
		bx	lr
	
/*variables*/
.data
.align 2
menu:			.asciz "\nEliga una de estas opciones:\nIngrese '+' para Suma\nIngrese '*' para Multiplicación\nIngrese 'M' para Módulo (devolver el residuo en formato int de una división )\nIngrese 'P' para Potencia de un número (primer número ingresado es la base, segundo la potencia)\nIngrese '=' para Muestra el resultado almacenado\nIngrese 'q' para Mostrar mensaje de despedida y salir al sistema operativo\n"
entradaS: 		.asciz " %s"
entradaC:		.asciz " %c"
entradaD:		.asciz " %d"
opcion: 		.asciz " "
su:				.asciz "Tu opcion es suma\n"
valor:			.asciz "Ingrese un valor: "
valor1:			.word 0
mul:			.asciz "Tu opcion es multi\n"
p:				.asciz "Tu opcion es potencia\n"
mod:			.asciz "Tu opcion es modulo\n"
igual:			.asciz "Tu opcion es igual\n"
q:				.asciz "Tu opcion es salida\n"
opciong: 		.asciz "Tu opcion fue: %s \n"
respuesta:		.word 0



