%include 'in_out.asm'

SECTION .data
msg_func db "Функция: f(x) = 3x - 1", 0
msg_result db "Результат: ", 0

SECTION .text
GLOBAL _start

_start:
    ; Выводим сообщение о функции
    mov eax, msg_func
    call sprintLF

    ; Инициализируем счетчики и регистры
    pop ecx      ; Количество аргументов (включая имя программы)
    pop edx      ; Имя программы (не нужен)
    sub ecx, 1   ; Уменьшаем на 1, чтобы исключить имя программы
    mov esi, 0   ; Инициализируем сумму

next:
    cmp ecx, 0h
    jz _end      ; Если аргументов нет, завершаем

    pop eax      ; Берем следующий аргумент
    call atoi    ; Преобразуем строку в число

    call _calculate_fx ; Вычисляем f(x)

    add esi, eax ; Добавляем результат к сумме
    loop next    ; Переходим к следующему аргументу

_end:
    ; Выводим результат
    mov eax, msg_result
    call sprint
    mov eax, esi
    call iprintLF

    ; Завершаем программу
    call quit

_calculate_fx:
    ; Вычисляем f(x) = 3x - 1
    mov ebx, 3
    mul ebx
    sub eax, 1
    ret

Find More
