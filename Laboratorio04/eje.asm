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



	int 20h

section .data

comnt	db	"Hay salud"
len 	equ	$-comnt