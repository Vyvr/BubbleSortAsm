INCLUDE Irvine32.inc

.data
    arraySize DWORD 10
    array DWORD 10 dup (?)

    promptPassValues db "Pass 10 values to array:", 0
    promptOriginal db "Original array:", 0
    promptSorted db "Sorted array:", 0

.code
main PROC
    ; Read numbers into the array
    mov edx, OFFSET promptPassValues
    call WriteString
    call Crlf
    call ReadArray

    ; Display the original array
    mov edx, OFFSET promptOriginal
    call WriteString
    call Crlf
    call DisplayArray

    ; Sort the array using Bubble Sort
    call BubbleSort

    ; Display the sorted array
    mov edx, OFFSET promptSorted
    call WriteString
    call Crlf
    call DisplayArray

    exit
main ENDP

; Bubble Sort procedure
BubbleSort PROC
    mov ecx, arraySize
    dec ecx
outerLoop:
    push ecx
    mov ecx, arraySize
    dec ecx
    lea esi, array
innerLoop:
    mov eax, [esi]
    mov ebx, [esi+4]
    cmp eax, ebx
    jle noSwap
    xchg eax, [esi+4]
    mov [esi], eax
noSwap:
    add esi, 4
    loop innerLoop
    pop ecx
    loop outerLoop
    ret
BubbleSort ENDP

; Procedure to display the array
DisplayArray PROC
    mov ecx, arraySize
    lea esi, array
displayLoop:
    mov eax, [esi]
    call WriteInt
    call Crlf
    add esi, 4
    loop displayLoop
    ret
DisplayArray ENDP

; Procedure to read the array
ReadArray PROC
    mov ecx, arraySize
    lea esi, array
readLoop:
    call ReadInt
    mov [esi], eax
    add esi, 4
    loop readLoop
    ret
ReadArray ENDP

END main