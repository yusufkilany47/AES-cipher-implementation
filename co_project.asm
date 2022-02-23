
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

include 'emu8086.inc'
org 100h
      
      
.data segment 

arr db 16 dup(?)  

n1 db ?

counter dw 0h 

counter2 dw 0h 

counter3 dw 0h     

counter4 dw 0h

col_counter dw 0h

array db 0h, 0h, 0h, 0h    

matrix db 02h, 03h, 01h, 01h 
       db 01h, 02h, 03h, 01h 
       db 01h, 01h, 02h, 03h 
       db 03h, 01h, 01h, 02h  
       
input db 32h, 88h, 31h, 0e0h
      db 43h, 5ah, 31h, 37h
      db 0f6h, 30h, 98h, 07h
      db 0a8h, 8dh, 0a2h, 34h 
      
key1 db 2bh ,28h,0abh,09h,7eh,0aeh,0f7h,0cfh,15h,0d2h,15h,4fh,16h,0a6h,88h,3ch  

key2 db 0a0h,88h,23h,2ah,0fah,54h,0a3h,6ch,0feh,2ch,39h,76h,17h,0b1h,39h,05h     

key3 db 0f2h,7ah,59h,73h,0c2h,96h,35h,59h,95h,0b9h,80h,0f6h,0f2h,43h,7ah,7fh 

key4 db 3dh,47h,1eh,6dh,80h,16h,23h,7ah,47h,0feh,7eh,88h,7dh,3eh,44h,3bh  

key5 db 0efh,0a8h,0b6h,0dbh,44h,52h,71h,0bh,0a5h,5bh,25h,0adh,41h,7fh,3bh,00h   

key6 db 0d4h,7ch,0cah,11h,0d1h,83h,0f2h,0f9h,0c6h,9dh,0b8h,15h,0f8h,87h,0bch,0bch    

key7 db 6dh,11h,0dbh,0cah,88h,0bh,0f9h,00h,0a3h,3eh,86h,93h,7ah,0fdh,41h,0fdh   

key8 db 4eh,5fh,84h,4eh,54h,5fh,0a6h,0a6h,0f7h,0c9h,4fh,0dch,0eh,0f3h,0b2h,4fh  

key9 db 0eah,0b5h,31h,7fh,0d2h,8dh,2bh,8dh,73h,0bah,0f5h,29h,21h,0d2h,60h,2fh 
    
key10 db 0ach,19h,28h,57h,77h,0fah,0d1h,5ch,66h,0dch,29h,00h,0f3h,21h,41h,6eh 
    
key11 db 0d0h,0c9h,0e1h,0b6h,14h,0eeh,3fh,63h,0f9h,25h,0ch,0ch,0a8h,89h,0c8h,0a6h

cipher db 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh 
         
s_box db 63h,7ch,77h,7bh,0f2h,6bh,6fh,0c5h,30h,01h, 67h,2bh,0feh,0d7h,0abh,76h                                   
      db 0cah,82h,0c9h,7dh,0fah,59h,47h,0f0h,0adh,0d4h,0a2h,0afh,9ch,0a4h,72h,0c0h
      db 0b7h,0fdh,93h,26h,36h,3fh,0f7h,0cch,34h,0a5h,0e5h,0f1h,71h,0d8h,31h,15h
      db 04h,0c7h,23h,0c3h,18h,96h,05h,9ah,07h,12h,80h,0e2h,0ebh,27h,0b2h,75h
      db 09h,83h,2ch,1ah,1bh,6eh,5ah,0a0h,52h,3bh,0d6h,0b3h,29h,0e3h,2fh,84h
      db 53h,0d1h,00h,0edh,20h,0fch,0b1h,5bh,6ah,0cbh,0beh,39h,4ah,4ch,58h,0cfh
      db 0d0h,0efh,0aah,0fbh,43h,4dh,33h,85h,45h,0f9h,02h,7fh,50h,3ch,9fh,0a8h
      db 51h,0a3h,40h,8fh,92h,9dh,38h,0f5h,0bch,0b6h,0dah,21h,10h,0ffh,0f3h,0d2h
      db 0cdh,0ch,13h,0ech,5fh,97h,44h,17h,0c4h,0a7h,7eh,3dh,64h,5dh,19h,73h
      db 60h,81h,4fh,0dch,22h,2ah,90h,88h,46h,0eeh,0b8h,14h,0deh,5eh,0bh,0dbh
      db 0e0h,32h,3ah,0ah,49h,06h,24h,5ch,0c2h,0d3h,0ach,62h,91h,95h,0e4h,79h
      db 0e7h,0c8h,37h,6dh,8dh,0d5h,4eh,0a9h,6ch,56h,0f4h,0eah,65h,7ah,0aeh,08h
      db 0bah,78h,25h,2eh,1ch,0a6h,0b4h,0c6h,0e8h,0ddh,74h,1fh,4bh,0bdh,8bh,8ah
      db 70h,3eh,0b5h,66h,48h,03h,0f6h,0eh,61h,35h,57h,0b9h,86h,0c1h,1dh,9eh
      db 0e1h,0f8h,98h,11h,69h,0d9h,8eh,94h,9bh,1eh,87h,0e9h,0ceh,55h,28h,0dfh
      db 8ch,0a1h,89h,0dh,0bfh,0e6h,42h,68h,41h,99h,2dh,0fh,0b0h,54h,0bbh,16h

               

from_user PROC 
    
  printn 'Enter 16 digits: '  
    
  mov si, offset arr
  mov cx, 16
    
  reading: 
          mov ah, 01h                                                              
          int 21h  
                                         
          mov [si], al  
          inc si
          loop reading     
    
  ret    
  
from_user endp  
       
       
print_array PROC 
    
  printn ' '   
  
  printn 'Your current array: '  
  
  mov si, offset arr
  mov cx, 16
    
  printing: 
           mov ah, 02h
           mov dl, [si]             
           int 21h   
           
           inc si
           loop printing
  ret 
  
print_array endp     

          
          
          
AddRoundKey Macro cipher 
       
  LOCAL l1
            
  mov si, offset arr          
  mov cx, 16
  mov di, 0
    
  l1:
  mov bl, cipher[di]
  xor [si], bl
  inc si
  inc di  
  loop l1 
         
    
endm   
      
      
      
SubBytes macro s_box
    
  LOCAL l2  
  mov si, offset arr
  mov cx, 16
    
  l2:
  mov al,[si]
  ror al, 4
  and al, 0Fh
  mov dl, 10h 
  mul dl
  mov bl,[si]
  and bl, 0Fh
  mov bh, 0
  add ax,bx
                        
  mov di,ax 
  mov al, s_box[di]
  mov [si], al
  inc si
  loop l2  
    
endm     

    
    
ShiftRows macro
            
  LOCAL la,lb                     
  mov si, offset arr  
  mov cx, 3 
  add si, 4 
  mov al, [si] 
  
  la:
   mov dl, [si+1]
   mov [si], dl
   inc si
   loop la  
    
  mov [si], al
  inc si
  mov al, [si]
  mov ah, [si+1] 
  mov cx, 2  
  
  lb:
   mov dl, [si+2]
   mov [si], dl
   inc si
   loop lb
   
   mov [si], al
   mov [si+1], ah 
   
  
  add si, 2 
  mov al, [si]
  mov ah, [si+1]
  mov bl, [si+2]
  
  mov dl, [si+3]
  mov [si], dl
  inc si
  mov [si], al
  mov [si+1], ah
  mov [si+2], bl    
    
endm       



MixColumns macro matrix, array, counter, counter2, counter3, counter4   
                
    LOCAL LoopA,M1,M2,m2z,M3,m3z,next, LoopB,M11,M22,m22z,M33,m33z,next1, LoopC,M111,M222,m222z,M333,m333z,next11, LoopD,M1111,M2222,m2222z,M3333,m3333z,next111 
                
    mov si, offset arr
    mov cx, 04h
    mov di, 0h
    mov bp, 0h  
    
    
    LoopA:
     mov al, [si]
     mov ah, matrix[di]
     cmp ah, 03h
     jz M3
     cmp ah, 02h
     jz M2
     
     M1:
      jmp next
     
     M2:
      and al, 80h
      jz m2z
      mov al, [si]
      shl al, 1
      xor al, 1Bh
      jmp next 
      
      m2z:
       mov al, [si] 
       shl al, 1
       jmp next
      
       
     M3:
      and al, 80h
      jz m3z
      mov al, [si]
      shl al, 1
      xor al, 1Bh 
      mov bl, [si]
      xor al, bl
      jmp next
      
      m3z:
       mov al, [si]
       shl al, 1
       mov bl, [si]
       xor al, bl
       jmp next 
         
     
     next:
      mov [bp], al
      inc di
      inc bp
      add si, 4
      loop LoopA 
    
    
      
    mov bp, 0
    mov al, [bp]
    mov ah, [bp+1]
    mov bl, [bp+2]
    mov bh, [bp+3]  
    
    xor al, ah
    xor bl, bh
    xor al, bl 
    
    mov si, offset arr 
    mov bp, counter
    mov array[bp], al 
    mov bp, 0 
                
    mov cx, 04h            
    inc counter
    cmp counter, 4
    jnz LoopA  
    
    sub counter, 4
    mov al, array[bp]
    mov [si], al
    mov al, array[bp+1]
    mov [si+4], al
    mov al, array[bp+2]
    mov [si+8], al
    mov al, array[bp+3]
    mov [si+12], al  
                      
    ;----------------------------------------------------------------------                      
    ; now on 2nd column 
    
    mov cx, 04h
    mov di, 0h
    mov bp, 0h  
    inc si 
    
    LoopB:
     mov al, [si]
     mov ah, matrix[di]
     cmp ah, 03h
     jz M33
     cmp ah, 02h
     jz M22
     
     M11:
      jmp next1
     
     M22:
      and al, 80h
      jz m22z
      mov al, [si]
      shl al, 1
      xor al, 1Bh
      jmp next1 
      
      m22z:
       mov al, [si] 
       shl al, 1
       jmp next1
      
       
     M33:
      and al, 80h
      jz m33z
      mov al, [si]
      shl al, 1
      xor al, 1Bh 
      mov bl, [si]
      xor al, bl
      jmp next1
      
      m33z:
       mov al, [si]
       shl al, 1
       mov bl, [si]
       xor al, bl
       jmp next1 
         
     
     next1:
      mov [bp], al
      inc di
      inc bp
      add si, 4
      loop LoopB 
    
    
      
    mov bp, 0
    mov al, [bp]
    mov ah, [bp+1]
    mov bl, [bp+2]
    mov bh, [bp+3]  
    
    xor al, ah
    xor bl, bh
    xor al, bl 
    
    mov si, offset arr
    inc si 
    mov bp, counter2
    mov array[bp], al 
    mov bp, 0 
                
    mov cx, 04h            
    inc counter2
    cmp counter2, 4
    jnz LoopB  
        
    sub counter2, 4    
    mov al, array[bp]
    mov [si], al
    mov al, array[bp+1]
    mov [si+4], al
    mov al, array[bp+2]
    mov [si+8], al
    mov al, array[bp+3]
    mov [si+12], al       
       
    
    ;----------------------------------------------------------------------                      
    ; now on 3rd column 
    
    mov cx, 04h
    mov di, 0h
    mov bp, 0h  
    inc si 
    
    LoopC:
     mov al, [si]
     mov ah, matrix[di]
     cmp ah, 03h
     jz M333
     cmp ah, 02h
     jz M222
     
     M111:
      jmp next11
     
     M222:
      and al, 80h
      jz m222z
      mov al, [si]
      shl al, 1
      xor al, 1Bh
      jmp next11 
      
      m222z:
       mov al, [si] 
       shl al, 1
       jmp next11
      
       
     M333:
      and al, 80h
      jz m333z
      mov al, [si]
      shl al, 1
      xor al, 1Bh 
      mov bl, [si]
      xor al, bl
      jmp next11
      
      m333z:
       mov al, [si]
       shl al, 1
       mov bl, [si]
       xor al, bl
       jmp next11 
         
     
     next11:
      mov [bp], al
      inc di
      inc bp
      add si, 4
      loop LoopC 
    
    
      
    mov bp, 0
    mov al, [bp]
    mov ah, [bp+1]
    mov bl, [bp+2]
    mov bh, [bp+3]  
    
    xor al, ah
    xor bl, bh
    xor al, bl 
    
    mov si, offset arr
    inc si
    inc si 
    mov bp, counter3
    mov array[bp], al 
    mov bp, 0 
                
    mov cx, 04h            
    inc counter3
    cmp counter3, 4
    jnz LoopC  
        
    sub counter3, 4    
    mov al, array[bp]
    mov [si], al
    mov al, array[bp+1]
    mov [si+4], al
    mov al, array[bp+2]
    mov [si+8], al
    mov al, array[bp+3]
    mov [si+12], al
    
    ;----------------------------------------------------------------------                      
    ; now on 4th column 
    
    mov cx, 04h
    mov di, 0h
    mov bp, 0h  
    inc si 
    
    LoopD:
     mov al, [si]
     mov ah, matrix[di]
     cmp ah, 03h
     jz M3333
     cmp ah, 02h
     jz M2222
     
     M1111:
      jmp next111
     
     M2222:
      and al, 80h
      jz m2222z
      mov al, [si]
      shl al, 1
      xor al, 1Bh
      jmp next111 
      
      m2222z:
       mov al, [si] 
       shl al, 1
       jmp next111
      
       
     M3333:
      and al, 80h
      jz m3333z
      mov al, [si]
      shl al, 1
      xor al, 1Bh 
      mov bl, [si]
      xor al, bl
      jmp next111
      
      m3333z:
       mov al, [si]
       shl al, 1
       mov bl, [si]
       xor al, bl
       jmp next111 
         
     
     next111:
      mov [bp], al
      inc di
      inc bp
      add si, 4
      loop LoopD 
    
    
      
    mov bp, 0
    mov al, [bp]
    mov ah, [bp+1]
    mov bl, [bp+2]
    mov bh, [bp+3]  
    
    xor al, ah
    xor bl, bh
    xor al, bl 
    
    mov si, offset arr
    inc si
    inc si
    inc si 
    mov bp, counter4
    mov array[bp], al 
    mov bp, 0 
                
    mov cx, 04h            
    inc counter4
    cmp counter4, 4
    jnz LoopD  
        
    sub counter4, 4    
    mov al, array[bp]
    mov [si], al
    mov al, array[bp+1]
    mov [si+4], al
    mov al, array[bp+2]
    mov [si+8], al
    mov al, array[bp+3]
    mov [si+12], al
        
    
endm       
     
    
.code segment  
    
    mov ax, @data 
    mov ds, ax      
             
    ;taking the input from the user         
    ;call from_user                   
             
    ; adding the input in the video              
    mov si, offset arr
    mov cx, 16 
    mov al, input
    mov di, 0
    bnloop:
     mov dl, input[di]
     mov [si], dl
     inc si
     inc di
     loop bnloop  
     
    ;first, adding first round key                    
    AddRoundKey key1         
                 
    ;round 1             
    SubBytes s_box          
    ShiftRows                                            
    MixColumns matrix, array, counter, counter2, counter3, counter4 
    AddRoundKey key2 
    
    ;round 2
    SubBytes s_box          
    ShiftRows                                           
    MixColumns matrix, array, counter, counter2, counter3, counter4      
    AddRoundKey key3 
    
    ;round 3
    SubBytes s_box          
    ShiftRows                                           
    MixColumns matrix, array, counter, counter2, counter3, counter4      
    AddRoundKey key4
     
    ;round 4
    SubBytes s_box          
    ShiftRows                                           
    MixColumns matrix, array, counter, counter2, counter3, counter4      
    AddRoundKey key5
    
    ;round 5
    SubBytes s_box          
    ShiftRows                                           
    MixColumns matrix, array, counter, counter2, counter3, counter4      
    AddRoundKey key6
                     
                     
    ;round 6
    SubBytes s_box          
    ShiftRows                                           
    MixColumns matrix, array, counter, counter2, counter3, counter4      
    AddRoundKey key7
    
    ;round 7
    SubBytes s_box          
    ShiftRows                                           
    MixColumns matrix, array, counter, counter2, counter3, counter4      
    AddRoundKey key8
    
    ;round 8
    SubBytes s_box          
    ShiftRows                                           
    MixColumns matrix, array, counter, counter2, counter3, counter4      
    AddRoundKey key9
    
    ;round 9
    SubBytes s_box          
    ShiftRows                                           
    MixColumns matrix, array, counter, counter2, counter3, counter4      
    AddRoundKey key10 
    
    ;round 10
    SubBytes s_box          
    ShiftRows                                               
    AddRoundKey key11
                     
    call print_array
                     
                                        
      
      
    hlt
                    
        
ret