; file: factorial32.asm
; description: Function written in assembly 32 bits to calculate the factorial of a number

section .info
    ASM_UTILS_DEF_GLOBAL_FUNCTION(factorial)

section .data

section .bss

section .text

ASM_UTILS_FUNCTION(factorial):
    
; function entry
    prologue 0					; initial standard function setup

; initial value
    mov     eax, 1                          	; Set eax = 1, initial value for factorial calc

; Test the parameter
    cmp     DWORD [ebp + 8], 2              	; if (parm < 2) return 1        
    jl      .done

; Calculate the factorial
    push    ecx                             	; Save ecx current value
    mov     ecx, DWORD [ebp + 8]            	; Set ecx = parm
.loop:
    mul     ecx                             	; Set eax *= ecx
    loop    .loop                           	; Decrement ecx, then If ecx == 0 exit loop, else continue the multiplication
    pop     ecx                             	; Restore ecx previus value

; function return
.done:
    epilogue 0
    ret                                     	; Return the value in EAX

; compile: nasm -fwin32 factorial32.asm -ofactorial32.obj
