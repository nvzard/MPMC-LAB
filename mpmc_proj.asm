
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h


jmp START       ; jump over data declaration


msg1:    db      "Processing sensor 1...", 0Dh,0Ah, 24h
msg2:    db      "Processing sensor 2...", 0Dh,0Ah, 24h
data:    db      "DATA:", 0Dh,0Ah, 24h 
temp:    db      "Temperature(celsius):", 0Dh,0Ah, 24h
hum:     db      "Humidity(percent):", 0Dh,0Ah, 24h

sensor1: db      31h, 32h, 33h, 34h, 35h ;110, 115, 114, 105, 120
sensor2: db      36h, 37h, 38h, 39h, 30h ;113, 109, 122, 111, 106

START:  

        mov     dx, msg1  ; load offset of msg into dx.
        mov     ah, 09h  ; print function is 9.
        int     21h      ; do it!                    
        
        mov cx, 5
        lea SI, sensor1
        
l1: 
   
    mov ah, 09h
    mov dx, data                  ;Print "DATA:"
    int 21h
 
    mov ah, 02h
    mov dx, [SI]                  ;Print num
    int 21h    
    
    mov ah, 2h
    mov DL, 0ah                   ;Print Newline
    int 21h             
    
    mov ah, 09h
    mov dx, temp                  ;Print "Temperature:"
    int 21h
           
    mov bx, [SI]                  ; Processing
    add bx, 30h
    mov dx, bx
    mov ah, 2h
    int 21h                       ;Print temp
    
    mov ah, 2h
    mov DL, 0ah                   ;Print Newline
    int 21h                     
    
    mov ah, 09h
    mov dx, hum                  ;Print "Humidity:"
    int 21h
           
    mov bx, [SI]                  ;Processing
    add bx, 20h
    mov dx, bx
    mov ah, 2h
    int 21h                       ;Print hum
    
    mov ah, 2h
    mov DL, 0ah                   ;Print Newline
    int 21h 
    
    inc SI   
loop l1        

    mov ah, 2h
    mov DL, 0ah                   ;Print Newline
    int 21h 

    mov cx, 5
    lea SI, sensor2
        
    mov dx, msg2
    mov ah, 09h
    int 21h

l2: 
   
    mov ah, 09h
    mov dx, data                  ;Print "DATA:"
    int 21h
 
    mov ah, 02h
    mov dx, [SI]                  ;Print num
    int 21h    
    
    mov ah, 2h
    mov DL, 0ah                   ;Print Newline
    int 21h             
    
    mov ah, 09h
    mov dx, temp                  ;Print "Temperature:"
    int 21h
           
    mov bx, [SI]                  ; Processing
    add bx, 30h
    mov dx, bx
    mov ah, 2h
    int 21h                       ;Print temp
    
    mov ah, 2h
    mov DL, 0ah                   ;Print Newline
    int 21h                     
    
    mov ah, 09h
    mov dx, hum                  ;Print "Humidity:"
    int 21h
           
    mov bx, [SI]                  ;Processing
    add bx, 20h
    mov dx, bx
    mov ah, 2h
    int 21h                       ;Print hum
    
    mov ah, 2h
    mov DL, 0ah                   ;Print Newline
    int 21h 
    
    inc SI   
loop l2                                            
                                                     
        mov     ah, 0 
        int     16h      ; wait for any key....
    
ret ; return to operating system.