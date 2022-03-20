; file: asmutils.asm
; description: main file of the library. its include all other files

%include "asmutils.mac"

%if ASM_UTILS_BITS = BITS_32
    %include "factorial\factorial32.asm"
%endif

; compile: