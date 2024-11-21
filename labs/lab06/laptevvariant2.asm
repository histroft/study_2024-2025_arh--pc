%include 'in_out.asm' ; подключение внешнего файла
SECTION .data
msg: DB 'Введите значение переменной x: ',0
div: DB 'Результат: ',0
SECTION .bss
x: RESB 80
SECTION .text
GLOBAL _start
_start:
; ---- Ввод x
mov eax, msg
call sprint
mov ecx, x
mov edx, 80
call sread
; ---- Вычисление выражения
mov eax, msg
mov eax,x ; вызов подпрограммы преобразования
call atoi ; ASCII кода в число, `eax=x`
mov ebx,12 ; запись значения 12 в регистр ebx
mul ebx; EAX = EAX * EBX
add eax,3; EAX = EAX+3
mov ebx,5; EAX = EAX * EBX
mul ebx
mov edi,eax ; запись результата вычисления в 'edi'
; ---- Вывод результата на экран
mov eax,div ; вызов подпрограммы печати
call sprint ; сообщения 'Результат: '
mov eax,edi ; вызов подпрограммы печати значения
call iprintLF ; из 'edi' в виде символов
call quit ; вызов подпрограммы завершения
