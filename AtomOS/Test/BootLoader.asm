use16
org 0x7C00	;Адрес загрузки
BootLoader:

;---------------;
cli		; Запрещаем прерывания
xor ax, ax	; Очищаем регистр ax
mov ds, ax	; Устанавливаем сегмент данных на нулевой адрес
mov es, ax	; Устанавливаем сегмент es на нулевой адрес
mov ss, ax	; Устанавливаем сегмент стека на нулевой адрес
mov sp, 07c00h	; Устанавливаем сегмент sp на текущию вершину стека
sti		; Разрешаем прерывания
;---------------;

;Очистка экрана
mov al, 0002h
int 10h

mov al, 11h
int 10h

mov ah, 0Bh
mov bh, 00h
mov bl, 3
int 10h

mov dx, 200
mov cx, 200

mov ah, 0Ch
mov al, 4
mov bh, 0
int 10h

mouse:
xor ax, ax
int 16h

cmp al, 38
jz up
cmp al, 40
jz down

jmp mouse

update:
mov ah, 0Ch
mov al, 4
mov bh, 0
int 10h
jmp mouse

up:
sub dx, 1
jmp update

down:
add dx, 1
jmp update

times(512-2-($-07c00h)) db 0	; Заполняем пустоты нулями
db 055h, 0AAh			; Устанавливаем сигнатуру загрузочного сектора