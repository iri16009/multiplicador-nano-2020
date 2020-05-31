
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

*.SUBCKT NotGate in1 out1 vsource size = 1
*	M1 out1 in1 vsource vsource PMOS W='size*UNIT_W' L=UNIT_L
*	M2 out1 in1 0 0 NMOS W='size*UNIT_W' L=UNIT_L
*.ENDS

*********************************************************************
*COMPUERTA NAND2:
*ENTRADA: in1, in2
*SALIDA:  out 1

.SUBCKT Nand2 in1 in2 out1 vsource size = 1
	M1 out1 in1 vsource vsource PMOS W='size*UNIT_W' L=UNIT_L
	M2 out1 in2 vsource vsource PMOS W='size*UNIT_W' L=UNIT_L

	M3 out1 in1 J 0 NMOS W='size*UNIT_W' L=UNIT_L
	M4 J in2 0 0 NMOS W='size*UNIT_W' L=UNIT_L
.ENDS

*********************************************************************
*COMPUERTA NOR2:
*ENTRADA: in1, in2
*SALIDA:  out1

.SUBCKT Nor2 in1 in2 out1 vsource size = 1
	M1 out1 in2 p1 vsource PMOS W='size*UNIT_W' L=UNIT_L
	M2 p1 in1 vsource vsource PMOS W='size*UNIT_W' L=UNIT_L

	M3 out1 in1 0 0 NMOS W='size*UNIT_W' L=UNIT_L
	M4 out1 in2 0 0 NMOS W='size*UNIT_W' L=UNIT_L
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

	M1 p1 in1 vsource vsource PMOS W='size*UNIT_W' L=UNIT_L
	M2 p2 in1n vsource vsource PMOS W='size*UNIT_W' L=UNIT_L
	M3 p1 in2n out1 vsource PMOS W='size*UNIT_W' L=UNIT_L
	M4 p2 in2 out1 vsource PMOS W='size*UNIT_W' L=UNIT_L

	M5 n1 in1n out1 0 NMOS W='size*UNIT_W' L=UNIT_L
	M6 n1 in2 out1 0 NMOS W='size*UNIT_W' L=UNIT_L
	M7 n1 in1 0 0 NMOS W='size*UNIT_W' L=UNIT_L
	M8 n1 in2n 0 0 NMOS W='size*UNIT_W' L=UNIT_L

.ENDS
*************************************************************************************************************
*************************************************************************************************************
*************************************************************************************************************
*************************************************************************************************************

*********************************************************************
*Sumadores
*********************************************************************

*********************************************************************
*SUMADOR 1 BIT:
*ENTRADAS: in1, in2
*ENTRADA CARRY: cin1 (notar que para el bit menos significativo de un sumador de n bits ese cin1 debe ser 0,
*			en los demás bits este sirve de entrada para el siguiente bit, como un cinX.)
*SALIDAS: out1
*SALIDA CARRY: cout1 (este se conecta al cin del siguiente sumador de 1 bit para formar un sumador de n bits.)
.SUBCKT Sum1 in1 in2 cin1 out1 cout1 vsource size = 1
	*xor
	X3 in1 in2 z1 vsource Xor2 size = 1
	X4 z1 cin1 out1 vsource Xor2 size = 1

	*nand
	X5 z1 cin1 z3 vsource Nand2 size = 1
	X6 in1 in2 z2 vsource Nand2 size = 1

	*not
	X7 z3 z5 vsource NotGate size = 1
	X8 z2 z4 vsource NotGate size = 1
	X10 z6 cout1 vsource NotGate size = 1

	*nor
	X9 z5 z4 z6 vsource Nor2 size = 1

.ENDS

*********************************************************************
*SUMADOR DE 4 BITS:
*ENTRADAS:
*	valor 1: a3 a2 a1 a0
*	valor 2: b3 b2 b1 b0 (Tanto a3 como b3 son los bits más significativos de cada valor.)
*	carry 0: k0 (En la gran mayoría de aplicaciones se va a ingresar con valor 0.)
*SALIDAS:
*	resultado: s3 s2 s1 s0 (El bit más significativo es s3.)
*	carry out: k4

.SUBCKT Sum4 a3 a2 a1 a0 b3 b2 b1 b0 k0 k4 s3 s2 s1 s0 vsource size = 1
	X11 a0 b0 k0 s0 k1 vsource Sum1 size = 1
	X12 a1 b1 k1 s1 k2 vsource Sum1 size = 1
	X13 a2 b2 k2 s2 k3 vsource Sum1 size = 1
	X14 a3 b3 k3 s3 k4 vsource Sum1 size = 1
.ENDS

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
