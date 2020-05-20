org 	100h
section .text

	    call 	texto	
	    call 	cursor
	    call 	phrase
	    call 	phrase1
	    call 	phrase2
	    call	kbwait

        int 	20h

texto:	mov 	ah, 00h  ;MODO DE TEXTO
	mov	al, 03h  ;MODO TEXTO 80 COLUMNAS, 25 FILAS
	int 	10h 
	ret

cursor: mov	ah, 01h ;MODIFICA EL CURSOR 
	mov 	ch, 00000000b ;SUPERIOR
	mov 	cl, 00001110b ;INFERIOR
	int 	10h
	ret

w_char:	mov 	ah, 09h ;RESPECTIVO ATRIBUTO EN LA POSICION ACTUAL DEL CURSOR
	mov 	al, cl	;ASCII 
	mov 	bh, 0h	;NUMERO DE PAGINA
	mov 	bl, 00001111b  ;ATRIBUTO DEL CARACTER
	mov 	cx, 1h ;CANTIDAD DE VECES QUE SE MUESTRA EL CARACTER
	int 	10h
	ret

w_char1:mov 	ah, 09h ;RESPECTIVO ATRIBUTO EN LA POSICION ACTUAL DEL CURSOR
	mov 	al, al	;ASCII 
	mov 	bh, 0h	;NUMERO DE PAGINA
	mov 	bl, 00001111b  ;ATRIBUTO DEL CARACTER
	mov 	cx, 1h ;CANTIDAD DE VECES QUE SE MUESTRA EL CARACTER
	int 	10h
	ret

w_char2:mov 	ah, 09h ;RESPECTIVO ATRIBUTO EN LA POSICION ACTUAL DEL CURSOR
	mov 	al, dl	;ASCII 
	mov 	bh, 0h	;NUMERO DE PAGINA
	mov 	bl, 00001111b  ;ATRIBUTO DEL CARACTER
	mov 	cx, 1h ;CANTIDAD DE VECES QUE SE MUESTRA EL CARACTER
	int 	10h
	ret	
kbwait: mov 	ax, 0000h ;PERMITE TENER LIMPIA LA PANTALLA
	int 	16h
	ret

m_cursr:mov 	ah, 02h	;POSICION DEL CURSOR
	mov 	dx, di  ; columna dx permite acceder a dl por la cantidad de bit que logra almacenar, para la posicion de la primera palabra
	mov 	dh, 1d ; fila
	mov 	bh, 0h ;NUMERO PAGINA
	int 	10h
	ret

m_cursr1:mov 	ah, 02h	;POSICION DEL CURSOR
	mov 	dx, di  ; columna dx permite acceder a dl por la cantidad de bit que logra almacenar, para la posicion de la primera palabra
	mov 	dh, 10d ; fila
	mov 	bh, 0h ;NUMERO PAGINA
	int 	10h
	ret

m_cursr2:mov 	ah, 02h	;POSICION DEL CURSOR
	mov 	dx, di  ; columna dx permite acceder a dl por la cantidad de bit que logra almacenar, para la posicion de la primera palabra
	mov 	dh, 16d ; fila
	mov 	bh, 0h ;NUMERO PAGINA
	int 	10h
	ret

phrase: mov 	di, 10d
lupi:	mov 	cl, [msg+di-10d]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len
	jb	lupi
	ret

phrase1: mov 	di, 29d
lupi1:	mov 	al, [msg1+di-29d]
	call    m_cursr1
	call 	w_char1
	inc	di
	cmp 	di, len1
	jb	lupi1
	ret

phrase2: mov 	di, 12d
lupi2:	mov 	dl, [msg1+di-12d]
	call    m_cursr2
	call 	w_char2
	inc	di
	cmp 	di, len2
	jb	lupi2
	ret
section .data

msg	db 	"Mami que tu quiere? "
msg1	db	"PAPIIII SIIIIII"
msg2	db	"Ver lo que esconde el pantalon"
len 	equ	$-msg+10d
len1 	equ	$-msg1+29d
len2 	equ	$-msg2+12d

