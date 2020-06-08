*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
*|||| FINAL PROJECT IE3043 by Carlos Esquit           								                                    ||||||||
*|||| Universidad Del Valle de Guatemala                                                                  ||||||||
*|||| Serial Multiplier (24 bits)                                                                         ||||||||
*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


****************************** INCLUDE *****************************************
.include 'sub.sp'
.include 'sources.sp'
.include 'params.sp'
.include '32nm.sp'
.include 'Analysis.sp'
.include 'subct_adder12bits.sp'

***************************** ADDER 12 BITS*************************************
*    |    RESULTADO DEL SHIFT ENTRA A SUMADOR       |             MULTIPLICANDO         |  CARRY   |         RESULTADO DEL SUMADOR       |
Xi5  Q23 Q22 Q21 Q20 Q19 Q18 Q17 Q16 Q15 Q14 Q13 Q12 0 0 0 0 0 Vdd Vdd Vdd Vdd 0 Vdd Vdd 0 carryout s11 s10 s9 s8 s7 s6 s5 s4 s3 s2 s1 s0 vdd sum12 size = 1
*************************************************************************************************************************************************


* | S | CLK |       LO QUE VIENE DEL SUMADOR        |    ENTRADA 12 LSb   |                 SALIDA 12MSb                  |      SALIDA 12LSb (RESULTADO)       |
******************************************************* SHIFT REGISTER CARGA PARALELA *****************************************************************************************
Xi6 Q0 CLOCK carryout S11 S10 S9 S8 S7 S6 S5 S4 S3 S2 S1 S0 0 0 0 0 0 0 0 0 0 0 0 Q23 Q22 Q21 Q20 Q19 Q18 Q17 Q16 Q15 Q14 Q13 Q12 Q11 Q10 Q9 Q8 Q7 Q6 Q5 Q4 Q3 Q2 Q1 Q0 vdd SRP size=1
*******************************************************************************************************************************************************************************

* INIT CONDITION DE LOS 12MSb DE SALIDA DEL SHIFT
.IC V(Q23) = 0
.IC V(Q22) = 0
.IC V(Q21) = 0
.IC V(Q20) = 0
.IC V(Q19) = 0
.IC V(Q18) = 0
.IC V(Q17) = 0
.IC V(Q16) = 0
.IC V(Q15) = 0
.IC V(Q14) = 0
.IC V(Q13) = 0
.IC V(Q12) = 0


* MULTIPLIER INIT CONDITION
.IC V(Q11) = 0
.IC V(Q10) = 0
.IC V(Q9) = 0
.IC V(Q8) = 0
.IC V(Q7) = 0
.IC V(Q6) = 0
.IC V(Q5) = 0
.IC V(Q4) = 0
.IC V(Q3) = Vdd1
.IC V(Q2) = 0
.IC V(Q1) = Vdd1
.IC V(0) = 0

.option post

.END
