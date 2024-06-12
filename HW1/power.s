			AREA power, code, readonly
			ENTRY
			ALIGN
__main	    FUNCTION
			EXPORT __main
			; fast exponention
			MOVS r0, #2_0010 ; the number
			MOVS r1, #2_1011 ; the exponent
			MOVS r7, #1
			
pow			CMP r1, #0
			BGT continue
			MOVS r5, #2_1	; the result
			BX LR
continue	TST r1, r7
			BNE odd
			BEQ even
load		PUSH {LR}
			PUSH {r0}
			BL pow
			POP{r3}
			pop{r4}
			MULS r5, r3, r5
			BX r4

odd			SUBS r1, r1, #1		
			B load
even		LSRS r1, r1, #1
			MULS r0, r0, r0
			B pow
			
done		ENDFUNC
			END
