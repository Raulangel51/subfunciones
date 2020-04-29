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


	mov pc,lr
	
/*Se realiza la potencia 
	r0 es la base 
	r1 es la potencia
	r2 es el contador
	en r0 se almacena el resultado*/
.gloabl potencia
potencia:
	and r3, #0
	mov r3, #1
	ciclo:
		mul r0,r0,r0
		add r3, #1
		cmp r3,r2
		bne ciclo
	mov pc, lr
	


	




