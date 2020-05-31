*********************************************** VOLTAGE SOURCES ********************************************************************************
************************************************************************************************************************************************
V1 Vdd 0 Vdd1

*********************************************** CLOCK SIGNAL  **********************************************************************************
V2 CLOCK 0 PWL 0 0 1n 0 1.1n Vdd1 2n Vdd1 2.1n 0 3n 0 3.1n Vdd1 4n Vdd1 4.1n 0 5n 0 5.1n Vdd1 6n Vdd1 6.1n 0 7n 0 7.1n Vdd1
************************************************************************************************************************************************

*********************************************** D SIGNAL FOR FLIP-FLOP  ************************************************************************
V3 D 0 PWL 0 0 0.8n 0 0.81n Vdd1 1.71n Vdd1 1.72n 0 3.2n 0 3.21n Vdd1 3.53n Vdd1 3.54n 0 3.64n 0 3.65n Vdd1
************************************************************************************************************************************************


V4 A 0 PWL 0 0 0.8n 0 0.81n Vdd1
*********************************************** CONTROL SIGNAL FOR SHIFT REGISTER  *************************************************************
V5 SCTRL 0 PWL 0 Vdd1 2n Vdd1 2.1n 0 4n 0 4.1n Vdd1
************************************************************************************************************************************************

*********************************************** CONTROL SIGNAL D1  *************************************************************
V6 D1 0 PWL 0 0 3n 0 3.1n Vdd1
************************************************************************************************************************************************

*********************************************** CONTROL SIGNAL D6  *************************************************************
V7 D6 0 Vdd1
***************************************************************************************************************************

*********************************************** CONTROL SIGNAL D12  *************************************************************
V8 D12 0 0
***************************************************************************************************************************

*********************************************** CONTROL SIGNAL D18  *************************************************************
V9 D18 0 PWL 0 0 3n 0 3.1n Vdd1
***************************************************************************************************************************

*********************************************** CONTROL SIGNAL D24  *************************************************************
V10 D24 0 Vdd1
***************************************************************************************************************************
