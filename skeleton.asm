   ; directive include
%include "asm_io.inc"

segment .data
   ; directive Dx
	
segment .bss
   ; directive RESx

segment .text
   global _main
   _main:
      ; Routine “setup”
      enter  0, 0
      pusha

      ; Program Anda di bawah


      ; Routine “cleanup”
      popa
      mov    eax, 0
      leave
      ret