   
; File: if_else.asm
;
; Program ini:
; a. meminta user memasukkan nilai 1 dan nilai 2 antara 0 - 100
; b. jika salah satu nilai yang dimasukkan lebih dari 100 atau kurang dari 0, program keluar
; c. menghitung jumlah nilai 1 dan nilai 2
; d. jika nilai 1 + nilai 2 >= 150, program menampilkan pesan "Anda lulus"
; e. jika nilai 1 + nilai 2 < 150, program menampilkan pesan "Anda tidak lulus"
;

%include "asm_io.inc"

segment .data
;
; Output strings
;
prompt1          db    	"Masukkan Nilai 1 (0 s.d 100): ", 0
prompt2          db    	"Masukkan Nilai 2 (0 s.d 100): ", 0
err_input_msg	 db		"Angka yang Anda masukkan tidak dalam 0 s.d 100", 0
lulus_msg		 db		"Anda lulus!", 0
gagal_msg		 db		"Anda tidak lulus!", 0

passing_score	 dd		150d


segment .bss
; Deklarasikan variabel untuk menyimpan input user
nilai1			resd	1
nilai2			resd	1

segment .text
        global  _main
_main:
        enter   0,0               ; setup routine
        pusha

		
		; Prompt user untuk memasukkan Nilai 1
		mov eax, prompt1
		call print_string
		call read_int
				
		; Kode untuk mengecek apakah nilai yang dimasukkan antara 0 s.d 100
		; Jika nilai yang dimasukkan < 0 atau > 100, maka tampilkan pesan err_input_msg
		; Catatan: 
		; 1. Fungsi read_int menyimpan angka yang dimasukkan ke register EAX
		; 2. Tulis kode untuk dua kondisi: kurang dari 0 dan lebih dari 100  
		; Jangan lupa untuk menambahkan radiks d untuk komparasi dengan nilai desimal
		; 3. Lompat ke label kode gagal jika tidak memenuhi
		cmp eax, 0d
		jl error

		cmp eax, 100d
		jg error

		mov [nilai1], eax

		; Prompt user untuk memasukkan Nilai 2
		mov eax, prompt2
		call print_string
		call read_int
		
		; Kode untuk mengecek apakah nilai yang dimasukkan antara 0 s.d 100
		; Jika nilai yang dimasukkan < 0 atau > 100, maka tampilkan pesan err_input_msg
		; Catatan: 
		; 1. Fungsi read_int menyimpan angka yang dimasukkan ke register EAX
		; 2. Tulis kode untuk dua kondisi: kurang dari 0 dan lebih dari 100  
		; Jangan lupa untuk menambahkan radiks d untuk komparasi dengan nilai desimal
		; 3. Lompat ke label kode gagal jika tidak memenuhi
		cmp eax, 0d
		jl error

		cmp eax, 100d
		jg error

		mov [nilai2], eax
		
		; Kode untuk menjumlahkan nilai1 + nilai2 dan bandingkan dengan passing_score
		; jika jumlah > passing_score, maka tampilkan string lulus_msg 
		; jika jumlah < passing_score, maka tampilkan string gagal_msg (dengan melompat ke label kode gagal)
		; Pastikan Anda menuliskan instruksi untuk lompat ke label kode end untuk melompati block error dan gagal
		mov ebx, [nilai1]
		add ebx, [nilai2]
		mov eax, ebx
		; call print_int
		; call print_nl
		
		cmp ebx, 150d
		jnl lulus
		jl gagal
		

lulus:
mov eax, lulus_msg
call print_string
jmp end
; Label kode error untuk tujuan instruksi lompat jika angka yang dimasukkan user
; kurang dari 0 atau lebih dari 100.
; Tulis kode untuk menampilkan string err_input_msg
; lalu lompat ke label kode end
error:
mov eax, err_input_msg
call print_string
jmp end

; Label kode gagal untuk tujuan instruksi lompat jika jumlah nilai1 dan nilai2
; kurang dari passing_score
; Tulis kode untuk menampilkan string gagal_msg
gagal:	
mov eax, gagal_msg
call print_string
jmp end

; Label kode untuk tujuan lompat akhir dari program
end:
		
		popa
        mov     eax, 0            ; return back to C
        leave                     
        ret