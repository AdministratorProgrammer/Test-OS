use16
org 500h
Kernel:

mov al, 0002h
int 10h

mov ah, 0x0E
mov al, 'H'
int 10h

mov ah, 0x0E
mov al, 'e'
int 10h

mov ah, 0x0E
mov al, 'l'
int 10h

mov ah, 0x0E
mov al, 'l'
int 10h

mov ah, 0x0E
mov al, 'o'
int 10h

mov ah, 0x0E
mov al, '!'
int 10h

writer:
      xor ax, ax

      int 16h
      mov ah, 0x0E
      int 10h
jmp writer

jmp $