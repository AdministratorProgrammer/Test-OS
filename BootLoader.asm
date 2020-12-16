        use16
        ORG 0x7C00            ; // ����� ������������ ������� � ������ 0:7C00
        BootLoader:; // ����������� ������ 512 ����

        ;---------------------;
         cli                  ; // ��������� ����������
         xor ax, ax           ; // ������� ������� AX = 0
         mov ds, ax           ; // ������� DS
         mov es, ax           ; // ������� ES
         mov ss, ax           ; // ������� SS
         mov sp, 0xFFFF       ; // �������� �����
         sti                  ; // ��������� ����������
        ;---------------------;

        ;---------------------; // ��������� �������� ����� A20
         cli                  ;
         in   al,0x92         ;
         or   al,2            ;
         out  0x92,al         ;
         sti                  ;
        ;---------------------;

        ;---------------------;
         cli                  ; // �������� ����������
         push ds              ; // �������� ������� �������� ds
        ;---------------------;
         lgdt [gdtinfo]       ; // load gdt register
        ;---------------------;
         mov  eax, cr0        ; // ������� � ���������� �����
         or   al,1            ; //
         mov  cr0, eax        ; //
        ;---------------------;
         jmp  $+2             ; // tell 386/486 to not crash
         mov  bx, 0x08        ; // select descriptor 1
         mov  ds, bx          ; // 8h = 1000b
        ;---------------------;
         and  al,0xFE         ; // ���������� � �������� �����
         mov  cr0, eax        ;
        ;---------------------;
         pop ds               ; // ������������� ������� �������� DS
         sti                  ;
        ;---------------------;


         ;-----------------; // DL ����� ����� ����������� ��� ������� ������������ ������� �� ����
         mov dh, 0         ; // �������  1
         mov ch, 0         ; // �������
         mov cl, 1         ; // 1-� ������
         mov ax, 0         ; // ����� �������� ���� ���������
         mov es, ax        ; // ����� ���� ���������
         mov bx, 0x7C00    ; // ����� ���� ���������
         mov al, 18        ; // ���-�� �������� ��������  �� �������� ���������
         mov ah, 2         ; // ����� ������� � ���� ��� ������ � �����
         int 0x13          ; // ��������� ������� ����� ��������� 10 �������� ��� ��� ������ ������ ��� ����������� � ����� � 1 ������� 18 ��������
        ;------------------;

        ;------------------;
         cli               ; // ��������� ����������
         xor ax, ax        ;
         mov ds, ax        ;
         mov es, ax        ;
         mov ss, ax        ;
         mov sp, 0xFFFF    ; // �������� �����
         sti               ; // ��������� ����������
        ;------------------;
         jmp OS      ; // ������� � ���������� ���������
        ;------------------;

        gdtinfo:;--------------------------------------------------
        dw gdt_end - gdt - 1   ; // ������ ������ GDT-1 ����
        dd gdt                 ; // ������ ������� GDT
        gdt     :   dd 0,0     ; // entry 0 is always unused
        flatdesc:   db 0xff, 0xff, 0, 0, 0, 10010010b, 11001111b, 0
        gdt_end :              ; // ����� �������  GDT
        ;----------------------------------------------------------

        times 0x200  - 2 - ($ - BootLoader) db 0x90
        db  0x55, 0xAA     ; // ��������� ������������ �������

;===============================================================================END
; ���������  ===================================================================ASM
           OS: ; // ������ ���������	
	jmp 500h

	jmp $
OS_END:;{
times 1474560 - ($-0x7C00)  db 0x90 ; // 1474560 - ������ ������� 1.44 ��
;}