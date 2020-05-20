org 	100h
section .text

	    call 	texto	
	    call 	cursor
	    call 	phrase
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

kbwait: mov 	ax, 0000h ;PERMITE TENER LIMPIA LA PANTALLA
	int 	16h
	ret

m_cursr:mov 	ah, 02h	;POSICION DEL CURSOR
	mov 	dx, di  ; columna dx permite acceder a dl por la cantidad de bit que logra almacenar, para la posicion de la primera palabra
	mov 	dh, 12d ; fila
	mov 	bh, 0h ;NUMERO PAGINA
	int 	10h
	ret

m_cursr1:mov 	ah, 02h	;POSICION DEL CURSOR
	mov 	dx, si  ; columna dx permite acceder a dl por la cantidad de bit que logra almacenar, para la posicion de la primera palabra
	mov 	dh, 13d ; fila
	mov 	bh, 0h ;NUMERO PAGINA
	int 	10h
	ret

m_cursr2:mov 	ah, 02h	;POSICION DEL CURSOR
	mov 	dx, di  ; columna dx permite acceder a dl por la cantidad de bit que logra almacenar, para la posicion de la primera palabra
	mov 	dh, 14d ; fila
	mov 	bh, 0h ;NUMERO PAGINA
	int 	10h
	ret

m_fila: mov ah, 05h
	mov al, 14d

phrase:	mov 	di, 29d
	mov 	si, 29d

lupi:	mov 	cl, [msg+di-29d]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len
	jb	lupi
	ret

lupi1:	mov 	cl, [msg1+si-29d]
	call    m_cursr1
	call 	w_char
	inc	si
	cmp 	si, len1
	jb	lupi1
	ret

lupi2:	mov 	cl, [msg2+di-29d]
	call    m_cursr2
	call 	w_char
	call	m_fila
	inc	di
	cmp 	di, len2
	jb	lupi1
	ret	
section .data

msg	db 	"Mami que tu quiere? "
msg1	db	"PAPIIII SIIIIII"
msg2	db	"Ver lo que esconde el pantalon"
len 	equ	$-msg+29d
len1 	equ	$-msg1+29d
len2 	equ	$-msg2+29d

