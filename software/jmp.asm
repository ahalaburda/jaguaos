
;- test.asm
;
;; Programa para prueba del compilador de jaguaOs
;


org 010							; Define espacio de pila

define primera "aaaaaa\nHola. .\n"		; Define la variable "string"

define segunda "\tasdfasdfas"



:rutina
mov DR, offset primera			; Carga posicion inicial de la variable "string"






mov RA, 2						; Clear Screen Function
int

call rutina						; llama la subrutina
call rutina						; llama la subrutina

mov RA, 1						; Define llamar funcion "01" de la interrupción

int 							; Llama la interrupcion

mov DR, offset segunda
mov RA, 1

int 							; Llama la interrupción

end 							; End Program
