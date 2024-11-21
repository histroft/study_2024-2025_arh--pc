%include 'in_out.asm'

SECTION .data
msg_x: DB 'Введите значение переменной x: ', 0
msg_a: DB 'Введите значение переменной a: ', 0
res: DB 'Результат: ', 0

SECTION .bss
x: RESB 80
a: RESB 80

SECTION .text
GLOBAL _start

_start:
    ; Запрос значения x
    mov eax, msg_x
    call sprint
    mov ecx, x
    mov edx, 80
    call sread
    mov eax, x
    call atoi
    mov edi, eax  ; Сохраняем значение x в edi

    ; Запрос значения a
    mov eax, msg_a
    call sprint
    mov ecx, a
    mov edx, 80
    call sread
    mov eax, a
    call atoi
    mov esi, eax  ; Сохраняем значение a в esi

    ; Сравниваем x и a
    cmp edi, esi
    jl subtract_one_a  ; Если x < a, переходим к subtract_one_a

    ; Если x >= a, вычитаем 1 из x
    dec edi  ; edi = x - 1
    jmp print_result

subtract_one_a:
    ; Вычитаем 1 из a
    dec esi  ; esi = a - 1
    mov edi, esi  ; Перемещаем результат в edi для вывода

print_result:
    ; Выводим результат
    mov ecx, res
    call sprint
    mov eax, edi
    call iprintLF
    call quit

