.386
.model flat, stdcall
.stack 4096
option casemap:none

include inc\SDL\constantes.inc
include inc\SDL\estructuras.inc
include inc\SDL\prototipos.inc
include masm32\include\msvcrt.inc
includelib masm32\lib\msvcrt.lib

.data
SDL_GetTicks proto c

ANCHO				equ 600
ALTO				equ 540
FRECUENCIA_AUDIO	equ 44100
CANALES_AUDIO		equ 2
BYTES_POR_MUESTRA	equ	2048
TAMANIO_FUENTE		equ 40
TONO_ROJO_FONDO		equ 0
TONO_VERDE_FONDO	equ	128
TONO_AZUL_FONDO		equ 128
OPACIDAD_FONDO		equ 255

num		byte	0

modoSonido		BYTE	'rb',0
ventana			DWORD	?
renderer		DWORD	?
joystick		DWORD	?
imagen			DWORD	?
imagenInicio	DWORD	?
imagenBases		DWORD	?
imagenBoss		DWORD	?
imagenEnemy		DWORD	?
imagenFireball	DWORD	?
imagenGameover	DWORD	?
imagenKey		DWORD	?
imagenLife		DWORD	?
imagenCharacter	DWORD	?
musica			DWORD	?
musica1			DWORD	?
musicainicio	DWORD	?
sonido			DWORD	?
sonidoKey		DWORD	?
sonidoSalto		DWORD	?
sonidoSucess	DWORD	?
fuente			DWORD	?
creditosJuego	DWORD	?
basesP			DWORD	?
mensaje			DWORD	?
Piso			DWORD	?

textoImagen		DWORD	?
textoRectangulo	SDL_Rect	<>


titulo					BYTE	'Random game',0
direccionImagen			BYTE	'juego/imagen.png',0
direccionImagenInicio	BYTE	'juego/titulo.png',0 
direccionImagenBases	BYTE	'juego/bases.png', 0
direccionImagenBoss		BYTE	'juego/Boss.png', 0
direccionImagenEnemy	BYTE	'juego/Enemy.png', 0
direccionImagenFireball	BYTE	'juego/Fireballs.png', 0
direccionImagenGameover	BYTE	'juego/gameover.png', 0
direccionImagenKey		BYTE	'juego/key.png', 0
direccionImagenLife		BYTE	'juego/Life.png', 0
direccionImagenCharacter BYTE	'juego/Principal character.png', 0
direccionFuente			BYTE	'juego/fuentes.ttf.png',0
direccionMusica			BYTE	'juego/musicainicio2.mp3',0
direccionMusica1		BYTE	'juego/musica1.mp3', 0
direccionMusicaInicio	BYTE	'juego/musicainicio.mp3', 0
direccionSonido			BYTE	'juego/key.wav',0
;direccionSonidoKey		BYTE	'juego/', 0
direccionSonidoSalto	BYTE	'juego/salto.wav', 0
direccionSonidoSucess	BYTE	'juego/sucess.wav', 0
direccionCreditosJuego	BYTE	'juego/Creditosjuego.png', 0
direccionBases			BYTE	'juego/Bases.png', 0
direccionMessage		BYTE	'juego/message.png', 0

MI_ELEMENTO struct
	origen SDL_Rect <>
	destino SDL_Rect <>
	visible dword 0
MI_ELEMENTO ends

donaOrigen		SDL_Rect <0, 0, 600, 540>
donaDestino		SDL_Rect <0, 0, 600, 540>

nombreT		MI_ELEMENTO <	<105, 51, 474, 144>, <65, 25, 474, 144>	>
jugar		MI_ELEMENTO <	<81, 225, 200, 68>, <110, 200, 200, 68>	>
creditos	MI_ELEMENTO <	<81, 306, 200, 68>, <110, 300, 200, 68>	>
salir		MI_ELEMENTO <	<81, 385, 200, 68>, <110, 400, 200, 68>	>
vida		MI_ELEMENTO	<	<10, 35, 145, 40>, <0, 0, 145, 40>	>
vida1		MI_ELEMENTO	<	<170, 35, 145, 40>, <0, 0, 145, 40>	>
vida2		MI_ELEMENTO	<	<330, 35, 145, 40>, <0, 0, 145, 40>	>
vida3		MI_ELEMENTO	<	<10, 195, 145, 40>, <0, 0, 145, 40>	>
vida4		MI_ELEMENTO	<	<170, 195, 145, 40>, <0, 0, 145, 40>	>
vida5		MI_ELEMENTO	<	<330, 195, 145, 40>, <0, 0, 145, 40>	>
vida6		MI_ELEMENTO	<	<10, 354, 145, 40>, <0, 0, 145, 40>	>
;personaje	MI_ELEMENTO	<	<30, 30, 60, 85>, <0, 420, 60, 85>	>
personaje2	MI_ELEMENTO	<	<190, 30, 60, 85>, <0, 420, 60, 85>	>
;personaje3	MI_ELEMENTO	<	<30, 190, 60, 85>, <0, 420, 60, 85>	>
;personaje4	MI_ELEMENTO	<	<190, 190, 60, 85>, <0, 420, 60, 85>	>
fuego		MI_ELEMENTO	<	<56, 63, 84, 60>, <500, 0, 84, 60>	>	;la animacion esta en <56, 287, 84, 60>
bases		MI_ELEMENTO	<	<0, 0, 287, 55>, <100, 100, 287, 25>	>
bases1		MI_ELEMENTO	<	<0, 72, 160, 55>, <263, 300, 320, 25>	>
bases2		MI_ELEMENTO	<	<0, 144, 54, 55>, <430, 400, 100, 25>	>
bases3		MI_ELEMENTO	<	<0, 0, 287, 55>, <50, 50, 200, 25>	>
bases4		MI_ELEMENTO	<	<0, 72, 160, 55>, <320, 100, 67, 25>	>
bases5		MI_ELEMENTO	<	<0, 144, 54, 55>, <158, 350, 80, 25>	>
bases6		MI_ELEMENTO	<	<0, 0, 287, 55>, <68, 179, 92, 25>	>
bases7		MI_ELEMENTO	<	<0, 72, 160, 55>, <385, 265, 58, 25>	>
bases8		MI_ELEMENTO	<	<0, 144, 54, 55>, <430, 363, 35, 25>	>
creditosJ	MI_ELEMENTO	<	<0, 0, 406, 315>, <100, 100, 406, 315>	>
llave		MI_ELEMENTO	<	<135, 90, 120, 240>, <15, 50, 30, 60>	>
puerta		MI_ELEMENTO	<	<578, 393, 20, 109>, <578, 393, 20, 109>	>
mensajeT	MI_ELEMENTO	<	<0, 0, 400, 47>, <65, 50, 400, 47>	>
piso		MI_ELEMENTO <	<0, 502, 600, 38>, <0, 502, 600, 38>	>
fuego2		MI_ELEMENTO	<	<56, 63, 84, 60>, <599, 0, 84, 60>	>
fuego3		MI_ELEMENTO	<	<56, 63, 84, 60>, <599, 25, 84, 60>	>
fuego4		MI_ELEMENTO	<	<56, 63, 84, 60>, <599, 259, 84, 60>	>
fuego5		MI_ELEMENTO	<	<56, 63, 84, 60>, <599, 315, 84, 60>	>
fuego6		MI_ELEMENTO	<	<56, 63, 84, 60>, <599, 500, 84, 60>	>
fuego7		MI_ELEMENTO	<	<56, 63, 84, 60>, <599, 18, 84, 60>	>
fuego8		MI_ELEMENTO	<	<56, 63, 84, 60>, <599, 250, 84, 60>	>
fuego9		MI_ELEMENTO	<	<56, 63, 84, 60>, <599, 354, 84, 60>	>
fuego10		MI_ELEMENTO	<	<56, 63, 84, 60>, <599, 125, 84, 60>	>
fuego11		MI_ELEMENTO	<	<56, 63, 84, 60>, <599, 453, 84, 60>	>
fuego12		MI_ELEMENTO	<	<56, 63, 84, 60>, <599, 1, 84, 60>	>
fuego13		MI_ELEMENTO	<	<56, 63, 84, 60>, <599, 38, 84, 60>	>
fuego14		MI_ELEMENTO	<	<56, 63, 84, 60>, <599, 25, 84, 60>	>
fuego15		MI_ELEMENTO	<	<56, 63, 84, 60>, <599, 367, 84, 60>	>
fuego16		MI_ELEMENTO	<	<56, 63, 84, 60>, <599, 562, 84, 60>	>
fuego17		MI_ELEMENTO	<	<56, 63, 84, 60>, <599, 258, 84, 60>	>
fuego18		MI_ELEMENTO	<	<56, 63, 84, 60>, <599, 147, 84, 60>	>
fuego19		MI_ELEMENTO	<	<56, 63, 84, 60>, <599, 295, 84, 60>	>
fuego20		MI_ELEMENTO	<	<56, 63, 84, 60>, <599, 154, 84, 60>	>
fuego21		MI_ELEMENTO	<	<56, 63, 84, 60>, <599, 360, 84, 60>	>
fuego22		MI_ELEMENTO	<	<56, 63, 84, 60>, <599, 479, 84, 60>	>
fuego23		MI_ELEMENTO	<	<56, 63, 84, 60>, <599, 538, 84, 60>	>
fuego24		MI_ELEMENTO	<	<56, 63, 84, 60>, <599, 238, 84, 60>	>
fuego25		MI_ELEMENTO	<	<56, 63, 84, 60>, <599, 15, 84, 60>	>
fuego26		MI_ELEMENTO	<	<56, 63, 84, 60>, <599, 9, 84, 60>	>
fuego27		MI_ELEMENTO	<	<56, 63, 84, 60>, <599, 300, 84, 60>	>
fuego28		MI_ELEMENTO	<	<56, 63, 84, 60>, <599, 18, 84, 60>	>
fuego29		MI_ELEMENTO	<	<56, 63, 84, 60>, <599, 56, 84, 60>	>
fuego30		MI_ELEMENTO	<	<56, 63, 84, 60>, <599, 3, 84, 60>	>
fuego31		MI_ELEMENTO	<	<56, 63, 84, 60>, <599, 500, 84, 60>	>
fuegos		MI_ELEMENTO 100 dup (<	<56, 63, 84, 60>, <600, 0, 84, 60>, 0	>)

cadenaTexto1 byte 'Creditos', 0
cadenaTiempo	byte	100 dup(0)
ticksAnterior	dword	0
ticksActual		dword	?
residuo			dword	0
movPorSeg		dword	0
saltar			byte	0
caida			byte	0
suelo			byte	0
fuegoSig		dword	0
numero			byte	0

.code
inicializarSDL proc
	xor eax, eax
	invoke SDL_Init, SDL_INIT_EVERYTHING
	invoke SDL_CreateWindow, addr titulo, 100, 100, ANCHO, ALTO, SDL_WINDOW_SHOWN
	mov ventana, eax
	xor eax, eax
	mov eax, SDL_RENDERER_ACCELERATED
	or eax, SDL_RENDERER_PRESENTVSYNC
	invoke SDL_CreateRenderer, ventana, -1, eax
	mov renderer, eax
	invoke SDL_SetRenderDrawColor, renderer, TONO_ROJO_FONDO, TONO_VERDE_FONDO, TONO_AZUL_FONDO, OPACIDAD_FONDO
	invoke IMG_Init, IMG_INIT_ALL
	invoke TTF_Init
	invoke Mix_OpenAudio, FRECUENCIA_AUDIO, MIX_DEFAULT_FORMAT, CANALES_AUDIO, BYTES_POR_MUESTRA
	xor eax, eax
	invoke SDL_NumJoysticks
	.IF eax > 0
		invoke SDL_JoystickOpen, 0
	.ENDIF
	xor eax, eax
	ret
inicializarSDL endp

cargarImagen proc direccion:dword
	LOCAL superficieTemporal :dword
	invoke IMG_Load, direccion
	mov superficieTemporal, eax
	invoke SDL_CreateTextureFromSurface, renderer, superficieTemporal
	push eax
	invoke SDL_FreeSurface, superficieTemporal
	pop eax
	ret
cargarImagen endp

cargarSonido proc direccion:dword
	invoke SDL_RWFromFile, direccion, addr modoSonido
	invoke Mix_LoadWAV_RW, eax, 1	
	ret
cargarSonido endp

obtenerRecursos proc
	invoke cargarImagen, addr direccionImagen
	mov imagen, eax
	invoke cargarImagen, addr direccionImagen
	mov Piso, eax
	invoke cargarImagen, addr direccionImagenInicio
	mov imagenInicio, eax
	invoke cargarImagen, addr direccionImagenBases
	mov imagenBases, eax
	invoke cargarImagen, addr direccionImagenBoss
	mov imagenBoss, eax
	invoke cargarImagen, addr direccionImagenEnemy
	mov imagenEnemy, eax
	invoke cargarImagen, addr direccionImagenFireball
	mov imagenFireball, eax
	invoke cargarImagen, addr direccionImagenGameover
	mov imagenGameover, eax
	invoke cargarImagen, addr direccionImagenKey
	mov imagenKey, eax
	invoke cargarImagen, addr direccionImagenLife
	mov imagenLife, eax
	invoke cargarImagen, addr direccionImagenCharacter
	mov imagenCharacter, eax
	invoke cargarImagen, addr direccionCreditosJuego
	mov creditosJuego, eax
	invoke cargarImagen, addr direccionBases
	mov basesP, eax
	invoke cargarImagen, addr direccionMessage
	mov mensaje, eax
	invoke Mix_LoadMUS, addr direccionMusica
	mov musica, eax
	invoke Mix_LoadMUS, addr direccionMusica1
	mov musica1, eax
	invoke Mix_LoadMUS, addr direccionMusicaInicio
	mov musicainicio, eax
	invoke cargarSonido, addr direccionSonido
	mov sonido, eax
	invoke cargarSonido, addr direccionSonidoSalto
	mov sonidoSalto, eax
	invoke cargarSonido, addr direccionSonidoSucess
	mov sonidoSucess, eax
	invoke TTF_OpenFont, addr direccionFuente, TAMANIO_FUENTE
	mov fuente, eax
	xor eax, eax
	ret
obtenerRecursos endp

detectarColisionRectangulo proc	rectangulo:SDL_Rect, x:DWORD, y:DWORD
	LOCAL resultado:DWORD
	mov resultado, 0
	mov eax, x
	mov ebx, y
	mov ecx, rectangulo.x
	add ecx, rectangulo.w
	mov edx, rectangulo.y
	add edx, rectangulo.h
	.IF eax > rectangulo.x
		inc resultado
	.ENDIF
	.IF eax < ecx
		inc resultado
	.ENDIF
	.IF ebx > rectangulo.y
		inc resultado
	.ENDIF
	.IF ebx < edx
		inc resultado
	.ENDIF
	.IF resultado == 4
		mov eax, 1
	.ELSE
		mov eax, 0
	.ENDIF
	ret
detectarColisionRectangulo endp

pantallaJuego proc
	LOCAL finCiclo	:BYTE
	LOCAL evento	:SDL_Event
	mov finCiclo, 0
	xor eax, eax

	invoke Mix_PlayMusic, musicainicio, -1
	
	
	xor ebx, ebx
	.WHILE ebx < sizeof fuegos
		push ebx
		invoke crt_rand
		xor edx, edx
		xor ecx, ecx
		mov cx, 540
		div cx
		pop ebx
		push ebx
		mov fuegos[ebx].destino.y, edx
		pop ebx
		add ebx, sizeof MI_ELEMENTO
	.ENDW
	xor ebx, ebx

	xor ebx, ebx
	.WHILE finCiclo == 0
		invoke  SDL_PollEvent, addr evento
		.WHILE eax != 0
            ; Si el evento es salir del programa...
			.IF evento.type_ == SDL_QUIT
                ; Asigna 1 a finJuego para que se salga del ciclo del juego
				mov finCiclo, 1
            ; Si el evento es que se presionó una tecla del teclado...
            .ELSEIF evento.type_ == SDL_KEYDOWN
                ; Si la tecla es la "s"
				.IF evento.key.keysym.sym == 119
					dec personaje2.destino.y
				.ENDIF
				;(letra 'w')
                .IF evento.key.keysym.sym == 115
                    ; Si no se ha saludado a la sombra misteriosa...
                    inc personaje2.destino.y
                .ENDIF
				;(letra 'a')
				.IF evento.key.keysym.sym == 97
				.IF personaje2.origen.x == 190
					sub personaje2.origen.x, 160
				.ENDIF

					dec personaje2.destino.x
				.ENDIF
				;(letra 'd')
				.IF evento.key.keysym.sym == 100
					.IF personaje2.origen.x == 190
						sub personaje2.origen.x, 160
						add personaje2.origen.y, 160
					.ENDIF
					inc personaje2.destino.x
				.ENDIF
				;(letra 'b')para desaparecer la llave
				.IF evento.key.keysym.sym == 98
					invoke SDL_DestroyTexture, imagenKey
				.ENDIF
				;(letra 'q')para salir al menu
				.IF evento.key.keysym.sym == 113
					mov finCiclo, 1
				.ENDIF
				;(letra 'f')para invocar fuego
                .IF evento.key.keysym.sym == 102
					;mov numero, 0
					.IF numero == 0
						invoke SDL_RenderCopy, renderer, imagenFireball, addr fuego2.origen, addr fuego2.destino
						dec fuego2.destino.x
					.ENDIF
					.IF numero == 1
						invoke SDL_RenderCopy, renderer, imagenFireball, addr fuego3.origen, addr fuego3.destino
						dec fuego3.destino.x
					.ENDIF
					.IF numero == 2
						invoke SDL_RenderCopy, renderer, imagenFireball, addr fuego4.origen, addr fuego4.destino
						dec fuego4.destino.x
					.ENDIF
					.IF numero == 3
						invoke SDL_RenderCopy, renderer, imagenFireball, addr fuego5.origen, addr fuego5.destino
						dec fuego5.destino.x
					.ENDIF
					.IF numero == 4
						invoke SDL_RenderCopy, renderer, imagenFireball, addr fuego6.origen, addr fuego6.destino
						dec fuego6.destino.x
					.ENDIF
					.IF numero == 5
						invoke SDL_RenderCopy, renderer, imagenFireball, addr fuego7.origen, addr fuego7.destino
						dec fuego7.destino.x
					.ENDIF
					.IF numero == 6
						invoke SDL_RenderCopy, renderer, imagenFireball, addr fuego8.origen, addr fuego8.destino
						dec fuego8.destino.x
					.ENDIF
					.IF numero == 7
						invoke SDL_RenderCopy, renderer, imagenFireball, addr fuego9.origen, addr fuego9.destino
						dec fuego9.destino.x
					.ENDIF
					.IF numero == 8
						invoke SDL_RenderCopy, renderer, imagenFireball, addr fuego10.origen, addr fuego10.destino
						dec fuego10.destino.x
					.ENDIF
					.IF numero == 9
						invoke SDL_RenderCopy, renderer, imagenFireball, addr fuego11.origen, addr fuego11.destino
						dec fuego11.destino.x
					.ENDIF
					.IF numero == 10
						invoke SDL_RenderCopy, renderer, imagenFireball, addr fuego12.origen, addr fuego12.destino
						dec fuego12.destino.x
					.ENDIF
					.IF numero == 11
						invoke SDL_RenderCopy, renderer, imagenFireball, addr fuego13.origen, addr fuego13.destino
						dec fuego13.destino.x
					.ENDIF
					.IF numero == 12
						invoke SDL_RenderCopy, renderer, imagenFireball, addr fuego14.origen, addr fuego14.destino
						dec fuego14.destino.x
					.ENDIF
					.IF numero == 13
						invoke SDL_RenderCopy, renderer, imagenFireball, addr fuego15.origen, addr fuego15.destino
						dec fuego15.destino.x
					.ENDIF
					.IF numero == 14
						invoke SDL_RenderCopy, renderer, imagenFireball, addr fuego16.origen, addr fuego16.destino
						dec fuego16.destino.x
					.ENDIF
					.IF numero == 15
						invoke SDL_RenderCopy, renderer, imagenFireball, addr fuego17.origen, addr fuego17.destino
						dec fuego17.destino.x
					.ENDIF
					.IF numero == 16
						invoke SDL_RenderCopy, renderer, imagenFireball, addr fuego18.origen, addr fuego18.destino
						dec fuego18.destino.x
					.ENDIF
					.IF numero == 17
						invoke SDL_RenderCopy, renderer, imagenFireball, addr fuego19.origen, addr fuego19.destino
						dec fuego19.destino.x
					.ENDIF
					.IF numero == 18
						invoke SDL_RenderCopy, renderer, imagenFireball, addr fuego20.origen, addr fuego20.destino
						dec fuego20.destino.x
					.ENDIF
					.IF numero == 19
						invoke SDL_RenderCopy, renderer, imagenFireball, addr fuego21.origen, addr fuego21.destino
						dec fuego21.destino.x
					.ENDIF
					.IF numero == 20
						invoke SDL_RenderCopy, renderer, imagenFireball, addr fuego22.origen, addr fuego22.destino
						dec fuego22.destino.x
					.ENDIF
					.IF numero == 21
						invoke SDL_RenderCopy, renderer, imagenFireball, addr fuego23.origen, addr fuego23.destino
						dec fuego23.destino.x
					.ENDIF
					.IF numero == 22
						invoke SDL_RenderCopy, renderer, imagenFireball, addr fuego24.origen, addr fuego24.destino
						dec fuego24.destino.x
					.ENDIF
					.IF numero == 23
						invoke SDL_RenderCopy, renderer, imagenFireball, addr fuego25.origen, addr fuego25.destino
						dec fuego25.destino.x
					.ENDIF
					.IF numero == 24
						invoke SDL_RenderCopy, renderer, imagenFireball, addr fuego26.origen, addr fuego26.destino
						dec fuego26.destino.x
					.ENDIF
					.IF numero == 25
						invoke SDL_RenderCopy, renderer, imagenFireball, addr fuego27.origen, addr fuego27.destino
						dec fuego27.destino.x
					.ENDIF
					.IF numero == 26
						invoke SDL_RenderCopy, renderer, imagenFireball, addr fuego28.origen, addr fuego28.destino
						dec fuego28.destino.x
					.ENDIF
					.IF numero == 27
						invoke SDL_RenderCopy, renderer, imagenFireball, addr fuego29.origen, addr fuego29.destino
						dec fuego29.destino.x
					.ENDIF
					.IF numero == 28
						invoke SDL_RenderCopy, renderer, imagenFireball, addr fuego30.origen, addr fuego30.destino
						dec fuego30.destino.x
					.ENDIF
					.IF numero == 29
						invoke SDL_RenderCopy, renderer, imagenFireball, addr fuego31.origen, addr fuego31.destino
						dec fuego31.destino.x
						mov numero, 0
					.ENDIF
                .ENDIF
				;(letra 'x')para quitar vida
				.IF evento.key.keysym.sym == 120
					.IF vida.origen.x == 10
						.IF vida.origen.y == 35
							mov vida.origen.x, 170
						.ENDIF
						.IF vida.origen.y == 195
							mov vida.origen.x, 170
						.ELSE
						.IF vida.origen.y == 330
							;mov finCiclo, 1
						.ENDIF
					.ENDIF
					.ELSEIF vida.origen.x == 170
						.IF vida.origen.y == 35
							mov vida.origen.x, 330
						.ENDIF
						.IF vida.origen.y == 195
							mov vida.origen.x, 330
						.ENDIF
					.ELSEIF vida.origen.x == 330
						.IF vida.origen.y == 35
							mov vida.origen.x, 10
							mov vida.origen.y, 195
						.ENDIF
						.IF vida.origen.y == 330
							mov vida.origen.x, 10
							mov vida.origen.y, 330
							;mov finCiclo, 1
						.ENDIF
					.ENDIF
				.ENDIF
				;('barra espaciadora')
				.IF evento.key.keysym.sym == 32
					mov movPorSeg, 100	;MODIFICAR PARA QUE SALTE MAS ALTO EL MONITO
					mov saltar, 1
				.ENDIF
            ; Si el evento es que se liberó una tecla. (Liberar es dejar de presionar)
            .ELSEIF evento.type_ == SDL_KEYUP
				.IF evento.key.keysym.sym == 119
					mov personaje2.origen.x, 190
					mov personaje2.origen.y, 30
				.ENDIF
				.IF evento.key.keysym.sym == 115
					mov personaje2.origen.x, 190
					mov personaje2.origen.y, 30
				.ENDIF
				.IF evento.key.keysym.sym == 97
					mov personaje2.origen.x, 190
					mov personaje2.origen.y, 30
				.ENDIF
				.IF evento.key.keysym.sym == 100
					mov personaje2.origen.x, 190
					mov personaje2.origen.y, 30
				.ENDIF
				.IF evento.key.keysym.sym == 98
					invoke SDL_RenderCopy, renderer, imagenKey, addr llave.origen, addr llave.destino
				.ENDIF
				.IF evento.key.keysym.sym == 102
					.IF numero <= 29
						add numero, 1
					.ELSE
						mov numero, 0
					.ENDIF
				.ENDIF
                xor eax, eax
            ; Si el evento es que se movió el mouse.
            .ELSEIF evento.type_ == SDL_MOUSEMOTION
                xor eax, eax
            ; Si el evento es que se presionó un botón del mouse.
            .ELSEIF evento.type_ == SDL_MOUSEBUTTONDOWN
                xor eax, eax
            ; Si el evento es que se liberó un botón del mouse
            .ELSEIF evento.type_ == SDL_MOUSEBUTTONUP
                xor eax, eax
            ; Si el evento es que se está moviendo un control análogo del joystick
            .ELSEIF evento.type_ == SDL_JOYAXISMOTION
                xor eax, eax
            ; Si el evento es que se presionó un botón del joystick
            .ELSEIF evento.type_ == SDL_JOYBUTTONDOWN
                xor eax, eax
            ; Si el evento es que se liberó un botón del joystick
            .ELSEIF evento.type_ == SDL_JOYBUTTONUP
                xor eax, eax
			.ENDIF
            ; Verifica si hay más eventos que atender.
			invoke SDL_PollEvent, addr evento
			mov ecx, personaje2.destino.x
			.IF fuegos.destino.x == ecx
				.IF vida.origen.x == 10
						.IF vida.origen.y == 35
							mov vida.origen.x, 170
						.ENDIF
						.IF vida.origen.y == 195
							mov vida.origen.x, 170
						.ELSE
						.IF vida.origen.y == 330
							;mov finCiclo, 1
						.ENDIF
					.ENDIF
					.ELSEIF vida.origen.x == 170
						.IF vida.origen.y == 35
							mov vida.origen.x, 330
						.ENDIF
						.IF vida.origen.y == 195
							mov vida.origen.x, 330
						.ENDIF
					.ELSEIF vida.origen.x == 330
						.IF vida.origen.y == 35
							mov vida.origen.x, 10
							mov vida.origen.y, 195
						.ENDIF
						.IF vida.origen.y == 330
							mov vida.origen.x, 10
							mov vida.origen.y, 330
							;mov finCiclo, 1
						.ENDIF
					.ENDIF
			.ENDIF
			invoke SDL_PollEvent, addr evento
		.ENDW
			invoke SDL_RenderClear, renderer
			invoke SDL_RenderCopy, renderer, imagen, addr donaOrigen, addr donaDestino
			invoke SDL_RenderCopy, renderer, imagenLife, addr vida.origen, addr vida.destino
			invoke SDL_RenderCopy, renderer, basesP, addr bases.origen, addr bases.destino
			invoke SDL_RenderCopy, renderer, basesP, addr bases1.origen, addr bases1.destino
			invoke SDL_RenderCopy, renderer, basesP, addr bases2.origen, addr bases2.destino
			invoke SDL_RenderCopy, renderer, basesP, addr bases3.origen, addr bases3.destino
			invoke SDL_RenderCopy, renderer, basesP, addr bases4.origen, addr bases4.destino
			invoke SDL_RenderCopy, renderer, basesP, addr bases5.origen, addr bases5.destino
			invoke SDL_RenderCopy, renderer, basesP, addr bases6.origen, addr bases6.destino
			invoke SDL_RenderCopy, renderer, basesP, addr bases7.origen, addr bases7.destino
			invoke SDL_RenderCopy, renderer, basesP, addr bases8.origen, addr bases8.destino

			invoke SDL_GetTicks	;El resultado se pone en EAX
			mov ticksActual, eax
			sub eax, ticksAnterior
			mov ebx, movPorSeg
			.IF ebx != 0
				xor ebx, ebx
				add eax, residuo
				xor ebx, ebx
				xor ecx, ecx
				xor edx, edx
				mov ebx, movPorSeg
				mul ebx	;El resultado de la multiplicacion está en EDX:EAX
				xor edx, edx
				mov ebx, 1000
				div ebx	;EAX es el cociente (es, decir, lo que se debe avanzar) EDX es el residuo
				.IF caida == 0
					sub personaje2.destino.y, eax
				.ELSE
					add personaje2.destino.y, eax
				.ENDIF
				
				mov eax, edx
				xor edx, edx
				mov ebx, movPorSeg
				div ebx
				mov residuo, eax
				;add personaje2.destino.x, 5	;ESTO ES PARA UN TIRO PARABOLICO
			.ENDIF
			.IF saltar == 1
				.IF movPorSeg == 0
					mov caida, 1
				.ELSEIF caida == 0
					sub movPorSeg, 1
				.ENDIF
			.ENDIF
			.IF caida == 1
				add movPorSeg, 1
			.ENDIF
			
			mov eax, ticksActual
			mov ticksAnterior, eax

			invoke detectarColisionRectangulo, personaje2.destino, llave.destino.x, llave.destino.y
			.IF eax == 1
				invoke SDL_DestroyTexture, imagenKey
			.ENDIF
			invoke detectarColisionRectangulo, fuego.destino, personaje2.destino.x, personaje2.destino.y
			.IF eax == 1
				.IF vida.origen.x == 10
						.IF vida.origen.y == 35
							mov vida.origen.x, 170
						.ENDIF
						.IF vida.origen.y == 195
							mov vida.origen.x, 170
						.ELSE
						.IF vida.origen.y == 330
							;mov finCiclo, 1
						.ENDIF
					.ENDIF
					.ELSEIF vida.origen.x == 170
						.IF vida.origen.y == 35
							mov vida.origen.x, 330
						.ENDIF
						.IF vida.origen.y == 195
							mov vida.origen.x, 330
						.ENDIF
					.ELSEIF vida.origen.x == 330
						.IF vida.origen.y == 35
							mov vida.origen.x, 10
							mov vida.origen.y, 195
						.ENDIF
						.IF vida.origen.y == 330
							mov vida.origen.x, 10
							mov vida.origen.y, 330
							;mov finCiclo, 1
						.ENDIF
					.ENDIF
			.ENDIF
			invoke SDL_RenderCopy, renderer, imagenKey, addr llave.origen, addr llave.destino

			mov eax, sizeof MI_ELEMENTO
			xor ebx, ebx
			.WHILE ebx < sizeof fuegos
				push ebx
				;.IF fuegos[ebx].visible == 1
					invoke SDL_RenderCopy, renderer, imagenFireball, addr fuegos[ebx].origen, addr fuegos[ebx].destino
					dec fuegos[ebx].destino.x
				;.ENDIF
				pop ebx
				add ebx, sizeof MI_ELEMENTO
			.ENDW
			xor ebx, ebx

			xor eax, eax
			xor ebx, ebx
			invoke SDL_GetTicks
			mov ebx, ticksAnterior
			sub eax, ebx
			xor ebx, ebx
			
			mov num, 0

			;invoke SDL_RenderCopy, renderer, imagenFireball, addr fuegos[0].origen, addr fuegos[0].destino
			;invoke SDL_RenderCopy, renderer, imagenFireball, addr fuegos[32].origen, addr fuegos[32].destino
			invoke SDL_RenderCopy, renderer, imagenFireball, addr fuego.origen, addr fuego.destino
			dec fuego.destino.x
			dec fuego2.destino.x
			dec fuego3.destino.x
			dec fuego4.destino.x
			dec fuego5.destino.x
			dec fuego6.destino.x
			dec fuego7.destino.x
			dec fuego8.destino.x
			dec fuego9.destino.x
			dec fuego10.destino.x
			dec fuego11.destino.x
			dec fuego12.destino.x
			dec fuego13.destino.x
			dec fuego14.destino.x
			dec fuego15.destino.x
			dec fuego16.destino.x
			dec fuego17.destino.x
			dec fuego18.destino.x
			dec fuego19.destino.x
			dec fuego20.destino.x
			dec fuego21.destino.x
			dec fuego22.destino.x
			dec fuego23.destino.x
			dec fuego24.destino.x
			dec fuego25.destino.x
			dec fuego26.destino.x
			dec fuego27.destino.x
			dec fuego28.destino.x
			dec fuego29.destino.x
			dec fuego30.destino.x
			dec fuego31.destino.x

			invoke SDL_RenderCopy, renderer, imagen, addr piso.origen, addr piso.destino
			invoke SDL_RenderCopy, renderer, imagenCharacter, addr personaje2.origen, addr personaje2.destino
			invoke SDL_RenderCopy, renderer, imagen, addr puerta.origen, addr puerta.destino
			invoke SDL_RenderPresent, renderer
	.ENDW
	xor eax, eax
	ret
pantallaJuego endp

pantallaCreditos proc
	LOCAL finCiclo	:BYTE
	LOCAL evento	:SDL_Event
	mov finCiclo, 0
	xor eax, eax

	;invoke crearTexto, addr cadenaTexto1, 110, 0, 200
	.WHILE finCiclo == 0
		invoke  SDL_PollEvent, addr evento
		.WHILE eax != 0
		invoke  SDL_PollEvent, addr evento
		.IF evento.type_ == SDL_QUIT
			mov finCiclo, 1
		.ENDIF
		.ENDW
		
		invoke SDL_RenderClear, renderer

		invoke SDL_RenderCopy, renderer, creditosJuego, addr creditosJ.origen, addr creditosJ.destino
		invoke SDL_RenderCopy, renderer, textoImagen, 0, addr textoRectangulo
		invoke SDL_RenderPresent, renderer
	.ENDW
	xor eax, eax
	ret
pantallaCreditos endp

cicloPrincipal proc
	LOCAL finCiclo	:BYTE
	LOCAL evento	:SDL_Event
	mov finCiclo, 0
    xor eax, eax
	
	invoke Mix_PlayMusic, musica, -1
	.WHILE finCiclo == 0
        
		invoke SDL_PollEvent, addr evento
        
		.WHILE eax != 0
			
			.IF evento.type_ == SDL_QUIT
                
				mov finCiclo, 1
				.ELSEIF evento.type_ == SDL_MOUSEMOTION
					;evento.motion.x contiene la coordenada en x del mouse
					;evento.motion.y contiene la coordenada en y del mouse
					invoke detectarColisionRectangulo, jugar.destino, evento.motion.x, evento.motion.y
					.IF eax ==1
						mov jugar.origen.x, 296
					.ELSE
						mov jugar.origen.x, 81
					.ENDIF
					invoke detectarColisionRectangulo, creditos.destino, evento.motion.x, evento.motion.y
					.IF eax ==1
						mov creditos.origen.x, 296
					.ELSE
						mov creditos.origen.x, 81
					.ENDIF
					invoke detectarColisionRectangulo, salir.destino, evento.motion.x, evento.motion.y
					.IF eax ==1
						mov salir.origen.x, 296
					.ELSE
						mov salir.origen.x, 81
					.ENDIF

					.ELSEIF evento.type_ == SDL_MOUSEBUTTONDOWN
					;Reacciona al hacer click sobre un boton
						invoke detectarColisionRectangulo, jugar.destino, evento.button.x, evento.button.y
						.IF eax ==1
							invoke pantallaJuego
						.ENDIF
						invoke detectarColisionRectangulo, creditos.destino, evento.button.x, evento.button.y
						.IF eax ==1
							invoke pantallaCreditos
						.ENDIF
						invoke detectarColisionRectangulo, salir.destino, evento.button.x, evento.button.y
						.IF eax ==1
							mov finCiclo, 1
						.ENDIF
				.ENDIF
            
			invoke SDL_PollEvent, addr evento
		.ENDW

		invoke SDL_RenderClear, renderer
        
		invoke SDL_RenderCopy, renderer, imagen, addr donaOrigen, addr donaDestino
		invoke SDL_RenderCopy, renderer, imagenInicio, addr nombreT.origen, addr nombreT.destino
		invoke SDL_RenderCopy, renderer, imagenInicio, addr jugar.origen, addr jugar.destino
		invoke SDL_RenderCopy, renderer, imagenInicio, addr creditos.origen, addr creditos.destino
		invoke SDL_RenderCopy, renderer, imagenInicio, addr salir.origen, addr salir.destino
        
		invoke SDL_RenderPresent, renderer
	.ENDW
	xor eax, eax
	ret
cicloPrincipal endp

crearTexto proc cadena:dword, posx:dword, posy:dword, maximoAncho:dword	
	LOCAL superficie :DWORD
	LOCAL color :SDL_Color
	invoke SDL_DestroyTexture, textoImagen ;fuente
	mov color.r, 255
	mov color.g, 255
	mov color.b, 255
	mov color.a, 255
	invoke TTF_RenderText_Blended_Wrapped, fuente, cadena, color, maximoAncho
	mov superficie, eax
	mov eax, posx
	mov textoRectangulo.x, eax
	mov eax, posy
	mov textoRectangulo.y, eax
	mov esi, superficie
	add esi, 8
	mov eax, dword ptr [esi]
	add esi, 4
	mov textoRectangulo.w, eax
	mov eax, dword ptr[esi]
	mov textoRectangulo.h, eax
	invoke SDL_CreateTextureFromSurface, renderer, superficie
	invoke SDL_FreeSurface, superficie
	ret
crearTexto endp

cerrarSDL proc
    invoke SDL_DestroyRenderer, renderer
    invoke SDL_DestroyWindow, ventana
    invoke TTF_CloseFont, fuente
    invoke SDL_JoystickClose, joystick
    invoke SDL_DestroyTexture, imagen
	invoke SDL_DestroyTexture, Piso
	invoke SDL_DestroyTexture, imagenInicio
	invoke SDL_DestroyTexture, imagenBases
	invoke SDL_DestroyTexture, imagenBoss
	invoke SDL_DestroyTexture, imagenEnemy
	invoke SDL_DestroyTexture, imagenFireball
	invoke SDL_DestroyTexture, imagenGameover
	invoke SDL_DestroyTexture, imagenKey
	invoke SDL_DestroyTexture, imagenLife
	invoke SDL_DestroyTexture, imagenCharacter
	invoke SDL_DestroyTexture, creditosJuego
	invoke SDL_DestroyTexture, basesP
	;invoke SDL_DestroyTexture, mensaje
    invoke SDL_DestroyTexture, textoImagen	;estaba deshab
    invoke Mix_FreeMusic, musica
	invoke Mix_FreeMusic, musica1
	invoke Mix_FreeMusic, musicainicio
    invoke Mix_FreeChunk, sonido
	invoke Mix_FreeChunk, sonidoSalto
	invoke Mix_FreeChunk, sonidoSucess
    invoke SDL_Quit
    invoke IMG_Quit
    invoke TTF_Quit
    invoke Mix_Quit
    xor eax, eax
    ret
cerrarSDL endp

main proc c argc:dword, argv:ptr ptr SBYTE
	invoke crt_time, 0
	invoke crt_srand, eax
	invoke crt_rand
	finit
	invoke inicializarSDL
	invoke obtenerRecursos
	invoke cicloPrincipal
    invoke cerrarSDL
	xor eax, eax
	ret
main endp
end main