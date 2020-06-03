*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
*|||| FINAL PROJECT IE3043 by Carlos Esquit           								                      ||||||||
*|||| Universidad Del Valle de Guatemala                                                                  ||||||||
*|||| Serial Multiplier (24 bits)                                                                         ||||||||
*|||| May 2020                                              											  ||||||||
*|||| (Ricardo Girón          /16556)                         											  ||||||||
*|||| (Charlie Cruz           /16157)                         											  ||||||||
*|||| (Matthias Sibrián       /16247)                          											  ||||||||
*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


*********************************************** INCLUDE ****************************************************************************************
.include 'sub.sp'
.include 'sources.sp'
.include 'params.sp'
.include '32nm.sp'
.include 'Analysis.sp'
.include 'subct_adder12bits.sp'
************************************************************************************************************************************************
*X2 A 0 CLOCK out Vdd MUX size=1

*********************************************** CMOS POSITIVE EDGE TRIGGERED D FLIP-FLOP *******************************************************
*X1 D CLOCK Q Vdd DFF size=1
************************************************************************************************************************************************

******************************************************ADDER 12 bits *****************************************************************************
*X4  Q24 Q23 Q22 Q21 Q20 Q19 Q18 Q17 Q16 Q15 Q14 Q13     0 0 Vdd Vdd Vdd 0 0 0 0 Vdd Vdd Vdd    0 k12  s11 s10 s09 s08 s07 s06 s05 s04 s03 s02 s01 s00 Vdd Sum12 size = 1
*************************************************************************************************************************************************

*             D1 D2  D3 D4 D5 D6 D7 D8 D9 D10 D11 D12 D13
******************************************************SHIFT REGISTER ****************************************************************************
*X3 Q24 CLOCK Vdd Vdd 0 Vdd 0 Vdd Vdd 0 Vdd 0 Vdd 0 Vdd 0 Vdd 0 0 0 0 0 0 0 0 0 Q1 Q2 Q3 Q4 Q5 Q6 Q7 Q8 Q9 Q10 Q11 Q12 Q13 Q14 Q15 Q16 Q17 Q18 Q19 Q20 Q21 Q22 Q23 Q24 Vdd SRP size=1
*************************************************************************************************************************************************

*PRUEBA DEL ADDER A = 1, B = 2 (multiplicacion = 2) (multiplicand = A) paso, pulso 24
*PRUEBA DEL ADDER A = 1, B = 1 (multiplicacion = 1) (multiplicand = A) paso, pulso 24
*PRUEBA DEL ADDER A = 2, B = 1 (multiplicacion = 2) (multiplicand = A) paso, pulso 25
*PRUEBA DEL ADDER A = 2, B = 2 (multiplicacion = 4) (multiplicand = A) paso, pulso 24
****************************************************************** ADDER 12 BITS*****************************************************************
X5 0 0 0 0 0 0 0 0 0 0 Vdd 0  f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12  0 k12   s11 s10 s9 s8 s7 s6 s5 s4 s3 s2 s1 s0 vdd sum12 size = 1
*************************************************************************************************************************************************
*                  3  2 1  0

* ESTAS PRIMERAS FILAS SON LAS D, LO QUE VA A TENER CADA UNO COMO CARGA PARALELA.
* DEL  14 AL 24 SE DEBEN PONER LAS CONDICIONES INICIALES, ES DECIR, EL MULTIPLICANDO, EN ESTE CASO, DEBEN SER LAS fn LAS QUE SE CARGUEN CON CONDICIONES INICIALES
* DEL 1 AL 13 SON LOS SR QUE VAN A HACER CARGA PARALELA.
*            1  2   3  4   5  6  7  8  9 10 11 12 13 14  15  16   17  18  19  20  21  22  23  24 || A PARTIR DE AQUI VAN LAS SALIDAS, ES DECIR LAS Q.
******************************************************* SHIFT REGISTER CARGA PARALELA ****************************************************************
X6 f24 clock 0 s11 s10 s9 s8 s7 s6 s5 s4 s3 s2 s1 s0 0 0 0 0 0 0 0 0 0 0 0   f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12 f13 f14 f15 f16 f17 f18 f19 f20 f21 f22 f23 f24 vdd srp size=1
******************************************************************************************************************************************************

*Se hace la carga paralela y sus condiciones iniciales
.IC V(f1) = 0
.IC V(f2) = 0
.IC V(f3) = 0
.IC V(f4) = 0
.IC V(f5) = 0
.IC V(f6) = 0
.IC V(f7) = 0
.IC V(f8) = 0
.IC V(f9) = 0
.IC V(f10) = 0
.IC V(f11) = 0
.IC V(f12) = 0


*El multiplicador va a partir de aqui (Multiplier)
.IC V(f13) = 0
.IC V(f14) = 0
.IC V(f15) = 0
.IC V(f16) = 0
.IC V(f17) = 0
.IC V(f18) = 0
.IC V(f19) = 0
.IC V(f20) = 0
.IC V(f21) = 0
.IC V(f22) = 0
.IC V(f23) = 0
.IC V(f24) = Vdd1

.IC V(D)=0
.IC V(CLOCK)=0


**.TRAN 100p 26n**
.option post

.END
