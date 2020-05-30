
*LIBRERÍA DE COMPUERTAS LÓGICAS. 


*PARA EL SUMADOR SE NECESITAN COMPUERTAS XOR, AND Y OR. DADO QUE SE TRABAJÓ CON TECONOLOGÍA CMOS SE HICIERON 
*LAS COMPUERTAS XOR, NAND Y NOR Y LUEGO SE LES COLOCÓ UNA NOT EN LA SALIDA PARA OBTENER EL RESULTADO DESEADO. 

*************************************************************************************************************
*************************************************************************************************************
*************************************************************************************************************
*************************************************************************************************************
*********************************************************************
*COMPUERTA NOT: 
*ENTRADA: in1
*SALIDA:  out1

.SUBCKT NotGate in1 out1 vsource size = 1
	M1 out1 in1 vsource vsource pmos W='size*UNIT_W' L=UNIT_L
	M2 out1 in1 0 0 nmos W='size*UNIT_W' L=UNIT_L
.ENDS

*********************************************************************
*COMPUERTA NAND2:
*ENTRADA: in1, in2
*SALIDA:  out 1

.SUBCKT Nand2 in1 in2 out1 vsource size = 1
	M1 out1 in1 vsource vsource pmos W='size*UNIT_W' L=UNIT_L
	M2 out1 in2 vsource vsource pmos W='size*UNIT_W' L=UNIT_L

	M3 out1 in1 J 0 nmos W='size*UNIT_W' L=UNIT_L
	M4 J in2 0 0 nmos W='size*UNIT_W' L=UNIT_L
.ENDS

*********************************************************************
*COMPUERTA NOR2:
*ENTRADA: in1, in2
*SALIDA:  out1

.SUBCKT Nor2 in1 in2 out1 vsource size = 1
	M1 out1 in2 p1 vsource pmos W='size*UNIT_W' L=UNIT_L
	M2 p1 in1 vsource vsource pmos W='size*UNIT_W' L=UNIT_L

	M3 out1 in1 0 0 nmos W='size*UNIT_W' L=UNIT_L
	M4 out1 in2 0 0 nmos W='size*UNIT_W' L=UNIT_L
.ENDS

*********************************************************************
*COMPUERTA XOR2:
*ENTRADA: in1, in2
*SALIDA:  out1
*NOTAR QUE LA XOR HECHA CON CMOS NECESITA TANTO LAS ENTREDAS A Y B COMO SUS COMPLEMENTOS. ESTO SE HIZO
*INTERNAMENTE CON UNAS NOT, LO CUAL AGREGA 4 TRANSISTORES (2NMOS Y 2PMOS) AL ESQUEMÁTICO VISTO EN LA 
*CLASE.

.SUBCKT Xor2 in1 in2 out1 vsource size = 1
	X1 in1 in1n vsource NotGate size = 1
	X2 in2 in2n vsource NotGate size = 1

	M1 p1 in1 vsource vsource pmos W='size*UNIT_W' L=UNIT_L
	M2 p2 in1n vsource vsource pmos W='size*UNIT_W' L=UNIT_L
	M3 p1 in2n out1 vsource pmos W='size*UNIT_W' L=UNIT_L
	M4 p2 in2 out1 vsource pmos W='size*UNIT_W' L=UNIT_L

	M5 n1 in1n out1 0 nmos W='size*UNIT_W' L=UNIT_L
	M6 n1 in2 out1 0 nmos W='size*UNIT_W' L=UNIT_L
	M7 n1 in1 0 0 nmos W='size*UNIT_W' L=UNIT_L
	M8 n1 in2n 0 0 nmos W='size*UNIT_W' L=UNIT_L

.ENDS
*************************************************************************************************************
*************************************************************************************************************
*************************************************************************************************************
*************************************************************************************************************


*********************************************************************
*SUMADOR DE 12 BITS:
*ENTRADAS:
*	valor 1: a11 hasta a00 (Tanto a11 como b11 son los bits más significativos de cada valor.)
*	valor 2: b11 hasta b00
*	carry 0: k00 (Se recomienda dejar el valor a tierra.)
*SALIDAS:
*	resultado: s11 hasta s00 (s11 es el bit más significativo del resultado.)
*	carry out: k12

.SUBCKT Sum12 a11 a10 a09 a08 a07 a06 a05 a04 a03 a02 a01 a00 b11 b10 b09 b08 b07 b06 b05 b04 b03 b02 b01 b00 k00 k12 s11 s10 s09 s08 s07 s06 s05 s04 s03 s02 s01 s00 vsource size = 1
	X15 a03 a02 a01 a00 b03 b02 b01 b00 k00 k04 s03 s02 s01 s00 vsource Sum4 size = 1
	X16 a07 a06 a05 a04 b07 b06 b05 b04 k04 k08 s07 s06 s05 s04 vsource Sum4 size = 1
	X17 a11 a10 a09 a08 b11 b10 b09 b08 k08 k12 s11 s10 s09 s08 vsource Sum4 size = 1
.ENDS

*********************************************************************
*************************************************************************************************************
*************************************************************************************************************
*************************************************************************************************************
*************************************************************************************************************
