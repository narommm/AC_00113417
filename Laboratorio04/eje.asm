org         100h
  
section .text
	;13417
	mov di, 0d ;CONTADOR
	mov cx, [len]


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
	
	

	int 20h

section .data

comnt	db	"Hay salud"
len 	equ	$-comnt