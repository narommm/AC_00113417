org         100h
  
section .text
	;13417
	mov di, 0d ;CONTADOR
	mov cx, [len]


;   	EJERCICIO  1
lupi:	;mov cx, 13417d ;3469‬h
	mov ax, 1d 
	mov cx, 3d
	add ax,cx ;Suma los primeros 2 digitos

	mov cx, 4d
	add ax,cx ;Suma al siguiente

	mov cx, 1d 
	add ax, cx;Suma al siguiente

	mov cx, 7d 
	add ax,cx ;Suma al siguiente

	mov cx, 5d
	div cx ;Saca el promedio de la nota
	
	mov bl, [comnt]
	mov [200h], bl ;Guarda el mensaje en la celda 210
	



	;EJERCICIO 2
	mov ax, 0000h ;Se limpia el registro ax
	mov al, 2d 
	mov bx, 210h 
	mov cx, 2d ;Se irá multiplicando con el número de casos anterior en ax
proye:	mul cx ;Realiza la proyección casosxdia . 2
	mov [bx], ax 
	cmp ah, 00h 
	ja sumd 
	je sumu

sumd: 	add bx, 2h 
	jmp sig 

sumu:	add bx, 1h 

sig:	cmp bx, 21F 
	jb proye

;	EJERCICIO 3

	mov ax, 0000h
	mov ax, 0d ;Valores triviales
	mov [220h], ax ;Se colocan en las primeras celdas de memoria
	mov ax, 1d ;Valores triviales
	mov [221h], ax
	mov bx, 222h 

fibo:	mov ax, 0000h 
	mov [bx], ax
	sub bx, 2h ;Le resta 2 para luego sumarle el resultado con el número anterior Fn-2
	mov al, [bx] 
	add bx, 1h ;Le suma 1 al resultado de restar el fn-1 + fn-2
	add ax,[bx]
	add bx, 1h 
	mov [bx], 1h 
	add bx, 1h 
	cmp bx, 22Fh
	jb fibo


	int 20h

section .data

comnt	db	"Hay salud"
len 	equ	$-comnt