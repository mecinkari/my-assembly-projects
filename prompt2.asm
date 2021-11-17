   ; directive include
%include "asm_io.inc"

segment .data
   ; directive Dx
   msg1  db    "Masukkan angka 1: ", 0
   msg2  db    "Masukkan angka 2: ", 0
   msg3  db    "Angka pertama yang Anda masukkan: ", 0
   msg4  db    "Angka kedua yang Anda masukkan: ", 0
	
segment .bss
   ; directive RESx
   input1   RESd  1
   input2   RESd  1

segment .text
   global _main
   _main:
      ; Routine “setup”
      enter  0, 0
      pusha

      ; Program Anda di bawah
      mov eax, msg1
      call print_string
      call read_int
      mov [input1], eax

      mov eax, msg2
      call print_string
      call read_int
      mov [input2], eax

      mov eax, msg3
      call print_string
      mov eax, [input1]
      call print_int
      call print_nl

      mov eax, msg4
      call print_string
      mov eax, [input2]
      call print_int

      ; Routine “cleanup”
      popa
      mov    eax, 0
      leave
      ret
