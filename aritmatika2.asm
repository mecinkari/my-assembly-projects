   
; File: aritmatika2.asm
;
; Program ini meminta user memasukkan dua angka x dan y
; dan menampilkan hasil x * y dan x / y beserta sisa baginya 
; 

%include "asm_io.inc"

segment .data
;
; Output strings
;
prompt1          db    	"Masukkan x: ", 0
prompt2          db    	"Masukkan y: ", 0
kali_msg		 db		"x * y = ", 0
bagi_msg		 db		"x / y = ", 0
sisa_msg		 db		"Sisa x / y = ", 0

segment .bss
; Deklarasikan variabel x dan y dengan besar masing-masing double word (32-bit)
x 	RESd 	1
y 	RESd 1

segment .text
        global  _main
_main:
        enter   0,0               ; setup routine
        pusha

		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		; Prompt user untuk memasukkan dua angka 					  ;
		;															  ; 
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		
		; Prompt user untuk memasukkan x
		; dan simpan angka yang dimasukkan ke variabel x

		mov eax, prompt1
		call print_string
		call read_int
		mov [x], eax

		; Prompt user untuk memasukkan y 
		; dan simpan angka yang dimasukkan ke variabel y 
		
		mov eax, prompt2
		call print_string
		call read_int
		mov [y], eax
		
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		; Perkalian												 	   ;
		; Hitung x * y dengan instruksi IMUL 32 bit		               ;
		; dan tampilkan hasilnya									   ;
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		
		; hitung x * y dengan IMUL 32 bit
		; (Gunakan varian 1 operand	
		
		; tampilkan pesan kali_msg
		mov eax, kali_msg
		call print_string
		
		; tampilkan nilai hasil perkalian dan baris baru
		mov eax, [x]
		mov ebx, [y]
		imul ebx
		call print_int
		call print_nl

		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		; Pembagian									 				   ;
		; Hitung x / y dengan instruksi IDIV 32 bit                    ;
		; dan tampilkan hasil bagi dan sisa bagi 					   ;
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        
		; hitung x / y dengan IDIV 32 bit
		; EDX:EAX / EBX -> Hasil bagi disimpan dalam EAX
		; dan sisa bagi disimpan dalam EDX
		
		; tampilkan pesan hasil bagi
		mov eax, bagi_msg
		call print_string
		
		; tampilkan nilai hasil bagi dan baris baru
		mov eax, [x]
		cdq
		mov ebx, [y]
		idiv ebx
		call print_int
		call print_nl

		; tampilkan pesan sisa bagi
		mov eax, sisa_msg
		call print_string
		
		; tampilkan nilai sisa bagi dan baris baru
		mov eax, edx
		call print_int
		call print_nl
		
		popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
