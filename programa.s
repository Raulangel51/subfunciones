.text
.align 2
.global main
.type main,%function

stmfd sp!, {lr}	/* SP = R13 link register */
	/* valor1 */
main:	
	/*Bienvenida*/
	ldr r0, =menu
	bl printf
	
	mov r10, #0
	
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
	beq mod
	
	cmp r10, #'P'
	beq pot
	
	cmp r10, #'='
	beq igual
	
	cmp r10, #'q'
	beq salir	
	
sumo:
/*prueba para ver si entraba*/
	/*ldr r1, =su
	ldr r0, =entradaS
	bl printf*/
	
	/*muestra que ingrese un valor*/
	ldr r0, =valor
	bl printf
	
	/*pide el valor al usuario*/
	ldr r0, =entradaD
	ldr r1, =valor1
	bl scanf
	
	@ compara y salta si r0 es 0 (error)
	cmp r0,#0
	beq Num_Mal
	
	
	/*ingresa el valor a r1*/
	ldr r1, =valor1
	ldr r1, [r1]
	/*Ingresa el acumulado a r0*/
	ldr r0, =respuesta
	ldr r0, [r0]
	
	bl suma
	
	/*carga la posicion de respusta a r8*/
	ldr r8, =respuesta
	str r0, [r8]
	
	/*muestra el resultado*/
	mov r1, r0
	ldr r0, =entradaD
	bl printf
	bl getchar @para que borre la informacion del buffer de teclado

	b main
	
multip:
/*prueba de que entrara*/
	/*ldr r1, =mul
	ldr r0, =entradaS
	bl printf*/
	
	/*muestra que ingrese un valor*/
	ldr r0, =valor
	bl printf
	
	/*pide el valor al usuario*/
	ldr r0, =entradaD
	ldr r1, =valor1
	bl scanf

	@ compara y salta si r0 es 0 (error)
	cmp r0,#0
	beq Num_Mal
	

	
	/*ingresa el valor a r1*/
	ldr r1, =valor1
	ldr r1, [r1]
	/*Ingresa el acumulado a r0*/
	ldr r0, =respuesta
	ldr r0, [r0]
	
	bl multiplicacion
	
	/*carga la posicion de respusta a r8*/
	ldr r8, =respuesta
	str r0, [r8]
	
	/*muestra el resultado*/
	mov r1, r0
	ldr r0, =entradaD
	bl printf	
	bl getchar @para que borre la informacion del buffer de teclado

	b main
	
mod:
	/*prueba de que entrara*/
	/*ldr r1, =mul
	ldr r0, =entradaS
	bl printf*/
	
	/*muestra que ingrese un valor*/
	ldr r0, =valor
	bl printf
	
	/*pide el valor al usuario*/
	ldr r0, =entradaD
	ldr r1, =valor1
	bl scanf

	@ compara y salta si r0 es 0 (error)
	cmp r0,#0
	beq Num_Mal
	

	
	/*ingresa el valor a r1*/
	ldr r1, =valor1
	ldr r1, [r1]
	/*Ingresa el acumulado a r0*/
	ldr r0, =respuesta
	ldr r0, [r0]
	
	bl modulo
	
	/*carga la posicion de respusta a r8*/
	ldr r8, =respuesta
	str r0, [r8]
	
	/*muestra el resultado*/
	mov r1, r0
	ldr r0, =entradaD
	bl printf	
	bl getchar @para que borre la informacion del buffer de teclado

	b main


pot:
	/*prueba de que entrara*/
	/*ldr r1, =mul
	ldr r0, =entradaS
	bl printf*/
	
	/*muestra que ingrese un valor*/
	ldr r0, =valor
	bl printf
	
	/*pide el valor al usuario*/
	ldr r0, =entradaD
	ldr r1, =valor1
	bl scanf

	@ compara y salta si r0 es 0 (error)
	cmp r0,#0
	beq Num_Mal
	
	
	/*ingresa el valor a r1*/
	ldr r1, =valor1
	ldr r1, [r1]
	/*Ingresa el acumulado a r0*/
	ldr r0, =respuesta
	ldr r0, [r0]
	
	bl potencia
	
	/*carga la posicion de respusta a r8*/
	ldr r8, =respuesta
	str r0, [r8]
	
	/*muestra el resultado*/
	mov r1, r0
	ldr r0, =entradaD
	bl printf	
	bl getchar @para que borre la informacion del buffer de teclado
	b main


Num_Mal:
	ldr r0,=mal
	bl puts
	bl getchar @para que borre la informacion del buffer de teclado
	b main

igual:
	ldr r1, =respuesta
	ldr r1, [r1]
	ldr r0, =entradaD
	bl printf
	bl getchar @para que borre la informacion del buffer de teclado
	b main


salir:
	ldr r1, =salida
	ldr r0, =entradaS
	bl printf
	
	@@ r0, r3 <- 0 como sennal de no error al sistema operativo
	mov	r3, #0
	mov	r0, #0
	@ colocar registro de enlace para desactivar la pila y retorna al SO
	ldmfd	sp!, {lr}
	bx	lr
	
/*variables*/
.data
.align 2
menu:			.asciz "\nEliga una de estas opciones:\n\nIngrese '+' para Suma\nIngrese '*' para Multiplicación\nIngrese 'M' para Módulo (devolver el residuo en formato int de una división )\nIngrese 'P' para Potencia de un número (primer número ingresado es la base, segundo la potencia)\nIngrese '=' para Muestra el resultado almacenado\nIngrese 'q' para Mostrar mensaje de despedida y salir al sistema operativo\n"
entradaS: 		.asciz " %s"
entradaC:		.asciz " %c"
entradaD:		.asciz " %d"
mal:	.asciz "\nIngreso incorrecto. Por favor vuelva a intentar :(\n"
su:				.asciz "Tu opcion es suma\n"
valor:			.asciz "Ingrese un valor: "
valor1:			.word 0
mul:			.asciz "Tu opcion es multi\n"
p:				.asciz "Tu opcion es potencia\n"
q:				.asciz "Tu opcion es salida\n"
opciong: 		.asciz "Tu opcion fue: %s \n"
respuesta:		.word 0
salida: 		.asciz "Gracias por usar el programa, tenga buen dia.\n"
opcion: 		.asciz " "



