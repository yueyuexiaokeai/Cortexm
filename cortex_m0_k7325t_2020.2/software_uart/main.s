

; Vector Table Mapped to Address 0 at Reset

						PRESERVE8
                		THUMB

        				AREA	RESET, DATA, READONLY	  			; First 32 WORDS is VECTOR TABLE
        				EXPORT 	__Vectors
					
__Vectors		    	DCD		0x0000FFFC
        				DCD		Reset_Handler
        				DCD		0  			
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD 	0
        				DCD		0
        				DCD		0
        				DCD 	0
        				DCD		0
        				
        				; External Interrupts
						        				
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
              
                AREA |.text|, CODE, READONLY
;Reset Handler
Reset_Handler   PROC
                GLOBAL Reset_Handler
                ENTRY



;将字符串“谢思聪”通过UART发送到PC/笔记本的串口调试界面中
                
                LDR     R1, = 0x53000000
                MOVS    R0, # 'x'
                STR     R0, [R1]           
                
                LDR     R1, = 0x53000000
                MOVS    R0, # 'i'
                STR     R0, [R1]          
                
                LDR     R1, = 0x53000000
                MOVS    R0, # 'e'
                STR     R0, [R1]          
                
                LDR     R1, = 0x53000000
                MOVS    R0, # 's'
                STR     R0, [R1]         
                

;等待，直到缓冲区非空

WAIT            LDR     R1, = 0x53000004
                LDR     R0, [R1]
                MOVS    R1, # 01
                ANDS    R0, R0, R1
                CMP     R0, # 0x00
                BNE     WAIT
                
;将接收到的字符重新通过UART发送到PC/笔记本的串口调试界面中
                
                LDR     R1, =0x53000000
                LDR     R0, [R1]
                STR     R0, [R1]
                B       WAIT

				ENDP

				ALIGN 		4					 ; Align to a word boundary

		END                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
   