.model small
.stack 100h                                                                                        


.data
welcomemsg db 0Dh, 0Ah
             db '', 0Dh, 0Ah
             db '*=========================================================*', 0Dh, 0Ah
             db '*         WELCOME TO THE PARKING MANAGEMENT SYSTEM!       *', 0Dh, 0Ah
             db '*=========================================================*', 0Dh, 0Ah
             db '', 0Dh, 0Ah, '$'

blank_line db 0Dh, 0Ah, '$'
separator db '--------------------------------------------------', 0Dh, 0Ah, '$'
menu db 0Dh, 0Ah, '==================== MENU ========================', 0Dh, 0Ah, '$'
menu1 db ' [1] Park Rikshaw in Zone A', 0Dh, 0Ah, '$'
menu2 db ' [2] Park Car in Zone B', 0Dh, 0Ah, '$'
menu3 db ' [3] Park Bus in Zone C', 0Dh, 0Ah, '$'
menu4 db ' [4] Show Parking Record', 0Dh, 0Ah, '$'
menu5 db ' [5] Delete All Records', 0Dh, 0Ah, '$'
menu6 db ' [6] Exit Program', 0Dh, 0Ah, '$'
msg1 db 0Dh, 0Ah, '------------', 0Dh, 0Ah, '!!! Sorry, Parking Is FULL. Please try later. !!!', 0Dh, 0Ah, '------------', 0Dh, 0Ah, '$'
msg2 db 0Dh, 0Ah, '------------', 0Dh, 0Ah, '*** Invalid Input! Please select a valid option. ***', 0Dh, 0Ah, '------------', 0Dh, 0Ah, '$'
msg7 db 0Dh, 0Ah, '------------', 0Dh, 0Ah, '>> Total Amount Collected: Rs. ','$'
msg8 db 0Dh, 0Ah, '>> Total Vehicles Parked: ','$'
msg9 db 0Dh, 0Ah, '>> Rikshaws Parked (Zone A): ','$'
msg10 db 0Dh, 0Ah, '>> Cars Parked (Zone B): ','$'
msg11 db 0Dh, 0Ah, '>> Buses Parked (Zone C): ','$'
msg12 db 0Dh, 0Ah, '------------', 0Dh, 0Ah, '--- All Records Deleted Successfully! ---', 0Dh, 0Ah, '------------', 0Dh, 0Ah, '$'
press_any_key_msg db 0Dh, 0Ah, 'Press any key to continue...', 0Dh, 0Ah, '$'

slot1 db '[1] 09:00 AM - 10:00 AM', 0Dh, 0Ah, '$'
slot2 db '[2] 10:00 AM - 11:00 AM', 0Dh, 0Ah, '$'
slot3 db '[3] 01:00 PM - 02:00 PM', 0Dh, 0Ah, '$'
slot4 db '[4] 03:00 PM - 04:00 PM', 0Dh, 0Ah, '$'

vehicle_lbl db ' Vehicle Type: ', '$' 
vehicle_type_ptr dw ? 

ticket_header db 0Dh, 0Ah, '=============== PARKING TICKET =================', 0Dh, 0Ah, '$'
ticket_title db '        *** PARKING MANAGEMENT SYSTEM ***', 0Dh, 0Ah, '$'
ticket_line  db '----------------------------------------------', 0Dh, 0Ah, '$'
slot_lbl db ' Time Slot: ', 0Dh, 0Ah, '$'
id_lbl db ' Ticket ID: ', 0Dh, 0Ah, '$'
rikshaw_type_str db 'RIKSHAW', '$'
car_type_str db 'CAR', '$'
bus_type_str db 'BUS', '$'


ticket_id db 1   
amount dw 0     
count db 0       
r db 0           
c db 0          
b db 0            
MAX_CAPACITY dw 15
time_slot db ?     

.code
main proc
    mov ax, @data
    mov ds, ax

    mov dx, offset welcomemsg
    mov ah, 09h
    int 21h
    mov dx, offset blank_line
    mov ah, 09h
    int 21h

while_:
    mov dx, offset menu
    mov ah, 09h
    int 21h
    mov dx, offset blank_line
    mov ah, 09h
    int 21h

    mov dx, offset menu1
    mov ah, 09h
    int 21h
    mov dx, offset menu2
    mov ah, 09h
    int 21h
    mov dx, offset menu3
    mov ah, 09h
    int 21h
    mov dx, offset menu4
    mov ah, 09h
    int 21h
    mov dx, offset menu5
    mov ah, 09h
    int 21h
    mov dx, offset menu6
    mov ah, 09h
    int 21h
    mov dx, offset separator
    mov ah, 09h
    int 21h
    mov dx, offset blank_line
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h

    cmp al, '1'
    je call_rikshaw
    cmp al, '2'
    je call_car
    cmp al, '3'
    je call_bus
    cmp al, '4'
    je call_recrd
    cmp al, '5'
    je call_delt
    cmp al, '6'
    je end_

   
    mov dx, offset msg2
    mov ah, 09h
    int 21h
    call newline
    call wait_for_key
    jmp while_

call_rikshaw:
    call select_time
   
    mov word ptr vehicle_type_ptr, offset rikshaw_type_str
    call rikshaw_park
    call wait_for_key 
    jmp while_

call_car:
    call select_time
   
    mov word ptr vehicle_type_ptr, offset car_type_str
    call car_park
    call wait_for_key
    jmp while_

call_bus:
    call select_time
   
    mov word ptr vehicle_type_ptr, offset bus_type_str
    call bus_park
    call wait_for_key
    jmp while_

call_recrd:
    call recrd
    call wait_for_key 
    jmp while_

call_delt:
    call delt
    call wait_for_key 
    jmp while_

end_:
    mov ah, 4ch
    int 21h
main endp




select_time proc
    call newline
    mov dx, offset separator
    mov ah, 09h
    int 21h
    call newline
    mov dx, offset slot1
    mov ah, 09h
    int 21h
    call newline
    mov dx, offset slot2
    mov ah, 09h
    int 21h
    call newline
    mov dx, offset slot3
    mov ah, 09h
    int 21h
    call newline
    mov dx, offset slot4
    mov ah, 09h
    int 21h
    call newline
    mov dx, offset separator
    mov ah, 09h
    int 21h
    call newline
    mov ah, 01h
    int 21h
    sub al, '0'
    mov time_slot, al 
    ret
select_time endp




print_time proc
    cmp time_slot, 1
    je show_slot1
    cmp time_slot, 2
    je show_slot2
    cmp time_slot, 3
    je show_slot3
    cmp time_slot, 4
    je show_slot4
    ret
show_slot1:
    mov dx, offset slot1
    jmp print_slot_common
show_slot2:
    mov dx, offset slot2
    jmp print_slot_common
show_slot3:
    mov dx, offset slot3
    jmp print_slot_common
show_slot4:
    mov dx, offset slot4
print_slot_common:
    mov ah, 09h
    int 21h
    call newline
    ret
print_time endp





generate_ticket proc
    call clear_screen
    mov dx, offset ticket_header
    mov ah, 09h
    int 21h
    mov dx, offset ticket_title
    mov ah, 09h
    int 21h
    mov dx, offset ticket_line
    mov ah, 09h
    int 21h
    call newline


    mov dx, offset vehicle_lbl
    mov ah, 09h
    int 21h

    mov dx, [vehicle_type_ptr]
    mov ah, 09h
    int 21h
    call newline

    
    mov dx, offset slot_lbl
    mov ah, 09h
    int 21h
    call print_time

    
    mov dx, offset id_lbl
    mov ah, 09h
    int 21h
    mov al, ticket_id
    xor ah, ah 
    call print_number
    call newline

    mov dx, offset ticket_line
    mov ah, 09h
    int 21h
    call newline
    inc ticket_id
    ret
generate_ticket endp





rikshaw_park proc
    mov al, count
    xor ah, ah
    cmp ax, MAX_CAPACITY
    jl continue_rikshaw_park

    mov dx, offset msg1
    mov ah, 09h
    int 21h
    jmp end_rikshaw_park

continue_rikshaw_park:
    mov ax, 200
    add amount, ax
    inc count
    inc r
    call generate_ticket

end_rikshaw_park:
    ret
rikshaw_park endp

car_park proc
    mov al, count
    xor ah, ah
    cmp ax, MAX_CAPACITY
    jl continue_car_park

    mov dx, offset msg1
    mov ah, 09h
    int 21h
    jmp end_car_park

continue_car_park:
    mov ax, 300
    add amount, ax
    inc count
    inc c
    call generate_ticket

end_car_park:
    ret
car_park endp

bus_park proc
    mov al, count
    xor ah, ah
    cmp ax, MAX_CAPACITY
    jl continue_bus_park

    mov dx, offset msg1
    mov ah, 09h
    int 21h
    jmp end_bus_park

continue_bus_park:
    mov ax, 400
    add amount, ax
    inc count
    inc b
    call generate_ticket

end_bus_park:
    ret
bus_park endp




recrd proc
    call newline
    mov dx, offset separator
    mov ah, 09h
    int 21h
    call newline
    mov dx, offset msg7
    mov ah, 09h
    int 21h
    mov ax, amount
    call print_number
    call newline
    mov dx, offset msg8
    mov ah, 09h
    int 21h
    mov al, count
    xor ah, ah
    call print_number
    call newline
    mov dx, offset msg9
    mov ah, 09h
    int 21h
    mov al, r
    xor ah, ah
    call print_number
    call newline
    mov dx, offset msg10
    mov ah, 09h
    int 21h
    mov al, c
    xor ah, ah
    call print_number
    call newline
    mov dx, offset msg11
    mov ah, 09h
    int 21h
    mov al, b
    xor ah, ah
    call print_number
    call newline
    mov dx, offset separator
    mov ah, 09h
    int 21h
    call newline
    ret
recrd endp




delt proc
    mov amount, 0
    mov count, 0
    mov r, 0
    mov c, 0
    mov b, 0
    mov ticket_id, 1 

    mov dx, offset msg12
    mov ah, 09h
    int 21h
    ret
delt endp




print_number proc
    push ax
    push cx
    push dx
    mov cx, 0       
    mov bx, 10      

    
    convert_loop:
        xor dx, dx
        div bx 
        push dx   
        inc cx    
        test ax, ax
        jnz convert_loop 

    
    print_loop:
        pop dx    
        add dl, '0'
        mov ah, 02h
        int 21h
        loop print_loop

    pop dx
    pop cx
    pop ax
    ret
print_number endp




newline proc
    mov ah, 02h
    mov dl, 0Dh
    int 21h
    mov dl, 0Ah
    int 21h
    ret
newline endp




clear_screen proc
    mov ah, 0  
    mov al, 3  
    int 10h
    ret
clear_screen endp




wait_for_key proc
    mov dx, offset press_any_key_msg
    mov ah, 09h
    int 21h
    mov ah, 08h
    int 21h    
    ret
wait_for_key endp

end main
