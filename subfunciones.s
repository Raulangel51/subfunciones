
.text
.align 2
/*Sub rutina para realizar la suma de dos numeros
	r0 primer numero a sumar
	r1 segundo numero a sumar
	la suma se regresa en el r0*/
.global suma
suma:
	add r0,r0,r1
	mov pc, lr
	
/*Sub rutina para realizar la multiplicacion de dos numeros
	r0 es el primer numero
	r1 es el segundo numero 
	en r0 se almacena el resultadao*/
.global multiplicacion
multiplicacion:
	mul r0,r0,r1
	mov pc, lr
	
/*Subrutina para realizar el modulo de dos numeros
	r0 es divisor 
	r1 dividendo 
	r2 contador 
	el residuo se regresa en r0*/
.global modulo
modulo:
	modu:
		cmp r1, r0
		bgt fin
		sub r0,r1
		add r2,#1
		b modu
	fin:
		@ mov r0, r1
		mov pc, lr


	mov pc,lr
	
/*Se realiza la potencia 
	r0 es la base 
	r1 es la potencia
	r2 es el contador
	r3 es la nueva base
	en r0 se almacena el resultado*/
.global potencia
potencia:
	and r2, #0
	mov r2, #1
	and r3, #0
	mov r3, r0
	ciclo:
		mul r0,r0,r3
		add r2, #1
		cmp r2,r1
		bne ciclo
	mov pc, lr
	


	




