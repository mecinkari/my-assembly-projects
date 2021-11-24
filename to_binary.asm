   
; File: to_binary.asm
;
; Program ini mengkonversi angka desimal yang dimasukkan user ke biner
;

%include "asm_io.inc"

segment .data
;
; Output strings
;
prompt          db    	"Masukkan angka (0 s.d 255): ", 0

segment .bss


segment .text
        global  _main
_main:
        enter   0,0               ; setup routine
        pusha
		;; Kode program Anda di bawah
		;; Jangan modifikasi kode-kode di atas
		
		; Prompt user untuk memasukkan angka 0 s.d 255
		mov eax, prompt
		call print_string
		call read_int

		; eax digunakan dalam print_int untuk print angka "0" atau "1"
		; jadi kita harus memindahkan angka yang dimasukkan user ke register lain
		; ebx akan kita gunakan untuk nilai bitmask
		; ecx digunakan sebagai counter loop
		; sehingga kita harus pindahkan nilai yang dimasukkan user ke register selain eax, ebx, dan ecx
		mov edx, eax
		mov ebx, 10000000b
		; siapkan angka untuk pembanding nilai bit di register ebx
		; kita mulai dengan bit ke-7 jadi angka pembanding kita 10000000


		
;; loop dari bit 7 ke bit 0
;; pada setiap loop jalankan instruksi test 
;; (instruksi test melakukan operasi AND namun tidak menyimpan hasilnya)
;; buat if-else print "0" jika hasil 0, print "1" jika tidak
		
		; siapkan counter untuk loop
		jmp loop_start
		
loop_start:
		; bandingkan angka yang dimasukkan dengan nilai bitmask
		; lompat ke label yang sesuai
		
	mov eax, edx
	cmp ebx, 000000000b
	je end
	test eax, ebx
	je print_0
	jne print_1
	jmp loop_start
; jika hasil 1
print_1:
	mov eax, 1d
	call print_int
	jmp end_if		
		
; jika hasil 0
print_0:
	mov eax, 0d
	call print_int
	jmp end_if
		
		
end_if:
        ; geser bit nilai bitmask ke kanan pada setiap loop sehingga:
		; loop ke-1: memeriksa bit 7 dengan nilai bitmask 10000000
		; loop ke-2: memeriksa bit 6 dengan nilai bitmask 01000000
		; loop ke-3: memeriksa bit 5 dengan nilai bitmask 00100000
		; dan seterusnya
	shr ebx, 1
	jmp loop_start
		
		
end:
	;; Kode program Anda di atas
	;; Jangan modifikasi program di bawah
	popa
	mov     eax, 0            ; return back to C
	leave                     
	ret