use16
org 500h
Kernel:

mov al, 0002h
int 10h

mov ah, 0x0E
mov al, 'A'
int 10h

mov ah, 0x0E
mov al, 't'
int 10h

mov ah, 0x0E
mov al, 'o'
int 10h

mov ah, 0x0E
mov al, 'm'
int 10h

mov ah, 0x0E
mov al, 'O'
int 10h

mov ah, 0x0E
mov al, 'S'
int 10h

mov ah, 0x0E
mov al, ' '
int 10h

mov ah, 0x0E
mov al, 'M'
int 10h
mov ah, 0x0E
mov al, 'i'
int 10h
mov ah, 0x0E
mov al, 'n'
int 10h
mov ah, 0x0E
mov al, 'i'
int 10h

writer:
      xor ax, ax

      int 16h
      mov ah, 0x0E
      int 10h
jmp writer

jmp $
