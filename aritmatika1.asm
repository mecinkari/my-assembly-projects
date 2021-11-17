   
; File: aritmatika1.asm
;
; Program ini meminta user memasukkan dua angka x dan y
; dan menampilkan hasil x + y dan x - y 
; 

%include "asm_io.inc"

segment .data
;
; Output strings
;
prompt1          db    	"Masukkan x: ", 0
prompt2          db    	"Masukkan y: ", 0
jumlah_msg		 db		"x + y = ", 0
selisih_mgs		 db		"x - y = ", 0

segment .bss
; Deklarasikan variabel x dan y dengan besar masing-masing double word (32-bit)
x 	RESd 	1
y 	RESd 	1


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
		; Penjumlahan												   ;
		; Hitung x + y dengan instruksi ADD				               ;
		; dan tampilkan hasilnya									   ;
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		
		; hitung x + y dengan ADD
		mov ebx, [x]
		add ebx, [y]
		
		; tampilkan pesan jumlah_msg
		mov eax, jumlah_msg
		call print_string
		
		; tampilkan nilai hasil penjumlahan
		; pindahkan nilai penjumlahan yang disimpan dalam ebx
		; ke eax. Kenapa? karena fungsi print_int memprint isi dari eax
		mov eax, ebx
		
		; print nilai hasil penjumlahan (dalam integer) yang tersimpan dalam eax
		call print_int
		
		; print baris baru dengan memanggil fungsi print_nl
		call print_nl

		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		; Pengurangan												   ;
		; Hitung x - y dengan instruksi SUB                            ;
		; dan tampilkan hasilnya									   ;
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        
		; hitung x - y dengan SUB
		mov ebx, [x]
		sub ebx, [y]
		
		; tampilkan pesan selisih_mgs
		mov eax, selisih_mgs
		call print_string
		
		; tampilkan nilai hasil pengurangan
		; pindahkan nilai pengurangan yang disimpan dalam ebx
		; ke eax. Kenapa? karena fungsi print_int memprint isi dari eax
		mov eax, ebx
		
		; print nilai hasil pengurangan (dalam integer) yang tersimpan dalam eax
		call print_int
		
		; print baris baru dengan memanggil fungsi print_nl
		call print_nl		
		
		popa
    mov     eax, 0            ; return back to C
    leave                     
    ret
