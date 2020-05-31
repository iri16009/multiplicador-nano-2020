*********************************************** NOT GATE ***************************************************************************************
************************************************************************************************************************************************
.SUBCKT NotGate in1 out1 vsource size=1
	M1 out1 in1 0 0 NMOS W='size*UNIT_W' L=UNIT_L
	M2 out1 in1 vsource vsource PMOS W='2*size*UNIT_W' L=UNIT_L
.ENDS


*********************************************** NEGATIVE LEVEL SENSITIVE D latch ***************************************************************
************************************************************************************************************************************************
.SUBCKT pDLATCH D CLK Qn2 vsource size=1
	X1 CLK CLKn vsource NotGate size = 1
	X2 Q2 Qn2 vsource NotGate size = 1
	X3 Qn2 Qnn2 vsource NotGate size = 1

	M1 Q2 CLK D 0 NMOS W='size*UNIT_W' L=UNIT_L
	M2 Q2 CLKn D vsource PMOS W='2*size*UNIT_W' L=UNIT_L

	M3 Qnn2 CLKn Q2 0 NMOS W='size*UNIT_W' L=UNIT_L
	M4 Qnn2 CLK Q2 vsource PMOS W='2*size*UNIT_W' L=UNIT_L

.ENDS

*********************************************** POSITIVE LEVEL SENSITIVE D latch ***************************************************************
************************************************************************************************************************************************

.SUBCKT nDLATCH D CLK Qn1 vsource size=1

	X1 CLK CLKn vsource NotGate size = 1
	X2 Q1 Qn1 vsource NotGate size = 1
	X3 Qn1 Qnn1 vsource NotGate size = 1

	M1 Q1 CLKn D 0 NMOS W='size*UNIT_W' L=UNIT_L
	M2 Q1 CLK D vsource PMOS W='2*size*UNIT_W' L=UNIT_L

	M3 Qnn1 CLKn Q1 0 NMOS W='size*UNIT_W' L=UNIT_L
	M4 Qnn1 CLK Q1 vsource PMOS W='2*size*UNIT_W' L=UNIT_L

.ENDS

*********************************************** CMOS POSITIVE EDGE TRIGGERED D FLIP-FLOP *******************************************************
************************************************************************************************************************************************
* Combination of two level-sensitive latches, one negative-sensitive and one positive-sensitive in series, "DFFout" is the OUTPUT(Q).          *
************************************************************************************************************************************************

.SUBCKT DFF D CLK DFFout vsource size=1

	X8 D CLK outNdlatch vsource nDLATCH size=1
	X9 outNdlatch CLK DFFout vsource pDLATCH size=1

.ENDS

**********************************************
*                MULTIPLEXER                 *
**********************************************
* Descripción:
* S = 0 pasa D0
* S = 1 pasa D1

.SUBCKT MUX D0 D1 S Y1 vsource size=1

	X1 S Sneg vsource NotGate size = 1
	M1 n1 D0 vsource vsource PMOS W='2*size*UNIT_W' L=UNIT_L
	M2 n1 S Y vsource PMOS W='2*size*UNIT_W' L=UNIT_L
	M3 Y Sneg n2 0 NMOS W='size*UNIT_W' L=UNIT_L
	M4 n2 D0 0 0 NMOS W='size*UNIT_W' L=UNIT_L

	M5 n3 D1 vsource vsource PMOS W='2*size*UNIT_W' L=UNIT_L
	M6 n3 Sneg Y vsource PMOS W='2*size*UNIT_W' L=UNIT_L
	M7 Y S n4 0 NMOS W='size*UNIT_W' L=UNIT_L
	M8 n4 D1 0 0 NMOS W='size*UNIT_W' L=UNIT_L

	X2 Y Y1 vsource NotGate size = 1

.ENDS

*************************************************
*								SHIFT REGISTER									*
*************************************************
* Descripción:
* SCTRL selecciona si pasa D o hace SHIFT
* si es 0 hace SHIFT, si es 1 pasa D


.SUBCKT SRP SCTRL CLK D1 D2 D3 D4 D5 D6 D7 D8 D9 D10 D11 D12 D13 D14 D15 D16 D17 D18 D19 D20 D21 D22 D23 D24 Q1 Q2 Q3 Q4 Q5 Q6 Q7 Q8 Q9 Q10 Q11 Q12 Q13 Q14 Q15 Q16 Q17 Q18 Q19 Q20 Q21 Q22 Q23 Q24 vsource size=1

	X1 0 D1 SCTRL Y1 vsource MUX size=1
	X2 Y1 CLK Q1 vsource DFF size=1
	X3 Q1 D2 SCTRL Y2 vsource MUX size=1
	X4 Y2 CLK Q2 vsource DFF size=1
	X5 Q2 D3 SCTRL Y3 vsource MUX size=1
	X6 Y3 CLK Q3 vsource DFF size=1
	X7 Q3 D4 SCTRL Y4 vsource MUX size=1
	X8 Y4 CLK Q4 vsource DFF size=1

	X9 Q4 D5 SCTRL Y5 vsource MUX size=1
	X10 Y5 CLK Q5 vsource DFF size=1
	X11 Q5 D6 SCTRL Y6 vsource MUX size=1
	X12 Y6 CLK Q6 vsource DFF size=1
	X13 Q6 D7 SCTRL Y7 vsource MUX size=1
	X14 Y7 CLK Q7 vsource DFF size=1
	X15 Q7 D8 SCTRL Y8 vsource MUX size=1
	X16 Y8 CLK Q8 vsource DFF size=1

	X17 Q8 D9 SCTRL Y9 vsource MUX size=1
	X18 Y9 CLK Q9 vsource DFF size=1
	X19 Q9 D10 SCTRL Y10 vsource MUX size=1
	X20 Y10 CLK Q10 vsource DFF size=1
	X21 Q10 D11 SCTRL Y11 vsource MUX size=1
	X22 Y11 CLK Q11 vsource DFF size=1
	X23 Q11 D12 SCTRL Y12 vsource MUX size=1
	X24 Y12 CLK Q12 vsource DFF size=1

	X25 Q12 D13 SCTRL Y13 vsource MUX size=1
	X26 Y13 CLK Q13 vsource DFF size=1
	X27 Q13 D14 0 Y14 vsource MUX size=1
	X28 Y14 CLK Q14 vsource DFF size=1
	X29 Q14 D15 0 Y15 vsource MUX size=1
	X30 Y15 CLK Q15 vsource DFF size=1
	X31 Q15 D16 0 Y16 vsource MUX size=1
	X32 Y16 CLK Q16 vsource DFF size=1

	X33 Q16 D17 0 Y17 vsource MUX size=1
	X34 Y17 CLK Q17 vsource DFF size=1
	X35 Q17 D18 0 Y18 vsource MUX size=1
	X36 Y18 CLK Q18 vsource DFF size=1
	X37 Q18 D19 0 Y19 vsource MUX size=1
	X38 Y19 CLK Q19 vsource DFF size=1
	X39 Q19 D20 0 Y20 vsource MUX size=1
	X40 Y20 CLK Q20 vsource DFF size=1

	X41 Q20 D21 0 Y21 vsource MUX size=1
	X42 Y21 CLK Q21 vsource DFF size=1
	X43 Q21 D22 0 Y22 vsource MUX size=1
	X44 Y22 CLK Q22 vsource DFF size=1
	X45 Q22 D23 0 Y23 vsource MUX size=1
	X46 Y23 CLK Q23 vsource DFF size=1
	X47 Q23 D24 0 Y24 vsource MUX size=1
	X48 Y24 CLK Q24 vsource DFF size=1

.ENDS
