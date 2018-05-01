org 100h

jmp START       ; jump over data declaration
                                                                ; Normal --> Humidity <= 50
normal:  db     "and humidity is normal", 0Dh,0Ah, 24h          ; Humid -->  50 < Humidity < 90
sunny:   db     "It is Sunny...", 0Dh,0Ah, 24h                  ; Rainy --> 90 <= Humidity
rainy:   db     "and it is Raining...", 0Dh,0Ah, 24h            ; Sunny --> Temp >= 30
dry:     db     "and humidity is dry...", 0Dh,0Ah, 24h          ; Cold --> Temp < 30
cold:    db     "It is Cold...", 0Dh,0Ah, 24h
ITEMP:   db     "Input Temperature(celsius)[2 digits]:", 0Dh,0Ah, 24h
IHUMD:   db     "Input Humidity(percent):", 0Dh,0Ah, 24h


START: 

    mov ax, 0700h               ; Init DS
    mov ds, ax 

    mov     dx, ITEMP           ; Print 'Input Temperature:'
    mov     ah, 09h      
    int     21h                           
        
    mov di, 1100h               ; Take 2 digit inputs and store at 1100h
    mov cx, 02h                 ; itemp @ 1100h
    l1: mov ah, 01h      
        int 21h
        stosb
        loop l1
    
    mov ah, 02h  
    mov dx, 0xBA                ; Print Degree
    int 21h    
        
    call newline
    
    mov dx, IHUMD               ; Print 'Input Humidity:'
    mov ah, 09h  
    int 21h 
     
                                
    mov di, 1500h               ; Take 2 digit inputs and store at 1500h
    mov cx, 02h                 ; ihumd @ 1500h
    l2: mov ah, 01h              
        int 21h
        stosb
        loop l2
        
    mov ah, 02h  
    mov dx, 0x25                ; Print Percentage
    int 21h 
        
    call newline
        
    mov ax, 3330h               ;Init AX to 30 for comparision(temperature)
    mov bx, [1100h] 
    mov dl, bh
    mov bh, bl
    mov bl, dl
    cmp bx, ax 
    
    call newline
                              
    
    jae LHOT                    ;Comparing Temperature 
    jb LCOLD

    
    LHOT:
         mov dx, sunny          ; Print 'its sunny'
         mov ah, 09h
         int 21h 
         
         call newline  
           
         mov ax, 3530h           ;Init AX to 50 for comparision(humidity)
         mov bx, [1500h]
         mov dl, bh
         mov bh, bl              ; swapping
         mov bl, dl
         
         cmp bx, ax               ;Comparing  humidity
         
         jae LHUMID
         jb LDRY
         
         LHUMID:
                mov ax, 3930h               ;Init AX to 90 for comparision( rainy or not)
                cmp bx, ax
                
                ja LRAINY
                                            ; Print 'Its Normal'
                mov dx, normal
                mov ah, 09h
                int 21h 
                hlt    
                
                LRAINY:
                      mov dx, rainy          ; Print 'Its rainy'
                      mov ah, 09h
                      int 21h
                      hlt
                      
          LDRY:
               mov dx, dry                   ; Print 'Its dry'
               mov ah, 09h
               int 21h
               hlt
                      
     LCOLD:  
            mov dx, cold                     ; Print 'Its cold'
            mov ah, 09h
            int 21h 
             
            call newline
             
            mov ax, 3530h                      ;Init AX to 50 for comparision( normal or dry)
            mov bx, [1500h]
            mov dl, bh
            mov bh, bl
            mov bl, dl
            cmp bx, ax
         
         jae LHUMID
         jb LDRY
         
         
     PROC newline               ; Procedure to print New line
         mov ah, 02h  
         mov dl, 0ah
         int 21h        
         ret
     ENDP newline       