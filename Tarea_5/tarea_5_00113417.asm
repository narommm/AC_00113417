org 	100h

section .text

	call 	grafico	

	xor 	si, si
	xor 	di, di

	
;-------TRAZO VERTICAL IZQUIERDO GRANDE
	mov	si, 50d
	mov	di, 30d
	call	linea_verticalGrande
	
;-------TRAZO VERTICAL DERECHO MEDIO
	mov	si, 110d
	mov	di, 30d
	call	linea_verticalMedio
	
;-------TRAZO VERTICAL DERECHO PEQUEÑO
	mov 	si, 180d 
	mov 	di, 0d 
	call 	linea_verticalPequenio

;--------TRAZO HORIZONTAL SUPERIOR
	mov 	si, 50d 
	mov 	di, 30d 
	call 	linea_horiSuperior
;--------TRAZO HORIZONTAL MEDIO
	mov 	si, 80d 
	mov 	di, 150d 
	call 	linea_horiMedio

;------------TRAZO HORIZONTAL INFERIOR
	mov 	si, 50d 
	mov 	di, 180d 
	call 	linea_horiInferior
	call 	kb		
	int 	20h



grafico:mov	ah, 00h
	mov	al, 13h
	int 	10h
	ret

pixel:	mov	ah, 0Ch
	mov	al, 1010b
	int 	10h
	ret

linea_horiInferior: 
lupi_horiInferior:
	mov 	cx, 0d 
	add 	cx, si
	mov	dx, di 
	call 	pixel
	inc 	si
	cmp 	si, 180d
	jne 	lupi_horiInferior
	ret

linea_horiSuperior: 
lupi_horiSuperior:
	mov 	cx, 0d 
	add 	cx, si
	mov	dx, di
	call 	pixel
	inc 	si
	cmp 	si, 110d 
	jne 	lupi_horiSuperior
	ret

linea_horiMedio: 
lupi_horiMedio:
	mov cx, 30d 
	add    cx, si
	mov	dx, di 
	call 	pixel
	inc 	si
	cmp 	si, 150d
	jne 	lupi_horiMedio
	ret

linea_verticalGrande:
lupi_verticalGrande:
	mov 	cx, si  
	mov	dx, 0d 
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 180d
	jne 	lupi_verticalGrande
	ret

linea_verticalMedio:
lupi_verticalMedio:
	mov 	cx, si  
	mov	dx, 0d 
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 150d
	jne 	lupi_verticalMedio
	ret

linea_verticalPequenio:
lupi_verticalPequenio:
	mov 	cx, si 
	mov	dx, 150d 
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 31d
	jne 	lupi_verticalPequenio
	ret

kb: 	mov	ah, 00h
	int 	16h
	ret

section .data