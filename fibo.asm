; fibo.asm
; Meminta user untuk memasukkan suatu nilai n
; dan mengembalikan suku ke-n dari bilangan fibonacci
; 

%include "asm_io.inc"

segment .data
;
; Output strings
;
prompt          db    	"Masukkan n: ", 0

segment .bss


segment .text
        global  _main
_main:
        enter   0,0               ; setup routine
        pusha
		;; Kode program Anda di bawah
		
		mov  	eax, prompt
		call	print_string
		call	read_int
		
		; angka yang dimasukkan user berada di eax
		; push angka ini ke stack
		
		push	eax			; simpan parameter 1 ke stack
		call	fibo		; panggil subprogram factorial
		add		esp, 4		; bersihkan parameter 1
		
		call	print_int	; print hasil
		
		;; Kode program Anda di atas
		;; Jangan modifikasi program di bawah
		popa
        mov     eax, 0            ; return back to C
        leave                     
        ret


;; Subprogram Fibonacci
;
;  int fibonaci(int num) {
 ; 		int x;
;		// kondisi base
 ;      if (num == 0) return 0; 
;		if (num == 1) return 1;
;		x = f(num-1);
;		return x + f(num-2);
; 
fibo:
    mov     eax,[esp+4]            ;eax = n  
        cmp     eax,2               ;br if n < 2
        jb      _endFIbofunc
        dec     eax                     ;push n-1
        push    eax
        call    fibo             ;returns eax = fib(n-1)
        xchg    eax,[esp]              ;eax = n-1, [esp] = fib(n-1)
        dec     eax                    ;push n-2
        push    eax
        call    fibo             ;returns eax = fib(n-2)
        add     eax,[esp+4]     ;eax = fib(n-1)+fib(n-2)
        add     esp,8
_endFIbofunc:
    ret
;; Tulis kode untuk subprogram yang menghitung suku ke-n barisan Fibonacci
;; Gunakan subprogram rekursif