TITLE Print Registers (Print_Registers.asm)
; �й�, �̸�, �׸��� ���� �������� �� ��� (Irvine32 ���)
; --------------------------------------------------------------

INCLUDE Irvine32.inc

.data
studentID  BYTE "�й� : 2023664016",0
studentName BYTE "�̸� : ��ä��",0
msgTitle   BYTE "���� �������� ��",0
separator  BYTE "-----------------------------",0

fmtLine    BYTE "%s : %08X",0
newline    BYTE 0Dh,0Ah,0

regEAX BYTE "EAX",0
regEBX BYTE "EBX",0
regECX BYTE "ECX",0
regEDX BYTE "EDX",0
regESI BYTE "ESI",0
regEDI BYTE "EDI",0
regEBP BYTE "EBP",0
regESP BYTE "ESP",0

.code
main PROC
    call Clrscr

    ; �й�, �̸� ���
    mov edx, OFFSET studentID
    call WriteString
    call Crlf

    mov edx, OFFSET studentName
    call WriteString
    call Crlf
    call Crlf

    mov edx, OFFSET msgTitle
    call WriteString
    call Crlf

    mov edx, OFFSET separator
    call WriteString
    call Crlf

    ; �������Ϳ� �׽�Ʈ �� ���� (���� ����)
    mov eax, 1111FFFFh
    mov ebx, ABBCFFFFh
    mov ecx, 1245FFFFh
    mov edx, 44444444h
    mov esi, 55555555h
    mov edi, 66666666h
    mov ebp, esp

    ; ���� ���
    push eax
    push OFFSET regEAX
    call PrintReg
    add esp, 8

    push ebx
    push OFFSET regEBX
    call PrintReg
    add esp, 8

    push ecx
    push OFFSET regECX
    call PrintReg
    add esp, 8

    push edx
    push OFFSET regEDX
    call PrintReg
    add esp, 8

    push esi
    push OFFSET regESI
    call PrintReg
    add esp, 8

    push edi
    push OFFSET regEDI
    call PrintReg
    add esp, 8

    push ebp
    push OFFSET regEBP
    call PrintReg
    add esp, 8

    mov eax, esp
    push eax
    push OFFSET regESP
    call PrintReg
    add esp, 8

    call Crlf
    exit
main ENDP

;------------------------------------------------------------
; PrintReg
;   [esp+4] = �������� �̸� �ּ�
;   [esp+8] = �� (DWORD)
;------------------------------------------------------------
PrintReg PROC
    push ebp
    mov ebp, esp

    mov edx, [ebp+8]   ; �������� �̸�
    call WriteString
    mov al, ' '
    call WriteChar
    mov al, ':'
    call WriteChar
    mov al, ' '
    call WriteChar

    mov eax, [ebp+12]  ; ��
    call WriteHex
    call Crlf

    pop ebp
    ret
PrintReg ENDP

END main
