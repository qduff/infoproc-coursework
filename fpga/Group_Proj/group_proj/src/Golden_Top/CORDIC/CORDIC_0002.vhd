-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 18.1 (Release Build #625)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2018 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from CORDIC_0002
-- VHDL created on Tue Mar 12 19:26:19 2024


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity CORDIC_0002 is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        b : in std_logic_vector(31 downto 0);  -- float32_m23
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end CORDIC_0002;

architecture normal of CORDIC_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid6_fpArctan2Test_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstZeroWF_uid7_fpArctan2Test_q : STD_LOGIC_VECTOR (22 downto 0);
    signal exp_xIn_uid9_fpArctan2Test_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_xIn_uid10_fpArctan2Test_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expXIsMax_uid12_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid12_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid13_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid13_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid14_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_xIn_uid15_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_xIn_uid16_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_yIn_uid23_fpArctan2Test_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_yIn_uid24_fpArctan2Test_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expXIsMax_uid26_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid26_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid27_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid27_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid28_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_yIn_uid29_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_yIn_uid30_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yInSign_uid34_fpArctan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal xInSign_uid35_fpArctan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal zwEwF_uid36_fpArctan2Test_q : STD_LOGIC_VECTOR (30 downto 0);
    signal yInExpFrac_uid39_fpArctan2Test_q : STD_LOGIC_VECTOR (30 downto 0);
    signal yInZero_uid40_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal yInZero_uid40_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xInExpFrac_uid43_fpArctan2Test_q : STD_LOGIC_VECTOR (30 downto 0);
    signal xInZero_uid44_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal xInZero_uid44_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expX_uid46_fpArctan2Test_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fracX_uid47_fpArctan2Test_b : STD_LOGIC_VECTOR (22 downto 0);
    signal singX_uid48_fpArctan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal cstNaNWF_uid51_fpArctan2Test_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstAllZWE_uid52_fpArctan2Test_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstBias_uid53_fpArctan2Test_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstBiasM1_uid54_fpArctan2Test_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstBiasMWF_uid55_fpArctan2Test_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstBiasP1_uid56_fpArctan2Test_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstWFP1_uid57_fpArctan2Test_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstWFP2_uid58_fpArctan2Test_q : STD_LOGIC_VECTOR (7 downto 0);
    signal excZ_div_uid450_uid65_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid66_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid66_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid67_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid67_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_div_uid69_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal updatedY_uid75_fpArctan2Test_q : STD_LOGIC_VECTOR (45 downto 0);
    signal fracXIsZero_uid74_fpArctan2Test_a : STD_LOGIC_VECTOR (45 downto 0);
    signal fracXIsZero_uid74_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsBias_uid77_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal inIsOne_uid78_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal inIsOne_uid78_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal piO2_uid79_fpArctan2Test_q : STD_LOGIC_VECTOR (25 downto 0);
    signal piO4_uid80_fpArctan2Test_q : STD_LOGIC_VECTOR (23 downto 0);
    signal cstPiO2_uid81_fpArctan2Test_in : STD_LOGIC_VECTOR (24 downto 0);
    signal cstPiO2_uid81_fpArctan2Test_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fpPiO2C_uid82_fpArctan2Test_q : STD_LOGIC_VECTOR (31 downto 0);
    signal cstPiO4_uid84_fpArctan2Test_in : STD_LOGIC_VECTOR (22 downto 0);
    signal cstPiO4_uid84_fpArctan2Test_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fpPiO4C_uid85_fpArctan2Test_q : STD_LOGIC_VECTOR (31 downto 0);
    signal constOut_uid87_fpArctan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal constOut_uid87_fpArctan2Test_q : STD_LOGIC_VECTOR (31 downto 0);
    signal xyInInf_uid88_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal xyInInf_uid88_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal arctanIsConst_uid89_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal arctanIsConst_uid89_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal path2_uid90_fpArctan2Test_a : STD_LOGIC_VECTOR (9 downto 0);
    signal path2_uid90_fpArctan2Test_b : STD_LOGIC_VECTOR (9 downto 0);
    signal path2_uid90_fpArctan2Test_o : STD_LOGIC_VECTOR (9 downto 0);
    signal path2_uid90_fpArctan2Test_n : STD_LOGIC_VECTOR (0 downto 0);
    signal u_uid92_fpArctan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal u_uid92_fpArctan2Test_q : STD_LOGIC_VECTOR (31 downto 0);
    signal oFracU_uid95_fpArctan2Test_q : STD_LOGIC_VECTOR (23 downto 0);
    signal biasMwShift_uid96_fpArctan2Test_q : STD_LOGIC_VECTOR (7 downto 0);
    signal atanUIsU_uid97_fpArctan2Test_a : STD_LOGIC_VECTOR (9 downto 0);
    signal atanUIsU_uid97_fpArctan2Test_b : STD_LOGIC_VECTOR (9 downto 0);
    signal atanUIsU_uid97_fpArctan2Test_o : STD_LOGIC_VECTOR (9 downto 0);
    signal atanUIsU_uid97_fpArctan2Test_n : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftBias_uid98_fpArctan2Test_q : STD_LOGIC_VECTOR (7 downto 0);
    signal shiftValue_uid99_fpArctan2Test_a : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftValue_uid99_fpArctan2Test_b : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftValue_uid99_fpArctan2Test_o : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftValue_uid99_fpArctan2Test_q : STD_LOGIC_VECTOR (8 downto 0);
    signal xMSB_uid100_fpArctan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal zS_uid102_fpArctan2Test_q : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftValuePostNeg_uid103_fpArctan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftValuePostNeg_uid103_fpArctan2Test_q : STD_LOGIC_VECTOR (8 downto 0);
    signal cst01pWShift_uid104_fpArctan2Test_q : STD_LOGIC_VECTOR (12 downto 0);
    signal oFracUExt_uid105_fpArctan2Test_q : STD_LOGIC_VECTOR (36 downto 0);
    signal fxpShifterBits_uid106_fpArctan2Test_in : STD_LOGIC_VECTOR (3 downto 0);
    signal fxpShifterBits_uid106_fpArctan2Test_b : STD_LOGIC_VECTOR (3 downto 0);
    signal y_uid108_fpArctan2Test_in : STD_LOGIC_VECTOR (35 downto 0);
    signal y_uid108_fpArctan2Test_b : STD_LOGIC_VECTOR (34 downto 0);
    signal fxpAtanXOXRes_uid113_fpArctan2Test_in : STD_LOGIC_VECTOR (31 downto 0);
    signal fxpAtanXOXRes_uid113_fpArctan2Test_b : STD_LOGIC_VECTOR (26 downto 0);
    signal normBit_uid115_fpArctan2Test_in : STD_LOGIC_VECTOR (49 downto 0);
    signal normBit_uid115_fpArctan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPath3High_uid116_fpArctan2Test_in : STD_LOGIC_VECTOR (48 downto 0);
    signal fracRPath3High_uid116_fpArctan2Test_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPath3Low_uid117_fpArctan2Test_in : STD_LOGIC_VECTOR (47 downto 0);
    signal fracRPath3Low_uid117_fpArctan2Test_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPath3Pre_uid118_fpArctan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPath3Pre_uid118_fpArctan2Test_q : STD_LOGIC_VECTOR (23 downto 0);
    signal invNormBit_uid119_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expRPath3Ext_uid120_fpArctan2Test_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expRPath3Ext_uid120_fpArctan2Test_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expRPath3Ext_uid120_fpArctan2Test_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expRPath3Ext_uid120_fpArctan2Test_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expRPath3PreRnd_uid121_fpArctan2Test_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expRPath3PreRnd_uid121_fpArctan2Test_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPath3PreRnd_uid122_fpArctan2Test_q : STD_LOGIC_VECTOR (31 downto 0);
    signal fracRPath3PostRnd_uid125_fpArctan2Test_a : STD_LOGIC_VECTOR (32 downto 0);
    signal fracRPath3PostRnd_uid125_fpArctan2Test_b : STD_LOGIC_VECTOR (32 downto 0);
    signal fracRPath3PostRnd_uid125_fpArctan2Test_o : STD_LOGIC_VECTOR (32 downto 0);
    signal fracRPath3PostRnd_uid125_fpArctan2Test_q : STD_LOGIC_VECTOR (32 downto 0);
    signal shiftOut_uid129_fpArctan2Test_a : STD_LOGIC_VECTOR (9 downto 0);
    signal shiftOut_uid129_fpArctan2Test_b : STD_LOGIC_VECTOR (9 downto 0);
    signal shiftOut_uid129_fpArctan2Test_o : STD_LOGIC_VECTOR (9 downto 0);
    signal shiftOut_uid129_fpArctan2Test_c : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracRPath2_uid132_fpArctan2Test_q : STD_LOGIC_VECTOR (24 downto 0);
    signal sValPostSOutR_uid133_fpArctan2Test_in : STD_LOGIC_VECTOR (4 downto 0);
    signal sValPostSOutR_uid133_fpArctan2Test_b : STD_LOGIC_VECTOR (4 downto 0);
    signal bPostPad_uid136_fpArctan2Test_q : STD_LOGIC_VECTOR (25 downto 0);
    signal path2Diff_uid137_fpArctan2Test_a : STD_LOGIC_VECTOR (26 downto 0);
    signal path2Diff_uid137_fpArctan2Test_b : STD_LOGIC_VECTOR (26 downto 0);
    signal path2Diff_uid137_fpArctan2Test_o : STD_LOGIC_VECTOR (26 downto 0);
    signal path2Diff_uid137_fpArctan2Test_q : STD_LOGIC_VECTOR (26 downto 0);
    signal normBitPath2Diff_uid138_fpArctan2Test_in : STD_LOGIC_VECTOR (25 downto 0);
    signal normBitPath2Diff_uid138_fpArctan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal path2DiffHigh_uid139_fpArctan2Test_in : STD_LOGIC_VECTOR (24 downto 0);
    signal path2DiffHigh_uid139_fpArctan2Test_b : STD_LOGIC_VECTOR (23 downto 0);
    signal path2DiffLow_uid140_fpArctan2Test_in : STD_LOGIC_VECTOR (23 downto 0);
    signal path2DiffLow_uid140_fpArctan2Test_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPath2_uid141_fpArctan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPath2_uid141_fpArctan2Test_q : STD_LOGIC_VECTOR (23 downto 0);
    signal expRPath2_uid142_fpArctan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expRPath2_uid142_fpArctan2Test_q : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracConc_uid145_fpArctan2Test_q : STD_LOGIC_VECTOR (31 downto 0);
    signal expFracRPath2PostRnd_uid146_fpArctan2Test_a : STD_LOGIC_VECTOR (32 downto 0);
    signal expFracRPath2PostRnd_uid146_fpArctan2Test_b : STD_LOGIC_VECTOR (32 downto 0);
    signal expFracRPath2PostRnd_uid146_fpArctan2Test_o : STD_LOGIC_VECTOR (32 downto 0);
    signal expFracRPath2PostRnd_uid146_fpArctan2Test_q : STD_LOGIC_VECTOR (32 downto 0);
    signal pathSelBits_uid149_fpArctan2Test_q : STD_LOGIC_VECTOR (2 downto 0);
    signal fracOutMuxSelEnc_uid150_fpArctan2Test_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRCalc_uid152_fpArctan2Test_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRCalc_uid152_fpArctan2Test_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRCalc_uid154_fpArctan2Test_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRCalc_uid154_fpArctan2Test_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstPi_uid155_fpArctan2Test_q : STD_LOGIC_VECTOR (46 downto 0);
    signal sOutAlignRes_uid157_fpArctan2Test_a : STD_LOGIC_VECTOR (9 downto 0);
    signal sOutAlignRes_uid157_fpArctan2Test_b : STD_LOGIC_VECTOR (9 downto 0);
    signal sOutAlignRes_uid157_fpArctan2Test_o : STD_LOGIC_VECTOR (9 downto 0);
    signal sOutAlignRes_uid157_fpArctan2Test_c : STD_LOGIC_VECTOR (0 downto 0);
    signal yInZOrsOutAlignRes_uid158_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sValPostSOutRange_uid161_fpArctan2Test_in : STD_LOGIC_VECTOR (4 downto 0);
    signal sValPostSOutRange_uid161_fpArctan2Test_b : STD_LOGIC_VECTOR (4 downto 0);
    signal oFracRCalc_uid162_fpArctan2Test_q : STD_LOGIC_VECTOR (23 downto 0);
    signal padConst_uid163_fpArctan2Test_q : STD_LOGIC_VECTOR (23 downto 0);
    signal rightPaddedIn_uid164_fpArctan2Test_q : STD_LOGIC_VECTOR (47 downto 0);
    signal padACst_uid167_fpArctan2Test_q : STD_LOGIC_VECTOR (1 downto 0);
    signal aPostPad_uid168_fpArctan2Test_q : STD_LOGIC_VECTOR (48 downto 0);
    signal subRes_uid169_fpArctan2Test_a : STD_LOGIC_VECTOR (49 downto 0);
    signal subRes_uid169_fpArctan2Test_b : STD_LOGIC_VECTOR (49 downto 0);
    signal subRes_uid169_fpArctan2Test_o : STD_LOGIC_VECTOR (49 downto 0);
    signal subRes_uid169_fpArctan2Test_q : STD_LOGIC_VECTOR (49 downto 0);
    signal subResNormBit_uid170_fpArctan2Test_in : STD_LOGIC_VECTOR (48 downto 0);
    signal subResNormBit_uid170_fpArctan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal subResHigh_uid171_fpArctan2Test_in : STD_LOGIC_VECTOR (47 downto 0);
    signal subResHigh_uid171_fpArctan2Test_b : STD_LOGIC_VECTOR (22 downto 0);
    signal subResLow_uid172_fpArctan2Test_in : STD_LOGIC_VECTOR (46 downto 0);
    signal subResLow_uid172_fpArctan2Test_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRSub_uid173_fpArctan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRSub_uid173_fpArctan2Test_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRSub_uid174_fpArctan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expRSub_uid174_fpArctan2Test_q : STD_LOGIC_VECTOR (7 downto 0);
    signal xInIsLTEZero_uid175_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal xInIsLTEZero_uid175_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRFinal_uid176_fpArctan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRFinal_uid176_fpArctan2Test_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRFinal_uid177_fpArctan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expRFinal_uid177_fpArctan2Test_q : STD_LOGIC_VECTOR (7 downto 0);
    signal invYInSign_uid178_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invXInSign_uid179_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero2_uid180_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero1_uid181_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid182_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid182_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid183_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid183_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excSelBits_uid184_fpArctan2Test_q : STD_LOGIC_VECTOR (2 downto 0);
    signal outMuxSelEnc_uid185_fpArctan2Test_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid187_fpArctan2Test_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid187_fpArctan2Test_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid188_fpArctan2Test_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid188_fpArctan2Test_q : STD_LOGIC_VECTOR (7 downto 0);
    signal invExcRNaN_uid189_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid190_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal R_uid191_fpArctan2Test_q : STD_LOGIC_VECTOR (31 downto 0);
    signal updatedY_uid203_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (23 downto 0);
    signal fracYZero_uid202_div_uid45_fpArctan2Test_a : STD_LOGIC_VECTOR (23 downto 0);
    signal fracYZero_uid202_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid210_div_uid45_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid210_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid216_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid217_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid218_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid224_div_uid45_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid224_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid230_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid231_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid232_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid233_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXmY_uid234_div_uid45_fpArctan2Test_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expXmY_uid234_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expXmY_uid234_div_uid45_fpArctan2Test_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expXmY_uid234_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expR_uid235_div_uid45_fpArctan2Test_a : STD_LOGIC_VECTOR (10 downto 0);
    signal expR_uid235_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expR_uid235_div_uid45_fpArctan2Test_o : STD_LOGIC_VECTOR (10 downto 0);
    signal expR_uid235_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (9 downto 0);
    signal yAddr_uid238_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (8 downto 0);
    signal yPE_uid239_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (13 downto 0);
    signal fracYPostZ_uid243_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal lOAdded_uid245_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (23 downto 0);
    signal oFracXSE_mergedSignalTM_uid250_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (25 downto 0);
    signal divValPreNormS_uid252_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (25 downto 0);
    signal divValPreNormTrunc_uid253_div_uid45_fpArctan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal divValPreNormTrunc_uid253_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (25 downto 0);
    signal norm_uid254_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal divValPreNormHigh_uid255_div_uid45_fpArctan2Test_in : STD_LOGIC_VECTOR (24 downto 0);
    signal divValPreNormHigh_uid255_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (23 downto 0);
    signal divValPreNormLow_uid256_div_uid45_fpArctan2Test_in : STD_LOGIC_VECTOR (23 downto 0);
    signal divValPreNormLow_uid256_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (23 downto 0);
    signal normFracRnd_uid257_div_uid45_fpArctan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal normFracRnd_uid257_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (23 downto 0);
    signal expFracRnd_uid258_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (33 downto 0);
    signal rndOp_uid262_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (24 downto 0);
    signal expFracPostRnd_uid263_div_uid45_fpArctan2Test_a : STD_LOGIC_VECTOR (35 downto 0);
    signal expFracPostRnd_uid263_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (35 downto 0);
    signal expFracPostRnd_uid263_div_uid45_fpArctan2Test_o : STD_LOGIC_VECTOR (35 downto 0);
    signal expFracPostRnd_uid263_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (34 downto 0);
    signal fracRPreExc_uid265_div_uid45_fpArctan2Test_in : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExc_uid265_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excRPreExc_uid266_div_uid45_fpArctan2Test_in : STD_LOGIC_VECTOR (31 downto 0);
    signal excRPreExc_uid266_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expRExt_uid267_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expUdf_uid268_div_uid45_fpArctan2Test_a : STD_LOGIC_VECTOR (12 downto 0);
    signal expUdf_uid268_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (12 downto 0);
    signal expUdf_uid268_div_uid45_fpArctan2Test_o : STD_LOGIC_VECTOR (12 downto 0);
    signal expUdf_uid268_div_uid45_fpArctan2Test_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid271_div_uid45_fpArctan2Test_a : STD_LOGIC_VECTOR (12 downto 0);
    signal expOvf_uid271_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (12 downto 0);
    signal expOvf_uid271_div_uid45_fpArctan2Test_o : STD_LOGIC_VECTOR (12 downto 0);
    signal expOvf_uid271_div_uid45_fpArctan2Test_n : STD_LOGIC_VECTOR (0 downto 0);
    signal zeroOverReg_uid272_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal regOverRegWithUf_uid273_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xRegOrZero_uid274_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal regOrZeroOverInf_uid275_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid276_div_uid45_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid276_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRYZ_uid277_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRYROvf_uid278_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYZ_uid279_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYR_uid280_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid281_div_uid45_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid281_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZYZ_uid282_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYI_uid283_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid284_div_uid45_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid284_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid285_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid286_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid290_div_uid45_fpArctan2Test_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid290_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid294_div_uid45_fpArctan2Test_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid294_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (7 downto 0);
    signal invExcRNaN_uid295_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sRPostExc_uid296_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal divR_uid297_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (31 downto 0);
    signal cst2BiasM1_uid306_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cst2Bias_uid307_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (7 downto 0);
    signal fracXIsNotZero_uid317_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid319_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid320_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid321_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid322_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracX_uid323_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (23 downto 0);
    signal fracXIsZero_uid324_z_uid91_fpArctan2Test_a : STD_LOGIC_VECTOR (23 downto 0);
    signal fracXIsZero_uid324_z_uid91_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid324_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal y_uid327_z_uid91_fpArctan2Test_in : STD_LOGIC_VECTOR (22 downto 0);
    signal y_uid327_z_uid91_fpArctan2Test_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expRCompExt_uid332_z_uid91_fpArctan2Test_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompExt_uid332_z_uid91_fpArctan2Test_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompExt_uid332_z_uid91_fpArctan2Test_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompExt_uid332_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expRComp_uid333_z_uid91_fpArctan2Test_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expRComp_uid333_z_uid91_fpArctan2Test_b : STD_LOGIC_VECTOR (7 downto 0);
    signal udf_uid334_z_uid91_fpArctan2Test_in : STD_LOGIC_VECTOR (9 downto 0);
    signal udf_uid334_z_uid91_fpArctan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expRCompYIsOneExt_uid335_z_uid91_fpArctan2Test_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompYIsOneExt_uid335_z_uid91_fpArctan2Test_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompYIsOneExt_uid335_z_uid91_fpArctan2Test_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompYIsOneExt_uid335_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompYIsOne_uid336_z_uid91_fpArctan2Test_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expRCompYIsOne_uid336_z_uid91_fpArctan2Test_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fxpInverseRes_uid337_z_uid91_fpArctan2Test_in : STD_LOGIC_VECTOR (28 downto 0);
    signal fxpInverseRes_uid337_z_uid91_fpArctan2Test_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fxpInverseResFrac_uid339_z_uid91_fpArctan2Test_in : STD_LOGIC_VECTOR (22 downto 0);
    signal fxpInverseResFrac_uid339_z_uid91_fpArctan2Test_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRCalc_uid340_z_uid91_fpArctan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRCalc_uid340_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRCalc_uid341_z_uid91_fpArctan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expRCalc_uid341_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (7 downto 0);
    signal xRegAndUdf_uid342_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xIOrXRUdf_uid343_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excSelBits_uid344_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (2 downto 0);
    signal outMuxSelEnc_uid345_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid347_z_uid91_fpArctan2Test_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid347_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid348_z_uid91_fpArctan2Test_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid348_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (7 downto 0);
    signal invExcRNaN_uid349_z_uid91_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcRNaN_uid349_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid350_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal R_uid351_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (31 downto 0);
    signal yT1_uid365_invPolyEval_b : STD_LOGIC_VECTOR (12 downto 0);
    signal rndBit_uid367_invPolyEval_q : STD_LOGIC_VECTOR (1 downto 0);
    signal cIncludingRoundingBit_uid368_invPolyEval_q : STD_LOGIC_VECTOR (22 downto 0);
    signal ts1_uid370_invPolyEval_a : STD_LOGIC_VECTOR (23 downto 0);
    signal ts1_uid370_invPolyEval_b : STD_LOGIC_VECTOR (23 downto 0);
    signal ts1_uid370_invPolyEval_o : STD_LOGIC_VECTOR (23 downto 0);
    signal ts1_uid370_invPolyEval_q : STD_LOGIC_VECTOR (23 downto 0);
    signal s1_uid371_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal rndBit_uid374_invPolyEval_q : STD_LOGIC_VECTOR (2 downto 0);
    signal cIncludingRoundingBit_uid375_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal ts2_uid377_invPolyEval_a : STD_LOGIC_VECTOR (34 downto 0);
    signal ts2_uid377_invPolyEval_b : STD_LOGIC_VECTOR (34 downto 0);
    signal ts2_uid377_invPolyEval_o : STD_LOGIC_VECTOR (34 downto 0);
    signal ts2_uid377_invPolyEval_q : STD_LOGIC_VECTOR (34 downto 0);
    signal s2_uid378_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal os_uid382_invTables_q : STD_LOGIC_VECTOR (30 downto 0);
    signal os_uid386_invTables_q : STD_LOGIC_VECTOR (20 downto 0);
    signal yT1_uid394_invPolyEval_b : STD_LOGIC_VECTOR (11 downto 0);
    signal cIncludingRoundingBit_uid397_invPolyEval_q : STD_LOGIC_VECTOR (22 downto 0);
    signal ts1_uid399_invPolyEval_a : STD_LOGIC_VECTOR (23 downto 0);
    signal ts1_uid399_invPolyEval_b : STD_LOGIC_VECTOR (23 downto 0);
    signal ts1_uid399_invPolyEval_o : STD_LOGIC_VECTOR (23 downto 0);
    signal ts1_uid399_invPolyEval_q : STD_LOGIC_VECTOR (23 downto 0);
    signal s1_uid400_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal cIncludingRoundingBit_uid404_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal ts2_uid406_invPolyEval_a : STD_LOGIC_VECTOR (34 downto 0);
    signal ts2_uid406_invPolyEval_b : STD_LOGIC_VECTOR (34 downto 0);
    signal ts2_uid406_invPolyEval_o : STD_LOGIC_VECTOR (34 downto 0);
    signal ts2_uid406_invPolyEval_q : STD_LOGIC_VECTOR (34 downto 0);
    signal s2_uid407_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal topRangeX_uid417_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (17 downto 0);
    signal topRangeY_uid418_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (17 downto 0);
    signal aboveLeftX_uid423_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (8 downto 0);
    signal aboveLeftY_bottomExtension_uid424_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (2 downto 0);
    signal aboveLeftY_bottomRange_uid425_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_in : STD_LOGIC_VECTOR (5 downto 0);
    signal aboveLeftY_bottomRange_uid425_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (5 downto 0);
    signal aboveLeftY_mergedSignalTM_uid426_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (8 downto 0);
    signal rightBottomX_bottomRange_uid429_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_in : STD_LOGIC_VECTOR (7 downto 0);
    signal rightBottomX_bottomRange_uid429_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightBottomX_mergedSignalTM_uid430_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (8 downto 0);
    signal rightBottomY_uid432_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (8 downto 0);
    signal rightBottomX_uid436_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_in : STD_LOGIC_VECTOR (16 downto 0);
    signal rightBottomX_uid436_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (4 downto 0);
    signal rightBottomY_uid437_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_in : STD_LOGIC_VECTOR (5 downto 0);
    signal rightBottomY_uid437_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (4 downto 0);
    signal aboveLeftX_uid438_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_in : STD_LOGIC_VECTOR (7 downto 0);
    signal aboveLeftX_uid438_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (4 downto 0);
    signal aboveLeftY_uid439_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_in : STD_LOGIC_VECTOR (14 downto 0);
    signal aboveLeftY_uid439_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (4 downto 0);
    signal n1_uid445_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n0_uid446_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n1_uid447_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n0_uid448_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n1_uid453_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n0_uid454_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n1_uid455_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n0_uid456_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n1_uid461_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (1 downto 0);
    signal n0_uid462_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (1 downto 0);
    signal n1_uid463_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (1 downto 0);
    signal n0_uid464_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid475_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal sm0_uid475_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b0 : STD_LOGIC_VECTOR (17 downto 0);
    signal sm0_uid475_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_s1 : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid475_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_reset : std_logic;
    signal sm0_uid475_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid476_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_a0 : STD_LOGIC_VECTOR (8 downto 0);
    signal sm0_uid476_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b0 : STD_LOGIC_VECTOR (8 downto 0);
    signal sm0_uid476_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_s1 : STD_LOGIC_VECTOR (17 downto 0);
    signal sm0_uid476_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_reset : std_logic;
    signal sm0_uid476_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (17 downto 0);
    signal sm1_uid477_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_a0 : STD_LOGIC_VECTOR (8 downto 0);
    signal sm1_uid477_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b0 : STD_LOGIC_VECTOR (8 downto 0);
    signal sm1_uid477_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_s1 : STD_LOGIC_VECTOR (17 downto 0);
    signal sm1_uid477_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_reset : std_logic;
    signal sm1_uid477_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (17 downto 0);
    signal sm0_uid478_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_a0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid478_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid478_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_s1 : STD_LOGIC_VECTOR (3 downto 0);
    signal sm0_uid478_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_reset : std_logic;
    signal sm0_uid478_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (3 downto 0);
    signal sm1_uid479_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_a0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm1_uid479_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm1_uid479_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_s1 : STD_LOGIC_VECTOR (3 downto 0);
    signal sm1_uid479_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_reset : std_logic;
    signal sm1_uid479_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (3 downto 0);
    signal lev1_a0_uid480_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_a : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0_uid480_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0_uid480_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_o : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0_uid480_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a1high_uid483_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_a : STD_LOGIC_VECTOR (13 downto 0);
    signal lev1_a1high_uid483_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (13 downto 0);
    signal lev1_a1high_uid483_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_o : STD_LOGIC_VECTOR (13 downto 0);
    signal lev1_a1high_uid483_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (13 downto 0);
    signal lev1_a1_uid484_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (18 downto 0);
    signal lev2_a0_uid485_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_a : STD_LOGIC_VECTOR (37 downto 0);
    signal lev2_a0_uid485_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (37 downto 0);
    signal lev2_a0_uid485_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_o : STD_LOGIC_VECTOR (37 downto 0);
    signal lev2_a0_uid485_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (37 downto 0);
    signal lev3_a0high_uid488_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_a : STD_LOGIC_VECTOR (33 downto 0);
    signal lev3_a0high_uid488_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (33 downto 0);
    signal lev3_a0high_uid488_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_o : STD_LOGIC_VECTOR (33 downto 0);
    signal lev3_a0high_uid488_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (33 downto 0);
    signal lev3_a0_uid489_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (38 downto 0);
    signal osig_uid490_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_in : STD_LOGIC_VECTOR (35 downto 0);
    signal osig_uid490_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (26 downto 0);
    signal yT1_uid504_invPolyEval_b : STD_LOGIC_VECTOR (11 downto 0);
    signal cIncludingRoundingBit_uid507_invPolyEval_q : STD_LOGIC_VECTOR (21 downto 0);
    signal ts1_uid509_invPolyEval_a : STD_LOGIC_VECTOR (22 downto 0);
    signal ts1_uid509_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal ts1_uid509_invPolyEval_o : STD_LOGIC_VECTOR (22 downto 0);
    signal ts1_uid509_invPolyEval_q : STD_LOGIC_VECTOR (22 downto 0);
    signal s1_uid510_invPolyEval_b : STD_LOGIC_VECTOR (21 downto 0);
    signal cIncludingRoundingBit_uid514_invPolyEval_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ts2_uid516_invPolyEval_a : STD_LOGIC_VECTOR (32 downto 0);
    signal ts2_uid516_invPolyEval_b : STD_LOGIC_VECTOR (32 downto 0);
    signal ts2_uid516_invPolyEval_o : STD_LOGIC_VECTOR (32 downto 0);
    signal ts2_uid516_invPolyEval_q : STD_LOGIC_VECTOR (32 downto 0);
    signal s2_uid517_invPolyEval_b : STD_LOGIC_VECTOR (31 downto 0);
    signal nx_mergedSignalTM_uid521_pT1_uid366_invPolyEval_q : STD_LOGIC_VECTOR (13 downto 0);
    signal topRangeX_mergedSignalTM_uid533_pT1_uid366_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal topRangeY_bottomExtension_uid535_pT1_uid366_invPolyEval_q : STD_LOGIC_VECTOR (3 downto 0);
    signal topRangeY_mergedSignalTM_uid537_pT1_uid366_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid539_pT1_uid366_invPolyEval_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid539_pT1_uid366_invPolyEval_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid539_pT1_uid366_invPolyEval_s1 : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid539_pT1_uid366_invPolyEval_reset : std_logic;
    signal sm0_uid539_pT1_uid366_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal osig_uid540_pT1_uid366_invPolyEval_in : STD_LOGIC_VECTOR (32 downto 0);
    signal osig_uid540_pT1_uid366_invPolyEval_b : STD_LOGIC_VECTOR (14 downto 0);
    signal nx_mergedSignalTM_uid544_pT2_uid373_invPolyEval_q : STD_LOGIC_VECTOR (18 downto 0);
    signal topRangeX_uid554_pT2_uid373_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal topRangeY_uid555_pT2_uid373_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal aboveLeftX_uid563_pT2_uid373_invPolyEval_b : STD_LOGIC_VECTOR (7 downto 0);
    signal aboveLeftY_bottomRange_uid565_pT2_uid373_invPolyEval_in : STD_LOGIC_VECTOR (5 downto 0);
    signal aboveLeftY_bottomRange_uid565_pT2_uid373_invPolyEval_b : STD_LOGIC_VECTOR (5 downto 0);
    signal aboveLeftY_mergedSignalTM_uid566_pT2_uid373_invPolyEval_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rightBottomX_bottomExtension_uid568_pT2_uid373_invPolyEval_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rightBottomX_bottomRange_uid569_pT2_uid373_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal rightBottomX_bottomRange_uid569_pT2_uid373_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightBottomX_mergedSignalTM_uid570_pT2_uid373_invPolyEval_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rightBottomY_uid572_pT2_uid373_invPolyEval_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightBottomX_uid576_pT2_uid373_invPolyEval_in : STD_LOGIC_VECTOR (10 downto 0);
    signal rightBottomX_uid576_pT2_uid373_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal rightBottomY_uid577_pT2_uid373_invPolyEval_in : STD_LOGIC_VECTOR (5 downto 0);
    signal rightBottomY_uid577_pT2_uid373_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal aboveLeftX_mergedSignalTM_uid580_pT2_uid373_invPolyEval_q : STD_LOGIC_VECTOR (4 downto 0);
    signal aboveLeftY_uid582_pT2_uid373_invPolyEval_in : STD_LOGIC_VECTOR (14 downto 0);
    signal aboveLeftY_uid582_pT2_uid373_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal n1_uid588_pT2_uid373_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n0_uid589_pT2_uid373_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n1_uid590_pT2_uid373_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n0_uid591_pT2_uid373_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal sm0_uid602_pT2_uid373_invPolyEval_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid602_pT2_uid373_invPolyEval_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid602_pT2_uid373_invPolyEval_s1 : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid602_pT2_uid373_invPolyEval_reset : std_logic;
    signal sm0_uid602_pT2_uid373_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid603_pT2_uid373_invPolyEval_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal sm0_uid603_pT2_uid373_invPolyEval_b0 : STD_LOGIC_VECTOR (8 downto 0);
    signal sm0_uid603_pT2_uid373_invPolyEval_s1 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid603_pT2_uid373_invPolyEval_reset : std_logic;
    signal sm0_uid603_pT2_uid373_invPolyEval_q : STD_LOGIC_VECTOR (15 downto 0);
    signal sm1_uid604_pT2_uid373_invPolyEval_a0 : STD_LOGIC_VECTOR (8 downto 0);
    signal sm1_uid604_pT2_uid373_invPolyEval_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal sm1_uid604_pT2_uid373_invPolyEval_s1 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm1_uid604_pT2_uid373_invPolyEval_reset : std_logic;
    signal sm1_uid604_pT2_uid373_invPolyEval_q : STD_LOGIC_VECTOR (15 downto 0);
    signal sm0_uid605_pT2_uid373_invPolyEval_a0 : STD_LOGIC_VECTOR (3 downto 0);
    signal sm0_uid605_pT2_uid373_invPolyEval_b0 : STD_LOGIC_VECTOR (3 downto 0);
    signal sm0_uid605_pT2_uid373_invPolyEval_s1 : STD_LOGIC_VECTOR (7 downto 0);
    signal sm0_uid605_pT2_uid373_invPolyEval_reset : std_logic;
    signal sm0_uid605_pT2_uid373_invPolyEval_q : STD_LOGIC_VECTOR (7 downto 0);
    signal sm1_uid606_pT2_uid373_invPolyEval_a0 : STD_LOGIC_VECTOR (3 downto 0);
    signal sm1_uid606_pT2_uid373_invPolyEval_b0 : STD_LOGIC_VECTOR (3 downto 0);
    signal sm1_uid606_pT2_uid373_invPolyEval_s1 : STD_LOGIC_VECTOR (7 downto 0);
    signal sm1_uid606_pT2_uid373_invPolyEval_reset : std_logic;
    signal sm1_uid606_pT2_uid373_invPolyEval_q : STD_LOGIC_VECTOR (7 downto 0);
    signal lowRangeA_uid607_pT2_uid373_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid607_pT2_uid373_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid608_pT2_uid373_invPolyEval_b : STD_LOGIC_VECTOR (32 downto 0);
    signal lev1_a0high_uid609_pT2_uid373_invPolyEval_a : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid609_pT2_uid373_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid609_pT2_uid373_invPolyEval_o : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid609_pT2_uid373_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0_uid610_pT2_uid373_invPolyEval_q : STD_LOGIC_VECTOR (34 downto 0);
    signal lev1_a1_uid611_pT2_uid373_invPolyEval_a : STD_LOGIC_VECTOR (17 downto 0);
    signal lev1_a1_uid611_pT2_uid373_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal lev1_a1_uid611_pT2_uid373_invPolyEval_o : STD_LOGIC_VECTOR (17 downto 0);
    signal lev1_a1_uid611_pT2_uid373_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal lowRangeA_uid612_pT2_uid373_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid612_pT2_uid373_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid613_pT2_uid373_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal lev2_a0high_uid614_pT2_uid373_invPolyEval_a : STD_LOGIC_VECTOR (34 downto 0);
    signal lev2_a0high_uid614_pT2_uid373_invPolyEval_b : STD_LOGIC_VECTOR (34 downto 0);
    signal lev2_a0high_uid614_pT2_uid373_invPolyEval_o : STD_LOGIC_VECTOR (34 downto 0);
    signal lev2_a0high_uid614_pT2_uid373_invPolyEval_q : STD_LOGIC_VECTOR (34 downto 0);
    signal lev2_a0_uid615_pT2_uid373_invPolyEval_q : STD_LOGIC_VECTOR (35 downto 0);
    signal lowRangeA_uid616_pT2_uid373_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid616_pT2_uid373_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid617_pT2_uid373_invPolyEval_b : STD_LOGIC_VECTOR (34 downto 0);
    signal lev3_a0high_uid618_pT2_uid373_invPolyEval_a : STD_LOGIC_VECTOR (36 downto 0);
    signal lev3_a0high_uid618_pT2_uid373_invPolyEval_b : STD_LOGIC_VECTOR (36 downto 0);
    signal lev3_a0high_uid618_pT2_uid373_invPolyEval_o : STD_LOGIC_VECTOR (36 downto 0);
    signal lev3_a0high_uid618_pT2_uid373_invPolyEval_q : STD_LOGIC_VECTOR (35 downto 0);
    signal lev3_a0_uid619_pT2_uid373_invPolyEval_q : STD_LOGIC_VECTOR (36 downto 0);
    signal osig_uid620_pT2_uid373_invPolyEval_in : STD_LOGIC_VECTOR (32 downto 0);
    signal osig_uid620_pT2_uid373_invPolyEval_b : STD_LOGIC_VECTOR (24 downto 0);
    signal nx_mergedSignalTM_uid624_pT1_uid395_invPolyEval_q : STD_LOGIC_VECTOR (12 downto 0);
    signal topRangeX_mergedSignalTM_uid639_pT1_uid395_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal topRangeY_bottomExtension_uid641_pT1_uid395_invPolyEval_q : STD_LOGIC_VECTOR (4 downto 0);
    signal topRangeY_mergedSignalTM_uid643_pT1_uid395_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid645_pT1_uid395_invPolyEval_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid645_pT1_uid395_invPolyEval_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid645_pT1_uid395_invPolyEval_s1 : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid645_pT1_uid395_invPolyEval_reset : std_logic;
    signal sm0_uid645_pT1_uid395_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal osig_uid646_pT1_uid395_invPolyEval_in : STD_LOGIC_VECTOR (32 downto 0);
    signal osig_uid646_pT1_uid395_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal nx_mergedSignalTM_uid650_pT2_uid402_invPolyEval_q : STD_LOGIC_VECTOR (14 downto 0);
    signal topRangeX_mergedSignalTM_uid662_pT2_uid402_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal topRangeY_uid664_pT2_uid402_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal aboveLeftX_uid670_pT2_uid402_invPolyEval_b : STD_LOGIC_VECTOR (7 downto 0);
    signal aboveLeftY_bottomRange_uid672_pT2_uid402_invPolyEval_in : STD_LOGIC_VECTOR (5 downto 0);
    signal aboveLeftY_bottomRange_uid672_pT2_uid402_invPolyEval_b : STD_LOGIC_VECTOR (5 downto 0);
    signal aboveLeftY_mergedSignalTM_uid673_pT2_uid402_invPolyEval_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rightBottomX_uid681_pT2_uid402_invPolyEval_in : STD_LOGIC_VECTOR (6 downto 0);
    signal rightBottomX_uid681_pT2_uid402_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal rightBottomY_uid682_pT2_uid402_invPolyEval_in : STD_LOGIC_VECTOR (5 downto 0);
    signal rightBottomY_uid682_pT2_uid402_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal n1_uid691_pT2_uid402_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n0_uid692_pT2_uid402_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n1_uid699_pT2_uid402_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n0_uid700_pT2_uid402_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal sm0_uid713_pT2_uid402_invPolyEval_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid713_pT2_uid402_invPolyEval_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid713_pT2_uid402_invPolyEval_s1 : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid713_pT2_uid402_invPolyEval_reset : std_logic;
    signal sm0_uid713_pT2_uid402_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid714_pT2_uid402_invPolyEval_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal sm0_uid714_pT2_uid402_invPolyEval_b0 : STD_LOGIC_VECTOR (8 downto 0);
    signal sm0_uid714_pT2_uid402_invPolyEval_s1 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid714_pT2_uid402_invPolyEval_reset : std_logic;
    signal sm0_uid714_pT2_uid402_invPolyEval_q : STD_LOGIC_VECTOR (15 downto 0);
    signal sm0_uid715_pT2_uid402_invPolyEval_a0 : STD_LOGIC_VECTOR (2 downto 0);
    signal sm0_uid715_pT2_uid402_invPolyEval_b0 : STD_LOGIC_VECTOR (2 downto 0);
    signal sm0_uid715_pT2_uid402_invPolyEval_s1 : STD_LOGIC_VECTOR (5 downto 0);
    signal sm0_uid715_pT2_uid402_invPolyEval_reset : std_logic;
    signal sm0_uid715_pT2_uid402_invPolyEval_q : STD_LOGIC_VECTOR (5 downto 0);
    signal lowRangeA_uid716_pT2_uid402_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid716_pT2_uid402_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid717_pT2_uid402_invPolyEval_b : STD_LOGIC_VECTOR (32 downto 0);
    signal lev1_a0high_uid718_pT2_uid402_invPolyEval_a : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid718_pT2_uid402_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid718_pT2_uid402_invPolyEval_o : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid718_pT2_uid402_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0_uid719_pT2_uid402_invPolyEval_q : STD_LOGIC_VECTOR (34 downto 0);
    signal lowRangeA_uid720_pT2_uid402_invPolyEval_in : STD_LOGIC_VECTOR (2 downto 0);
    signal lowRangeA_uid720_pT2_uid402_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal highABits_uid721_pT2_uid402_invPolyEval_b : STD_LOGIC_VECTOR (31 downto 0);
    signal lev2_a0high_uid722_pT2_uid402_invPolyEval_a : STD_LOGIC_VECTOR (33 downto 0);
    signal lev2_a0high_uid722_pT2_uid402_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal lev2_a0high_uid722_pT2_uid402_invPolyEval_o : STD_LOGIC_VECTOR (33 downto 0);
    signal lev2_a0high_uid722_pT2_uid402_invPolyEval_q : STD_LOGIC_VECTOR (32 downto 0);
    signal lev2_a0_uid723_pT2_uid402_invPolyEval_q : STD_LOGIC_VECTOR (35 downto 0);
    signal osig_uid724_pT2_uid402_invPolyEval_in : STD_LOGIC_VECTOR (32 downto 0);
    signal osig_uid724_pT2_uid402_invPolyEval_b : STD_LOGIC_VECTOR (24 downto 0);
    signal nx_mergedSignalTM_uid728_pT1_uid505_invPolyEval_q : STD_LOGIC_VECTOR (12 downto 0);
    signal topRangeX_mergedSignalTM_uid743_pT1_uid505_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal topRangeY_mergedSignalTM_uid747_pT1_uid505_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid749_pT1_uid505_invPolyEval_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid749_pT1_uid505_invPolyEval_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid749_pT1_uid505_invPolyEval_s1 : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid749_pT1_uid505_invPolyEval_reset : std_logic;
    signal sm0_uid749_pT1_uid505_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal osig_uid750_pT1_uid505_invPolyEval_in : STD_LOGIC_VECTOR (32 downto 0);
    signal osig_uid750_pT1_uid505_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal nx_mergedSignalTM_uid754_pT2_uid512_invPolyEval_q : STD_LOGIC_VECTOR (15 downto 0);
    signal topRangeX_mergedSignalTM_uid766_pT2_uid512_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal topRangeY_uid768_pT2_uid512_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal aboveLeftX_uid774_pT2_uid512_invPolyEval_b : STD_LOGIC_VECTOR (7 downto 0);
    signal aboveLeftY_bottomRange_uid776_pT2_uid512_invPolyEval_in : STD_LOGIC_VECTOR (4 downto 0);
    signal aboveLeftY_bottomRange_uid776_pT2_uid512_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal aboveLeftY_mergedSignalTM_uid777_pT2_uid512_invPolyEval_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rightBottomX_uid785_pT2_uid512_invPolyEval_in : STD_LOGIC_VECTOR (7 downto 0);
    signal rightBottomX_uid785_pT2_uid512_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal rightBottomY_uid786_pT2_uid512_invPolyEval_in : STD_LOGIC_VECTOR (4 downto 0);
    signal rightBottomY_uid786_pT2_uid512_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal n1_uid795_pT2_uid512_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n0_uid796_pT2_uid512_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n1_uid803_pT2_uid512_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n0_uid804_pT2_uid512_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal n1_uid811_pT2_uid512_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal n0_uid812_pT2_uid512_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid825_pT2_uid512_invPolyEval_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid825_pT2_uid512_invPolyEval_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid825_pT2_uid512_invPolyEval_s1 : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid825_pT2_uid512_invPolyEval_reset : std_logic;
    signal sm0_uid825_pT2_uid512_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid826_pT2_uid512_invPolyEval_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal sm0_uid826_pT2_uid512_invPolyEval_b0 : STD_LOGIC_VECTOR (8 downto 0);
    signal sm0_uid826_pT2_uid512_invPolyEval_s1 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid826_pT2_uid512_invPolyEval_reset : std_logic;
    signal sm0_uid826_pT2_uid512_invPolyEval_q : STD_LOGIC_VECTOR (15 downto 0);
    signal sm0_uid827_pT2_uid512_invPolyEval_a0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid827_pT2_uid512_invPolyEval_b0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid827_pT2_uid512_invPolyEval_s1 : STD_LOGIC_VECTOR (3 downto 0);
    signal sm0_uid827_pT2_uid512_invPolyEval_reset : std_logic;
    signal sm0_uid827_pT2_uid512_invPolyEval_q : STD_LOGIC_VECTOR (3 downto 0);
    signal lowRangeA_uid828_pT2_uid512_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid828_pT2_uid512_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid829_pT2_uid512_invPolyEval_b : STD_LOGIC_VECTOR (32 downto 0);
    signal lev1_a0high_uid830_pT2_uid512_invPolyEval_a : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid830_pT2_uid512_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid830_pT2_uid512_invPolyEval_o : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid830_pT2_uid512_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0_uid831_pT2_uid512_invPolyEval_q : STD_LOGIC_VECTOR (34 downto 0);
    signal lowRangeA_uid832_pT2_uid512_invPolyEval_in : STD_LOGIC_VECTOR (4 downto 0);
    signal lowRangeA_uid832_pT2_uid512_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal highABits_uid833_pT2_uid512_invPolyEval_b : STD_LOGIC_VECTOR (29 downto 0);
    signal lev2_a0high_uid834_pT2_uid512_invPolyEval_a : STD_LOGIC_VECTOR (31 downto 0);
    signal lev2_a0high_uid834_pT2_uid512_invPolyEval_b : STD_LOGIC_VECTOR (31 downto 0);
    signal lev2_a0high_uid834_pT2_uid512_invPolyEval_o : STD_LOGIC_VECTOR (31 downto 0);
    signal lev2_a0high_uid834_pT2_uid512_invPolyEval_q : STD_LOGIC_VECTOR (30 downto 0);
    signal lev2_a0_uid835_pT2_uid512_invPolyEval_q : STD_LOGIC_VECTOR (35 downto 0);
    signal osig_uid836_pT2_uid512_invPolyEval_in : STD_LOGIC_VECTOR (32 downto 0);
    signal osig_uid836_pT2_uid512_invPolyEval_b : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx1Rng2_uid841_fxpU_uid107_fpArctan2Test_in : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage0Idx1Rng2_uid841_fxpU_uid107_fpArctan2Test_b : STD_LOGIC_VECTOR (34 downto 0);
    signal leftShiftStage0Idx1_uid842_fxpU_uid107_fpArctan2Test_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage0Idx2Rng4_uid844_fxpU_uid107_fpArctan2Test_in : STD_LOGIC_VECTOR (32 downto 0);
    signal leftShiftStage0Idx2Rng4_uid844_fxpU_uid107_fpArctan2Test_b : STD_LOGIC_VECTOR (32 downto 0);
    signal leftShiftStage0Idx2_uid845_fxpU_uid107_fpArctan2Test_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage0Idx3Rng6_uid847_fxpU_uid107_fpArctan2Test_in : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage0Idx3Rng6_uid847_fxpU_uid107_fpArctan2Test_b : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage0Idx3_uid848_fxpU_uid107_fpArctan2Test_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage0Idx4Rng8_uid850_fxpU_uid107_fpArctan2Test_in : STD_LOGIC_VECTOR (28 downto 0);
    signal leftShiftStage0Idx4Rng8_uid850_fxpU_uid107_fpArctan2Test_b : STD_LOGIC_VECTOR (28 downto 0);
    signal leftShiftStage0Idx4_uid851_fxpU_uid107_fpArctan2Test_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage0Idx5Pad10_uid852_fxpU_uid107_fpArctan2Test_q : STD_LOGIC_VECTOR (9 downto 0);
    signal leftShiftStage0Idx5Rng10_uid853_fxpU_uid107_fpArctan2Test_in : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage0Idx5Rng10_uid853_fxpU_uid107_fpArctan2Test_b : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage0Idx5_uid854_fxpU_uid107_fpArctan2Test_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage0Idx6Pad12_uid855_fxpU_uid107_fpArctan2Test_q : STD_LOGIC_VECTOR (11 downto 0);
    signal leftShiftStage0Idx6Rng12_uid856_fxpU_uid107_fpArctan2Test_in : STD_LOGIC_VECTOR (24 downto 0);
    signal leftShiftStage0Idx6Rng12_uid856_fxpU_uid107_fpArctan2Test_b : STD_LOGIC_VECTOR (24 downto 0);
    signal leftShiftStage0Idx6_uid857_fxpU_uid107_fpArctan2Test_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage0Idx7Pad14_uid858_fxpU_uid107_fpArctan2Test_q : STD_LOGIC_VECTOR (13 downto 0);
    signal leftShiftStage0Idx7Rng14_uid859_fxpU_uid107_fpArctan2Test_in : STD_LOGIC_VECTOR (22 downto 0);
    signal leftShiftStage0Idx7Rng14_uid859_fxpU_uid107_fpArctan2Test_b : STD_LOGIC_VECTOR (22 downto 0);
    signal leftShiftStage0Idx7_uid860_fxpU_uid107_fpArctan2Test_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage1Idx1Rng1_uid864_fxpU_uid107_fpArctan2Test_in : STD_LOGIC_VECTOR (35 downto 0);
    signal leftShiftStage1Idx1Rng1_uid864_fxpU_uid107_fpArctan2Test_b : STD_LOGIC_VECTOR (35 downto 0);
    signal leftShiftStage1Idx1_uid865_fxpU_uid107_fpArctan2Test_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage1_uid867_fxpU_uid107_fpArctan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage1_uid867_fxpU_uid107_fpArctan2Test_q : STD_LOGIC_VECTOR (36 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_im0_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_im0_b0 : STD_LOGIC_VECTOR (17 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_im0_s1 : STD_LOGIC_VECTOR (35 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_im0_reset : std_logic;
    signal mulXAtanXOXRes_uid114_fpArctan2Test_im0_q : STD_LOGIC_VECTOR (35 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_im3_b0 : STD_LOGIC_VECTOR (8 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_im3_s1 : STD_LOGIC_VECTOR (26 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_im3_reset : std_logic;
    signal mulXAtanXOXRes_uid114_fpArctan2Test_im3_q : STD_LOGIC_VECTOR (26 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_im6_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_im6_b0 : STD_LOGIC_VECTOR (5 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_im6_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_im6_reset : std_logic;
    signal mulXAtanXOXRes_uid114_fpArctan2Test_im6_q : STD_LOGIC_VECTOR (23 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_im9_a0 : STD_LOGIC_VECTOR (8 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_im9_b0 : STD_LOGIC_VECTOR (5 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_im9_s1 : STD_LOGIC_VECTOR (14 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_im9_reset : std_logic;
    signal mulXAtanXOXRes_uid114_fpArctan2Test_im9_q : STD_LOGIC_VECTOR (14 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_join_12_q : STD_LOGIC_VECTOR (50 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_align_13_q : STD_LOGIC_VECTOR (44 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_align_13_qint : STD_LOGIC_VECTOR (44 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_align_15_q : STD_LOGIC_VECTOR (41 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_align_15_qint : STD_LOGIC_VECTOR (41 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_result_add_0_0_a : STD_LOGIC_VECTOR (51 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_result_add_0_0_b : STD_LOGIC_VECTOR (51 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_result_add_0_0_o : STD_LOGIC_VECTOR (51 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_result_add_0_0_q : STD_LOGIC_VECTOR (51 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_result_add_1_0_a : STD_LOGIC_VECTOR (52 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_result_add_1_0_b : STD_LOGIC_VECTOR (52 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_result_add_1_0_o : STD_LOGIC_VECTOR (52 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_result_add_1_0_q : STD_LOGIC_VECTOR (52 downto 0);
    signal shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_a : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_b : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_i : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_o : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage0Idx1Rng4_uid891_fxpOp2Path2_uid134_fpArctan2Test_b : STD_LOGIC_VECTOR (20 downto 0);
    signal rightShiftStage0Idx1_uid893_fxpOp2Path2_uid134_fpArctan2Test_q : STD_LOGIC_VECTOR (24 downto 0);
    signal rightShiftStage0Idx2Rng8_uid894_fxpOp2Path2_uid134_fpArctan2Test_b : STD_LOGIC_VECTOR (16 downto 0);
    signal rightShiftStage0Idx2_uid896_fxpOp2Path2_uid134_fpArctan2Test_q : STD_LOGIC_VECTOR (24 downto 0);
    signal rightShiftStage0Idx3Rng12_uid897_fxpOp2Path2_uid134_fpArctan2Test_b : STD_LOGIC_VECTOR (12 downto 0);
    signal rightShiftStage0Idx3_uid899_fxpOp2Path2_uid134_fpArctan2Test_q : STD_LOGIC_VECTOR (24 downto 0);
    signal rightShiftStage0Idx4Rng16_uid900_fxpOp2Path2_uid134_fpArctan2Test_b : STD_LOGIC_VECTOR (8 downto 0);
    signal rightShiftStage0Idx4Pad16_uid901_fxpOp2Path2_uid134_fpArctan2Test_q : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage0Idx4_uid902_fxpOp2Path2_uid134_fpArctan2Test_q : STD_LOGIC_VECTOR (24 downto 0);
    signal rightShiftStage0Idx5Rng20_uid903_fxpOp2Path2_uid134_fpArctan2Test_b : STD_LOGIC_VECTOR (4 downto 0);
    signal rightShiftStage0Idx5Pad20_uid904_fxpOp2Path2_uid134_fpArctan2Test_q : STD_LOGIC_VECTOR (19 downto 0);
    signal rightShiftStage0Idx5_uid905_fxpOp2Path2_uid134_fpArctan2Test_q : STD_LOGIC_VECTOR (24 downto 0);
    signal rightShiftStage0Idx6Rng24_uid906_fxpOp2Path2_uid134_fpArctan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx6_uid908_fxpOp2Path2_uid134_fpArctan2Test_q : STD_LOGIC_VECTOR (24 downto 0);
    signal rightShiftStage0Idx7_uid909_fxpOp2Path2_uid134_fpArctan2Test_q : STD_LOGIC_VECTOR (24 downto 0);
    signal rightShiftStage1Idx1Rng1_uid912_fxpOp2Path2_uid134_fpArctan2Test_b : STD_LOGIC_VECTOR (23 downto 0);
    signal rightShiftStage1Idx1_uid914_fxpOp2Path2_uid134_fpArctan2Test_q : STD_LOGIC_VECTOR (24 downto 0);
    signal rightShiftStage1Idx2Rng2_uid915_fxpOp2Path2_uid134_fpArctan2Test_b : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStage1Idx2_uid917_fxpOp2Path2_uid134_fpArctan2Test_q : STD_LOGIC_VECTOR (24 downto 0);
    signal rightShiftStage1Idx3Rng3_uid918_fxpOp2Path2_uid134_fpArctan2Test_b : STD_LOGIC_VECTOR (21 downto 0);
    signal rightShiftStage1Idx3_uid920_fxpOp2Path2_uid134_fpArctan2Test_q : STD_LOGIC_VECTOR (24 downto 0);
    signal rightShiftStage1_uid922_fxpOp2Path2_uid134_fpArctan2Test_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid922_fxpOp2Path2_uid134_fpArctan2Test_q : STD_LOGIC_VECTOR (24 downto 0);
    signal sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_a : STD_LOGIC_VECTOR (8 downto 0);
    signal sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_b : STD_LOGIC_VECTOR (8 downto 0);
    signal sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_i : STD_LOGIC_VECTOR (8 downto 0);
    signal sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_o : STD_LOGIC_VECTOR (8 downto 0);
    signal sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage0Idx1Rng4_uid927_fxpAlignedRes_uid163_fpArctan2Test_b : STD_LOGIC_VECTOR (43 downto 0);
    signal rightShiftStage0Idx1_uid929_fxpAlignedRes_uid163_fpArctan2Test_q : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage0Idx2Rng8_uid930_fxpAlignedRes_uid163_fpArctan2Test_b : STD_LOGIC_VECTOR (39 downto 0);
    signal rightShiftStage0Idx2_uid932_fxpAlignedRes_uid163_fpArctan2Test_q : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage0Idx3Rng12_uid933_fxpAlignedRes_uid163_fpArctan2Test_b : STD_LOGIC_VECTOR (35 downto 0);
    signal rightShiftStage0Idx3_uid935_fxpAlignedRes_uid163_fpArctan2Test_q : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage0Idx4Rng16_uid936_fxpAlignedRes_uid163_fpArctan2Test_b : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0Idx4_uid938_fxpAlignedRes_uid163_fpArctan2Test_q : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage0Idx5Rng20_uid939_fxpAlignedRes_uid163_fpArctan2Test_b : STD_LOGIC_VECTOR (27 downto 0);
    signal rightShiftStage0Idx5_uid941_fxpAlignedRes_uid163_fpArctan2Test_q : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage0Idx6Rng24_uid942_fxpAlignedRes_uid163_fpArctan2Test_b : STD_LOGIC_VECTOR (23 downto 0);
    signal rightShiftStage0Idx6_uid944_fxpAlignedRes_uid163_fpArctan2Test_q : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage0Idx7Rng28_uid945_fxpAlignedRes_uid163_fpArctan2Test_b : STD_LOGIC_VECTOR (19 downto 0);
    signal rightShiftStage0Idx7Pad28_uid946_fxpAlignedRes_uid163_fpArctan2Test_q : STD_LOGIC_VECTOR (27 downto 0);
    signal rightShiftStage0Idx7_uid947_fxpAlignedRes_uid163_fpArctan2Test_q : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage1Idx1Rng1_uid950_fxpAlignedRes_uid163_fpArctan2Test_b : STD_LOGIC_VECTOR (46 downto 0);
    signal rightShiftStage1Idx1_uid952_fxpAlignedRes_uid163_fpArctan2Test_q : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage1Idx2Rng2_uid953_fxpAlignedRes_uid163_fpArctan2Test_b : STD_LOGIC_VECTOR (45 downto 0);
    signal rightShiftStage1Idx2_uid955_fxpAlignedRes_uid163_fpArctan2Test_q : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage1Idx3Rng3_uid956_fxpAlignedRes_uid163_fpArctan2Test_b : STD_LOGIC_VECTOR (44 downto 0);
    signal rightShiftStage1Idx3_uid958_fxpAlignedRes_uid163_fpArctan2Test_q : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage1_uid960_fxpAlignedRes_uid163_fpArctan2Test_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid960_fxpAlignedRes_uid163_fpArctan2Test_q : STD_LOGIC_VECTOR (47 downto 0);
    signal memoryC0_uid353_atan2Tables_lutmem_reset0 : std_logic;
    signal memoryC0_uid353_atan2Tables_lutmem_ia : STD_LOGIC_VECTOR (30 downto 0);
    signal memoryC0_uid353_atan2Tables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid353_atan2Tables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid353_atan2Tables_lutmem_ir : STD_LOGIC_VECTOR (30 downto 0);
    signal memoryC0_uid353_atan2Tables_lutmem_r : STD_LOGIC_VECTOR (30 downto 0);
    signal memoryC1_uid356_atan2Tables_lutmem_reset0 : std_logic;
    signal memoryC1_uid356_atan2Tables_lutmem_ia : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC1_uid356_atan2Tables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid356_atan2Tables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid356_atan2Tables_lutmem_ir : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC1_uid356_atan2Tables_lutmem_r : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC2_uid359_atan2Tables_lutmem_reset0 : std_logic;
    signal memoryC2_uid359_atan2Tables_lutmem_ia : STD_LOGIC_VECTOR (12 downto 0);
    signal memoryC2_uid359_atan2Tables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid359_atan2Tables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid359_atan2Tables_lutmem_ir : STD_LOGIC_VECTOR (12 downto 0);
    signal memoryC2_uid359_atan2Tables_lutmem_r : STD_LOGIC_VECTOR (12 downto 0);
    signal memoryC0_uid380_invTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid380_invTables_lutmem_ia : STD_LOGIC_VECTOR (17 downto 0);
    signal memoryC0_uid380_invTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid380_invTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid380_invTables_lutmem_ir : STD_LOGIC_VECTOR (17 downto 0);
    signal memoryC0_uid380_invTables_lutmem_r : STD_LOGIC_VECTOR (17 downto 0);
    signal memoryC0_uid381_invTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid381_invTables_lutmem_ia : STD_LOGIC_VECTOR (12 downto 0);
    signal memoryC0_uid381_invTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid381_invTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid381_invTables_lutmem_ir : STD_LOGIC_VECTOR (12 downto 0);
    signal memoryC0_uid381_invTables_lutmem_r : STD_LOGIC_VECTOR (12 downto 0);
    signal memoryC1_uid384_invTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid384_invTables_lutmem_ia : STD_LOGIC_VECTOR (17 downto 0);
    signal memoryC1_uid384_invTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid384_invTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid384_invTables_lutmem_ir : STD_LOGIC_VECTOR (17 downto 0);
    signal memoryC1_uid384_invTables_lutmem_r : STD_LOGIC_VECTOR (17 downto 0);
    signal memoryC1_uid385_invTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid385_invTables_lutmem_ia : STD_LOGIC_VECTOR (2 downto 0);
    signal memoryC1_uid385_invTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid385_invTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid385_invTables_lutmem_ir : STD_LOGIC_VECTOR (2 downto 0);
    signal memoryC1_uid385_invTables_lutmem_r : STD_LOGIC_VECTOR (2 downto 0);
    signal memoryC2_uid388_invTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid388_invTables_lutmem_ia : STD_LOGIC_VECTOR (11 downto 0);
    signal memoryC2_uid388_invTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid388_invTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid388_invTables_lutmem_ir : STD_LOGIC_VECTOR (11 downto 0);
    signal memoryC2_uid388_invTables_lutmem_r : STD_LOGIC_VECTOR (11 downto 0);
    signal memoryC0_uid492_inverseTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid492_inverseTables_lutmem_ia : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC0_uid492_inverseTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid492_inverseTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid492_inverseTables_lutmem_ir : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC0_uid492_inverseTables_lutmem_r : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC1_uid495_inverseTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid495_inverseTables_lutmem_ia : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC1_uid495_inverseTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid495_inverseTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid495_inverseTables_lutmem_ir : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC1_uid495_inverseTables_lutmem_r : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC2_uid498_inverseTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid498_inverseTables_lutmem_ia : STD_LOGIC_VECTOR (11 downto 0);
    signal memoryC2_uid498_inverseTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid498_inverseTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid498_inverseTables_lutmem_ir : STD_LOGIC_VECTOR (11 downto 0);
    signal memoryC2_uid498_inverseTables_lutmem_r : STD_LOGIC_VECTOR (11 downto 0);
    signal leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_msplit_0_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_msplit_0_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_msplit_1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_msplit_1_q : STD_LOGIC_VECTOR (36 downto 0);
    signal leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_mfinal_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_mfinal_q : STD_LOGIC_VECTOR (36 downto 0);
    signal rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_msplit_0_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_msplit_0_q : STD_LOGIC_VECTOR (24 downto 0);
    signal rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_msplit_1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_msplit_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_mfinal_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_mfinal_q : STD_LOGIC_VECTOR (24 downto 0);
    signal rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_msplit_0_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_msplit_0_q : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_msplit_1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_msplit_1_q : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_mfinal_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_mfinal_q : STD_LOGIC_VECTOR (47 downto 0);
    signal fracOutCst_uid151_fpArctan2Test_merged_bit_select_in : STD_LOGIC_VECTOR (30 downto 0);
    signal fracOutCst_uid151_fpArctan2Test_merged_bit_select_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracOutCst_uid151_fpArctan2Test_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal expU_uid93_fpArctan2Test_merged_bit_select_in : STD_LOGIC_VECTOR (30 downto 0);
    signal expU_uid93_fpArctan2Test_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expU_uid93_fpArctan2Test_merged_bit_select_c : STD_LOGIC_VECTOR (22 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal leftShiftStageSel3Dto1_uid861_fxpU_uid107_fpArctan2Test_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStageSel3Dto1_uid861_fxpU_uid107_fpArctan2Test_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal yAddr_uid110_fpArctan2Test_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal yAddr_uid110_fpArctan2Test_merged_bit_select_c : STD_LOGIC_VECTOR (17 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (8 downto 0);
    signal fracRPath3_uid126_fpArctan2Test_merged_bit_select_in : STD_LOGIC_VECTOR (31 downto 0);
    signal fracRPath3_uid126_fpArctan2Test_merged_bit_select_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPath3_uid126_fpArctan2Test_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStageSel4Dto2_uid910_fxpOp2Path2_uid134_fpArctan2Test_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStageSel4Dto2_uid910_fxpOp2Path2_uid134_fpArctan2Test_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPath2_uid147_fpArctan2Test_merged_bit_select_in : STD_LOGIC_VECTOR (31 downto 0);
    signal fracRPath2_uid147_fpArctan2Test_merged_bit_select_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPath2_uid147_fpArctan2Test_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStageSel4Dto2_uid948_fxpAlignedRes_uid163_fpArctan2Test_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStageSel4Dto2_uid948_fxpAlignedRes_uid163_fpArctan2Test_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_c : STD_LOGIC_VECTOR (14 downto 0);
    signal invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_in : STD_LOGIC_VECTOR (31 downto 0);
    signal invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_b : STD_LOGIC_VECTOR (25 downto 0);
    signal invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid481_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_merged_bit_select_b : STD_LOGIC_VECTOR (4 downto 0);
    signal lowRangeA_uid481_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_merged_bit_select_c : STD_LOGIC_VECTOR (12 downto 0);
    signal lowRangeA_uid486_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_merged_bit_select_b : STD_LOGIC_VECTOR (4 downto 0);
    signal lowRangeA_uid486_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_merged_bit_select_c : STD_LOGIC_VECTOR (32 downto 0);
    signal leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_selLSBs_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_selLSBs_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_selLSBs_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_selLSBs_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_selLSBs_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_selLSBs_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_lowRangeA_uid481_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist1_invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (25 downto 0);
    signal redist2_invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_c_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_b_2_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist4_yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_b_7_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist5_yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_c_2_q : STD_LOGIC_VECTOR (14 downto 0);
    signal redist6_yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_c_5_q : STD_LOGIC_VECTOR (14 downto 0);
    signal redist7_fracRPath2_uid147_fpArctan2Test_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist8_fracRPath2_uid147_fpArctan2Test_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist9_fracRPath3_uid126_fpArctan2Test_merged_bit_select_b_3_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist10_fracRPath3_uid126_fpArctan2Test_merged_bit_select_c_3_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist11_yAddr_uid110_fpArctan2Test_merged_bit_select_b_2_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist12_yAddr_uid110_fpArctan2Test_merged_bit_select_b_8_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist13_yAddr_uid110_fpArctan2Test_merged_bit_select_c_2_q : STD_LOGIC_VECTOR (17 downto 0);
    signal redist14_yAddr_uid110_fpArctan2Test_merged_bit_select_c_5_q : STD_LOGIC_VECTOR (17 downto 0);
    signal redist16_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_c_11_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist17_expU_uid93_fpArctan2Test_merged_bit_select_b_16_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist18_expU_uid93_fpArctan2Test_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist19_mulXAtanXOXRes_uid114_fpArctan2Test_im6_q_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist20_osig_uid836_pT2_uid512_invPolyEval_b_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist21_highABits_uid833_pT2_uid512_invPolyEval_b_1_q : STD_LOGIC_VECTOR (29 downto 0);
    signal redist22_lowRangeA_uid832_pT2_uid512_invPolyEval_b_1_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist23_n0_uid812_pT2_uid512_invPolyEval_b_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist24_n1_uid811_pT2_uid512_invPolyEval_b_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist25_osig_uid724_pT2_uid402_invPolyEval_b_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist26_highABits_uid721_pT2_uid402_invPolyEval_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist27_lowRangeA_uid720_pT2_uid402_invPolyEval_b_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist28_n0_uid700_pT2_uid402_invPolyEval_b_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist29_n1_uid699_pT2_uid402_invPolyEval_b_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist30_osig_uid620_pT2_uid373_invPolyEval_b_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist31_highABits_uid617_pT2_uid373_invPolyEval_b_1_q : STD_LOGIC_VECTOR (34 downto 0);
    signal redist32_lowRangeA_uid616_pT2_uid373_invPolyEval_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_lowRangeA_uid607_pT2_uid373_invPolyEval_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_n1_uid590_pT2_uid373_invPolyEval_b_2_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist35_rightBottomX_bottomRange_uid569_pT2_uid373_invPolyEval_b_2_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist36_s1_uid510_invPolyEval_b_1_q : STD_LOGIC_VECTOR (21 downto 0);
    signal redist37_n0_uid464_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b_2_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist38_s1_uid400_invPolyEval_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist39_s1_uid371_invPolyEval_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist40_fracXIsZero_uid324_z_uid91_fpArctan2Test_q_9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist42_divR_uid297_div_uid45_fpArctan2Test_q_10_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist43_excRPreExc_uid266_div_uid45_fpArctan2Test_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist44_fracRPreExc_uid265_div_uid45_fpArctan2Test_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist45_lOAdded_uid245_div_uid45_fpArctan2Test_q_2_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist46_lOAdded_uid245_div_uid45_fpArctan2Test_q_4_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist47_yPE_uid239_div_uid45_fpArctan2Test_b_2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist48_yPE_uid239_div_uid45_fpArctan2Test_b_5_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist49_yAddr_uid238_div_uid45_fpArctan2Test_b_2_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist50_yAddr_uid238_div_uid45_fpArctan2Test_b_7_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist51_expXmY_uid234_div_uid45_fpArctan2Test_q_14_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist52_excZ_y_uid224_div_uid45_fpArctan2Test_q_16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_excZ_x_uid210_div_uid45_fpArctan2Test_q_16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_updatedY_uid203_div_uid45_fpArctan2Test_q_3_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist55_excRNaN_uid183_fpArctan2Test_q_35_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist56_excRZero_uid182_fpArctan2Test_q_26_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist57_xInIsLTEZero_uid175_fpArctan2Test_q_25_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist58_xInIsLTEZero_uid175_fpArctan2Test_q_26_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist59_expRCalc_uid154_fpArctan2Test_q_3_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist60_fracRCalc_uid152_fpArctan2Test_q_2_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist61_fracRCalc_uid152_fpArctan2Test_q_4_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist62_fracOutMuxSelEnc_uid150_fpArctan2Test_q_4_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist63_normBitPath2Diff_uid138_fpArctan2Test_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist64_expRPath3PreRnd_uid121_fpArctan2Test_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist65_fracRPath3Low_uid117_fpArctan2Test_b_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist66_fracRPath3High_uid116_fpArctan2Test_b_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist67_normBit_uid115_fpArctan2Test_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist68_fxpAtanXOXRes_uid113_fpArctan2Test_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist69_fxpShifterBits_uid106_fpArctan2Test_b_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist70_path2_uid90_fpArctan2Test_n_17_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist71_arctanIsConst_uid89_fpArctan2Test_q_17_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist72_xyInInf_uid88_fpArctan2Test_q_10_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist73_excI_div_uid69_fpArctan2Test_q_21_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist74_excZ_div_uid450_uid65_fpArctan2Test_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist75_singX_uid48_fpArctan2Test_b_20_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist76_fracX_uid47_fpArctan2Test_b_8_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist78_expX_uid46_fpArctan2Test_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist80_xInZero_uid44_fpArctan2Test_q_25_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist81_yInZero_uid40_fpArctan2Test_q_25_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist82_yInZero_uid40_fpArctan2Test_q_48_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist83_xInSign_uid35_fpArctan2Test_b_17_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist84_xInSign_uid35_fpArctan2Test_b_25_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist85_yInSign_uid34_fpArctan2Test_b_17_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist86_yInSign_uid34_fpArctan2Test_b_25_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist87_yInSign_uid34_fpArctan2Test_b_51_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist88_fracXIsZero_uid27_fpArctan2Test_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist89_expXIsMax_uid26_fpArctan2Test_q_16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist91_fracXIsZero_uid13_fpArctan2Test_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist92_expXIsMax_uid12_fpArctan2Test_q_16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_inputreg_q : STD_LOGIC_VECTOR (17 downto 0);
    signal redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_mem_reset0 : std_logic;
    signal redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_mem_ia : STD_LOGIC_VECTOR (17 downto 0);
    signal redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_mem_iq : STD_LOGIC_VECTOR (17 downto 0);
    signal redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_mem_q : STD_LOGIC_VECTOR (17 downto 0);
    signal redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve : boolean;
    attribute preserve of redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_rdcnt_i : signal is true;
    signal redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_rdcnt_eq : std_logic;
    attribute preserve of redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_rdcnt_eq : signal is true;
    signal redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_expU_uid93_fpArctan2Test_merged_bit_select_b_16_inputreg_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_inputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_mem_reset0 : std_logic;
    signal redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_rdcnt_i : signal is true;
    signal redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_rdcnt_eq : std_logic;
    attribute preserve of redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_rdcnt_eq : signal is true;
    signal redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist76_fracX_uid47_fpArctan2Test_b_8_inputreg_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist76_fracX_uid47_fpArctan2Test_b_8_outputreg_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist77_fracX_uid47_fpArctan2Test_b_30_outputreg_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist77_fracX_uid47_fpArctan2Test_b_30_mem_reset0 : std_logic;
    signal redist77_fracX_uid47_fpArctan2Test_b_30_mem_ia : STD_LOGIC_VECTOR (22 downto 0);
    signal redist77_fracX_uid47_fpArctan2Test_b_30_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist77_fracX_uid47_fpArctan2Test_b_30_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist77_fracX_uid47_fpArctan2Test_b_30_mem_iq : STD_LOGIC_VECTOR (22 downto 0);
    signal redist77_fracX_uid47_fpArctan2Test_b_30_mem_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist77_fracX_uid47_fpArctan2Test_b_30_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist77_fracX_uid47_fpArctan2Test_b_30_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve of redist77_fracX_uid47_fpArctan2Test_b_30_rdcnt_i : signal is true;
    signal redist77_fracX_uid47_fpArctan2Test_b_30_rdcnt_eq : std_logic;
    attribute preserve of redist77_fracX_uid47_fpArctan2Test_b_30_rdcnt_eq : signal is true;
    signal redist77_fracX_uid47_fpArctan2Test_b_30_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist77_fracX_uid47_fpArctan2Test_b_30_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist77_fracX_uid47_fpArctan2Test_b_30_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist77_fracX_uid47_fpArctan2Test_b_30_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist77_fracX_uid47_fpArctan2Test_b_30_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist77_fracX_uid47_fpArctan2Test_b_30_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist77_fracX_uid47_fpArctan2Test_b_30_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist77_fracX_uid47_fpArctan2Test_b_30_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist77_fracX_uid47_fpArctan2Test_b_30_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist79_expX_uid46_fpArctan2Test_b_22_outputreg_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist79_expX_uid46_fpArctan2Test_b_22_mem_reset0 : std_logic;
    signal redist79_expX_uid46_fpArctan2Test_b_22_mem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal redist79_expX_uid46_fpArctan2Test_b_22_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist79_expX_uid46_fpArctan2Test_b_22_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist79_expX_uid46_fpArctan2Test_b_22_mem_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal redist79_expX_uid46_fpArctan2Test_b_22_mem_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist79_expX_uid46_fpArctan2Test_b_22_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist79_expX_uid46_fpArctan2Test_b_22_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve of redist79_expX_uid46_fpArctan2Test_b_22_rdcnt_i : signal is true;
    signal redist79_expX_uid46_fpArctan2Test_b_22_rdcnt_eq : std_logic;
    attribute preserve of redist79_expX_uid46_fpArctan2Test_b_22_rdcnt_eq : signal is true;
    signal redist79_expX_uid46_fpArctan2Test_b_22_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist79_expX_uid46_fpArctan2Test_b_22_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist79_expX_uid46_fpArctan2Test_b_22_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist79_expX_uid46_fpArctan2Test_b_22_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist79_expX_uid46_fpArctan2Test_b_22_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist79_expX_uid46_fpArctan2Test_b_22_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist79_expX_uid46_fpArctan2Test_b_22_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist79_expX_uid46_fpArctan2Test_b_22_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist79_expX_uid46_fpArctan2Test_b_22_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist90_frac_yIn_uid24_fpArctan2Test_b_10_mem_reset0 : std_logic;
    signal redist90_frac_yIn_uid24_fpArctan2Test_b_10_mem_ia : STD_LOGIC_VECTOR (22 downto 0);
    signal redist90_frac_yIn_uid24_fpArctan2Test_b_10_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist90_frac_yIn_uid24_fpArctan2Test_b_10_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist90_frac_yIn_uid24_fpArctan2Test_b_10_mem_iq : STD_LOGIC_VECTOR (22 downto 0);
    signal redist90_frac_yIn_uid24_fpArctan2Test_b_10_mem_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist90_frac_yIn_uid24_fpArctan2Test_b_10_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist90_frac_yIn_uid24_fpArctan2Test_b_10_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve of redist90_frac_yIn_uid24_fpArctan2Test_b_10_rdcnt_i : signal is true;
    signal redist90_frac_yIn_uid24_fpArctan2Test_b_10_rdcnt_eq : std_logic;
    attribute preserve of redist90_frac_yIn_uid24_fpArctan2Test_b_10_rdcnt_eq : signal is true;
    signal redist90_frac_yIn_uid24_fpArctan2Test_b_10_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist90_frac_yIn_uid24_fpArctan2Test_b_10_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist90_frac_yIn_uid24_fpArctan2Test_b_10_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist90_frac_yIn_uid24_fpArctan2Test_b_10_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist90_frac_yIn_uid24_fpArctan2Test_b_10_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist90_frac_yIn_uid24_fpArctan2Test_b_10_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist90_frac_yIn_uid24_fpArctan2Test_b_10_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist90_frac_yIn_uid24_fpArctan2Test_b_10_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist93_frac_xIn_uid10_fpArctan2Test_b_14_mem_reset0 : std_logic;
    signal redist93_frac_xIn_uid10_fpArctan2Test_b_14_mem_ia : STD_LOGIC_VECTOR (22 downto 0);
    signal redist93_frac_xIn_uid10_fpArctan2Test_b_14_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist93_frac_xIn_uid10_fpArctan2Test_b_14_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist93_frac_xIn_uid10_fpArctan2Test_b_14_mem_iq : STD_LOGIC_VECTOR (22 downto 0);
    signal redist93_frac_xIn_uid10_fpArctan2Test_b_14_mem_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist93_frac_xIn_uid10_fpArctan2Test_b_14_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist93_frac_xIn_uid10_fpArctan2Test_b_14_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve of redist93_frac_xIn_uid10_fpArctan2Test_b_14_rdcnt_i : signal is true;
    signal redist93_frac_xIn_uid10_fpArctan2Test_b_14_rdcnt_eq : std_logic;
    attribute preserve of redist93_frac_xIn_uid10_fpArctan2Test_b_14_rdcnt_eq : signal is true;
    signal redist93_frac_xIn_uid10_fpArctan2Test_b_14_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist93_frac_xIn_uid10_fpArctan2Test_b_14_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist93_frac_xIn_uid10_fpArctan2Test_b_14_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist93_frac_xIn_uid10_fpArctan2Test_b_14_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist93_frac_xIn_uid10_fpArctan2Test_b_14_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist93_frac_xIn_uid10_fpArctan2Test_b_14_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist93_frac_xIn_uid10_fpArctan2Test_b_14_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist93_frac_xIn_uid10_fpArctan2Test_b_14_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist93_frac_xIn_uid10_fpArctan2Test_b_14_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- redist90_frac_yIn_uid24_fpArctan2Test_b_10_notEnable(LOGICAL,1152)
    redist90_frac_yIn_uid24_fpArctan2Test_b_10_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist90_frac_yIn_uid24_fpArctan2Test_b_10_nor(LOGICAL,1153)
    redist90_frac_yIn_uid24_fpArctan2Test_b_10_nor_q <= not (redist90_frac_yIn_uid24_fpArctan2Test_b_10_notEnable_q or redist90_frac_yIn_uid24_fpArctan2Test_b_10_sticky_ena_q);

    -- redist90_frac_yIn_uid24_fpArctan2Test_b_10_mem_last(CONSTANT,1149)
    redist90_frac_yIn_uid24_fpArctan2Test_b_10_mem_last_q <= "0111";

    -- redist90_frac_yIn_uid24_fpArctan2Test_b_10_cmp(LOGICAL,1150)
    redist90_frac_yIn_uid24_fpArctan2Test_b_10_cmp_q <= "1" WHEN redist90_frac_yIn_uid24_fpArctan2Test_b_10_mem_last_q = redist90_frac_yIn_uid24_fpArctan2Test_b_10_rdcnt_q ELSE "0";

    -- redist90_frac_yIn_uid24_fpArctan2Test_b_10_cmpReg(REG,1151)
    redist90_frac_yIn_uid24_fpArctan2Test_b_10_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist90_frac_yIn_uid24_fpArctan2Test_b_10_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist90_frac_yIn_uid24_fpArctan2Test_b_10_cmpReg_q <= STD_LOGIC_VECTOR(redist90_frac_yIn_uid24_fpArctan2Test_b_10_cmp_q);
        END IF;
    END PROCESS;

    -- redist90_frac_yIn_uid24_fpArctan2Test_b_10_sticky_ena(REG,1154)
    redist90_frac_yIn_uid24_fpArctan2Test_b_10_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist90_frac_yIn_uid24_fpArctan2Test_b_10_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist90_frac_yIn_uid24_fpArctan2Test_b_10_nor_q = "1") THEN
                redist90_frac_yIn_uid24_fpArctan2Test_b_10_sticky_ena_q <= STD_LOGIC_VECTOR(redist90_frac_yIn_uid24_fpArctan2Test_b_10_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist90_frac_yIn_uid24_fpArctan2Test_b_10_enaAnd(LOGICAL,1155)
    redist90_frac_yIn_uid24_fpArctan2Test_b_10_enaAnd_q <= redist90_frac_yIn_uid24_fpArctan2Test_b_10_sticky_ena_q and VCC_q;

    -- redist90_frac_yIn_uid24_fpArctan2Test_b_10_rdcnt(COUNTER,1147)
    -- low=0, high=8, step=1, init=0
    redist90_frac_yIn_uid24_fpArctan2Test_b_10_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist90_frac_yIn_uid24_fpArctan2Test_b_10_rdcnt_i <= TO_UNSIGNED(0, 4);
            redist90_frac_yIn_uid24_fpArctan2Test_b_10_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist90_frac_yIn_uid24_fpArctan2Test_b_10_rdcnt_i = TO_UNSIGNED(7, 4)) THEN
                redist90_frac_yIn_uid24_fpArctan2Test_b_10_rdcnt_eq <= '1';
            ELSE
                redist90_frac_yIn_uid24_fpArctan2Test_b_10_rdcnt_eq <= '0';
            END IF;
            IF (redist90_frac_yIn_uid24_fpArctan2Test_b_10_rdcnt_eq = '1') THEN
                redist90_frac_yIn_uid24_fpArctan2Test_b_10_rdcnt_i <= redist90_frac_yIn_uid24_fpArctan2Test_b_10_rdcnt_i + 8;
            ELSE
                redist90_frac_yIn_uid24_fpArctan2Test_b_10_rdcnt_i <= redist90_frac_yIn_uid24_fpArctan2Test_b_10_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist90_frac_yIn_uid24_fpArctan2Test_b_10_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist90_frac_yIn_uid24_fpArctan2Test_b_10_rdcnt_i, 4)));

    -- frac_yIn_uid24_fpArctan2Test(BITSELECT,23)@0
    frac_yIn_uid24_fpArctan2Test_b <= a(22 downto 0);

    -- redist90_frac_yIn_uid24_fpArctan2Test_b_10_wraddr(REG,1148)
    redist90_frac_yIn_uid24_fpArctan2Test_b_10_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist90_frac_yIn_uid24_fpArctan2Test_b_10_wraddr_q <= "1000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist90_frac_yIn_uid24_fpArctan2Test_b_10_wraddr_q <= STD_LOGIC_VECTOR(redist90_frac_yIn_uid24_fpArctan2Test_b_10_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist90_frac_yIn_uid24_fpArctan2Test_b_10_mem(DUALMEM,1146)
    redist90_frac_yIn_uid24_fpArctan2Test_b_10_mem_ia <= STD_LOGIC_VECTOR(frac_yIn_uid24_fpArctan2Test_b);
    redist90_frac_yIn_uid24_fpArctan2Test_b_10_mem_aa <= redist90_frac_yIn_uid24_fpArctan2Test_b_10_wraddr_q;
    redist90_frac_yIn_uid24_fpArctan2Test_b_10_mem_ab <= redist90_frac_yIn_uid24_fpArctan2Test_b_10_rdcnt_q;
    redist90_frac_yIn_uid24_fpArctan2Test_b_10_mem_reset0 <= areset;
    redist90_frac_yIn_uid24_fpArctan2Test_b_10_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 4,
        numwords_a => 9,
        width_b => 23,
        widthad_b => 4,
        numwords_b => 9,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken1 => redist90_frac_yIn_uid24_fpArctan2Test_b_10_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist90_frac_yIn_uid24_fpArctan2Test_b_10_mem_reset0,
        clock1 => clk,
        address_a => redist90_frac_yIn_uid24_fpArctan2Test_b_10_mem_aa,
        data_a => redist90_frac_yIn_uid24_fpArctan2Test_b_10_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist90_frac_yIn_uid24_fpArctan2Test_b_10_mem_ab,
        q_b => redist90_frac_yIn_uid24_fpArctan2Test_b_10_mem_iq
    );
    redist90_frac_yIn_uid24_fpArctan2Test_b_10_mem_q <= redist90_frac_yIn_uid24_fpArctan2Test_b_10_mem_iq(22 downto 0);

    -- cstZeroWF_uid7_fpArctan2Test(CONSTANT,6)
    cstZeroWF_uid7_fpArctan2Test_q <= "00000000000000000000000";

    -- fracXIsZero_uid27_fpArctan2Test(LOGICAL,26)@10 + 1
    fracXIsZero_uid27_fpArctan2Test_qi <= "1" WHEN cstZeroWF_uid7_fpArctan2Test_q = redist90_frac_yIn_uid24_fpArctan2Test_b_10_mem_q ELSE "0";
    fracXIsZero_uid27_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid27_fpArctan2Test_qi, xout => fracXIsZero_uid27_fpArctan2Test_q, clk => clk, aclr => areset );

    -- redist88_fracXIsZero_uid27_fpArctan2Test_q_6(DELAY,1092)
    redist88_fracXIsZero_uid27_fpArctan2Test_q_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid27_fpArctan2Test_q, xout => redist88_fracXIsZero_uid27_fpArctan2Test_q_6_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid28_fpArctan2Test(LOGICAL,27)@16
    fracXIsNotZero_uid28_fpArctan2Test_q <= not (redist88_fracXIsZero_uid27_fpArctan2Test_q_6_q);

    -- cstAllOWE_uid6_fpArctan2Test(CONSTANT,5)
    cstAllOWE_uid6_fpArctan2Test_q <= "11111111";

    -- exp_yIn_uid23_fpArctan2Test(BITSELECT,22)@0
    exp_yIn_uid23_fpArctan2Test_b <= a(30 downto 23);

    -- expXIsMax_uid26_fpArctan2Test(LOGICAL,25)@0 + 1
    expXIsMax_uid26_fpArctan2Test_qi <= "1" WHEN exp_yIn_uid23_fpArctan2Test_b = cstAllOWE_uid6_fpArctan2Test_q ELSE "0";
    expXIsMax_uid26_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid26_fpArctan2Test_qi, xout => expXIsMax_uid26_fpArctan2Test_q, clk => clk, aclr => areset );

    -- redist89_expXIsMax_uid26_fpArctan2Test_q_16(DELAY,1093)
    redist89_expXIsMax_uid26_fpArctan2Test_q_16 : dspba_delay
    GENERIC MAP ( width => 1, depth => 15, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid26_fpArctan2Test_q, xout => redist89_expXIsMax_uid26_fpArctan2Test_q_16_q, clk => clk, aclr => areset );

    -- excN_yIn_uid30_fpArctan2Test(LOGICAL,29)@16
    excN_yIn_uid30_fpArctan2Test_q <= redist89_expXIsMax_uid26_fpArctan2Test_q_16_q and fracXIsNotZero_uid28_fpArctan2Test_q;

    -- redist93_frac_xIn_uid10_fpArctan2Test_b_14_notEnable(LOGICAL,1162)
    redist93_frac_xIn_uid10_fpArctan2Test_b_14_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist93_frac_xIn_uid10_fpArctan2Test_b_14_nor(LOGICAL,1163)
    redist93_frac_xIn_uid10_fpArctan2Test_b_14_nor_q <= not (redist93_frac_xIn_uid10_fpArctan2Test_b_14_notEnable_q or redist93_frac_xIn_uid10_fpArctan2Test_b_14_sticky_ena_q);

    -- redist93_frac_xIn_uid10_fpArctan2Test_b_14_mem_last(CONSTANT,1159)
    redist93_frac_xIn_uid10_fpArctan2Test_b_14_mem_last_q <= "01011";

    -- redist93_frac_xIn_uid10_fpArctan2Test_b_14_cmp(LOGICAL,1160)
    redist93_frac_xIn_uid10_fpArctan2Test_b_14_cmp_b <= STD_LOGIC_VECTOR("0" & redist93_frac_xIn_uid10_fpArctan2Test_b_14_rdcnt_q);
    redist93_frac_xIn_uid10_fpArctan2Test_b_14_cmp_q <= "1" WHEN redist93_frac_xIn_uid10_fpArctan2Test_b_14_mem_last_q = redist93_frac_xIn_uid10_fpArctan2Test_b_14_cmp_b ELSE "0";

    -- redist93_frac_xIn_uid10_fpArctan2Test_b_14_cmpReg(REG,1161)
    redist93_frac_xIn_uid10_fpArctan2Test_b_14_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist93_frac_xIn_uid10_fpArctan2Test_b_14_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist93_frac_xIn_uid10_fpArctan2Test_b_14_cmpReg_q <= STD_LOGIC_VECTOR(redist93_frac_xIn_uid10_fpArctan2Test_b_14_cmp_q);
        END IF;
    END PROCESS;

    -- redist93_frac_xIn_uid10_fpArctan2Test_b_14_sticky_ena(REG,1164)
    redist93_frac_xIn_uid10_fpArctan2Test_b_14_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist93_frac_xIn_uid10_fpArctan2Test_b_14_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist93_frac_xIn_uid10_fpArctan2Test_b_14_nor_q = "1") THEN
                redist93_frac_xIn_uid10_fpArctan2Test_b_14_sticky_ena_q <= STD_LOGIC_VECTOR(redist93_frac_xIn_uid10_fpArctan2Test_b_14_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist93_frac_xIn_uid10_fpArctan2Test_b_14_enaAnd(LOGICAL,1165)
    redist93_frac_xIn_uid10_fpArctan2Test_b_14_enaAnd_q <= redist93_frac_xIn_uid10_fpArctan2Test_b_14_sticky_ena_q and VCC_q;

    -- redist93_frac_xIn_uid10_fpArctan2Test_b_14_rdcnt(COUNTER,1157)
    -- low=0, high=12, step=1, init=0
    redist93_frac_xIn_uid10_fpArctan2Test_b_14_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist93_frac_xIn_uid10_fpArctan2Test_b_14_rdcnt_i <= TO_UNSIGNED(0, 4);
            redist93_frac_xIn_uid10_fpArctan2Test_b_14_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist93_frac_xIn_uid10_fpArctan2Test_b_14_rdcnt_i = TO_UNSIGNED(11, 4)) THEN
                redist93_frac_xIn_uid10_fpArctan2Test_b_14_rdcnt_eq <= '1';
            ELSE
                redist93_frac_xIn_uid10_fpArctan2Test_b_14_rdcnt_eq <= '0';
            END IF;
            IF (redist93_frac_xIn_uid10_fpArctan2Test_b_14_rdcnt_eq = '1') THEN
                redist93_frac_xIn_uid10_fpArctan2Test_b_14_rdcnt_i <= redist93_frac_xIn_uid10_fpArctan2Test_b_14_rdcnt_i + 4;
            ELSE
                redist93_frac_xIn_uid10_fpArctan2Test_b_14_rdcnt_i <= redist93_frac_xIn_uid10_fpArctan2Test_b_14_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist93_frac_xIn_uid10_fpArctan2Test_b_14_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist93_frac_xIn_uid10_fpArctan2Test_b_14_rdcnt_i, 4)));

    -- frac_xIn_uid10_fpArctan2Test(BITSELECT,9)@0
    frac_xIn_uid10_fpArctan2Test_b <= b(22 downto 0);

    -- redist93_frac_xIn_uid10_fpArctan2Test_b_14_wraddr(REG,1158)
    redist93_frac_xIn_uid10_fpArctan2Test_b_14_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist93_frac_xIn_uid10_fpArctan2Test_b_14_wraddr_q <= "1100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist93_frac_xIn_uid10_fpArctan2Test_b_14_wraddr_q <= STD_LOGIC_VECTOR(redist93_frac_xIn_uid10_fpArctan2Test_b_14_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist93_frac_xIn_uid10_fpArctan2Test_b_14_mem(DUALMEM,1156)
    redist93_frac_xIn_uid10_fpArctan2Test_b_14_mem_ia <= STD_LOGIC_VECTOR(frac_xIn_uid10_fpArctan2Test_b);
    redist93_frac_xIn_uid10_fpArctan2Test_b_14_mem_aa <= redist93_frac_xIn_uid10_fpArctan2Test_b_14_wraddr_q;
    redist93_frac_xIn_uid10_fpArctan2Test_b_14_mem_ab <= redist93_frac_xIn_uid10_fpArctan2Test_b_14_rdcnt_q;
    redist93_frac_xIn_uid10_fpArctan2Test_b_14_mem_reset0 <= areset;
    redist93_frac_xIn_uid10_fpArctan2Test_b_14_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 4,
        numwords_a => 13,
        width_b => 23,
        widthad_b => 4,
        numwords_b => 13,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken1 => redist93_frac_xIn_uid10_fpArctan2Test_b_14_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist93_frac_xIn_uid10_fpArctan2Test_b_14_mem_reset0,
        clock1 => clk,
        address_a => redist93_frac_xIn_uid10_fpArctan2Test_b_14_mem_aa,
        data_a => redist93_frac_xIn_uid10_fpArctan2Test_b_14_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist93_frac_xIn_uid10_fpArctan2Test_b_14_mem_ab,
        q_b => redist93_frac_xIn_uid10_fpArctan2Test_b_14_mem_iq
    );
    redist93_frac_xIn_uid10_fpArctan2Test_b_14_mem_q <= redist93_frac_xIn_uid10_fpArctan2Test_b_14_mem_iq(22 downto 0);

    -- fracXIsZero_uid13_fpArctan2Test(LOGICAL,12)@14 + 1
    fracXIsZero_uid13_fpArctan2Test_qi <= "1" WHEN cstZeroWF_uid7_fpArctan2Test_q = redist93_frac_xIn_uid10_fpArctan2Test_b_14_mem_q ELSE "0";
    fracXIsZero_uid13_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid13_fpArctan2Test_qi, xout => fracXIsZero_uid13_fpArctan2Test_q, clk => clk, aclr => areset );

    -- redist91_fracXIsZero_uid13_fpArctan2Test_q_2(DELAY,1095)
    redist91_fracXIsZero_uid13_fpArctan2Test_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid13_fpArctan2Test_q, xout => redist91_fracXIsZero_uid13_fpArctan2Test_q_2_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid14_fpArctan2Test(LOGICAL,13)@16
    fracXIsNotZero_uid14_fpArctan2Test_q <= not (redist91_fracXIsZero_uid13_fpArctan2Test_q_2_q);

    -- exp_xIn_uid9_fpArctan2Test(BITSELECT,8)@0
    exp_xIn_uid9_fpArctan2Test_b <= b(30 downto 23);

    -- expXIsMax_uid12_fpArctan2Test(LOGICAL,11)@0 + 1
    expXIsMax_uid12_fpArctan2Test_qi <= "1" WHEN exp_xIn_uid9_fpArctan2Test_b = cstAllOWE_uid6_fpArctan2Test_q ELSE "0";
    expXIsMax_uid12_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid12_fpArctan2Test_qi, xout => expXIsMax_uid12_fpArctan2Test_q, clk => clk, aclr => areset );

    -- redist92_expXIsMax_uid12_fpArctan2Test_q_16(DELAY,1096)
    redist92_expXIsMax_uid12_fpArctan2Test_q_16 : dspba_delay
    GENERIC MAP ( width => 1, depth => 15, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid12_fpArctan2Test_q, xout => redist92_expXIsMax_uid12_fpArctan2Test_q_16_q, clk => clk, aclr => areset );

    -- excN_xIn_uid16_fpArctan2Test(LOGICAL,15)@16
    excN_xIn_uid16_fpArctan2Test_q <= redist92_expXIsMax_uid12_fpArctan2Test_q_16_q and fracXIsNotZero_uid14_fpArctan2Test_q;

    -- excRNaN_uid183_fpArctan2Test(LOGICAL,182)@16 + 1
    excRNaN_uid183_fpArctan2Test_qi <= excN_xIn_uid16_fpArctan2Test_q or excN_yIn_uid30_fpArctan2Test_q;
    excRNaN_uid183_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaN_uid183_fpArctan2Test_qi, xout => excRNaN_uid183_fpArctan2Test_q, clk => clk, aclr => areset );

    -- redist55_excRNaN_uid183_fpArctan2Test_q_35(DELAY,1059)
    redist55_excRNaN_uid183_fpArctan2Test_q_35 : dspba_delay
    GENERIC MAP ( width => 1, depth => 34, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaN_uid183_fpArctan2Test_q, xout => redist55_excRNaN_uid183_fpArctan2Test_q_35_q, clk => clk, aclr => areset );

    -- invExcRNaN_uid189_fpArctan2Test(LOGICAL,188)@51
    invExcRNaN_uid189_fpArctan2Test_q <= not (redist55_excRNaN_uid183_fpArctan2Test_q_35_q);

    -- yInSign_uid34_fpArctan2Test(BITSELECT,33)@0
    yInSign_uid34_fpArctan2Test_b <= STD_LOGIC_VECTOR(a(31 downto 31));

    -- redist85_yInSign_uid34_fpArctan2Test_b_17(DELAY,1089)
    redist85_yInSign_uid34_fpArctan2Test_b_17 : dspba_delay
    GENERIC MAP ( width => 1, depth => 17, reset_kind => "ASYNC" )
    PORT MAP ( xin => yInSign_uid34_fpArctan2Test_b, xout => redist85_yInSign_uid34_fpArctan2Test_b_17_q, clk => clk, aclr => areset );

    -- redist86_yInSign_uid34_fpArctan2Test_b_25(DELAY,1090)
    redist86_yInSign_uid34_fpArctan2Test_b_25 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist85_yInSign_uid34_fpArctan2Test_b_17_q, xout => redist86_yInSign_uid34_fpArctan2Test_b_25_q, clk => clk, aclr => areset );

    -- redist87_yInSign_uid34_fpArctan2Test_b_51(DELAY,1091)
    redist87_yInSign_uid34_fpArctan2Test_b_51 : dspba_delay
    GENERIC MAP ( width => 1, depth => 26, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist86_yInSign_uid34_fpArctan2Test_b_25_q, xout => redist87_yInSign_uid34_fpArctan2Test_b_51_q, clk => clk, aclr => areset );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- signR_uid190_fpArctan2Test(LOGICAL,189)@51
    signR_uid190_fpArctan2Test_q <= redist87_yInSign_uid34_fpArctan2Test_b_51_q and invExcRNaN_uid189_fpArctan2Test_q;

    -- cstBiasP1_uid56_fpArctan2Test(CONSTANT,55)
    cstBiasP1_uid56_fpArctan2Test_q <= "10000000";

    -- cstBias_uid53_fpArctan2Test(CONSTANT,52)
    cstBias_uid53_fpArctan2Test_q <= "01111111";

    -- aboveLeftY_bottomExtension_uid424_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(CONSTANT,423)
    aboveLeftY_bottomExtension_uid424_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q <= "000";

    -- rightShiftStage1Idx3Rng3_uid956_fxpAlignedRes_uid163_fpArctan2Test(BITSELECT,955)@49
    rightShiftStage1Idx3Rng3_uid956_fxpAlignedRes_uid163_fpArctan2Test_b <= rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_mfinal_q(47 downto 3);

    -- rightShiftStage1Idx3_uid958_fxpAlignedRes_uid163_fpArctan2Test(BITJOIN,957)@49
    rightShiftStage1Idx3_uid958_fxpAlignedRes_uid163_fpArctan2Test_q <= aboveLeftY_bottomExtension_uid424_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q & rightShiftStage1Idx3Rng3_uid956_fxpAlignedRes_uid163_fpArctan2Test_b;

    -- padACst_uid167_fpArctan2Test(CONSTANT,166)
    padACst_uid167_fpArctan2Test_q <= "00";

    -- rightShiftStage1Idx2Rng2_uid953_fxpAlignedRes_uid163_fpArctan2Test(BITSELECT,952)@49
    rightShiftStage1Idx2Rng2_uid953_fxpAlignedRes_uid163_fpArctan2Test_b <= rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_mfinal_q(47 downto 2);

    -- rightShiftStage1Idx2_uid955_fxpAlignedRes_uid163_fpArctan2Test(BITJOIN,954)@49
    rightShiftStage1Idx2_uid955_fxpAlignedRes_uid163_fpArctan2Test_q <= padACst_uid167_fpArctan2Test_q & rightShiftStage1Idx2Rng2_uid953_fxpAlignedRes_uid163_fpArctan2Test_b;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- rightShiftStage1Idx1Rng1_uid950_fxpAlignedRes_uid163_fpArctan2Test(BITSELECT,949)@49
    rightShiftStage1Idx1Rng1_uid950_fxpAlignedRes_uid163_fpArctan2Test_b <= rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_mfinal_q(47 downto 1);

    -- rightShiftStage1Idx1_uid952_fxpAlignedRes_uid163_fpArctan2Test(BITJOIN,951)@49
    rightShiftStage1Idx1_uid952_fxpAlignedRes_uid163_fpArctan2Test_q <= GND_q & rightShiftStage1Idx1Rng1_uid950_fxpAlignedRes_uid163_fpArctan2Test_b;

    -- rightShiftStage0Idx7Pad28_uid946_fxpAlignedRes_uid163_fpArctan2Test(CONSTANT,945)
    rightShiftStage0Idx7Pad28_uid946_fxpAlignedRes_uid163_fpArctan2Test_q <= "0000000000000000000000000000";

    -- redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_notEnable(LOGICAL,1118)
    redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_nor(LOGICAL,1119)
    redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_nor_q <= not (redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_notEnable_q or redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_sticky_ena_q);

    -- redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_mem_last(CONSTANT,1115)
    redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_mem_last_q <= "011";

    -- redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_cmp(LOGICAL,1116)
    redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_cmp_q <= "1" WHEN redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_mem_last_q = redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_rdcnt_q ELSE "0";

    -- redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_cmpReg(REG,1117)
    redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_cmpReg_q <= STD_LOGIC_VECTOR(redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_cmp_q);
        END IF;
    END PROCESS;

    -- redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_sticky_ena(REG,1120)
    redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_nor_q = "1") THEN
                redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_sticky_ena_q <= STD_LOGIC_VECTOR(redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_enaAnd(LOGICAL,1121)
    redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_enaAnd_q <= redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_sticky_ena_q and VCC_q;

    -- redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_rdcnt(COUNTER,1113)
    -- low=0, high=4, step=1, init=0
    redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_rdcnt_i <= TO_UNSIGNED(0, 3);
            redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_rdcnt_i = TO_UNSIGNED(3, 3)) THEN
                redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_rdcnt_eq <= '1';
            ELSE
                redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_rdcnt_eq <= '0';
            END IF;
            IF (redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_rdcnt_eq = '1') THEN
                redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_rdcnt_i <= redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_rdcnt_i + 4;
            ELSE
                redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_rdcnt_i <= redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_rdcnt_i, 3)));

    -- excI_xIn_uid15_fpArctan2Test(LOGICAL,14)@16
    excI_xIn_uid15_fpArctan2Test_q <= redist92_expXIsMax_uid12_fpArctan2Test_q_16_q and redist91_fracXIsZero_uid13_fpArctan2Test_q_2_q;

    -- excI_yIn_uid29_fpArctan2Test(LOGICAL,28)@16
    excI_yIn_uid29_fpArctan2Test_q <= redist89_expXIsMax_uid26_fpArctan2Test_q_16_q and redist88_fracXIsZero_uid27_fpArctan2Test_q_6_q;

    -- excXIYI_uid283_div_uid45_fpArctan2Test(LOGICAL,282)@16
    excXIYI_uid283_div_uid45_fpArctan2Test_q <= excI_yIn_uid29_fpArctan2Test_q and excI_xIn_uid15_fpArctan2Test_q;

    -- excZ_y_uid224_div_uid45_fpArctan2Test(LOGICAL,223)@0 + 1
    excZ_y_uid224_div_uid45_fpArctan2Test_qi <= "1" WHEN exp_xIn_uid9_fpArctan2Test_b = cstAllZWE_uid52_fpArctan2Test_q ELSE "0";
    excZ_y_uid224_div_uid45_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_y_uid224_div_uid45_fpArctan2Test_qi, xout => excZ_y_uid224_div_uid45_fpArctan2Test_q, clk => clk, aclr => areset );

    -- redist52_excZ_y_uid224_div_uid45_fpArctan2Test_q_16(DELAY,1056)
    redist52_excZ_y_uid224_div_uid45_fpArctan2Test_q_16 : dspba_delay
    GENERIC MAP ( width => 1, depth => 15, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_y_uid224_div_uid45_fpArctan2Test_q, xout => redist52_excZ_y_uid224_div_uid45_fpArctan2Test_q_16_q, clk => clk, aclr => areset );

    -- excZ_x_uid210_div_uid45_fpArctan2Test(LOGICAL,209)@0 + 1
    excZ_x_uid210_div_uid45_fpArctan2Test_qi <= "1" WHEN exp_yIn_uid23_fpArctan2Test_b = cstAllZWE_uid52_fpArctan2Test_q ELSE "0";
    excZ_x_uid210_div_uid45_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid210_div_uid45_fpArctan2Test_qi, xout => excZ_x_uid210_div_uid45_fpArctan2Test_q, clk => clk, aclr => areset );

    -- redist53_excZ_x_uid210_div_uid45_fpArctan2Test_q_16(DELAY,1057)
    redist53_excZ_x_uid210_div_uid45_fpArctan2Test_q_16 : dspba_delay
    GENERIC MAP ( width => 1, depth => 15, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid210_div_uid45_fpArctan2Test_q, xout => redist53_excZ_x_uid210_div_uid45_fpArctan2Test_q_16_q, clk => clk, aclr => areset );

    -- excXZYZ_uid282_div_uid45_fpArctan2Test(LOGICAL,281)@16
    excXZYZ_uid282_div_uid45_fpArctan2Test_q <= redist53_excZ_x_uid210_div_uid45_fpArctan2Test_q_16_q and redist52_excZ_y_uid224_div_uid45_fpArctan2Test_q_16_q;

    -- excRNaN_uid284_div_uid45_fpArctan2Test(LOGICAL,283)@16 + 1
    excRNaN_uid284_div_uid45_fpArctan2Test_qi <= excXZYZ_uid282_div_uid45_fpArctan2Test_q or excN_yIn_uid30_fpArctan2Test_q or excN_xIn_uid16_fpArctan2Test_q or excXIYI_uid283_div_uid45_fpArctan2Test_q;
    excRNaN_uid284_div_uid45_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaN_uid284_div_uid45_fpArctan2Test_qi, xout => excRNaN_uid284_div_uid45_fpArctan2Test_q, clk => clk, aclr => areset );

    -- invExcRNaN_uid295_div_uid45_fpArctan2Test(LOGICAL,294)@17
    invExcRNaN_uid295_div_uid45_fpArctan2Test_q <= not (excRNaN_uid284_div_uid45_fpArctan2Test_q);

    -- xInSign_uid35_fpArctan2Test(BITSELECT,34)@0
    xInSign_uid35_fpArctan2Test_b <= STD_LOGIC_VECTOR(b(31 downto 31));

    -- redist83_xInSign_uid35_fpArctan2Test_b_17(DELAY,1087)
    redist83_xInSign_uid35_fpArctan2Test_b_17 : dspba_delay
    GENERIC MAP ( width => 1, depth => 17, reset_kind => "ASYNC" )
    PORT MAP ( xin => xInSign_uid35_fpArctan2Test_b, xout => redist83_xInSign_uid35_fpArctan2Test_b_17_q, clk => clk, aclr => areset );

    -- signR_uid233_div_uid45_fpArctan2Test(LOGICAL,232)@17
    signR_uid233_div_uid45_fpArctan2Test_q <= redist85_yInSign_uid34_fpArctan2Test_b_17_q xor redist83_xInSign_uid35_fpArctan2Test_b_17_q;

    -- sRPostExc_uid296_div_uid45_fpArctan2Test(LOGICAL,295)@17
    sRPostExc_uid296_div_uid45_fpArctan2Test_q <= signR_uid233_div_uid45_fpArctan2Test_q and invExcRNaN_uid295_div_uid45_fpArctan2Test_q;

    -- lOAdded_uid245_div_uid45_fpArctan2Test(BITJOIN,244)@10
    lOAdded_uid245_div_uid45_fpArctan2Test_q <= VCC_q & redist90_frac_yIn_uid24_fpArctan2Test_b_10_mem_q;

    -- redist45_lOAdded_uid245_div_uid45_fpArctan2Test_q_2(DELAY,1049)
    redist45_lOAdded_uid245_div_uid45_fpArctan2Test_q_2 : dspba_delay
    GENERIC MAP ( width => 24, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => lOAdded_uid245_div_uid45_fpArctan2Test_q, xout => redist45_lOAdded_uid245_div_uid45_fpArctan2Test_q_2_q, clk => clk, aclr => areset );

    -- redist46_lOAdded_uid245_div_uid45_fpArctan2Test_q_4(DELAY,1050)
    redist46_lOAdded_uid245_div_uid45_fpArctan2Test_q_4 : dspba_delay
    GENERIC MAP ( width => 24, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist45_lOAdded_uid245_div_uid45_fpArctan2Test_q_2_q, xout => redist46_lOAdded_uid245_div_uid45_fpArctan2Test_q_4_q, clk => clk, aclr => areset );

    -- oFracXSE_mergedSignalTM_uid250_div_uid45_fpArctan2Test(BITJOIN,249)@14
    oFracXSE_mergedSignalTM_uid250_div_uid45_fpArctan2Test_q <= redist46_lOAdded_uid245_div_uid45_fpArctan2Test_q_4_q & padACst_uid167_fpArctan2Test_q;

    -- aboveLeftY_uid439_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(BITSELECT,438)@12
    aboveLeftY_uid439_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_in <= redist45_lOAdded_uid245_div_uid45_fpArctan2Test_q_2_q(14 downto 0);
    aboveLeftY_uid439_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b <= aboveLeftY_uid439_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_in(14 downto 10);

    -- n1_uid447_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(BITSELECT,446)@12
    n1_uid447_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b <= aboveLeftY_uid439_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b(4 downto 1);

    -- n1_uid455_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(BITSELECT,454)@12
    n1_uid455_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b <= n1_uid447_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b(3 downto 1);

    -- n1_uid463_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(BITSELECT,462)@12
    n1_uid463_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b <= n1_uid455_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b(2 downto 1);

    -- yAddr_uid238_div_uid45_fpArctan2Test(BITSELECT,237)@0
    yAddr_uid238_div_uid45_fpArctan2Test_b <= frac_xIn_uid10_fpArctan2Test_b(22 downto 14);

    -- memoryC2_uid388_invTables_lutmem(DUALMEM,968)@0 + 2
    -- in j@20000000
    memoryC2_uid388_invTables_lutmem_aa <= yAddr_uid238_div_uid45_fpArctan2Test_b;
    memoryC2_uid388_invTables_lutmem_reset0 <= areset;
    memoryC2_uid388_invTables_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 12,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "CORDIC_0002_memoryC2_uid388_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid388_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid388_invTables_lutmem_aa,
        q_a => memoryC2_uid388_invTables_lutmem_ir
    );
    memoryC2_uid388_invTables_lutmem_r <= memoryC2_uid388_invTables_lutmem_ir(11 downto 0);

    -- topRangeY_bottomExtension_uid641_pT1_uid395_invPolyEval(CONSTANT,640)
    topRangeY_bottomExtension_uid641_pT1_uid395_invPolyEval_q <= "00000";

    -- topRangeY_mergedSignalTM_uid643_pT1_uid395_invPolyEval(BITJOIN,642)@2
    topRangeY_mergedSignalTM_uid643_pT1_uid395_invPolyEval_q <= memoryC2_uid388_invTables_lutmem_r & topRangeY_bottomExtension_uid641_pT1_uid395_invPolyEval_q;

    -- yPE_uid239_div_uid45_fpArctan2Test(BITSELECT,238)@0
    yPE_uid239_div_uid45_fpArctan2Test_b <= b(13 downto 0);

    -- redist47_yPE_uid239_div_uid45_fpArctan2Test_b_2(DELAY,1051)
    redist47_yPE_uid239_div_uid45_fpArctan2Test_b_2 : dspba_delay
    GENERIC MAP ( width => 14, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yPE_uid239_div_uid45_fpArctan2Test_b, xout => redist47_yPE_uid239_div_uid45_fpArctan2Test_b_2_q, clk => clk, aclr => areset );

    -- yT1_uid394_invPolyEval(BITSELECT,393)@2
    yT1_uid394_invPolyEval_b <= redist47_yPE_uid239_div_uid45_fpArctan2Test_b_2_q(13 downto 2);

    -- nx_mergedSignalTM_uid624_pT1_uid395_invPolyEval(BITJOIN,623)@2
    nx_mergedSignalTM_uid624_pT1_uid395_invPolyEval_q <= GND_q & yT1_uid394_invPolyEval_b;

    -- topRangeY_bottomExtension_uid535_pT1_uid366_invPolyEval(CONSTANT,534)
    topRangeY_bottomExtension_uid535_pT1_uid366_invPolyEval_q <= "0000";

    -- topRangeX_mergedSignalTM_uid639_pT1_uid395_invPolyEval(BITJOIN,638)@2
    topRangeX_mergedSignalTM_uid639_pT1_uid395_invPolyEval_q <= nx_mergedSignalTM_uid624_pT1_uid395_invPolyEval_q & topRangeY_bottomExtension_uid535_pT1_uid366_invPolyEval_q;

    -- sm0_uid645_pT1_uid395_invPolyEval(MULT,644)@2 + 2
    sm0_uid645_pT1_uid395_invPolyEval_a0 <= STD_LOGIC_VECTOR(topRangeX_mergedSignalTM_uid639_pT1_uid395_invPolyEval_q);
    sm0_uid645_pT1_uid395_invPolyEval_b0 <= STD_LOGIC_VECTOR(topRangeY_mergedSignalTM_uid643_pT1_uid395_invPolyEval_q);
    sm0_uid645_pT1_uid395_invPolyEval_reset <= areset;
    sm0_uid645_pT1_uid395_invPolyEval_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 17,
        lpm_widthb => 17,
        lpm_widthp => 34,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm0_uid645_pT1_uid395_invPolyEval_a0,
        datab => sm0_uid645_pT1_uid395_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid645_pT1_uid395_invPolyEval_reset,
        clock => clk,
        result => sm0_uid645_pT1_uid395_invPolyEval_s1
    );
    sm0_uid645_pT1_uid395_invPolyEval_q <= sm0_uid645_pT1_uid395_invPolyEval_s1;

    -- osig_uid646_pT1_uid395_invPolyEval(BITSELECT,645)@4
    osig_uid646_pT1_uid395_invPolyEval_in <= STD_LOGIC_VECTOR(sm0_uid645_pT1_uid395_invPolyEval_q(32 downto 0));
    osig_uid646_pT1_uid395_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid646_pT1_uid395_invPolyEval_in(32 downto 19));

    -- redist49_yAddr_uid238_div_uid45_fpArctan2Test_b_2(DELAY,1053)
    redist49_yAddr_uid238_div_uid45_fpArctan2Test_b_2 : dspba_delay
    GENERIC MAP ( width => 9, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid238_div_uid45_fpArctan2Test_b, xout => redist49_yAddr_uid238_div_uid45_fpArctan2Test_b_2_q, clk => clk, aclr => areset );

    -- memoryC1_uid385_invTables_lutmem(DUALMEM,967)@2 + 2
    -- in j@20000000
    memoryC1_uid385_invTables_lutmem_aa <= redist49_yAddr_uid238_div_uid45_fpArctan2Test_b_2_q;
    memoryC1_uid385_invTables_lutmem_reset0 <= areset;
    memoryC1_uid385_invTables_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 3,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "CORDIC_0002_memoryC1_uid385_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid385_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid385_invTables_lutmem_aa,
        q_a => memoryC1_uid385_invTables_lutmem_ir
    );
    memoryC1_uid385_invTables_lutmem_r <= memoryC1_uid385_invTables_lutmem_ir(2 downto 0);

    -- memoryC1_uid384_invTables_lutmem(DUALMEM,966)@2 + 2
    -- in j@20000000
    memoryC1_uid384_invTables_lutmem_aa <= redist49_yAddr_uid238_div_uid45_fpArctan2Test_b_2_q;
    memoryC1_uid384_invTables_lutmem_reset0 <= areset;
    memoryC1_uid384_invTables_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 18,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "CORDIC_0002_memoryC1_uid384_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid384_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid384_invTables_lutmem_aa,
        q_a => memoryC1_uid384_invTables_lutmem_ir
    );
    memoryC1_uid384_invTables_lutmem_r <= memoryC1_uid384_invTables_lutmem_ir(17 downto 0);

    -- os_uid386_invTables(BITJOIN,385)@4
    os_uid386_invTables_q <= memoryC1_uid385_invTables_lutmem_r & memoryC1_uid384_invTables_lutmem_r;

    -- rndBit_uid367_invPolyEval(CONSTANT,366)
    rndBit_uid367_invPolyEval_q <= "01";

    -- cIncludingRoundingBit_uid397_invPolyEval(BITJOIN,396)@4
    cIncludingRoundingBit_uid397_invPolyEval_q <= os_uid386_invTables_q & rndBit_uid367_invPolyEval_q;

    -- ts1_uid399_invPolyEval(ADD,398)@4
    ts1_uid399_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 23 => cIncludingRoundingBit_uid397_invPolyEval_q(22)) & cIncludingRoundingBit_uid397_invPolyEval_q));
    ts1_uid399_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 14 => osig_uid646_pT1_uid395_invPolyEval_b(13)) & osig_uid646_pT1_uid395_invPolyEval_b));
    ts1_uid399_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts1_uid399_invPolyEval_a) + SIGNED(ts1_uid399_invPolyEval_b));
    ts1_uid399_invPolyEval_q <= ts1_uid399_invPolyEval_o(23 downto 0);

    -- s1_uid400_invPolyEval(BITSELECT,399)@4
    s1_uid400_invPolyEval_b <= STD_LOGIC_VECTOR(ts1_uid399_invPolyEval_q(23 downto 1));

    -- redist38_s1_uid400_invPolyEval_b_1(DELAY,1042)
    redist38_s1_uid400_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => s1_uid400_invPolyEval_b, xout => redist38_s1_uid400_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- rightBottomY_uid682_pT2_uid402_invPolyEval(BITSELECT,681)@5
    rightBottomY_uid682_pT2_uid402_invPolyEval_in <= redist38_s1_uid400_invPolyEval_b_1_q(5 downto 0);
    rightBottomY_uid682_pT2_uid402_invPolyEval_b <= rightBottomY_uid682_pT2_uid402_invPolyEval_in(5 downto 1);

    -- n1_uid691_pT2_uid402_invPolyEval(BITSELECT,690)@5
    n1_uid691_pT2_uid402_invPolyEval_b <= rightBottomY_uid682_pT2_uid402_invPolyEval_b(4 downto 1);

    -- n1_uid699_pT2_uid402_invPolyEval(BITSELECT,698)@5
    n1_uid699_pT2_uid402_invPolyEval_b <= n1_uid691_pT2_uid402_invPolyEval_b(3 downto 1);

    -- redist29_n1_uid699_pT2_uid402_invPolyEval_b_1(DELAY,1033)
    redist29_n1_uid699_pT2_uid402_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => n1_uid699_pT2_uid402_invPolyEval_b, xout => redist29_n1_uid699_pT2_uid402_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- redist48_yPE_uid239_div_uid45_fpArctan2Test_b_5(DELAY,1052)
    redist48_yPE_uid239_div_uid45_fpArctan2Test_b_5 : dspba_delay
    GENERIC MAP ( width => 14, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist47_yPE_uid239_div_uid45_fpArctan2Test_b_2_q, xout => redist48_yPE_uid239_div_uid45_fpArctan2Test_b_5_q, clk => clk, aclr => areset );

    -- nx_mergedSignalTM_uid650_pT2_uid402_invPolyEval(BITJOIN,649)@5
    nx_mergedSignalTM_uid650_pT2_uid402_invPolyEval_q <= GND_q & redist48_yPE_uid239_div_uid45_fpArctan2Test_b_5_q;

    -- rightBottomX_uid681_pT2_uid402_invPolyEval(BITSELECT,680)@5
    rightBottomX_uid681_pT2_uid402_invPolyEval_in <= nx_mergedSignalTM_uid650_pT2_uid402_invPolyEval_q(6 downto 0);
    rightBottomX_uid681_pT2_uid402_invPolyEval_b <= rightBottomX_uid681_pT2_uid402_invPolyEval_in(6 downto 2);

    -- n0_uid692_pT2_uid402_invPolyEval(BITSELECT,691)@5
    n0_uid692_pT2_uid402_invPolyEval_b <= rightBottomX_uid681_pT2_uid402_invPolyEval_b(4 downto 1);

    -- n0_uid700_pT2_uid402_invPolyEval(BITSELECT,699)@5
    n0_uid700_pT2_uid402_invPolyEval_b <= n0_uid692_pT2_uid402_invPolyEval_b(3 downto 1);

    -- redist28_n0_uid700_pT2_uid402_invPolyEval_b_1(DELAY,1032)
    redist28_n0_uid700_pT2_uid402_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => n0_uid700_pT2_uid402_invPolyEval_b, xout => redist28_n0_uid700_pT2_uid402_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- sm0_uid715_pT2_uid402_invPolyEval(MULT,714)@6 + 2
    sm0_uid715_pT2_uid402_invPolyEval_a0 <= redist28_n0_uid700_pT2_uid402_invPolyEval_b_1_q;
    sm0_uid715_pT2_uid402_invPolyEval_b0 <= redist29_n1_uid699_pT2_uid402_invPolyEval_b_1_q;
    sm0_uid715_pT2_uid402_invPolyEval_reset <= areset;
    sm0_uid715_pT2_uid402_invPolyEval_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 3,
        lpm_widthb => 3,
        lpm_widthp => 6,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=NO, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm0_uid715_pT2_uid402_invPolyEval_a0,
        datab => sm0_uid715_pT2_uid402_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid715_pT2_uid402_invPolyEval_reset,
        clock => clk,
        result => sm0_uid715_pT2_uid402_invPolyEval_s1
    );
    sm0_uid715_pT2_uid402_invPolyEval_q <= sm0_uid715_pT2_uid402_invPolyEval_s1;

    -- aboveLeftY_bottomRange_uid672_pT2_uid402_invPolyEval(BITSELECT,671)@5
    aboveLeftY_bottomRange_uid672_pT2_uid402_invPolyEval_in <= STD_LOGIC_VECTOR(redist38_s1_uid400_invPolyEval_b_1_q(5 downto 0));
    aboveLeftY_bottomRange_uid672_pT2_uid402_invPolyEval_b <= STD_LOGIC_VECTOR(aboveLeftY_bottomRange_uid672_pT2_uid402_invPolyEval_in(5 downto 0));

    -- aboveLeftY_mergedSignalTM_uid673_pT2_uid402_invPolyEval(BITJOIN,672)@5
    aboveLeftY_mergedSignalTM_uid673_pT2_uid402_invPolyEval_q <= aboveLeftY_bottomRange_uid672_pT2_uid402_invPolyEval_b & padACst_uid167_fpArctan2Test_q;

    -- aboveLeftX_uid670_pT2_uid402_invPolyEval(BITSELECT,669)@5
    aboveLeftX_uid670_pT2_uid402_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid650_pT2_uid402_invPolyEval_q(14 downto 7));

    -- sm0_uid714_pT2_uid402_invPolyEval(MULT,713)@5 + 2
    sm0_uid714_pT2_uid402_invPolyEval_a0 <= STD_LOGIC_VECTOR(aboveLeftX_uid670_pT2_uid402_invPolyEval_b);
    sm0_uid714_pT2_uid402_invPolyEval_b0 <= '0' & aboveLeftY_mergedSignalTM_uid673_pT2_uid402_invPolyEval_q;
    sm0_uid714_pT2_uid402_invPolyEval_reset <= areset;
    sm0_uid714_pT2_uid402_invPolyEval_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 9,
        lpm_widthp => 17,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm0_uid714_pT2_uid402_invPolyEval_a0,
        datab => sm0_uid714_pT2_uid402_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid714_pT2_uid402_invPolyEval_reset,
        clock => clk,
        result => sm0_uid714_pT2_uid402_invPolyEval_s1
    );
    sm0_uid714_pT2_uid402_invPolyEval_q <= sm0_uid714_pT2_uid402_invPolyEval_s1(15 downto 0);

    -- topRangeY_uid664_pT2_uid402_invPolyEval(BITSELECT,663)@5
    topRangeY_uid664_pT2_uid402_invPolyEval_b <= STD_LOGIC_VECTOR(redist38_s1_uid400_invPolyEval_b_1_q(22 downto 6));

    -- topRangeX_mergedSignalTM_uid662_pT2_uid402_invPolyEval(BITJOIN,661)@5
    topRangeX_mergedSignalTM_uid662_pT2_uid402_invPolyEval_q <= nx_mergedSignalTM_uid650_pT2_uid402_invPolyEval_q & padACst_uid167_fpArctan2Test_q;

    -- sm0_uid713_pT2_uid402_invPolyEval(MULT,712)@5 + 2
    sm0_uid713_pT2_uid402_invPolyEval_a0 <= STD_LOGIC_VECTOR(topRangeX_mergedSignalTM_uid662_pT2_uid402_invPolyEval_q);
    sm0_uid713_pT2_uid402_invPolyEval_b0 <= STD_LOGIC_VECTOR(topRangeY_uid664_pT2_uid402_invPolyEval_b);
    sm0_uid713_pT2_uid402_invPolyEval_reset <= areset;
    sm0_uid713_pT2_uid402_invPolyEval_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 17,
        lpm_widthb => 17,
        lpm_widthp => 34,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm0_uid713_pT2_uid402_invPolyEval_a0,
        datab => sm0_uid713_pT2_uid402_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid713_pT2_uid402_invPolyEval_reset,
        clock => clk,
        result => sm0_uid713_pT2_uid402_invPolyEval_s1
    );
    sm0_uid713_pT2_uid402_invPolyEval_q <= sm0_uid713_pT2_uid402_invPolyEval_s1;

    -- highABits_uid717_pT2_uid402_invPolyEval(BITSELECT,716)@7
    highABits_uid717_pT2_uid402_invPolyEval_b <= STD_LOGIC_VECTOR(sm0_uid713_pT2_uid402_invPolyEval_q(33 downto 1));

    -- lev1_a0high_uid718_pT2_uid402_invPolyEval(ADD,717)@7
    lev1_a0high_uid718_pT2_uid402_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 33 => highABits_uid717_pT2_uid402_invPolyEval_b(32)) & highABits_uid717_pT2_uid402_invPolyEval_b));
    lev1_a0high_uid718_pT2_uid402_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 16 => sm0_uid714_pT2_uid402_invPolyEval_q(15)) & sm0_uid714_pT2_uid402_invPolyEval_q));
    lev1_a0high_uid718_pT2_uid402_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0high_uid718_pT2_uid402_invPolyEval_a) + SIGNED(lev1_a0high_uid718_pT2_uid402_invPolyEval_b));
    lev1_a0high_uid718_pT2_uid402_invPolyEval_q <= lev1_a0high_uid718_pT2_uid402_invPolyEval_o(33 downto 0);

    -- lowRangeA_uid716_pT2_uid402_invPolyEval(BITSELECT,715)@7
    lowRangeA_uid716_pT2_uid402_invPolyEval_in <= sm0_uid713_pT2_uid402_invPolyEval_q(0 downto 0);
    lowRangeA_uid716_pT2_uid402_invPolyEval_b <= lowRangeA_uid716_pT2_uid402_invPolyEval_in(0 downto 0);

    -- lev1_a0_uid719_pT2_uid402_invPolyEval(BITJOIN,718)@7
    lev1_a0_uid719_pT2_uid402_invPolyEval_q <= lev1_a0high_uid718_pT2_uid402_invPolyEval_q & lowRangeA_uid716_pT2_uid402_invPolyEval_b;

    -- highABits_uid721_pT2_uid402_invPolyEval(BITSELECT,720)@7
    highABits_uid721_pT2_uid402_invPolyEval_b <= STD_LOGIC_VECTOR(lev1_a0_uid719_pT2_uid402_invPolyEval_q(34 downto 3));

    -- redist26_highABits_uid721_pT2_uid402_invPolyEval_b_1(DELAY,1030)
    redist26_highABits_uid721_pT2_uid402_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => highABits_uid721_pT2_uid402_invPolyEval_b, xout => redist26_highABits_uid721_pT2_uid402_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- lev2_a0high_uid722_pT2_uid402_invPolyEval(ADD,721)@8
    lev2_a0high_uid722_pT2_uid402_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => redist26_highABits_uid721_pT2_uid402_invPolyEval_b_1_q(31)) & redist26_highABits_uid721_pT2_uid402_invPolyEval_b_1_q));
    lev2_a0high_uid722_pT2_uid402_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000000000000000000000000000" & sm0_uid715_pT2_uid402_invPolyEval_q));
    lev2_a0high_uid722_pT2_uid402_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev2_a0high_uid722_pT2_uid402_invPolyEval_a) + SIGNED(lev2_a0high_uid722_pT2_uid402_invPolyEval_b));
    lev2_a0high_uid722_pT2_uid402_invPolyEval_q <= lev2_a0high_uid722_pT2_uid402_invPolyEval_o(32 downto 0);

    -- lowRangeA_uid720_pT2_uid402_invPolyEval(BITSELECT,719)@7
    lowRangeA_uid720_pT2_uid402_invPolyEval_in <= lev1_a0_uid719_pT2_uid402_invPolyEval_q(2 downto 0);
    lowRangeA_uid720_pT2_uid402_invPolyEval_b <= lowRangeA_uid720_pT2_uid402_invPolyEval_in(2 downto 0);

    -- redist27_lowRangeA_uid720_pT2_uid402_invPolyEval_b_1(DELAY,1031)
    redist27_lowRangeA_uid720_pT2_uid402_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => lowRangeA_uid720_pT2_uid402_invPolyEval_b, xout => redist27_lowRangeA_uid720_pT2_uid402_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- lev2_a0_uid723_pT2_uid402_invPolyEval(BITJOIN,722)@8
    lev2_a0_uid723_pT2_uid402_invPolyEval_q <= lev2_a0high_uid722_pT2_uid402_invPolyEval_q & redist27_lowRangeA_uid720_pT2_uid402_invPolyEval_b_1_q;

    -- osig_uid724_pT2_uid402_invPolyEval(BITSELECT,723)@8
    osig_uid724_pT2_uid402_invPolyEval_in <= STD_LOGIC_VECTOR(lev2_a0_uid723_pT2_uid402_invPolyEval_q(32 downto 0));
    osig_uid724_pT2_uid402_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid724_pT2_uid402_invPolyEval_in(32 downto 8));

    -- redist25_osig_uid724_pT2_uid402_invPolyEval_b_1(DELAY,1029)
    redist25_osig_uid724_pT2_uid402_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 25, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => osig_uid724_pT2_uid402_invPolyEval_b, xout => redist25_osig_uid724_pT2_uid402_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- redist50_yAddr_uid238_div_uid45_fpArctan2Test_b_7(DELAY,1054)
    redist50_yAddr_uid238_div_uid45_fpArctan2Test_b_7 : dspba_delay
    GENERIC MAP ( width => 9, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist49_yAddr_uid238_div_uid45_fpArctan2Test_b_2_q, xout => redist50_yAddr_uid238_div_uid45_fpArctan2Test_b_7_q, clk => clk, aclr => areset );

    -- memoryC0_uid381_invTables_lutmem(DUALMEM,965)@7 + 2
    -- in j@20000000
    memoryC0_uid381_invTables_lutmem_aa <= redist50_yAddr_uid238_div_uid45_fpArctan2Test_b_7_q;
    memoryC0_uid381_invTables_lutmem_reset0 <= areset;
    memoryC0_uid381_invTables_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 13,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "CORDIC_0002_memoryC0_uid381_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid381_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid381_invTables_lutmem_aa,
        q_a => memoryC0_uid381_invTables_lutmem_ir
    );
    memoryC0_uid381_invTables_lutmem_r <= memoryC0_uid381_invTables_lutmem_ir(12 downto 0);

    -- memoryC0_uid380_invTables_lutmem(DUALMEM,964)@7 + 2
    -- in j@20000000
    memoryC0_uid380_invTables_lutmem_aa <= redist50_yAddr_uid238_div_uid45_fpArctan2Test_b_7_q;
    memoryC0_uid380_invTables_lutmem_reset0 <= areset;
    memoryC0_uid380_invTables_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 18,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "CORDIC_0002_memoryC0_uid380_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid380_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid380_invTables_lutmem_aa,
        q_a => memoryC0_uid380_invTables_lutmem_ir
    );
    memoryC0_uid380_invTables_lutmem_r <= memoryC0_uid380_invTables_lutmem_ir(17 downto 0);

    -- os_uid382_invTables(BITJOIN,381)@9
    os_uid382_invTables_q <= memoryC0_uid381_invTables_lutmem_r & memoryC0_uid380_invTables_lutmem_r;

    -- rndBit_uid374_invPolyEval(CONSTANT,373)
    rndBit_uid374_invPolyEval_q <= "001";

    -- cIncludingRoundingBit_uid404_invPolyEval(BITJOIN,403)@9
    cIncludingRoundingBit_uid404_invPolyEval_q <= os_uid382_invTables_q & rndBit_uid374_invPolyEval_q;

    -- ts2_uid406_invPolyEval(ADD,405)@9
    ts2_uid406_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 34 => cIncludingRoundingBit_uid404_invPolyEval_q(33)) & cIncludingRoundingBit_uid404_invPolyEval_q));
    ts2_uid406_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 25 => redist25_osig_uid724_pT2_uid402_invPolyEval_b_1_q(24)) & redist25_osig_uid724_pT2_uid402_invPolyEval_b_1_q));
    ts2_uid406_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts2_uid406_invPolyEval_a) + SIGNED(ts2_uid406_invPolyEval_b));
    ts2_uid406_invPolyEval_q <= ts2_uid406_invPolyEval_o(34 downto 0);

    -- s2_uid407_invPolyEval(BITSELECT,406)@9
    s2_uid407_invPolyEval_b <= STD_LOGIC_VECTOR(ts2_uid406_invPolyEval_q(34 downto 1));

    -- invY_uid241_div_uid45_fpArctan2Test_merged_bit_select(BITSELECT,998)@9
    invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_in <= s2_uid407_invPolyEval_b(31 downto 0);
    invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_b <= invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_in(30 downto 5);
    invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_c <= invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_in(31 downto 31);

    -- redist1_invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_b_1(DELAY,1005)
    redist1_invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 26, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_b, xout => redist1_invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- aboveLeftX_uid438_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(BITSELECT,437)@10
    aboveLeftX_uid438_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_in <= redist1_invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_b_1_q(7 downto 0);
    aboveLeftX_uid438_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b <= aboveLeftX_uid438_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_in(7 downto 3);

    -- n0_uid448_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(BITSELECT,447)@10
    n0_uid448_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b <= aboveLeftX_uid438_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b(4 downto 1);

    -- n0_uid456_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(BITSELECT,455)@10
    n0_uid456_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b <= n0_uid448_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b(3 downto 1);

    -- n0_uid464_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(BITSELECT,463)@10
    n0_uid464_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b <= n0_uid456_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b(2 downto 1);

    -- redist37_n0_uid464_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b_2(DELAY,1041)
    redist37_n0_uid464_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b_2 : dspba_delay
    GENERIC MAP ( width => 2, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => n0_uid464_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b, xout => redist37_n0_uid464_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b_2_q, clk => clk, aclr => areset );

    -- sm1_uid479_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(MULT,478)@12 + 2
    sm1_uid479_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_a0 <= redist37_n0_uid464_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b_2_q;
    sm1_uid479_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b0 <= n1_uid463_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b;
    sm1_uid479_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_reset <= areset;
    sm1_uid479_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 2,
        lpm_widthb => 2,
        lpm_widthp => 4,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=NO, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm1_uid479_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_a0,
        datab => sm1_uid479_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b0,
        clken => VCC_q(0),
        aclr => sm1_uid479_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_reset,
        clock => clk,
        result => sm1_uid479_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_s1
    );
    sm1_uid479_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q <= sm1_uid479_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_s1;

    -- lev3_a0high_uid488_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(ADD,487)@14
    lev3_a0high_uid488_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & lowRangeA_uid486_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_merged_bit_select_c);
    lev3_a0high_uid488_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b <= STD_LOGIC_VECTOR("000000000000000000000000000000" & sm1_uid479_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q);
    lev3_a0high_uid488_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(lev3_a0high_uid488_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_a) + UNSIGNED(lev3_a0high_uid488_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b));
    lev3_a0high_uid488_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q <= lev3_a0high_uid488_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_o(33 downto 0);

    -- rightBottomY_uid437_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(BITSELECT,436)@10
    rightBottomY_uid437_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_in <= lOAdded_uid245_div_uid45_fpArctan2Test_q(5 downto 0);
    rightBottomY_uid437_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b <= rightBottomY_uid437_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_in(5 downto 1);

    -- n1_uid445_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(BITSELECT,444)@10
    n1_uid445_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b <= rightBottomY_uid437_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b(4 downto 1);

    -- n1_uid453_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(BITSELECT,452)@10
    n1_uid453_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b <= n1_uid445_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b(3 downto 1);

    -- n1_uid461_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(BITSELECT,460)@10
    n1_uid461_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b <= n1_uid453_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b(2 downto 1);

    -- rightBottomX_uid436_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(BITSELECT,435)@10
    rightBottomX_uid436_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_in <= redist1_invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_b_1_q(16 downto 0);
    rightBottomX_uid436_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b <= rightBottomX_uid436_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_in(16 downto 12);

    -- n0_uid446_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(BITSELECT,445)@10
    n0_uid446_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b <= rightBottomX_uid436_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b(4 downto 1);

    -- n0_uid454_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(BITSELECT,453)@10
    n0_uid454_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b <= n0_uid446_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b(3 downto 1);

    -- n0_uid462_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(BITSELECT,461)@10
    n0_uid462_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b <= n0_uid454_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b(2 downto 1);

    -- sm0_uid478_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(MULT,477)@10 + 2
    sm0_uid478_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_a0 <= n0_uid462_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b;
    sm0_uid478_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b0 <= n1_uid461_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b;
    sm0_uid478_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_reset <= areset;
    sm0_uid478_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 2,
        lpm_widthb => 2,
        lpm_widthp => 4,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=NO, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm0_uid478_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_a0,
        datab => sm0_uid478_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b0,
        clken => VCC_q(0),
        aclr => sm0_uid478_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_reset,
        clock => clk,
        result => sm0_uid478_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_s1
    );
    sm0_uid478_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q <= sm0_uid478_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_s1;

    -- rightBottomY_uid432_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(BITSELECT,431)@10
    rightBottomY_uid432_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b <= lOAdded_uid245_div_uid45_fpArctan2Test_q(23 downto 15);

    -- rightBottomX_bottomRange_uid429_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(BITSELECT,428)@10
    rightBottomX_bottomRange_uid429_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_in <= redist1_invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_b_1_q(7 downto 0);
    rightBottomX_bottomRange_uid429_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b <= rightBottomX_bottomRange_uid429_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_in(7 downto 0);

    -- rightBottomX_mergedSignalTM_uid430_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(BITJOIN,429)@10
    rightBottomX_mergedSignalTM_uid430_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q <= rightBottomX_bottomRange_uid429_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b & GND_q;

    -- sm1_uid477_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(MULT,476)@10 + 2
    sm1_uid477_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_a0 <= rightBottomX_mergedSignalTM_uid430_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q;
    sm1_uid477_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b0 <= rightBottomY_uid432_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b;
    sm1_uid477_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_reset <= areset;
    sm1_uid477_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 9,
        lpm_widthb => 9,
        lpm_widthp => 18,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm1_uid477_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_a0,
        datab => sm1_uid477_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b0,
        clken => VCC_q(0),
        aclr => sm1_uid477_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_reset,
        clock => clk,
        result => sm1_uid477_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_s1
    );
    sm1_uid477_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q <= sm1_uid477_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_s1;

    -- lowRangeA_uid481_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_merged_bit_select(BITSELECT,999)@12
    lowRangeA_uid481_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_merged_bit_select_b <= sm1_uid477_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q(4 downto 0);
    lowRangeA_uid481_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_merged_bit_select_c <= sm1_uid477_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q(17 downto 5);

    -- lev1_a1high_uid483_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(ADD,482)@12 + 1
    lev1_a1high_uid483_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & lowRangeA_uid481_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_merged_bit_select_c);
    lev1_a1high_uid483_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b <= STD_LOGIC_VECTOR("0000000000" & sm0_uid478_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q);
    lev1_a1high_uid483_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            lev1_a1high_uid483_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            lev1_a1high_uid483_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(lev1_a1high_uid483_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_a) + UNSIGNED(lev1_a1high_uid483_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b));
        END IF;
    END PROCESS;
    lev1_a1high_uid483_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q <= lev1_a1high_uid483_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_o(13 downto 0);

    -- redist0_lowRangeA_uid481_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_merged_bit_select_b_1(DELAY,1004)
    redist0_lowRangeA_uid481_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => lowRangeA_uid481_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_merged_bit_select_b, xout => redist0_lowRangeA_uid481_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- lev1_a1_uid484_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(BITJOIN,483)@13
    lev1_a1_uid484_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q <= lev1_a1high_uid483_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q & redist0_lowRangeA_uid481_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_merged_bit_select_b_1_q;

    -- aboveLeftY_bottomRange_uid425_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(BITSELECT,424)@10
    aboveLeftY_bottomRange_uid425_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_in <= lOAdded_uid245_div_uid45_fpArctan2Test_q(5 downto 0);
    aboveLeftY_bottomRange_uid425_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b <= aboveLeftY_bottomRange_uid425_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_in(5 downto 0);

    -- aboveLeftY_mergedSignalTM_uid426_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(BITJOIN,425)@10
    aboveLeftY_mergedSignalTM_uid426_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q <= aboveLeftY_bottomRange_uid425_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b & aboveLeftY_bottomExtension_uid424_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q;

    -- aboveLeftX_uid423_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(BITSELECT,422)@10
    aboveLeftX_uid423_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b <= redist1_invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_b_1_q(25 downto 17);

    -- sm0_uid476_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(MULT,475)@10 + 2
    sm0_uid476_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_a0 <= aboveLeftX_uid423_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b;
    sm0_uid476_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b0 <= aboveLeftY_mergedSignalTM_uid426_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q;
    sm0_uid476_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_reset <= areset;
    sm0_uid476_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 9,
        lpm_widthb => 9,
        lpm_widthp => 18,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm0_uid476_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_a0,
        datab => sm0_uid476_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b0,
        clken => VCC_q(0),
        aclr => sm0_uid476_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_reset,
        clock => clk,
        result => sm0_uid476_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_s1
    );
    sm0_uid476_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q <= sm0_uid476_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_s1;

    -- topRangeY_uid418_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(BITSELECT,417)@10
    topRangeY_uid418_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b <= lOAdded_uid245_div_uid45_fpArctan2Test_q(23 downto 6);

    -- topRangeX_uid417_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(BITSELECT,416)@10
    topRangeX_uid417_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b <= redist1_invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_b_1_q(25 downto 8);

    -- sm0_uid475_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(MULT,474)@10 + 2
    sm0_uid475_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_a0 <= topRangeX_uid417_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b;
    sm0_uid475_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b0 <= topRangeY_uid418_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b;
    sm0_uid475_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_reset <= areset;
    sm0_uid475_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 18,
        lpm_widthp => 36,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm0_uid475_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_a0,
        datab => sm0_uid475_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b0,
        clken => VCC_q(0),
        aclr => sm0_uid475_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_reset,
        clock => clk,
        result => sm0_uid475_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_s1
    );
    sm0_uid475_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q <= sm0_uid475_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_s1;

    -- lev1_a0_uid480_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(ADD,479)@12 + 1
    lev1_a0_uid480_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & sm0_uid475_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q);
    lev1_a0_uid480_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b <= STD_LOGIC_VECTOR("0000000000000000000" & sm0_uid476_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q);
    lev1_a0_uid480_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            lev1_a0_uid480_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            lev1_a0_uid480_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(lev1_a0_uid480_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_a) + UNSIGNED(lev1_a0_uid480_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b));
        END IF;
    END PROCESS;
    lev1_a0_uid480_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q <= lev1_a0_uid480_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_o(36 downto 0);

    -- lev2_a0_uid485_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(ADD,484)@13 + 1
    lev2_a0_uid485_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & lev1_a0_uid480_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q);
    lev2_a0_uid485_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b <= STD_LOGIC_VECTOR("0000000000000000000" & lev1_a1_uid484_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q);
    lev2_a0_uid485_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            lev2_a0_uid485_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            lev2_a0_uid485_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(lev2_a0_uid485_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_a) + UNSIGNED(lev2_a0_uid485_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b));
        END IF;
    END PROCESS;
    lev2_a0_uid485_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q <= lev2_a0_uid485_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_o(37 downto 0);

    -- lowRangeA_uid486_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_merged_bit_select(BITSELECT,1000)@14
    lowRangeA_uid486_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_merged_bit_select_b <= lev2_a0_uid485_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q(4 downto 0);
    lowRangeA_uid486_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_merged_bit_select_c <= lev2_a0_uid485_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q(37 downto 5);

    -- lev3_a0_uid489_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(BITJOIN,488)@14
    lev3_a0_uid489_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q <= lev3_a0high_uid488_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q & lowRangeA_uid486_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_merged_bit_select_b;

    -- osig_uid490_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(BITSELECT,489)@14
    osig_uid490_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_in <= lev3_a0_uid489_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q(35 downto 0);
    osig_uid490_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b <= osig_uid490_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_in(35 downto 9);

    -- divValPreNormS_uid252_div_uid45_fpArctan2Test(BITSELECT,251)@14
    divValPreNormS_uid252_div_uid45_fpArctan2Test_b <= osig_uid490_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b(26 downto 1);

    -- redist2_invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_c_5(DELAY,1006)
    redist2_invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_c_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_c, xout => redist2_invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_c_5_q, clk => clk, aclr => areset );

    -- updatedY_uid203_div_uid45_fpArctan2Test(BITJOIN,202)@14
    updatedY_uid203_div_uid45_fpArctan2Test_q <= GND_q & cstZeroWF_uid7_fpArctan2Test_q;

    -- fracYZero_uid202_div_uid45_fpArctan2Test(LOGICAL,203)@14
    fracYZero_uid202_div_uid45_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & redist93_frac_xIn_uid10_fpArctan2Test_b_14_mem_q);
    fracYZero_uid202_div_uid45_fpArctan2Test_q <= "1" WHEN fracYZero_uid202_div_uid45_fpArctan2Test_a = updatedY_uid203_div_uid45_fpArctan2Test_q ELSE "0";

    -- fracYPostZ_uid243_div_uid45_fpArctan2Test(LOGICAL,242)@14
    fracYPostZ_uid243_div_uid45_fpArctan2Test_q <= fracYZero_uid202_div_uid45_fpArctan2Test_q or redist2_invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_c_5_q;

    -- divValPreNormTrunc_uid253_div_uid45_fpArctan2Test(MUX,252)@14 + 1
    divValPreNormTrunc_uid253_div_uid45_fpArctan2Test_s <= fracYPostZ_uid243_div_uid45_fpArctan2Test_q;
    divValPreNormTrunc_uid253_div_uid45_fpArctan2Test_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            divValPreNormTrunc_uid253_div_uid45_fpArctan2Test_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (divValPreNormTrunc_uid253_div_uid45_fpArctan2Test_s) IS
                WHEN "0" => divValPreNormTrunc_uid253_div_uid45_fpArctan2Test_q <= divValPreNormS_uid252_div_uid45_fpArctan2Test_b;
                WHEN "1" => divValPreNormTrunc_uid253_div_uid45_fpArctan2Test_q <= oFracXSE_mergedSignalTM_uid250_div_uid45_fpArctan2Test_q;
                WHEN OTHERS => divValPreNormTrunc_uid253_div_uid45_fpArctan2Test_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- norm_uid254_div_uid45_fpArctan2Test(BITSELECT,253)@15
    norm_uid254_div_uid45_fpArctan2Test_b <= STD_LOGIC_VECTOR(divValPreNormTrunc_uid253_div_uid45_fpArctan2Test_q(25 downto 25));

    -- rndOp_uid262_div_uid45_fpArctan2Test(BITJOIN,261)@15
    rndOp_uid262_div_uid45_fpArctan2Test_q <= norm_uid254_div_uid45_fpArctan2Test_b & cstZeroWF_uid7_fpArctan2Test_q & VCC_q;

    -- cstBiasM1_uid54_fpArctan2Test(CONSTANT,53)
    cstBiasM1_uid54_fpArctan2Test_q <= "01111110";

    -- expXmY_uid234_div_uid45_fpArctan2Test(SUB,233)@0 + 1
    expXmY_uid234_div_uid45_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & exp_yIn_uid23_fpArctan2Test_b);
    expXmY_uid234_div_uid45_fpArctan2Test_b <= STD_LOGIC_VECTOR("0" & exp_xIn_uid9_fpArctan2Test_b);
    expXmY_uid234_div_uid45_fpArctan2Test_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expXmY_uid234_div_uid45_fpArctan2Test_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expXmY_uid234_div_uid45_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(expXmY_uid234_div_uid45_fpArctan2Test_a) - UNSIGNED(expXmY_uid234_div_uid45_fpArctan2Test_b));
        END IF;
    END PROCESS;
    expXmY_uid234_div_uid45_fpArctan2Test_q <= expXmY_uid234_div_uid45_fpArctan2Test_o(8 downto 0);

    -- redist51_expXmY_uid234_div_uid45_fpArctan2Test_q_14(DELAY,1055)
    redist51_expXmY_uid234_div_uid45_fpArctan2Test_q_14 : dspba_delay
    GENERIC MAP ( width => 9, depth => 13, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXmY_uid234_div_uid45_fpArctan2Test_q, xout => redist51_expXmY_uid234_div_uid45_fpArctan2Test_q_14_q, clk => clk, aclr => areset );

    -- expR_uid235_div_uid45_fpArctan2Test(ADD,234)@14 + 1
    expR_uid235_div_uid45_fpArctan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 9 => redist51_expXmY_uid234_div_uid45_fpArctan2Test_q_14_q(8)) & redist51_expXmY_uid234_div_uid45_fpArctan2Test_q_14_q));
    expR_uid235_div_uid45_fpArctan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & cstBiasM1_uid54_fpArctan2Test_q));
    expR_uid235_div_uid45_fpArctan2Test_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expR_uid235_div_uid45_fpArctan2Test_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expR_uid235_div_uid45_fpArctan2Test_o <= STD_LOGIC_VECTOR(SIGNED(expR_uid235_div_uid45_fpArctan2Test_a) + SIGNED(expR_uid235_div_uid45_fpArctan2Test_b));
        END IF;
    END PROCESS;
    expR_uid235_div_uid45_fpArctan2Test_q <= expR_uid235_div_uid45_fpArctan2Test_o(9 downto 0);

    -- divValPreNormHigh_uid255_div_uid45_fpArctan2Test(BITSELECT,254)@15
    divValPreNormHigh_uid255_div_uid45_fpArctan2Test_in <= divValPreNormTrunc_uid253_div_uid45_fpArctan2Test_q(24 downto 0);
    divValPreNormHigh_uid255_div_uid45_fpArctan2Test_b <= divValPreNormHigh_uid255_div_uid45_fpArctan2Test_in(24 downto 1);

    -- divValPreNormLow_uid256_div_uid45_fpArctan2Test(BITSELECT,255)@15
    divValPreNormLow_uid256_div_uid45_fpArctan2Test_in <= divValPreNormTrunc_uid253_div_uid45_fpArctan2Test_q(23 downto 0);
    divValPreNormLow_uid256_div_uid45_fpArctan2Test_b <= divValPreNormLow_uid256_div_uid45_fpArctan2Test_in(23 downto 0);

    -- normFracRnd_uid257_div_uid45_fpArctan2Test(MUX,256)@15
    normFracRnd_uid257_div_uid45_fpArctan2Test_s <= norm_uid254_div_uid45_fpArctan2Test_b;
    normFracRnd_uid257_div_uid45_fpArctan2Test_combproc: PROCESS (normFracRnd_uid257_div_uid45_fpArctan2Test_s, divValPreNormLow_uid256_div_uid45_fpArctan2Test_b, divValPreNormHigh_uid255_div_uid45_fpArctan2Test_b)
    BEGIN
        CASE (normFracRnd_uid257_div_uid45_fpArctan2Test_s) IS
            WHEN "0" => normFracRnd_uid257_div_uid45_fpArctan2Test_q <= divValPreNormLow_uid256_div_uid45_fpArctan2Test_b;
            WHEN "1" => normFracRnd_uid257_div_uid45_fpArctan2Test_q <= divValPreNormHigh_uid255_div_uid45_fpArctan2Test_b;
            WHEN OTHERS => normFracRnd_uid257_div_uid45_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- expFracRnd_uid258_div_uid45_fpArctan2Test(BITJOIN,257)@15
    expFracRnd_uid258_div_uid45_fpArctan2Test_q <= expR_uid235_div_uid45_fpArctan2Test_q & normFracRnd_uid257_div_uid45_fpArctan2Test_q;

    -- expFracPostRnd_uid263_div_uid45_fpArctan2Test(ADD,262)@15 + 1
    expFracPostRnd_uid263_div_uid45_fpArctan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 34 => expFracRnd_uid258_div_uid45_fpArctan2Test_q(33)) & expFracRnd_uid258_div_uid45_fpArctan2Test_q));
    expFracPostRnd_uid263_div_uid45_fpArctan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000" & rndOp_uid262_div_uid45_fpArctan2Test_q));
    expFracPostRnd_uid263_div_uid45_fpArctan2Test_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracPostRnd_uid263_div_uid45_fpArctan2Test_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracPostRnd_uid263_div_uid45_fpArctan2Test_o <= STD_LOGIC_VECTOR(SIGNED(expFracPostRnd_uid263_div_uid45_fpArctan2Test_a) + SIGNED(expFracPostRnd_uid263_div_uid45_fpArctan2Test_b));
        END IF;
    END PROCESS;
    expFracPostRnd_uid263_div_uid45_fpArctan2Test_q <= expFracPostRnd_uid263_div_uid45_fpArctan2Test_o(34 downto 0);

    -- excRPreExc_uid266_div_uid45_fpArctan2Test(BITSELECT,265)@16
    excRPreExc_uid266_div_uid45_fpArctan2Test_in <= expFracPostRnd_uid263_div_uid45_fpArctan2Test_q(31 downto 0);
    excRPreExc_uid266_div_uid45_fpArctan2Test_b <= excRPreExc_uid266_div_uid45_fpArctan2Test_in(31 downto 24);

    -- redist43_excRPreExc_uid266_div_uid45_fpArctan2Test_b_1(DELAY,1047)
    redist43_excRPreExc_uid266_div_uid45_fpArctan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRPreExc_uid266_div_uid45_fpArctan2Test_b, xout => redist43_excRPreExc_uid266_div_uid45_fpArctan2Test_b_1_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid230_div_uid45_fpArctan2Test(LOGICAL,229)@16
    invExpXIsMax_uid230_div_uid45_fpArctan2Test_q <= not (redist92_expXIsMax_uid12_fpArctan2Test_q_16_q);

    -- InvExpXIsZero_uid231_div_uid45_fpArctan2Test(LOGICAL,230)@16
    InvExpXIsZero_uid231_div_uid45_fpArctan2Test_q <= not (redist52_excZ_y_uid224_div_uid45_fpArctan2Test_q_16_q);

    -- excR_y_uid232_div_uid45_fpArctan2Test(LOGICAL,231)@16
    excR_y_uid232_div_uid45_fpArctan2Test_q <= InvExpXIsZero_uid231_div_uid45_fpArctan2Test_q and invExpXIsMax_uid230_div_uid45_fpArctan2Test_q;

    -- excXIYR_uid280_div_uid45_fpArctan2Test(LOGICAL,279)@16
    excXIYR_uid280_div_uid45_fpArctan2Test_q <= excI_yIn_uid29_fpArctan2Test_q and excR_y_uid232_div_uid45_fpArctan2Test_q;

    -- excXIYZ_uid279_div_uid45_fpArctan2Test(LOGICAL,278)@16
    excXIYZ_uid279_div_uid45_fpArctan2Test_q <= excI_yIn_uid29_fpArctan2Test_q and redist52_excZ_y_uid224_div_uid45_fpArctan2Test_q_16_q;

    -- expRExt_uid267_div_uid45_fpArctan2Test(BITSELECT,266)@16
    expRExt_uid267_div_uid45_fpArctan2Test_b <= STD_LOGIC_VECTOR(expFracPostRnd_uid263_div_uid45_fpArctan2Test_q(34 downto 24));

    -- expOvf_uid271_div_uid45_fpArctan2Test(COMPARE,270)@16
    expOvf_uid271_div_uid45_fpArctan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 11 => expRExt_uid267_div_uid45_fpArctan2Test_b(10)) & expRExt_uid267_div_uid45_fpArctan2Test_b));
    expOvf_uid271_div_uid45_fpArctan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000" & cstAllOWE_uid6_fpArctan2Test_q));
    expOvf_uid271_div_uid45_fpArctan2Test_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid271_div_uid45_fpArctan2Test_a) - SIGNED(expOvf_uid271_div_uid45_fpArctan2Test_b));
    expOvf_uid271_div_uid45_fpArctan2Test_n(0) <= not (expOvf_uid271_div_uid45_fpArctan2Test_o(12));

    -- invExpXIsMax_uid216_div_uid45_fpArctan2Test(LOGICAL,215)@16
    invExpXIsMax_uid216_div_uid45_fpArctan2Test_q <= not (redist89_expXIsMax_uid26_fpArctan2Test_q_16_q);

    -- InvExpXIsZero_uid217_div_uid45_fpArctan2Test(LOGICAL,216)@16
    InvExpXIsZero_uid217_div_uid45_fpArctan2Test_q <= not (redist53_excZ_x_uid210_div_uid45_fpArctan2Test_q_16_q);

    -- excR_x_uid218_div_uid45_fpArctan2Test(LOGICAL,217)@16
    excR_x_uid218_div_uid45_fpArctan2Test_q <= InvExpXIsZero_uid217_div_uid45_fpArctan2Test_q and invExpXIsMax_uid216_div_uid45_fpArctan2Test_q;

    -- excXRYROvf_uid278_div_uid45_fpArctan2Test(LOGICAL,277)@16
    excXRYROvf_uid278_div_uid45_fpArctan2Test_q <= excR_x_uid218_div_uid45_fpArctan2Test_q and excR_y_uid232_div_uid45_fpArctan2Test_q and expOvf_uid271_div_uid45_fpArctan2Test_n;

    -- excXRYZ_uid277_div_uid45_fpArctan2Test(LOGICAL,276)@16
    excXRYZ_uid277_div_uid45_fpArctan2Test_q <= excR_x_uid218_div_uid45_fpArctan2Test_q and redist52_excZ_y_uid224_div_uid45_fpArctan2Test_q_16_q;

    -- excRInf_uid281_div_uid45_fpArctan2Test(LOGICAL,280)@16 + 1
    excRInf_uid281_div_uid45_fpArctan2Test_qi <= excXRYZ_uid277_div_uid45_fpArctan2Test_q or excXRYROvf_uid278_div_uid45_fpArctan2Test_q or excXIYZ_uid279_div_uid45_fpArctan2Test_q or excXIYR_uid280_div_uid45_fpArctan2Test_q;
    excRInf_uid281_div_uid45_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRInf_uid281_div_uid45_fpArctan2Test_qi, xout => excRInf_uid281_div_uid45_fpArctan2Test_q, clk => clk, aclr => areset );

    -- xRegOrZero_uid274_div_uid45_fpArctan2Test(LOGICAL,273)@16
    xRegOrZero_uid274_div_uid45_fpArctan2Test_q <= excR_x_uid218_div_uid45_fpArctan2Test_q or redist53_excZ_x_uid210_div_uid45_fpArctan2Test_q_16_q;

    -- regOrZeroOverInf_uid275_div_uid45_fpArctan2Test(LOGICAL,274)@16
    regOrZeroOverInf_uid275_div_uid45_fpArctan2Test_q <= xRegOrZero_uid274_div_uid45_fpArctan2Test_q and excI_xIn_uid15_fpArctan2Test_q;

    -- expUdf_uid268_div_uid45_fpArctan2Test(COMPARE,267)@16
    expUdf_uid268_div_uid45_fpArctan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000000000" & GND_q));
    expUdf_uid268_div_uid45_fpArctan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 11 => expRExt_uid267_div_uid45_fpArctan2Test_b(10)) & expRExt_uid267_div_uid45_fpArctan2Test_b));
    expUdf_uid268_div_uid45_fpArctan2Test_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid268_div_uid45_fpArctan2Test_a) - SIGNED(expUdf_uid268_div_uid45_fpArctan2Test_b));
    expUdf_uid268_div_uid45_fpArctan2Test_n(0) <= not (expUdf_uid268_div_uid45_fpArctan2Test_o(12));

    -- regOverRegWithUf_uid273_div_uid45_fpArctan2Test(LOGICAL,272)@16
    regOverRegWithUf_uid273_div_uid45_fpArctan2Test_q <= expUdf_uid268_div_uid45_fpArctan2Test_n and excR_x_uid218_div_uid45_fpArctan2Test_q and excR_y_uid232_div_uid45_fpArctan2Test_q;

    -- zeroOverReg_uid272_div_uid45_fpArctan2Test(LOGICAL,271)@16
    zeroOverReg_uid272_div_uid45_fpArctan2Test_q <= redist53_excZ_x_uid210_div_uid45_fpArctan2Test_q_16_q and excR_y_uid232_div_uid45_fpArctan2Test_q;

    -- excRZero_uid276_div_uid45_fpArctan2Test(LOGICAL,275)@16 + 1
    excRZero_uid276_div_uid45_fpArctan2Test_qi <= zeroOverReg_uid272_div_uid45_fpArctan2Test_q or regOverRegWithUf_uid273_div_uid45_fpArctan2Test_q or regOrZeroOverInf_uid275_div_uid45_fpArctan2Test_q;
    excRZero_uid276_div_uid45_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRZero_uid276_div_uid45_fpArctan2Test_qi, xout => excRZero_uid276_div_uid45_fpArctan2Test_q, clk => clk, aclr => areset );

    -- concExc_uid285_div_uid45_fpArctan2Test(BITJOIN,284)@17
    concExc_uid285_div_uid45_fpArctan2Test_q <= excRNaN_uid284_div_uid45_fpArctan2Test_q & excRInf_uid281_div_uid45_fpArctan2Test_q & excRZero_uid276_div_uid45_fpArctan2Test_q;

    -- excREnc_uid286_div_uid45_fpArctan2Test(LOOKUP,285)@17
    excREnc_uid286_div_uid45_fpArctan2Test_combproc: PROCESS (concExc_uid285_div_uid45_fpArctan2Test_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExc_uid285_div_uid45_fpArctan2Test_q) IS
            WHEN "000" => excREnc_uid286_div_uid45_fpArctan2Test_q <= "01";
            WHEN "001" => excREnc_uid286_div_uid45_fpArctan2Test_q <= "00";
            WHEN "010" => excREnc_uid286_div_uid45_fpArctan2Test_q <= "10";
            WHEN "011" => excREnc_uid286_div_uid45_fpArctan2Test_q <= "00";
            WHEN "100" => excREnc_uid286_div_uid45_fpArctan2Test_q <= "11";
            WHEN "101" => excREnc_uid286_div_uid45_fpArctan2Test_q <= "00";
            WHEN "110" => excREnc_uid286_div_uid45_fpArctan2Test_q <= "00";
            WHEN "111" => excREnc_uid286_div_uid45_fpArctan2Test_q <= "00";
            WHEN OTHERS => -- unreachable
                           excREnc_uid286_div_uid45_fpArctan2Test_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid294_div_uid45_fpArctan2Test(MUX,293)@17
    expRPostExc_uid294_div_uid45_fpArctan2Test_s <= excREnc_uid286_div_uid45_fpArctan2Test_q;
    expRPostExc_uid294_div_uid45_fpArctan2Test_combproc: PROCESS (expRPostExc_uid294_div_uid45_fpArctan2Test_s, cstAllZWE_uid52_fpArctan2Test_q, redist43_excRPreExc_uid266_div_uid45_fpArctan2Test_b_1_q, cstAllOWE_uid6_fpArctan2Test_q)
    BEGIN
        CASE (expRPostExc_uid294_div_uid45_fpArctan2Test_s) IS
            WHEN "00" => expRPostExc_uid294_div_uid45_fpArctan2Test_q <= cstAllZWE_uid52_fpArctan2Test_q;
            WHEN "01" => expRPostExc_uid294_div_uid45_fpArctan2Test_q <= redist43_excRPreExc_uid266_div_uid45_fpArctan2Test_b_1_q;
            WHEN "10" => expRPostExc_uid294_div_uid45_fpArctan2Test_q <= cstAllOWE_uid6_fpArctan2Test_q;
            WHEN "11" => expRPostExc_uid294_div_uid45_fpArctan2Test_q <= cstAllOWE_uid6_fpArctan2Test_q;
            WHEN OTHERS => expRPostExc_uid294_div_uid45_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- cstNaNWF_uid51_fpArctan2Test(CONSTANT,50)
    cstNaNWF_uid51_fpArctan2Test_q <= "00000000000000000000001";

    -- fracRPreExc_uid265_div_uid45_fpArctan2Test(BITSELECT,264)@16
    fracRPreExc_uid265_div_uid45_fpArctan2Test_in <= expFracPostRnd_uid263_div_uid45_fpArctan2Test_q(23 downto 0);
    fracRPreExc_uid265_div_uid45_fpArctan2Test_b <= fracRPreExc_uid265_div_uid45_fpArctan2Test_in(23 downto 1);

    -- redist44_fracRPreExc_uid265_div_uid45_fpArctan2Test_b_1(DELAY,1048)
    redist44_fracRPreExc_uid265_div_uid45_fpArctan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPreExc_uid265_div_uid45_fpArctan2Test_b, xout => redist44_fracRPreExc_uid265_div_uid45_fpArctan2Test_b_1_q, clk => clk, aclr => areset );

    -- fracRPostExc_uid290_div_uid45_fpArctan2Test(MUX,289)@17
    fracRPostExc_uid290_div_uid45_fpArctan2Test_s <= excREnc_uid286_div_uid45_fpArctan2Test_q;
    fracRPostExc_uid290_div_uid45_fpArctan2Test_combproc: PROCESS (fracRPostExc_uid290_div_uid45_fpArctan2Test_s, cstZeroWF_uid7_fpArctan2Test_q, redist44_fracRPreExc_uid265_div_uid45_fpArctan2Test_b_1_q, cstNaNWF_uid51_fpArctan2Test_q)
    BEGIN
        CASE (fracRPostExc_uid290_div_uid45_fpArctan2Test_s) IS
            WHEN "00" => fracRPostExc_uid290_div_uid45_fpArctan2Test_q <= cstZeroWF_uid7_fpArctan2Test_q;
            WHEN "01" => fracRPostExc_uid290_div_uid45_fpArctan2Test_q <= redist44_fracRPreExc_uid265_div_uid45_fpArctan2Test_b_1_q;
            WHEN "10" => fracRPostExc_uid290_div_uid45_fpArctan2Test_q <= cstZeroWF_uid7_fpArctan2Test_q;
            WHEN "11" => fracRPostExc_uid290_div_uid45_fpArctan2Test_q <= cstNaNWF_uid51_fpArctan2Test_q;
            WHEN OTHERS => fracRPostExc_uid290_div_uid45_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- divR_uid297_div_uid45_fpArctan2Test(BITJOIN,296)@17
    divR_uid297_div_uid45_fpArctan2Test_q <= sRPostExc_uid296_div_uid45_fpArctan2Test_q & expRPostExc_uid294_div_uid45_fpArctan2Test_q & fracRPostExc_uid290_div_uid45_fpArctan2Test_q;

    -- redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_inputreg(DELAY,1110)
    redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => divR_uid297_div_uid45_fpArctan2Test_q, xout => redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_inputreg_q, clk => clk, aclr => areset );

    -- redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_wraddr(REG,1114)
    redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_wraddr_q <= "100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_wraddr_q <= STD_LOGIC_VECTOR(redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_mem(DUALMEM,1112)
    redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_mem_ia <= STD_LOGIC_VECTOR(redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_inputreg_q);
    redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_mem_aa <= redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_wraddr_q;
    redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_mem_ab <= redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_rdcnt_q;
    redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_mem_reset0 <= areset;
    redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 3,
        numwords_a => 5,
        width_b => 32,
        widthad_b => 3,
        numwords_b => 5,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken1 => redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_mem_reset0,
        clock1 => clk,
        address_a => redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_mem_aa,
        data_a => redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_mem_ab,
        q_b => redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_mem_iq
    );
    redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_mem_q <= redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_mem_iq(31 downto 0);

    -- redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_outputreg(DELAY,1111)
    redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_mem_q, xout => redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_outputreg_q, clk => clk, aclr => areset );

    -- redist42_divR_uid297_div_uid45_fpArctan2Test_q_10(DELAY,1046)
    redist42_divR_uid297_div_uid45_fpArctan2Test_q_10 : dspba_delay
    GENERIC MAP ( width => 32, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_outputreg_q, xout => redist42_divR_uid297_div_uid45_fpArctan2Test_q_10_q, clk => clk, aclr => areset );

    -- singX_uid48_fpArctan2Test(BITSELECT,47)@27
    singX_uid48_fpArctan2Test_b <= STD_LOGIC_VECTOR(redist42_divR_uid297_div_uid45_fpArctan2Test_q_10_q(31 downto 31));

    -- redist75_singX_uid48_fpArctan2Test_b_20(DELAY,1079)
    redist75_singX_uid48_fpArctan2Test_b_20 : dspba_delay
    GENERIC MAP ( width => 1, depth => 20, reset_kind => "ASYNC" )
    PORT MAP ( xin => singX_uid48_fpArctan2Test_b, xout => redist75_singX_uid48_fpArctan2Test_b_20_q, clk => clk, aclr => areset );

    -- piO2_uid79_fpArctan2Test(CONSTANT,78)
    piO2_uid79_fpArctan2Test_q <= "11001001000011111101101011";

    -- cstPiO2_uid81_fpArctan2Test(BITSELECT,80)@47
    cstPiO2_uid81_fpArctan2Test_in <= piO2_uid79_fpArctan2Test_q(24 downto 0);
    cstPiO2_uid81_fpArctan2Test_b <= cstPiO2_uid81_fpArctan2Test_in(24 downto 2);

    -- fpPiO2C_uid82_fpArctan2Test(BITJOIN,81)@47
    fpPiO2C_uid82_fpArctan2Test_q <= redist75_singX_uid48_fpArctan2Test_b_20_q & cstBias_uid53_fpArctan2Test_q & cstPiO2_uid81_fpArctan2Test_b;

    -- piO4_uid80_fpArctan2Test(CONSTANT,79)
    piO4_uid80_fpArctan2Test_q <= "110010010000111111011011";

    -- cstPiO4_uid84_fpArctan2Test(BITSELECT,83)@47
    cstPiO4_uid84_fpArctan2Test_in <= piO4_uid80_fpArctan2Test_q(22 downto 0);
    cstPiO4_uid84_fpArctan2Test_b <= cstPiO4_uid84_fpArctan2Test_in(22 downto 0);

    -- fpPiO4C_uid85_fpArctan2Test(BITJOIN,84)@47
    fpPiO4C_uid85_fpArctan2Test_q <= redist75_singX_uid48_fpArctan2Test_b_20_q & cstBiasM1_uid54_fpArctan2Test_q & cstPiO4_uid84_fpArctan2Test_b;

    -- fracX_uid47_fpArctan2Test(BITSELECT,46)@17
    fracX_uid47_fpArctan2Test_b <= divR_uid297_div_uid45_fpArctan2Test_q(22 downto 0);

    -- redist76_fracX_uid47_fpArctan2Test_b_8_inputreg(DELAY,1122)
    redist76_fracX_uid47_fpArctan2Test_b_8_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracX_uid47_fpArctan2Test_b, xout => redist76_fracX_uid47_fpArctan2Test_b_8_inputreg_q, clk => clk, aclr => areset );

    -- redist76_fracX_uid47_fpArctan2Test_b_8(DELAY,1080)
    redist76_fracX_uid47_fpArctan2Test_b_8 : dspba_delay
    GENERIC MAP ( width => 23, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist76_fracX_uid47_fpArctan2Test_b_8_inputreg_q, xout => redist76_fracX_uid47_fpArctan2Test_b_8_q, clk => clk, aclr => areset );

    -- redist76_fracX_uid47_fpArctan2Test_b_8_outputreg(DELAY,1123)
    redist76_fracX_uid47_fpArctan2Test_b_8_outputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist76_fracX_uid47_fpArctan2Test_b_8_q, xout => redist76_fracX_uid47_fpArctan2Test_b_8_outputreg_q, clk => clk, aclr => areset );

    -- fracXIsZero_uid67_fpArctan2Test(LOGICAL,66)@25 + 1
    fracXIsZero_uid67_fpArctan2Test_qi <= "1" WHEN cstZeroWF_uid7_fpArctan2Test_q = redist76_fracX_uid47_fpArctan2Test_b_8_outputreg_q ELSE "0";
    fracXIsZero_uid67_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid67_fpArctan2Test_qi, xout => fracXIsZero_uid67_fpArctan2Test_q, clk => clk, aclr => areset );

    -- expX_uid46_fpArctan2Test(BITSELECT,45)@25
    expX_uid46_fpArctan2Test_b <= redist41_divR_uid297_div_uid45_fpArctan2Test_q_8_outputreg_q(30 downto 23);

    -- expXIsMax_uid66_fpArctan2Test(LOGICAL,65)@25 + 1
    expXIsMax_uid66_fpArctan2Test_qi <= "1" WHEN expX_uid46_fpArctan2Test_b = cstAllOWE_uid6_fpArctan2Test_q ELSE "0";
    expXIsMax_uid66_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid66_fpArctan2Test_qi, xout => expXIsMax_uid66_fpArctan2Test_q, clk => clk, aclr => areset );

    -- excI_div_uid69_fpArctan2Test(LOGICAL,68)@26
    excI_div_uid69_fpArctan2Test_q <= expXIsMax_uid66_fpArctan2Test_q and fracXIsZero_uid67_fpArctan2Test_q;

    -- redist73_excI_div_uid69_fpArctan2Test_q_21(DELAY,1077)
    redist73_excI_div_uid69_fpArctan2Test_q_21 : dspba_delay
    GENERIC MAP ( width => 1, depth => 21, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_div_uid69_fpArctan2Test_q, xout => redist73_excI_div_uid69_fpArctan2Test_q_21_q, clk => clk, aclr => areset );

    -- constOut_uid87_fpArctan2Test(MUX,86)@47
    constOut_uid87_fpArctan2Test_s <= redist73_excI_div_uid69_fpArctan2Test_q_21_q;
    constOut_uid87_fpArctan2Test_combproc: PROCESS (constOut_uid87_fpArctan2Test_s, fpPiO4C_uid85_fpArctan2Test_q, fpPiO2C_uid82_fpArctan2Test_q)
    BEGIN
        CASE (constOut_uid87_fpArctan2Test_s) IS
            WHEN "0" => constOut_uid87_fpArctan2Test_q <= fpPiO4C_uid85_fpArctan2Test_q;
            WHEN "1" => constOut_uid87_fpArctan2Test_q <= fpPiO2C_uid82_fpArctan2Test_q;
            WHEN OTHERS => constOut_uid87_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracOutCst_uid151_fpArctan2Test_merged_bit_select(BITSELECT,987)@47
    fracOutCst_uid151_fpArctan2Test_merged_bit_select_in <= constOut_uid87_fpArctan2Test_q(30 downto 0);
    fracOutCst_uid151_fpArctan2Test_merged_bit_select_b <= fracOutCst_uid151_fpArctan2Test_merged_bit_select_in(22 downto 0);
    fracOutCst_uid151_fpArctan2Test_merged_bit_select_c <= fracOutCst_uid151_fpArctan2Test_merged_bit_select_in(30 downto 23);

    -- fracXIsNotZero_uid317_z_uid91_fpArctan2Test(LOGICAL,316)@26
    fracXIsNotZero_uid317_z_uid91_fpArctan2Test_q <= not (fracXIsZero_uid67_fpArctan2Test_q);

    -- excN_x_uid319_z_uid91_fpArctan2Test(LOGICAL,318)@26
    excN_x_uid319_z_uid91_fpArctan2Test_q <= expXIsMax_uid66_fpArctan2Test_q and fracXIsNotZero_uid317_z_uid91_fpArctan2Test_q;

    -- invExcRNaN_uid349_z_uid91_fpArctan2Test(LOGICAL,348)@26 + 1
    invExcRNaN_uid349_z_uid91_fpArctan2Test_qi <= not (excN_x_uid319_z_uid91_fpArctan2Test_q);
    invExcRNaN_uid349_z_uid91_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => invExcRNaN_uid349_z_uid91_fpArctan2Test_qi, xout => invExcRNaN_uid349_z_uid91_fpArctan2Test_q, clk => clk, aclr => areset );

    -- signR_uid350_z_uid91_fpArctan2Test(LOGICAL,349)@27
    signR_uid350_z_uid91_fpArctan2Test_q <= singX_uid48_fpArctan2Test_b and invExcRNaN_uid349_z_uid91_fpArctan2Test_q;

    -- redist78_expX_uid46_fpArctan2Test_b_1(DELAY,1082)
    redist78_expX_uid46_fpArctan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expX_uid46_fpArctan2Test_b, xout => redist78_expX_uid46_fpArctan2Test_b_1_q, clk => clk, aclr => areset );

    -- cst2Bias_uid307_z_uid91_fpArctan2Test(CONSTANT,306)
    cst2Bias_uid307_z_uid91_fpArctan2Test_q <= "11111110";

    -- expRCompYIsOneExt_uid335_z_uid91_fpArctan2Test(SUB,334)@26
    expRCompYIsOneExt_uid335_z_uid91_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & cst2Bias_uid307_z_uid91_fpArctan2Test_q);
    expRCompYIsOneExt_uid335_z_uid91_fpArctan2Test_b <= STD_LOGIC_VECTOR("0" & redist78_expX_uid46_fpArctan2Test_b_1_q);
    expRCompYIsOneExt_uid335_z_uid91_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(expRCompYIsOneExt_uid335_z_uid91_fpArctan2Test_a) - UNSIGNED(expRCompYIsOneExt_uid335_z_uid91_fpArctan2Test_b));
    expRCompYIsOneExt_uid335_z_uid91_fpArctan2Test_q <= expRCompYIsOneExt_uid335_z_uid91_fpArctan2Test_o(8 downto 0);

    -- expRCompYIsOne_uid336_z_uid91_fpArctan2Test(BITSELECT,335)@26
    expRCompYIsOne_uid336_z_uid91_fpArctan2Test_in <= expRCompYIsOneExt_uid335_z_uid91_fpArctan2Test_q(7 downto 0);
    expRCompYIsOne_uid336_z_uid91_fpArctan2Test_b <= expRCompYIsOne_uid336_z_uid91_fpArctan2Test_in(7 downto 0);

    -- cst2BiasM1_uid306_z_uid91_fpArctan2Test(CONSTANT,305)
    cst2BiasM1_uid306_z_uid91_fpArctan2Test_q <= "11111101";

    -- expRCompExt_uid332_z_uid91_fpArctan2Test(SUB,331)@26
    expRCompExt_uid332_z_uid91_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & cst2BiasM1_uid306_z_uid91_fpArctan2Test_q);
    expRCompExt_uid332_z_uid91_fpArctan2Test_b <= STD_LOGIC_VECTOR("0" & redist78_expX_uid46_fpArctan2Test_b_1_q);
    expRCompExt_uid332_z_uid91_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(expRCompExt_uid332_z_uid91_fpArctan2Test_a) - UNSIGNED(expRCompExt_uid332_z_uid91_fpArctan2Test_b));
    expRCompExt_uid332_z_uid91_fpArctan2Test_q <= expRCompExt_uid332_z_uid91_fpArctan2Test_o(8 downto 0);

    -- expRComp_uid333_z_uid91_fpArctan2Test(BITSELECT,332)@26
    expRComp_uid333_z_uid91_fpArctan2Test_in <= expRCompExt_uid332_z_uid91_fpArctan2Test_q(7 downto 0);
    expRComp_uid333_z_uid91_fpArctan2Test_b <= expRComp_uid333_z_uid91_fpArctan2Test_in(7 downto 0);

    -- redist54_updatedY_uid203_div_uid45_fpArctan2Test_q_3(DELAY,1058)
    redist54_updatedY_uid203_div_uid45_fpArctan2Test_q_3 : dspba_delay
    GENERIC MAP ( width => 24, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => updatedY_uid203_div_uid45_fpArctan2Test_q, xout => redist54_updatedY_uid203_div_uid45_fpArctan2Test_q_3_q, clk => clk, aclr => areset );

    -- fracXIsZero_uid324_z_uid91_fpArctan2Test(LOGICAL,325)@17 + 1
    fracXIsZero_uid324_z_uid91_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & fracX_uid47_fpArctan2Test_b);
    fracXIsZero_uid324_z_uid91_fpArctan2Test_qi <= "1" WHEN fracXIsZero_uid324_z_uid91_fpArctan2Test_a = redist54_updatedY_uid203_div_uid45_fpArctan2Test_q_3_q ELSE "0";
    fracXIsZero_uid324_z_uid91_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid324_z_uid91_fpArctan2Test_qi, xout => fracXIsZero_uid324_z_uid91_fpArctan2Test_q, clk => clk, aclr => areset );

    -- redist40_fracXIsZero_uid324_z_uid91_fpArctan2Test_q_9(DELAY,1044)
    redist40_fracXIsZero_uid324_z_uid91_fpArctan2Test_q_9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid324_z_uid91_fpArctan2Test_q, xout => redist40_fracXIsZero_uid324_z_uid91_fpArctan2Test_q_9_q, clk => clk, aclr => areset );

    -- expRCalc_uid341_z_uid91_fpArctan2Test(MUX,340)@26 + 1
    expRCalc_uid341_z_uid91_fpArctan2Test_s <= redist40_fracXIsZero_uid324_z_uid91_fpArctan2Test_q_9_q;
    expRCalc_uid341_z_uid91_fpArctan2Test_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRCalc_uid341_z_uid91_fpArctan2Test_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (expRCalc_uid341_z_uid91_fpArctan2Test_s) IS
                WHEN "0" => expRCalc_uid341_z_uid91_fpArctan2Test_q <= expRComp_uid333_z_uid91_fpArctan2Test_b;
                WHEN "1" => expRCalc_uid341_z_uid91_fpArctan2Test_q <= expRCompYIsOne_uid336_z_uid91_fpArctan2Test_b;
                WHEN OTHERS => expRCalc_uid341_z_uid91_fpArctan2Test_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- excZ_div_uid450_uid65_fpArctan2Test(LOGICAL,64)@25
    excZ_div_uid450_uid65_fpArctan2Test_q <= "1" WHEN expX_uid46_fpArctan2Test_b = cstAllZWE_uid52_fpArctan2Test_q ELSE "0";

    -- redist74_excZ_div_uid450_uid65_fpArctan2Test_q_1(DELAY,1078)
    redist74_excZ_div_uid450_uid65_fpArctan2Test_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_div_uid450_uid65_fpArctan2Test_q, xout => redist74_excZ_div_uid450_uid65_fpArctan2Test_q_1_q, clk => clk, aclr => areset );

    -- udf_uid334_z_uid91_fpArctan2Test(BITSELECT,333)@26
    udf_uid334_z_uid91_fpArctan2Test_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((9 downto 9 => expRCompExt_uid332_z_uid91_fpArctan2Test_q(8)) & expRCompExt_uid332_z_uid91_fpArctan2Test_q));
    udf_uid334_z_uid91_fpArctan2Test_b <= STD_LOGIC_VECTOR(udf_uid334_z_uid91_fpArctan2Test_in(9 downto 9));

    -- invExpXIsMax_uid320_z_uid91_fpArctan2Test(LOGICAL,319)@26
    invExpXIsMax_uid320_z_uid91_fpArctan2Test_q <= not (expXIsMax_uid66_fpArctan2Test_q);

    -- InvExpXIsZero_uid321_z_uid91_fpArctan2Test(LOGICAL,320)@26
    InvExpXIsZero_uid321_z_uid91_fpArctan2Test_q <= not (redist74_excZ_div_uid450_uid65_fpArctan2Test_q_1_q);

    -- excR_x_uid322_z_uid91_fpArctan2Test(LOGICAL,321)@26
    excR_x_uid322_z_uid91_fpArctan2Test_q <= InvExpXIsZero_uid321_z_uid91_fpArctan2Test_q and invExpXIsMax_uid320_z_uid91_fpArctan2Test_q;

    -- xRegAndUdf_uid342_z_uid91_fpArctan2Test(LOGICAL,341)@26
    xRegAndUdf_uid342_z_uid91_fpArctan2Test_q <= excR_x_uid322_z_uid91_fpArctan2Test_q and udf_uid334_z_uid91_fpArctan2Test_b;

    -- xIOrXRUdf_uid343_z_uid91_fpArctan2Test(LOGICAL,342)@26
    xIOrXRUdf_uid343_z_uid91_fpArctan2Test_q <= excI_div_uid69_fpArctan2Test_q or xRegAndUdf_uid342_z_uid91_fpArctan2Test_q;

    -- excSelBits_uid344_z_uid91_fpArctan2Test(BITJOIN,343)@26
    excSelBits_uid344_z_uid91_fpArctan2Test_q <= excN_x_uid319_z_uid91_fpArctan2Test_q & redist74_excZ_div_uid450_uid65_fpArctan2Test_q_1_q & xIOrXRUdf_uid343_z_uid91_fpArctan2Test_q;

    -- outMuxSelEnc_uid345_z_uid91_fpArctan2Test(LOOKUP,344)@26 + 1
    outMuxSelEnc_uid345_z_uid91_fpArctan2Test_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            outMuxSelEnc_uid345_z_uid91_fpArctan2Test_q <= "01";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (excSelBits_uid344_z_uid91_fpArctan2Test_q) IS
                WHEN "000" => outMuxSelEnc_uid345_z_uid91_fpArctan2Test_q <= "01";
                WHEN "001" => outMuxSelEnc_uid345_z_uid91_fpArctan2Test_q <= "00";
                WHEN "010" => outMuxSelEnc_uid345_z_uid91_fpArctan2Test_q <= "10";
                WHEN "011" => outMuxSelEnc_uid345_z_uid91_fpArctan2Test_q <= "01";
                WHEN "100" => outMuxSelEnc_uid345_z_uid91_fpArctan2Test_q <= "11";
                WHEN "101" => outMuxSelEnc_uid345_z_uid91_fpArctan2Test_q <= "01";
                WHEN "110" => outMuxSelEnc_uid345_z_uid91_fpArctan2Test_q <= "01";
                WHEN "111" => outMuxSelEnc_uid345_z_uid91_fpArctan2Test_q <= "01";
                WHEN OTHERS => -- unreachable
                               outMuxSelEnc_uid345_z_uid91_fpArctan2Test_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- expRPostExc_uid348_z_uid91_fpArctan2Test(MUX,347)@27
    expRPostExc_uid348_z_uid91_fpArctan2Test_s <= outMuxSelEnc_uid345_z_uid91_fpArctan2Test_q;
    expRPostExc_uid348_z_uid91_fpArctan2Test_combproc: PROCESS (expRPostExc_uid348_z_uid91_fpArctan2Test_s, cstAllZWE_uid52_fpArctan2Test_q, expRCalc_uid341_z_uid91_fpArctan2Test_q, cstAllOWE_uid6_fpArctan2Test_q)
    BEGIN
        CASE (expRPostExc_uid348_z_uid91_fpArctan2Test_s) IS
            WHEN "00" => expRPostExc_uid348_z_uid91_fpArctan2Test_q <= cstAllZWE_uid52_fpArctan2Test_q;
            WHEN "01" => expRPostExc_uid348_z_uid91_fpArctan2Test_q <= expRCalc_uid341_z_uid91_fpArctan2Test_q;
            WHEN "10" => expRPostExc_uid348_z_uid91_fpArctan2Test_q <= cstAllOWE_uid6_fpArctan2Test_q;
            WHEN "11" => expRPostExc_uid348_z_uid91_fpArctan2Test_q <= cstAllOWE_uid6_fpArctan2Test_q;
            WHEN OTHERS => expRPostExc_uid348_z_uid91_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oFracX_uid323_z_uid91_fpArctan2Test(BITJOIN,322)@17
    oFracX_uid323_z_uid91_fpArctan2Test_q <= VCC_q & fracX_uid47_fpArctan2Test_b;

    -- y_uid327_z_uid91_fpArctan2Test(BITSELECT,326)@17
    y_uid327_z_uid91_fpArctan2Test_in <= oFracX_uid323_z_uid91_fpArctan2Test_q(22 downto 0);
    y_uid327_z_uid91_fpArctan2Test_b <= y_uid327_z_uid91_fpArctan2Test_in(22 downto 0);

    -- yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select(BITSELECT,997)@17
    yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_b <= y_uid327_z_uid91_fpArctan2Test_b(22 downto 15);
    yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_c <= y_uid327_z_uid91_fpArctan2Test_b(14 downto 0);

    -- memoryC2_uid498_inverseTables_lutmem(DUALMEM,971)@17 + 2
    -- in j@20000000
    memoryC2_uid498_inverseTables_lutmem_aa <= yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_b;
    memoryC2_uid498_inverseTables_lutmem_reset0 <= areset;
    memoryC2_uid498_inverseTables_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "CORDIC_0002_memoryC2_uid498_inverseTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid498_inverseTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid498_inverseTables_lutmem_aa,
        q_a => memoryC2_uid498_inverseTables_lutmem_ir
    );
    memoryC2_uid498_inverseTables_lutmem_r <= memoryC2_uid498_inverseTables_lutmem_ir(11 downto 0);

    -- topRangeY_mergedSignalTM_uid747_pT1_uid505_invPolyEval(BITJOIN,746)@19
    topRangeY_mergedSignalTM_uid747_pT1_uid505_invPolyEval_q <= memoryC2_uid498_inverseTables_lutmem_r & topRangeY_bottomExtension_uid641_pT1_uid395_invPolyEval_q;

    -- redist5_yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_c_2(DELAY,1009)
    redist5_yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_c_2 : dspba_delay
    GENERIC MAP ( width => 15, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_c, xout => redist5_yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_c_2_q, clk => clk, aclr => areset );

    -- yT1_uid504_invPolyEval(BITSELECT,503)@19
    yT1_uid504_invPolyEval_b <= redist5_yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_c_2_q(14 downto 3);

    -- nx_mergedSignalTM_uid728_pT1_uid505_invPolyEval(BITJOIN,727)@19
    nx_mergedSignalTM_uid728_pT1_uid505_invPolyEval_q <= GND_q & yT1_uid504_invPolyEval_b;

    -- topRangeX_mergedSignalTM_uid743_pT1_uid505_invPolyEval(BITJOIN,742)@19
    topRangeX_mergedSignalTM_uid743_pT1_uid505_invPolyEval_q <= nx_mergedSignalTM_uid728_pT1_uid505_invPolyEval_q & topRangeY_bottomExtension_uid535_pT1_uid366_invPolyEval_q;

    -- sm0_uid749_pT1_uid505_invPolyEval(MULT,748)@19 + 2
    sm0_uid749_pT1_uid505_invPolyEval_a0 <= STD_LOGIC_VECTOR(topRangeX_mergedSignalTM_uid743_pT1_uid505_invPolyEval_q);
    sm0_uid749_pT1_uid505_invPolyEval_b0 <= STD_LOGIC_VECTOR(topRangeY_mergedSignalTM_uid747_pT1_uid505_invPolyEval_q);
    sm0_uid749_pT1_uid505_invPolyEval_reset <= areset;
    sm0_uid749_pT1_uid505_invPolyEval_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 17,
        lpm_widthb => 17,
        lpm_widthp => 34,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm0_uid749_pT1_uid505_invPolyEval_a0,
        datab => sm0_uid749_pT1_uid505_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid749_pT1_uid505_invPolyEval_reset,
        clock => clk,
        result => sm0_uid749_pT1_uid505_invPolyEval_s1
    );
    sm0_uid749_pT1_uid505_invPolyEval_q <= sm0_uid749_pT1_uid505_invPolyEval_s1;

    -- osig_uid750_pT1_uid505_invPolyEval(BITSELECT,749)@21
    osig_uid750_pT1_uid505_invPolyEval_in <= STD_LOGIC_VECTOR(sm0_uid749_pT1_uid505_invPolyEval_q(32 downto 0));
    osig_uid750_pT1_uid505_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid750_pT1_uid505_invPolyEval_in(32 downto 19));

    -- redist3_yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_b_2(DELAY,1007)
    redist3_yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_b_2 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_b, xout => redist3_yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_b_2_q, clk => clk, aclr => areset );

    -- memoryC1_uid495_inverseTables_lutmem(DUALMEM,970)@19 + 2
    -- in j@20000000
    memoryC1_uid495_inverseTables_lutmem_aa <= redist3_yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_b_2_q;
    memoryC1_uid495_inverseTables_lutmem_reset0 <= areset;
    memoryC1_uid495_inverseTables_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 20,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "CORDIC_0002_memoryC1_uid495_inverseTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid495_inverseTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid495_inverseTables_lutmem_aa,
        q_a => memoryC1_uid495_inverseTables_lutmem_ir
    );
    memoryC1_uid495_inverseTables_lutmem_r <= memoryC1_uid495_inverseTables_lutmem_ir(19 downto 0);

    -- cIncludingRoundingBit_uid507_invPolyEval(BITJOIN,506)@21
    cIncludingRoundingBit_uid507_invPolyEval_q <= memoryC1_uid495_inverseTables_lutmem_r & rndBit_uid367_invPolyEval_q;

    -- ts1_uid509_invPolyEval(ADD,508)@21
    ts1_uid509_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => cIncludingRoundingBit_uid507_invPolyEval_q(21)) & cIncludingRoundingBit_uid507_invPolyEval_q));
    ts1_uid509_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 14 => osig_uid750_pT1_uid505_invPolyEval_b(13)) & osig_uid750_pT1_uid505_invPolyEval_b));
    ts1_uid509_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts1_uid509_invPolyEval_a) + SIGNED(ts1_uid509_invPolyEval_b));
    ts1_uid509_invPolyEval_q <= ts1_uid509_invPolyEval_o(22 downto 0);

    -- s1_uid510_invPolyEval(BITSELECT,509)@21
    s1_uid510_invPolyEval_b <= STD_LOGIC_VECTOR(ts1_uid509_invPolyEval_q(22 downto 1));

    -- redist36_s1_uid510_invPolyEval_b_1(DELAY,1040)
    redist36_s1_uid510_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 22, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => s1_uid510_invPolyEval_b, xout => redist36_s1_uid510_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- rightBottomY_uid786_pT2_uid512_invPolyEval(BITSELECT,785)@22
    rightBottomY_uid786_pT2_uid512_invPolyEval_in <= redist36_s1_uid510_invPolyEval_b_1_q(4 downto 0);
    rightBottomY_uid786_pT2_uid512_invPolyEval_b <= rightBottomY_uid786_pT2_uid512_invPolyEval_in(4 downto 0);

    -- n1_uid795_pT2_uid512_invPolyEval(BITSELECT,794)@22
    n1_uid795_pT2_uid512_invPolyEval_b <= rightBottomY_uid786_pT2_uid512_invPolyEval_b(4 downto 1);

    -- n1_uid803_pT2_uid512_invPolyEval(BITSELECT,802)@22
    n1_uid803_pT2_uid512_invPolyEval_b <= n1_uid795_pT2_uid512_invPolyEval_b(3 downto 1);

    -- n1_uid811_pT2_uid512_invPolyEval(BITSELECT,810)@22
    n1_uid811_pT2_uid512_invPolyEval_b <= n1_uid803_pT2_uid512_invPolyEval_b(2 downto 1);

    -- redist24_n1_uid811_pT2_uid512_invPolyEval_b_1(DELAY,1028)
    redist24_n1_uid811_pT2_uid512_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => n1_uid811_pT2_uid512_invPolyEval_b, xout => redist24_n1_uid811_pT2_uid512_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- redist6_yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_c_5(DELAY,1010)
    redist6_yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_c_5 : dspba_delay
    GENERIC MAP ( width => 15, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist5_yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_c_2_q, xout => redist6_yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_c_5_q, clk => clk, aclr => areset );

    -- nx_mergedSignalTM_uid754_pT2_uid512_invPolyEval(BITJOIN,753)@22
    nx_mergedSignalTM_uid754_pT2_uid512_invPolyEval_q <= GND_q & redist6_yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_c_5_q;

    -- rightBottomX_uid785_pT2_uid512_invPolyEval(BITSELECT,784)@22
    rightBottomX_uid785_pT2_uid512_invPolyEval_in <= nx_mergedSignalTM_uid754_pT2_uid512_invPolyEval_q(7 downto 0);
    rightBottomX_uid785_pT2_uid512_invPolyEval_b <= rightBottomX_uid785_pT2_uid512_invPolyEval_in(7 downto 3);

    -- n0_uid796_pT2_uid512_invPolyEval(BITSELECT,795)@22
    n0_uid796_pT2_uid512_invPolyEval_b <= rightBottomX_uid785_pT2_uid512_invPolyEval_b(4 downto 1);

    -- n0_uid804_pT2_uid512_invPolyEval(BITSELECT,803)@22
    n0_uid804_pT2_uid512_invPolyEval_b <= n0_uid796_pT2_uid512_invPolyEval_b(3 downto 1);

    -- n0_uid812_pT2_uid512_invPolyEval(BITSELECT,811)@22
    n0_uid812_pT2_uid512_invPolyEval_b <= n0_uid804_pT2_uid512_invPolyEval_b(2 downto 1);

    -- redist23_n0_uid812_pT2_uid512_invPolyEval_b_1(DELAY,1027)
    redist23_n0_uid812_pT2_uid512_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => n0_uid812_pT2_uid512_invPolyEval_b, xout => redist23_n0_uid812_pT2_uid512_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- sm0_uid827_pT2_uid512_invPolyEval(MULT,826)@23 + 2
    sm0_uid827_pT2_uid512_invPolyEval_a0 <= redist23_n0_uid812_pT2_uid512_invPolyEval_b_1_q;
    sm0_uid827_pT2_uid512_invPolyEval_b0 <= redist24_n1_uid811_pT2_uid512_invPolyEval_b_1_q;
    sm0_uid827_pT2_uid512_invPolyEval_reset <= areset;
    sm0_uid827_pT2_uid512_invPolyEval_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 2,
        lpm_widthb => 2,
        lpm_widthp => 4,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=NO, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm0_uid827_pT2_uid512_invPolyEval_a0,
        datab => sm0_uid827_pT2_uid512_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid827_pT2_uid512_invPolyEval_reset,
        clock => clk,
        result => sm0_uid827_pT2_uid512_invPolyEval_s1
    );
    sm0_uid827_pT2_uid512_invPolyEval_q <= sm0_uid827_pT2_uid512_invPolyEval_s1;

    -- aboveLeftY_bottomRange_uid776_pT2_uid512_invPolyEval(BITSELECT,775)@22
    aboveLeftY_bottomRange_uid776_pT2_uid512_invPolyEval_in <= STD_LOGIC_VECTOR(redist36_s1_uid510_invPolyEval_b_1_q(4 downto 0));
    aboveLeftY_bottomRange_uid776_pT2_uid512_invPolyEval_b <= STD_LOGIC_VECTOR(aboveLeftY_bottomRange_uid776_pT2_uid512_invPolyEval_in(4 downto 0));

    -- aboveLeftY_mergedSignalTM_uid777_pT2_uid512_invPolyEval(BITJOIN,776)@22
    aboveLeftY_mergedSignalTM_uid777_pT2_uid512_invPolyEval_q <= aboveLeftY_bottomRange_uid776_pT2_uid512_invPolyEval_b & aboveLeftY_bottomExtension_uid424_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q;

    -- aboveLeftX_uid774_pT2_uid512_invPolyEval(BITSELECT,773)@22
    aboveLeftX_uid774_pT2_uid512_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid754_pT2_uid512_invPolyEval_q(15 downto 8));

    -- sm0_uid826_pT2_uid512_invPolyEval(MULT,825)@22 + 2
    sm0_uid826_pT2_uid512_invPolyEval_a0 <= STD_LOGIC_VECTOR(aboveLeftX_uid774_pT2_uid512_invPolyEval_b);
    sm0_uid826_pT2_uid512_invPolyEval_b0 <= '0' & aboveLeftY_mergedSignalTM_uid777_pT2_uid512_invPolyEval_q;
    sm0_uid826_pT2_uid512_invPolyEval_reset <= areset;
    sm0_uid826_pT2_uid512_invPolyEval_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 9,
        lpm_widthp => 17,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm0_uid826_pT2_uid512_invPolyEval_a0,
        datab => sm0_uid826_pT2_uid512_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid826_pT2_uid512_invPolyEval_reset,
        clock => clk,
        result => sm0_uid826_pT2_uid512_invPolyEval_s1
    );
    sm0_uid826_pT2_uid512_invPolyEval_q <= sm0_uid826_pT2_uid512_invPolyEval_s1(15 downto 0);

    -- topRangeY_uid768_pT2_uid512_invPolyEval(BITSELECT,767)@22
    topRangeY_uid768_pT2_uid512_invPolyEval_b <= STD_LOGIC_VECTOR(redist36_s1_uid510_invPolyEval_b_1_q(21 downto 5));

    -- topRangeX_mergedSignalTM_uid766_pT2_uid512_invPolyEval(BITJOIN,765)@22
    topRangeX_mergedSignalTM_uid766_pT2_uid512_invPolyEval_q <= nx_mergedSignalTM_uid754_pT2_uid512_invPolyEval_q & GND_q;

    -- sm0_uid825_pT2_uid512_invPolyEval(MULT,824)@22 + 2
    sm0_uid825_pT2_uid512_invPolyEval_a0 <= STD_LOGIC_VECTOR(topRangeX_mergedSignalTM_uid766_pT2_uid512_invPolyEval_q);
    sm0_uid825_pT2_uid512_invPolyEval_b0 <= STD_LOGIC_VECTOR(topRangeY_uid768_pT2_uid512_invPolyEval_b);
    sm0_uid825_pT2_uid512_invPolyEval_reset <= areset;
    sm0_uid825_pT2_uid512_invPolyEval_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 17,
        lpm_widthb => 17,
        lpm_widthp => 34,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm0_uid825_pT2_uid512_invPolyEval_a0,
        datab => sm0_uid825_pT2_uid512_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid825_pT2_uid512_invPolyEval_reset,
        clock => clk,
        result => sm0_uid825_pT2_uid512_invPolyEval_s1
    );
    sm0_uid825_pT2_uid512_invPolyEval_q <= sm0_uid825_pT2_uid512_invPolyEval_s1;

    -- highABits_uid829_pT2_uid512_invPolyEval(BITSELECT,828)@24
    highABits_uid829_pT2_uid512_invPolyEval_b <= STD_LOGIC_VECTOR(sm0_uid825_pT2_uid512_invPolyEval_q(33 downto 1));

    -- lev1_a0high_uid830_pT2_uid512_invPolyEval(ADD,829)@24
    lev1_a0high_uid830_pT2_uid512_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 33 => highABits_uid829_pT2_uid512_invPolyEval_b(32)) & highABits_uid829_pT2_uid512_invPolyEval_b));
    lev1_a0high_uid830_pT2_uid512_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 16 => sm0_uid826_pT2_uid512_invPolyEval_q(15)) & sm0_uid826_pT2_uid512_invPolyEval_q));
    lev1_a0high_uid830_pT2_uid512_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0high_uid830_pT2_uid512_invPolyEval_a) + SIGNED(lev1_a0high_uid830_pT2_uid512_invPolyEval_b));
    lev1_a0high_uid830_pT2_uid512_invPolyEval_q <= lev1_a0high_uid830_pT2_uid512_invPolyEval_o(33 downto 0);

    -- lowRangeA_uid828_pT2_uid512_invPolyEval(BITSELECT,827)@24
    lowRangeA_uid828_pT2_uid512_invPolyEval_in <= sm0_uid825_pT2_uid512_invPolyEval_q(0 downto 0);
    lowRangeA_uid828_pT2_uid512_invPolyEval_b <= lowRangeA_uid828_pT2_uid512_invPolyEval_in(0 downto 0);

    -- lev1_a0_uid831_pT2_uid512_invPolyEval(BITJOIN,830)@24
    lev1_a0_uid831_pT2_uid512_invPolyEval_q <= lev1_a0high_uid830_pT2_uid512_invPolyEval_q & lowRangeA_uid828_pT2_uid512_invPolyEval_b;

    -- highABits_uid833_pT2_uid512_invPolyEval(BITSELECT,832)@24
    highABits_uid833_pT2_uid512_invPolyEval_b <= STD_LOGIC_VECTOR(lev1_a0_uid831_pT2_uid512_invPolyEval_q(34 downto 5));

    -- redist21_highABits_uid833_pT2_uid512_invPolyEval_b_1(DELAY,1025)
    redist21_highABits_uid833_pT2_uid512_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 30, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => highABits_uid833_pT2_uid512_invPolyEval_b, xout => redist21_highABits_uid833_pT2_uid512_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- lev2_a0high_uid834_pT2_uid512_invPolyEval(ADD,833)@25
    lev2_a0high_uid834_pT2_uid512_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 30 => redist21_highABits_uid833_pT2_uid512_invPolyEval_b_1_q(29)) & redist21_highABits_uid833_pT2_uid512_invPolyEval_b_1_q));
    lev2_a0high_uid834_pT2_uid512_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000000000000000000000000000" & sm0_uid827_pT2_uid512_invPolyEval_q));
    lev2_a0high_uid834_pT2_uid512_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev2_a0high_uid834_pT2_uid512_invPolyEval_a) + SIGNED(lev2_a0high_uid834_pT2_uid512_invPolyEval_b));
    lev2_a0high_uid834_pT2_uid512_invPolyEval_q <= lev2_a0high_uid834_pT2_uid512_invPolyEval_o(30 downto 0);

    -- lowRangeA_uid832_pT2_uid512_invPolyEval(BITSELECT,831)@24
    lowRangeA_uid832_pT2_uid512_invPolyEval_in <= lev1_a0_uid831_pT2_uid512_invPolyEval_q(4 downto 0);
    lowRangeA_uid832_pT2_uid512_invPolyEval_b <= lowRangeA_uid832_pT2_uid512_invPolyEval_in(4 downto 0);

    -- redist22_lowRangeA_uid832_pT2_uid512_invPolyEval_b_1(DELAY,1026)
    redist22_lowRangeA_uid832_pT2_uid512_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => lowRangeA_uid832_pT2_uid512_invPolyEval_b, xout => redist22_lowRangeA_uid832_pT2_uid512_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- lev2_a0_uid835_pT2_uid512_invPolyEval(BITJOIN,834)@25
    lev2_a0_uid835_pT2_uid512_invPolyEval_q <= lev2_a0high_uid834_pT2_uid512_invPolyEval_q & redist22_lowRangeA_uid832_pT2_uid512_invPolyEval_b_1_q;

    -- osig_uid836_pT2_uid512_invPolyEval(BITSELECT,835)@25
    osig_uid836_pT2_uid512_invPolyEval_in <= STD_LOGIC_VECTOR(lev2_a0_uid835_pT2_uid512_invPolyEval_q(32 downto 0));
    osig_uid836_pT2_uid512_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid836_pT2_uid512_invPolyEval_in(32 downto 9));

    -- redist20_osig_uid836_pT2_uid512_invPolyEval_b_1(DELAY,1024)
    redist20_osig_uid836_pT2_uid512_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => osig_uid836_pT2_uid512_invPolyEval_b, xout => redist20_osig_uid836_pT2_uid512_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- redist4_yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_b_7(DELAY,1008)
    redist4_yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_b_7 : dspba_delay
    GENERIC MAP ( width => 8, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist3_yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_b_2_q, xout => redist4_yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_b_7_q, clk => clk, aclr => areset );

    -- memoryC0_uid492_inverseTables_lutmem(DUALMEM,969)@24 + 2
    -- in j@20000000
    memoryC0_uid492_inverseTables_lutmem_aa <= redist4_yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_b_7_q;
    memoryC0_uid492_inverseTables_lutmem_reset0 <= areset;
    memoryC0_uid492_inverseTables_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 29,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "CORDIC_0002_memoryC0_uid492_inverseTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid492_inverseTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid492_inverseTables_lutmem_aa,
        q_a => memoryC0_uid492_inverseTables_lutmem_ir
    );
    memoryC0_uid492_inverseTables_lutmem_r <= memoryC0_uid492_inverseTables_lutmem_ir(28 downto 0);

    -- cIncludingRoundingBit_uid514_invPolyEval(BITJOIN,513)@26
    cIncludingRoundingBit_uid514_invPolyEval_q <= memoryC0_uid492_inverseTables_lutmem_r & rndBit_uid374_invPolyEval_q;

    -- ts2_uid516_invPolyEval(ADD,515)@26
    ts2_uid516_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => cIncludingRoundingBit_uid514_invPolyEval_q(31)) & cIncludingRoundingBit_uid514_invPolyEval_q));
    ts2_uid516_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 24 => redist20_osig_uid836_pT2_uid512_invPolyEval_b_1_q(23)) & redist20_osig_uid836_pT2_uid512_invPolyEval_b_1_q));
    ts2_uid516_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts2_uid516_invPolyEval_a) + SIGNED(ts2_uid516_invPolyEval_b));
    ts2_uid516_invPolyEval_q <= ts2_uid516_invPolyEval_o(32 downto 0);

    -- s2_uid517_invPolyEval(BITSELECT,516)@26
    s2_uid517_invPolyEval_b <= STD_LOGIC_VECTOR(ts2_uid516_invPolyEval_q(32 downto 1));

    -- fxpInverseRes_uid337_z_uid91_fpArctan2Test(BITSELECT,336)@26
    fxpInverseRes_uid337_z_uid91_fpArctan2Test_in <= s2_uid517_invPolyEval_b(28 downto 0);
    fxpInverseRes_uid337_z_uid91_fpArctan2Test_b <= fxpInverseRes_uid337_z_uid91_fpArctan2Test_in(28 downto 5);

    -- fxpInverseResFrac_uid339_z_uid91_fpArctan2Test(BITSELECT,338)@26
    fxpInverseResFrac_uid339_z_uid91_fpArctan2Test_in <= fxpInverseRes_uid337_z_uid91_fpArctan2Test_b(22 downto 0);
    fxpInverseResFrac_uid339_z_uid91_fpArctan2Test_b <= fxpInverseResFrac_uid339_z_uid91_fpArctan2Test_in(22 downto 0);

    -- fracRCalc_uid340_z_uid91_fpArctan2Test(MUX,339)@26 + 1
    fracRCalc_uid340_z_uid91_fpArctan2Test_s <= redist40_fracXIsZero_uid324_z_uid91_fpArctan2Test_q_9_q;
    fracRCalc_uid340_z_uid91_fpArctan2Test_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRCalc_uid340_z_uid91_fpArctan2Test_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRCalc_uid340_z_uid91_fpArctan2Test_s) IS
                WHEN "0" => fracRCalc_uid340_z_uid91_fpArctan2Test_q <= fxpInverseResFrac_uid339_z_uid91_fpArctan2Test_b;
                WHEN "1" => fracRCalc_uid340_z_uid91_fpArctan2Test_q <= cstZeroWF_uid7_fpArctan2Test_q;
                WHEN OTHERS => fracRCalc_uid340_z_uid91_fpArctan2Test_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- fracRPostExc_uid347_z_uid91_fpArctan2Test(MUX,346)@27
    fracRPostExc_uid347_z_uid91_fpArctan2Test_s <= outMuxSelEnc_uid345_z_uid91_fpArctan2Test_q;
    fracRPostExc_uid347_z_uid91_fpArctan2Test_combproc: PROCESS (fracRPostExc_uid347_z_uid91_fpArctan2Test_s, cstZeroWF_uid7_fpArctan2Test_q, fracRCalc_uid340_z_uid91_fpArctan2Test_q, cstNaNWF_uid51_fpArctan2Test_q)
    BEGIN
        CASE (fracRPostExc_uid347_z_uid91_fpArctan2Test_s) IS
            WHEN "00" => fracRPostExc_uid347_z_uid91_fpArctan2Test_q <= cstZeroWF_uid7_fpArctan2Test_q;
            WHEN "01" => fracRPostExc_uid347_z_uid91_fpArctan2Test_q <= fracRCalc_uid340_z_uid91_fpArctan2Test_q;
            WHEN "10" => fracRPostExc_uid347_z_uid91_fpArctan2Test_q <= cstZeroWF_uid7_fpArctan2Test_q;
            WHEN "11" => fracRPostExc_uid347_z_uid91_fpArctan2Test_q <= cstNaNWF_uid51_fpArctan2Test_q;
            WHEN OTHERS => fracRPostExc_uid347_z_uid91_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid351_z_uid91_fpArctan2Test(BITJOIN,350)@27
    R_uid351_z_uid91_fpArctan2Test_q <= signR_uid350_z_uid91_fpArctan2Test_q & expRPostExc_uid348_z_uid91_fpArctan2Test_q & fracRPostExc_uid347_z_uid91_fpArctan2Test_q;

    -- path2_uid90_fpArctan2Test(COMPARE,89)@26 + 1
    path2_uid90_fpArctan2Test_a <= STD_LOGIC_VECTOR("00" & redist78_expX_uid46_fpArctan2Test_b_1_q);
    path2_uid90_fpArctan2Test_b <= STD_LOGIC_VECTOR("00" & cstBias_uid53_fpArctan2Test_q);
    path2_uid90_fpArctan2Test_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            path2_uid90_fpArctan2Test_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            path2_uid90_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(path2_uid90_fpArctan2Test_a) - UNSIGNED(path2_uid90_fpArctan2Test_b));
        END IF;
    END PROCESS;
    path2_uid90_fpArctan2Test_n(0) <= not (path2_uid90_fpArctan2Test_o(9));

    -- u_uid92_fpArctan2Test(MUX,91)@27
    u_uid92_fpArctan2Test_s <= path2_uid90_fpArctan2Test_n;
    u_uid92_fpArctan2Test_combproc: PROCESS (u_uid92_fpArctan2Test_s, redist42_divR_uid297_div_uid45_fpArctan2Test_q_10_q, R_uid351_z_uid91_fpArctan2Test_q)
    BEGIN
        CASE (u_uid92_fpArctan2Test_s) IS
            WHEN "0" => u_uid92_fpArctan2Test_q <= redist42_divR_uid297_div_uid45_fpArctan2Test_q_10_q;
            WHEN "1" => u_uid92_fpArctan2Test_q <= R_uid351_z_uid91_fpArctan2Test_q;
            WHEN OTHERS => u_uid92_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- expU_uid93_fpArctan2Test_merged_bit_select(BITSELECT,988)@27
    expU_uid93_fpArctan2Test_merged_bit_select_in <= u_uid92_fpArctan2Test_q(30 downto 0);
    expU_uid93_fpArctan2Test_merged_bit_select_b <= expU_uid93_fpArctan2Test_merged_bit_select_in(30 downto 23);
    expU_uid93_fpArctan2Test_merged_bit_select_c <= expU_uid93_fpArctan2Test_merged_bit_select_in(22 downto 0);

    -- redist18_expU_uid93_fpArctan2Test_merged_bit_select_c_1(DELAY,1022)
    redist18_expU_uid93_fpArctan2Test_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expU_uid93_fpArctan2Test_merged_bit_select_c, xout => redist18_expU_uid93_fpArctan2Test_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- oFracU_uid95_fpArctan2Test(BITJOIN,94)@28
    oFracU_uid95_fpArctan2Test_q <= VCC_q & redist18_expU_uid93_fpArctan2Test_merged_bit_select_c_1_q;

    -- mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select(BITSELECT,989)@28
    mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b <= oFracU_uid95_fpArctan2Test_q(17 downto 0);
    mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_c <= oFracU_uid95_fpArctan2Test_q(23 downto 18);

    -- redist16_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_c_11(DELAY,1020)
    redist16_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_c_11 : dspba_delay
    GENERIC MAP ( width => 6, depth => 11, reset_kind => "ASYNC" )
    PORT MAP ( xin => mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_c, xout => redist16_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_c_11_q, clk => clk, aclr => areset );

    -- leftShiftStage1Idx1Rng1_uid864_fxpU_uid107_fpArctan2Test(BITSELECT,863)@28
    leftShiftStage1Idx1Rng1_uid864_fxpU_uid107_fpArctan2Test_in <= leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_mfinal_q(35 downto 0);
    leftShiftStage1Idx1Rng1_uid864_fxpU_uid107_fpArctan2Test_b <= leftShiftStage1Idx1Rng1_uid864_fxpU_uid107_fpArctan2Test_in(35 downto 0);

    -- leftShiftStage1Idx1_uid865_fxpU_uid107_fpArctan2Test(BITJOIN,864)@28
    leftShiftStage1Idx1_uid865_fxpU_uid107_fpArctan2Test_q <= leftShiftStage1Idx1Rng1_uid864_fxpU_uid107_fpArctan2Test_b & GND_q;

    -- cst01pWShift_uid104_fpArctan2Test(CONSTANT,103)
    cst01pWShift_uid104_fpArctan2Test_q <= "0000000000000";

    -- oFracUExt_uid105_fpArctan2Test(BITJOIN,104)@28
    oFracUExt_uid105_fpArctan2Test_q <= cst01pWShift_uid104_fpArctan2Test_q & oFracU_uid95_fpArctan2Test_q;

    -- leftShiftStage0Idx7Rng14_uid859_fxpU_uid107_fpArctan2Test(BITSELECT,858)@28
    leftShiftStage0Idx7Rng14_uid859_fxpU_uid107_fpArctan2Test_in <= oFracUExt_uid105_fpArctan2Test_q(22 downto 0);
    leftShiftStage0Idx7Rng14_uid859_fxpU_uid107_fpArctan2Test_b <= leftShiftStage0Idx7Rng14_uid859_fxpU_uid107_fpArctan2Test_in(22 downto 0);

    -- leftShiftStage0Idx7Pad14_uid858_fxpU_uid107_fpArctan2Test(CONSTANT,857)
    leftShiftStage0Idx7Pad14_uid858_fxpU_uid107_fpArctan2Test_q <= "00000000000000";

    -- leftShiftStage0Idx7_uid860_fxpU_uid107_fpArctan2Test(BITJOIN,859)@28
    leftShiftStage0Idx7_uid860_fxpU_uid107_fpArctan2Test_q <= leftShiftStage0Idx7Rng14_uid859_fxpU_uid107_fpArctan2Test_b & leftShiftStage0Idx7Pad14_uid858_fxpU_uid107_fpArctan2Test_q;

    -- leftShiftStage0Idx6Rng12_uid856_fxpU_uid107_fpArctan2Test(BITSELECT,855)@28
    leftShiftStage0Idx6Rng12_uid856_fxpU_uid107_fpArctan2Test_in <= oFracUExt_uid105_fpArctan2Test_q(24 downto 0);
    leftShiftStage0Idx6Rng12_uid856_fxpU_uid107_fpArctan2Test_b <= leftShiftStage0Idx6Rng12_uid856_fxpU_uid107_fpArctan2Test_in(24 downto 0);

    -- leftShiftStage0Idx6Pad12_uid855_fxpU_uid107_fpArctan2Test(CONSTANT,854)
    leftShiftStage0Idx6Pad12_uid855_fxpU_uid107_fpArctan2Test_q <= "000000000000";

    -- leftShiftStage0Idx6_uid857_fxpU_uid107_fpArctan2Test(BITJOIN,856)@28
    leftShiftStage0Idx6_uid857_fxpU_uid107_fpArctan2Test_q <= leftShiftStage0Idx6Rng12_uid856_fxpU_uid107_fpArctan2Test_b & leftShiftStage0Idx6Pad12_uid855_fxpU_uid107_fpArctan2Test_q;

    -- leftShiftStage0Idx5Rng10_uid853_fxpU_uid107_fpArctan2Test(BITSELECT,852)@28
    leftShiftStage0Idx5Rng10_uid853_fxpU_uid107_fpArctan2Test_in <= oFracUExt_uid105_fpArctan2Test_q(26 downto 0);
    leftShiftStage0Idx5Rng10_uid853_fxpU_uid107_fpArctan2Test_b <= leftShiftStage0Idx5Rng10_uid853_fxpU_uid107_fpArctan2Test_in(26 downto 0);

    -- leftShiftStage0Idx5Pad10_uid852_fxpU_uid107_fpArctan2Test(CONSTANT,851)
    leftShiftStage0Idx5Pad10_uid852_fxpU_uid107_fpArctan2Test_q <= "0000000000";

    -- leftShiftStage0Idx5_uid854_fxpU_uid107_fpArctan2Test(BITJOIN,853)@28
    leftShiftStage0Idx5_uid854_fxpU_uid107_fpArctan2Test_q <= leftShiftStage0Idx5Rng10_uid853_fxpU_uid107_fpArctan2Test_b & leftShiftStage0Idx5Pad10_uid852_fxpU_uid107_fpArctan2Test_q;

    -- leftShiftStage0Idx4Rng8_uid850_fxpU_uid107_fpArctan2Test(BITSELECT,849)@28
    leftShiftStage0Idx4Rng8_uid850_fxpU_uid107_fpArctan2Test_in <= oFracUExt_uid105_fpArctan2Test_q(28 downto 0);
    leftShiftStage0Idx4Rng8_uid850_fxpU_uid107_fpArctan2Test_b <= leftShiftStage0Idx4Rng8_uid850_fxpU_uid107_fpArctan2Test_in(28 downto 0);

    -- leftShiftStage0Idx4_uid851_fxpU_uid107_fpArctan2Test(BITJOIN,850)@28
    leftShiftStage0Idx4_uid851_fxpU_uid107_fpArctan2Test_q <= leftShiftStage0Idx4Rng8_uid850_fxpU_uid107_fpArctan2Test_b & cstAllZWE_uid52_fpArctan2Test_q;

    -- leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_msplit_1(MUX,975)@28
    leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_msplit_1_s <= leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_selLSBs_merged_bit_select_b;
    leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_msplit_1_combproc: PROCESS (leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_msplit_1_s, leftShiftStage0Idx4_uid851_fxpU_uid107_fpArctan2Test_q, leftShiftStage0Idx5_uid854_fxpU_uid107_fpArctan2Test_q, leftShiftStage0Idx6_uid857_fxpU_uid107_fpArctan2Test_q, leftShiftStage0Idx7_uid860_fxpU_uid107_fpArctan2Test_q)
    BEGIN
        CASE (leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_msplit_1_s) IS
            WHEN "00" => leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_msplit_1_q <= leftShiftStage0Idx4_uid851_fxpU_uid107_fpArctan2Test_q;
            WHEN "01" => leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_msplit_1_q <= leftShiftStage0Idx5_uid854_fxpU_uid107_fpArctan2Test_q;
            WHEN "10" => leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_msplit_1_q <= leftShiftStage0Idx6_uid857_fxpU_uid107_fpArctan2Test_q;
            WHEN "11" => leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_msplit_1_q <= leftShiftStage0Idx7_uid860_fxpU_uid107_fpArctan2Test_q;
            WHEN OTHERS => leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_msplit_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage0Idx3Rng6_uid847_fxpU_uid107_fpArctan2Test(BITSELECT,846)@28
    leftShiftStage0Idx3Rng6_uid847_fxpU_uid107_fpArctan2Test_in <= oFracUExt_uid105_fpArctan2Test_q(30 downto 0);
    leftShiftStage0Idx3Rng6_uid847_fxpU_uid107_fpArctan2Test_b <= leftShiftStage0Idx3Rng6_uid847_fxpU_uid107_fpArctan2Test_in(30 downto 0);

    -- rightBottomX_bottomExtension_uid568_pT2_uid373_invPolyEval(CONSTANT,567)
    rightBottomX_bottomExtension_uid568_pT2_uid373_invPolyEval_q <= "000000";

    -- leftShiftStage0Idx3_uid848_fxpU_uid107_fpArctan2Test(BITJOIN,847)@28
    leftShiftStage0Idx3_uid848_fxpU_uid107_fpArctan2Test_q <= leftShiftStage0Idx3Rng6_uid847_fxpU_uid107_fpArctan2Test_b & rightBottomX_bottomExtension_uid568_pT2_uid373_invPolyEval_q;

    -- leftShiftStage0Idx2Rng4_uid844_fxpU_uid107_fpArctan2Test(BITSELECT,843)@28
    leftShiftStage0Idx2Rng4_uid844_fxpU_uid107_fpArctan2Test_in <= oFracUExt_uid105_fpArctan2Test_q(32 downto 0);
    leftShiftStage0Idx2Rng4_uid844_fxpU_uid107_fpArctan2Test_b <= leftShiftStage0Idx2Rng4_uid844_fxpU_uid107_fpArctan2Test_in(32 downto 0);

    -- leftShiftStage0Idx2_uid845_fxpU_uid107_fpArctan2Test(BITJOIN,844)@28
    leftShiftStage0Idx2_uid845_fxpU_uid107_fpArctan2Test_q <= leftShiftStage0Idx2Rng4_uid844_fxpU_uid107_fpArctan2Test_b & topRangeY_bottomExtension_uid535_pT1_uid366_invPolyEval_q;

    -- leftShiftStage0Idx1Rng2_uid841_fxpU_uid107_fpArctan2Test(BITSELECT,840)@28
    leftShiftStage0Idx1Rng2_uid841_fxpU_uid107_fpArctan2Test_in <= oFracUExt_uid105_fpArctan2Test_q(34 downto 0);
    leftShiftStage0Idx1Rng2_uid841_fxpU_uid107_fpArctan2Test_b <= leftShiftStage0Idx1Rng2_uid841_fxpU_uid107_fpArctan2Test_in(34 downto 0);

    -- leftShiftStage0Idx1_uid842_fxpU_uid107_fpArctan2Test(BITJOIN,841)@28
    leftShiftStage0Idx1_uid842_fxpU_uid107_fpArctan2Test_q <= leftShiftStage0Idx1Rng2_uid841_fxpU_uid107_fpArctan2Test_b & padACst_uid167_fpArctan2Test_q;

    -- leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_msplit_0(MUX,974)@28
    leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_msplit_0_s <= leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_selLSBs_merged_bit_select_b;
    leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_msplit_0_combproc: PROCESS (leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_msplit_0_s, oFracUExt_uid105_fpArctan2Test_q, leftShiftStage0Idx1_uid842_fxpU_uid107_fpArctan2Test_q, leftShiftStage0Idx2_uid845_fxpU_uid107_fpArctan2Test_q, leftShiftStage0Idx3_uid848_fxpU_uid107_fpArctan2Test_q)
    BEGIN
        CASE (leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_msplit_0_s) IS
            WHEN "00" => leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_msplit_0_q <= oFracUExt_uid105_fpArctan2Test_q;
            WHEN "01" => leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_msplit_0_q <= leftShiftStage0Idx1_uid842_fxpU_uid107_fpArctan2Test_q;
            WHEN "10" => leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_msplit_0_q <= leftShiftStage0Idx2_uid845_fxpU_uid107_fpArctan2Test_q;
            WHEN "11" => leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_msplit_0_q <= leftShiftStage0Idx3_uid848_fxpU_uid107_fpArctan2Test_q;
            WHEN OTHERS => leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_msplit_0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_selLSBs_merged_bit_select(BITSELECT,1001)@28
    leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_selLSBs_merged_bit_select_b <= leftShiftStageSel3Dto1_uid861_fxpU_uid107_fpArctan2Test_merged_bit_select_b(1 downto 0);
    leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_selLSBs_merged_bit_select_c <= leftShiftStageSel3Dto1_uid861_fxpU_uid107_fpArctan2Test_merged_bit_select_b(2 downto 2);

    -- leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_mfinal(MUX,976)@28
    leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_mfinal_s <= leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_selLSBs_merged_bit_select_c;
    leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_mfinal_combproc: PROCESS (leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_mfinal_s, leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_msplit_0_q, leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_msplit_1_q)
    BEGIN
        CASE (leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_mfinal_s) IS
            WHEN "0" => leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_mfinal_q <= leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_msplit_0_q;
            WHEN "1" => leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_mfinal_q <= leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_msplit_1_q;
            WHEN OTHERS => leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_mfinal_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- zS_uid102_fpArctan2Test(CONSTANT,101)
    zS_uid102_fpArctan2Test_q <= "000000000";

    -- shiftBias_uid98_fpArctan2Test(CONSTANT,97)
    shiftBias_uid98_fpArctan2Test_q <= "01110010";

    -- shiftValue_uid99_fpArctan2Test(SUB,98)@27
    shiftValue_uid99_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & expU_uid93_fpArctan2Test_merged_bit_select_b);
    shiftValue_uid99_fpArctan2Test_b <= STD_LOGIC_VECTOR("0" & shiftBias_uid98_fpArctan2Test_q);
    shiftValue_uid99_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftValue_uid99_fpArctan2Test_a) - UNSIGNED(shiftValue_uid99_fpArctan2Test_b));
    shiftValue_uid99_fpArctan2Test_q <= shiftValue_uid99_fpArctan2Test_o(8 downto 0);

    -- xMSB_uid100_fpArctan2Test(BITSELECT,99)@27
    xMSB_uid100_fpArctan2Test_b <= STD_LOGIC_VECTOR(shiftValue_uid99_fpArctan2Test_q(8 downto 8));

    -- shiftValuePostNeg_uid103_fpArctan2Test(MUX,102)@27
    shiftValuePostNeg_uid103_fpArctan2Test_s <= xMSB_uid100_fpArctan2Test_b;
    shiftValuePostNeg_uid103_fpArctan2Test_combproc: PROCESS (shiftValuePostNeg_uid103_fpArctan2Test_s, shiftValue_uid99_fpArctan2Test_q, zS_uid102_fpArctan2Test_q)
    BEGIN
        CASE (shiftValuePostNeg_uid103_fpArctan2Test_s) IS
            WHEN "0" => shiftValuePostNeg_uid103_fpArctan2Test_q <= shiftValue_uid99_fpArctan2Test_q;
            WHEN "1" => shiftValuePostNeg_uid103_fpArctan2Test_q <= zS_uid102_fpArctan2Test_q;
            WHEN OTHERS => shiftValuePostNeg_uid103_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fxpShifterBits_uid106_fpArctan2Test(BITSELECT,105)@27
    fxpShifterBits_uid106_fpArctan2Test_in <= shiftValuePostNeg_uid103_fpArctan2Test_q(3 downto 0);
    fxpShifterBits_uid106_fpArctan2Test_b <= fxpShifterBits_uid106_fpArctan2Test_in(3 downto 0);

    -- redist69_fxpShifterBits_uid106_fpArctan2Test_b_1(DELAY,1073)
    redist69_fxpShifterBits_uid106_fpArctan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fxpShifterBits_uid106_fpArctan2Test_b, xout => redist69_fxpShifterBits_uid106_fpArctan2Test_b_1_q, clk => clk, aclr => areset );

    -- leftShiftStageSel3Dto1_uid861_fxpU_uid107_fpArctan2Test_merged_bit_select(BITSELECT,990)@28
    leftShiftStageSel3Dto1_uid861_fxpU_uid107_fpArctan2Test_merged_bit_select_b <= redist69_fxpShifterBits_uid106_fpArctan2Test_b_1_q(3 downto 1);
    leftShiftStageSel3Dto1_uid861_fxpU_uid107_fpArctan2Test_merged_bit_select_c <= redist69_fxpShifterBits_uid106_fpArctan2Test_b_1_q(0 downto 0);

    -- leftShiftStage1_uid867_fxpU_uid107_fpArctan2Test(MUX,866)@28
    leftShiftStage1_uid867_fxpU_uid107_fpArctan2Test_s <= leftShiftStageSel3Dto1_uid861_fxpU_uid107_fpArctan2Test_merged_bit_select_c;
    leftShiftStage1_uid867_fxpU_uid107_fpArctan2Test_combproc: PROCESS (leftShiftStage1_uid867_fxpU_uid107_fpArctan2Test_s, leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_mfinal_q, leftShiftStage1Idx1_uid865_fxpU_uid107_fpArctan2Test_q)
    BEGIN
        CASE (leftShiftStage1_uid867_fxpU_uid107_fpArctan2Test_s) IS
            WHEN "0" => leftShiftStage1_uid867_fxpU_uid107_fpArctan2Test_q <= leftShiftStage0_uid862_fxpU_uid107_fpArctan2Test_mfinal_q;
            WHEN "1" => leftShiftStage1_uid867_fxpU_uid107_fpArctan2Test_q <= leftShiftStage1Idx1_uid865_fxpU_uid107_fpArctan2Test_q;
            WHEN OTHERS => leftShiftStage1_uid867_fxpU_uid107_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- y_uid108_fpArctan2Test(BITSELECT,107)@28
    y_uid108_fpArctan2Test_in <= leftShiftStage1_uid867_fxpU_uid107_fpArctan2Test_q(35 downto 0);
    y_uid108_fpArctan2Test_b <= y_uid108_fpArctan2Test_in(35 downto 1);

    -- yAddr_uid110_fpArctan2Test_merged_bit_select(BITSELECT,991)@28
    yAddr_uid110_fpArctan2Test_merged_bit_select_b <= y_uid108_fpArctan2Test_b(34 downto 27);
    yAddr_uid110_fpArctan2Test_merged_bit_select_c <= y_uid108_fpArctan2Test_b(26 downto 9);

    -- memoryC2_uid359_atan2Tables_lutmem(DUALMEM,963)@28 + 2
    -- in j@20000000
    memoryC2_uid359_atan2Tables_lutmem_aa <= yAddr_uid110_fpArctan2Test_merged_bit_select_b;
    memoryC2_uid359_atan2Tables_lutmem_reset0 <= areset;
    memoryC2_uid359_atan2Tables_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 13,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "CORDIC_0002_memoryC2_uid359_atan2Tables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid359_atan2Tables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid359_atan2Tables_lutmem_aa,
        q_a => memoryC2_uid359_atan2Tables_lutmem_ir
    );
    memoryC2_uid359_atan2Tables_lutmem_r <= memoryC2_uid359_atan2Tables_lutmem_ir(12 downto 0);

    -- topRangeY_mergedSignalTM_uid537_pT1_uid366_invPolyEval(BITJOIN,536)@30
    topRangeY_mergedSignalTM_uid537_pT1_uid366_invPolyEval_q <= memoryC2_uid359_atan2Tables_lutmem_r & topRangeY_bottomExtension_uid535_pT1_uid366_invPolyEval_q;

    -- redist13_yAddr_uid110_fpArctan2Test_merged_bit_select_c_2(DELAY,1017)
    redist13_yAddr_uid110_fpArctan2Test_merged_bit_select_c_2 : dspba_delay
    GENERIC MAP ( width => 18, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid110_fpArctan2Test_merged_bit_select_c, xout => redist13_yAddr_uid110_fpArctan2Test_merged_bit_select_c_2_q, clk => clk, aclr => areset );

    -- yT1_uid365_invPolyEval(BITSELECT,364)@30
    yT1_uid365_invPolyEval_b <= redist13_yAddr_uid110_fpArctan2Test_merged_bit_select_c_2_q(17 downto 5);

    -- nx_mergedSignalTM_uid521_pT1_uid366_invPolyEval(BITJOIN,520)@30
    nx_mergedSignalTM_uid521_pT1_uid366_invPolyEval_q <= GND_q & yT1_uid365_invPolyEval_b;

    -- topRangeX_mergedSignalTM_uid533_pT1_uid366_invPolyEval(BITJOIN,532)@30
    topRangeX_mergedSignalTM_uid533_pT1_uid366_invPolyEval_q <= nx_mergedSignalTM_uid521_pT1_uid366_invPolyEval_q & aboveLeftY_bottomExtension_uid424_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q;

    -- sm0_uid539_pT1_uid366_invPolyEval(MULT,538)@30 + 2
    sm0_uid539_pT1_uid366_invPolyEval_a0 <= STD_LOGIC_VECTOR(topRangeX_mergedSignalTM_uid533_pT1_uid366_invPolyEval_q);
    sm0_uid539_pT1_uid366_invPolyEval_b0 <= STD_LOGIC_VECTOR(topRangeY_mergedSignalTM_uid537_pT1_uid366_invPolyEval_q);
    sm0_uid539_pT1_uid366_invPolyEval_reset <= areset;
    sm0_uid539_pT1_uid366_invPolyEval_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 17,
        lpm_widthb => 17,
        lpm_widthp => 34,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm0_uid539_pT1_uid366_invPolyEval_a0,
        datab => sm0_uid539_pT1_uid366_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid539_pT1_uid366_invPolyEval_reset,
        clock => clk,
        result => sm0_uid539_pT1_uid366_invPolyEval_s1
    );
    sm0_uid539_pT1_uid366_invPolyEval_q <= sm0_uid539_pT1_uid366_invPolyEval_s1;

    -- osig_uid540_pT1_uid366_invPolyEval(BITSELECT,539)@32
    osig_uid540_pT1_uid366_invPolyEval_in <= STD_LOGIC_VECTOR(sm0_uid539_pT1_uid366_invPolyEval_q(32 downto 0));
    osig_uid540_pT1_uid366_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid540_pT1_uid366_invPolyEval_in(32 downto 18));

    -- redist11_yAddr_uid110_fpArctan2Test_merged_bit_select_b_2(DELAY,1015)
    redist11_yAddr_uid110_fpArctan2Test_merged_bit_select_b_2 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid110_fpArctan2Test_merged_bit_select_b, xout => redist11_yAddr_uid110_fpArctan2Test_merged_bit_select_b_2_q, clk => clk, aclr => areset );

    -- memoryC1_uid356_atan2Tables_lutmem(DUALMEM,962)@30 + 2
    -- in j@20000000
    memoryC1_uid356_atan2Tables_lutmem_aa <= redist11_yAddr_uid110_fpArctan2Test_merged_bit_select_b_2_q;
    memoryC1_uid356_atan2Tables_lutmem_reset0 <= areset;
    memoryC1_uid356_atan2Tables_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 21,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "CORDIC_0002_memoryC1_uid356_atan2Tables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid356_atan2Tables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid356_atan2Tables_lutmem_aa,
        q_a => memoryC1_uid356_atan2Tables_lutmem_ir
    );
    memoryC1_uid356_atan2Tables_lutmem_r <= memoryC1_uid356_atan2Tables_lutmem_ir(20 downto 0);

    -- cIncludingRoundingBit_uid368_invPolyEval(BITJOIN,367)@32
    cIncludingRoundingBit_uid368_invPolyEval_q <= memoryC1_uid356_atan2Tables_lutmem_r & rndBit_uid367_invPolyEval_q;

    -- ts1_uid370_invPolyEval(ADD,369)@32
    ts1_uid370_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 23 => cIncludingRoundingBit_uid368_invPolyEval_q(22)) & cIncludingRoundingBit_uid368_invPolyEval_q));
    ts1_uid370_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 15 => osig_uid540_pT1_uid366_invPolyEval_b(14)) & osig_uid540_pT1_uid366_invPolyEval_b));
    ts1_uid370_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts1_uid370_invPolyEval_a) + SIGNED(ts1_uid370_invPolyEval_b));
    ts1_uid370_invPolyEval_q <= ts1_uid370_invPolyEval_o(23 downto 0);

    -- s1_uid371_invPolyEval(BITSELECT,370)@32
    s1_uid371_invPolyEval_b <= STD_LOGIC_VECTOR(ts1_uid370_invPolyEval_q(23 downto 1));

    -- redist39_s1_uid371_invPolyEval_b_1(DELAY,1043)
    redist39_s1_uid371_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => s1_uid371_invPolyEval_b, xout => redist39_s1_uid371_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- aboveLeftY_uid582_pT2_uid373_invPolyEval(BITSELECT,581)@33
    aboveLeftY_uid582_pT2_uid373_invPolyEval_in <= redist39_s1_uid371_invPolyEval_b_1_q(14 downto 0);
    aboveLeftY_uid582_pT2_uid373_invPolyEval_b <= aboveLeftY_uid582_pT2_uid373_invPolyEval_in(14 downto 10);

    -- n1_uid590_pT2_uid373_invPolyEval(BITSELECT,589)@33
    n1_uid590_pT2_uid373_invPolyEval_b <= aboveLeftY_uid582_pT2_uid373_invPolyEval_b(4 downto 1);

    -- redist34_n1_uid590_pT2_uid373_invPolyEval_b_2(DELAY,1038)
    redist34_n1_uid590_pT2_uid373_invPolyEval_b_2 : dspba_delay
    GENERIC MAP ( width => 4, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => n1_uid590_pT2_uid373_invPolyEval_b, xout => redist34_n1_uid590_pT2_uid373_invPolyEval_b_2_q, clk => clk, aclr => areset );

    -- redist14_yAddr_uid110_fpArctan2Test_merged_bit_select_c_5(DELAY,1018)
    redist14_yAddr_uid110_fpArctan2Test_merged_bit_select_c_5 : dspba_delay
    GENERIC MAP ( width => 18, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist13_yAddr_uid110_fpArctan2Test_merged_bit_select_c_2_q, xout => redist14_yAddr_uid110_fpArctan2Test_merged_bit_select_c_5_q, clk => clk, aclr => areset );

    -- nx_mergedSignalTM_uid544_pT2_uid373_invPolyEval(BITJOIN,543)@33
    nx_mergedSignalTM_uid544_pT2_uid373_invPolyEval_q <= GND_q & redist14_yAddr_uid110_fpArctan2Test_merged_bit_select_c_5_q;

    -- rightBottomX_bottomRange_uid569_pT2_uid373_invPolyEval(BITSELECT,568)@33
    rightBottomX_bottomRange_uid569_pT2_uid373_invPolyEval_in <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid544_pT2_uid373_invPolyEval_q(1 downto 0));
    rightBottomX_bottomRange_uid569_pT2_uid373_invPolyEval_b <= STD_LOGIC_VECTOR(rightBottomX_bottomRange_uid569_pT2_uid373_invPolyEval_in(1 downto 0));

    -- redist35_rightBottomX_bottomRange_uid569_pT2_uid373_invPolyEval_b_2(DELAY,1039)
    redist35_rightBottomX_bottomRange_uid569_pT2_uid373_invPolyEval_b_2 : dspba_delay
    GENERIC MAP ( width => 2, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightBottomX_bottomRange_uid569_pT2_uid373_invPolyEval_b, xout => redist35_rightBottomX_bottomRange_uid569_pT2_uid373_invPolyEval_b_2_q, clk => clk, aclr => areset );

    -- aboveLeftX_mergedSignalTM_uid580_pT2_uid373_invPolyEval(BITJOIN,579)@35
    aboveLeftX_mergedSignalTM_uid580_pT2_uid373_invPolyEval_q <= redist35_rightBottomX_bottomRange_uid569_pT2_uid373_invPolyEval_b_2_q & aboveLeftY_bottomExtension_uid424_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q;

    -- n0_uid591_pT2_uid373_invPolyEval(BITSELECT,590)@35
    n0_uid591_pT2_uid373_invPolyEval_b <= aboveLeftX_mergedSignalTM_uid580_pT2_uid373_invPolyEval_q(4 downto 1);

    -- sm1_uid606_pT2_uid373_invPolyEval(MULT,605)@35 + 2
    sm1_uid606_pT2_uid373_invPolyEval_a0 <= n0_uid591_pT2_uid373_invPolyEval_b;
    sm1_uid606_pT2_uid373_invPolyEval_b0 <= redist34_n1_uid590_pT2_uid373_invPolyEval_b_2_q;
    sm1_uid606_pT2_uid373_invPolyEval_reset <= areset;
    sm1_uid606_pT2_uid373_invPolyEval_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 4,
        lpm_widthb => 4,
        lpm_widthp => 8,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=NO, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm1_uid606_pT2_uid373_invPolyEval_a0,
        datab => sm1_uid606_pT2_uid373_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm1_uid606_pT2_uid373_invPolyEval_reset,
        clock => clk,
        result => sm1_uid606_pT2_uid373_invPolyEval_s1
    );
    sm1_uid606_pT2_uid373_invPolyEval_q <= sm1_uid606_pT2_uid373_invPolyEval_s1;

    -- rightBottomY_uid577_pT2_uid373_invPolyEval(BITSELECT,576)@33
    rightBottomY_uid577_pT2_uid373_invPolyEval_in <= redist39_s1_uid371_invPolyEval_b_1_q(5 downto 0);
    rightBottomY_uid577_pT2_uid373_invPolyEval_b <= rightBottomY_uid577_pT2_uid373_invPolyEval_in(5 downto 1);

    -- n1_uid588_pT2_uid373_invPolyEval(BITSELECT,587)@33
    n1_uid588_pT2_uid373_invPolyEval_b <= rightBottomY_uid577_pT2_uid373_invPolyEval_b(4 downto 1);

    -- rightBottomX_uid576_pT2_uid373_invPolyEval(BITSELECT,575)@33
    rightBottomX_uid576_pT2_uid373_invPolyEval_in <= nx_mergedSignalTM_uid544_pT2_uid373_invPolyEval_q(10 downto 0);
    rightBottomX_uid576_pT2_uid373_invPolyEval_b <= rightBottomX_uid576_pT2_uid373_invPolyEval_in(10 downto 6);

    -- n0_uid589_pT2_uid373_invPolyEval(BITSELECT,588)@33
    n0_uid589_pT2_uid373_invPolyEval_b <= rightBottomX_uid576_pT2_uid373_invPolyEval_b(4 downto 1);

    -- sm0_uid605_pT2_uid373_invPolyEval(MULT,604)@33 + 2
    sm0_uid605_pT2_uid373_invPolyEval_a0 <= n0_uid589_pT2_uid373_invPolyEval_b;
    sm0_uid605_pT2_uid373_invPolyEval_b0 <= n1_uid588_pT2_uid373_invPolyEval_b;
    sm0_uid605_pT2_uid373_invPolyEval_reset <= areset;
    sm0_uid605_pT2_uid373_invPolyEval_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 4,
        lpm_widthb => 4,
        lpm_widthp => 8,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=NO, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm0_uid605_pT2_uid373_invPolyEval_a0,
        datab => sm0_uid605_pT2_uid373_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid605_pT2_uid373_invPolyEval_reset,
        clock => clk,
        result => sm0_uid605_pT2_uid373_invPolyEval_s1
    );
    sm0_uid605_pT2_uid373_invPolyEval_q <= sm0_uid605_pT2_uid373_invPolyEval_s1;

    -- rightBottomY_uid572_pT2_uid373_invPolyEval(BITSELECT,571)@33
    rightBottomY_uid572_pT2_uid373_invPolyEval_b <= STD_LOGIC_VECTOR(redist39_s1_uid371_invPolyEval_b_1_q(22 downto 15));

    -- rightBottomX_mergedSignalTM_uid570_pT2_uid373_invPolyEval(BITJOIN,569)@33
    rightBottomX_mergedSignalTM_uid570_pT2_uid373_invPolyEval_q <= rightBottomX_bottomRange_uid569_pT2_uid373_invPolyEval_b & rightBottomX_bottomExtension_uid568_pT2_uid373_invPolyEval_q;

    -- sm1_uid604_pT2_uid373_invPolyEval(MULT,603)@33 + 2
    sm1_uid604_pT2_uid373_invPolyEval_a0 <= '0' & rightBottomX_mergedSignalTM_uid570_pT2_uid373_invPolyEval_q;
    sm1_uid604_pT2_uid373_invPolyEval_b0 <= STD_LOGIC_VECTOR(rightBottomY_uid572_pT2_uid373_invPolyEval_b);
    sm1_uid604_pT2_uid373_invPolyEval_reset <= areset;
    sm1_uid604_pT2_uid373_invPolyEval_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 9,
        lpm_widthb => 8,
        lpm_widthp => 17,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm1_uid604_pT2_uid373_invPolyEval_a0,
        datab => sm1_uid604_pT2_uid373_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm1_uid604_pT2_uid373_invPolyEval_reset,
        clock => clk,
        result => sm1_uid604_pT2_uid373_invPolyEval_s1
    );
    sm1_uid604_pT2_uid373_invPolyEval_q <= sm1_uid604_pT2_uid373_invPolyEval_s1(15 downto 0);

    -- lev1_a1_uid611_pT2_uid373_invPolyEval(ADD,610)@35 + 1
    lev1_a1_uid611_pT2_uid373_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => sm1_uid604_pT2_uid373_invPolyEval_q(15)) & sm1_uid604_pT2_uid373_invPolyEval_q));
    lev1_a1_uid611_pT2_uid373_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000000000" & sm0_uid605_pT2_uid373_invPolyEval_q));
    lev1_a1_uid611_pT2_uid373_invPolyEval_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            lev1_a1_uid611_pT2_uid373_invPolyEval_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            lev1_a1_uid611_pT2_uid373_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a1_uid611_pT2_uid373_invPolyEval_a) + SIGNED(lev1_a1_uid611_pT2_uid373_invPolyEval_b));
        END IF;
    END PROCESS;
    lev1_a1_uid611_pT2_uid373_invPolyEval_q <= lev1_a1_uid611_pT2_uid373_invPolyEval_o(16 downto 0);

    -- aboveLeftY_bottomRange_uid565_pT2_uid373_invPolyEval(BITSELECT,564)@33
    aboveLeftY_bottomRange_uid565_pT2_uid373_invPolyEval_in <= STD_LOGIC_VECTOR(redist39_s1_uid371_invPolyEval_b_1_q(5 downto 0));
    aboveLeftY_bottomRange_uid565_pT2_uid373_invPolyEval_b <= STD_LOGIC_VECTOR(aboveLeftY_bottomRange_uid565_pT2_uid373_invPolyEval_in(5 downto 0));

    -- aboveLeftY_mergedSignalTM_uid566_pT2_uid373_invPolyEval(BITJOIN,565)@33
    aboveLeftY_mergedSignalTM_uid566_pT2_uid373_invPolyEval_q <= aboveLeftY_bottomRange_uid565_pT2_uid373_invPolyEval_b & padACst_uid167_fpArctan2Test_q;

    -- aboveLeftX_uid563_pT2_uid373_invPolyEval(BITSELECT,562)@33
    aboveLeftX_uid563_pT2_uid373_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid544_pT2_uid373_invPolyEval_q(18 downto 11));

    -- sm0_uid603_pT2_uid373_invPolyEval(MULT,602)@33 + 2
    sm0_uid603_pT2_uid373_invPolyEval_a0 <= STD_LOGIC_VECTOR(aboveLeftX_uid563_pT2_uid373_invPolyEval_b);
    sm0_uid603_pT2_uid373_invPolyEval_b0 <= '0' & aboveLeftY_mergedSignalTM_uid566_pT2_uid373_invPolyEval_q;
    sm0_uid603_pT2_uid373_invPolyEval_reset <= areset;
    sm0_uid603_pT2_uid373_invPolyEval_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 9,
        lpm_widthp => 17,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm0_uid603_pT2_uid373_invPolyEval_a0,
        datab => sm0_uid603_pT2_uid373_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid603_pT2_uid373_invPolyEval_reset,
        clock => clk,
        result => sm0_uid603_pT2_uid373_invPolyEval_s1
    );
    sm0_uid603_pT2_uid373_invPolyEval_q <= sm0_uid603_pT2_uid373_invPolyEval_s1(15 downto 0);

    -- topRangeY_uid555_pT2_uid373_invPolyEval(BITSELECT,554)@33
    topRangeY_uid555_pT2_uid373_invPolyEval_b <= STD_LOGIC_VECTOR(redist39_s1_uid371_invPolyEval_b_1_q(22 downto 6));

    -- topRangeX_uid554_pT2_uid373_invPolyEval(BITSELECT,553)@33
    topRangeX_uid554_pT2_uid373_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid544_pT2_uid373_invPolyEval_q(18 downto 2));

    -- sm0_uid602_pT2_uid373_invPolyEval(MULT,601)@33 + 2
    sm0_uid602_pT2_uid373_invPolyEval_a0 <= STD_LOGIC_VECTOR(topRangeX_uid554_pT2_uid373_invPolyEval_b);
    sm0_uid602_pT2_uid373_invPolyEval_b0 <= STD_LOGIC_VECTOR(topRangeY_uid555_pT2_uid373_invPolyEval_b);
    sm0_uid602_pT2_uid373_invPolyEval_reset <= areset;
    sm0_uid602_pT2_uid373_invPolyEval_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 17,
        lpm_widthb => 17,
        lpm_widthp => 34,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => sm0_uid602_pT2_uid373_invPolyEval_a0,
        datab => sm0_uid602_pT2_uid373_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid602_pT2_uid373_invPolyEval_reset,
        clock => clk,
        result => sm0_uid602_pT2_uid373_invPolyEval_s1
    );
    sm0_uid602_pT2_uid373_invPolyEval_q <= sm0_uid602_pT2_uid373_invPolyEval_s1;

    -- highABits_uid608_pT2_uid373_invPolyEval(BITSELECT,607)@35
    highABits_uid608_pT2_uid373_invPolyEval_b <= STD_LOGIC_VECTOR(sm0_uid602_pT2_uid373_invPolyEval_q(33 downto 1));

    -- lev1_a0high_uid609_pT2_uid373_invPolyEval(ADD,608)@35 + 1
    lev1_a0high_uid609_pT2_uid373_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 33 => highABits_uid608_pT2_uid373_invPolyEval_b(32)) & highABits_uid608_pT2_uid373_invPolyEval_b));
    lev1_a0high_uid609_pT2_uid373_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 16 => sm0_uid603_pT2_uid373_invPolyEval_q(15)) & sm0_uid603_pT2_uid373_invPolyEval_q));
    lev1_a0high_uid609_pT2_uid373_invPolyEval_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            lev1_a0high_uid609_pT2_uid373_invPolyEval_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            lev1_a0high_uid609_pT2_uid373_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0high_uid609_pT2_uid373_invPolyEval_a) + SIGNED(lev1_a0high_uid609_pT2_uid373_invPolyEval_b));
        END IF;
    END PROCESS;
    lev1_a0high_uid609_pT2_uid373_invPolyEval_q <= lev1_a0high_uid609_pT2_uid373_invPolyEval_o(33 downto 0);

    -- lowRangeA_uid607_pT2_uid373_invPolyEval(BITSELECT,606)@35
    lowRangeA_uid607_pT2_uid373_invPolyEval_in <= sm0_uid602_pT2_uid373_invPolyEval_q(0 downto 0);
    lowRangeA_uid607_pT2_uid373_invPolyEval_b <= lowRangeA_uid607_pT2_uid373_invPolyEval_in(0 downto 0);

    -- redist33_lowRangeA_uid607_pT2_uid373_invPolyEval_b_1(DELAY,1037)
    redist33_lowRangeA_uid607_pT2_uid373_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => lowRangeA_uid607_pT2_uid373_invPolyEval_b, xout => redist33_lowRangeA_uid607_pT2_uid373_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- lev1_a0_uid610_pT2_uid373_invPolyEval(BITJOIN,609)@36
    lev1_a0_uid610_pT2_uid373_invPolyEval_q <= lev1_a0high_uid609_pT2_uid373_invPolyEval_q & redist33_lowRangeA_uid607_pT2_uid373_invPolyEval_b_1_q;

    -- highABits_uid613_pT2_uid373_invPolyEval(BITSELECT,612)@36
    highABits_uid613_pT2_uid373_invPolyEval_b <= STD_LOGIC_VECTOR(lev1_a0_uid610_pT2_uid373_invPolyEval_q(34 downto 1));

    -- lev2_a0high_uid614_pT2_uid373_invPolyEval(ADD,613)@36
    lev2_a0high_uid614_pT2_uid373_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 34 => highABits_uid613_pT2_uid373_invPolyEval_b(33)) & highABits_uid613_pT2_uid373_invPolyEval_b));
    lev2_a0high_uid614_pT2_uid373_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 17 => lev1_a1_uid611_pT2_uid373_invPolyEval_q(16)) & lev1_a1_uid611_pT2_uid373_invPolyEval_q));
    lev2_a0high_uid614_pT2_uid373_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev2_a0high_uid614_pT2_uid373_invPolyEval_a) + SIGNED(lev2_a0high_uid614_pT2_uid373_invPolyEval_b));
    lev2_a0high_uid614_pT2_uid373_invPolyEval_q <= lev2_a0high_uid614_pT2_uid373_invPolyEval_o(34 downto 0);

    -- lowRangeA_uid612_pT2_uid373_invPolyEval(BITSELECT,611)@36
    lowRangeA_uid612_pT2_uid373_invPolyEval_in <= lev1_a0_uid610_pT2_uid373_invPolyEval_q(0 downto 0);
    lowRangeA_uid612_pT2_uid373_invPolyEval_b <= lowRangeA_uid612_pT2_uid373_invPolyEval_in(0 downto 0);

    -- lev2_a0_uid615_pT2_uid373_invPolyEval(BITJOIN,614)@36
    lev2_a0_uid615_pT2_uid373_invPolyEval_q <= lev2_a0high_uid614_pT2_uid373_invPolyEval_q & lowRangeA_uid612_pT2_uid373_invPolyEval_b;

    -- highABits_uid617_pT2_uid373_invPolyEval(BITSELECT,616)@36
    highABits_uid617_pT2_uid373_invPolyEval_b <= STD_LOGIC_VECTOR(lev2_a0_uid615_pT2_uid373_invPolyEval_q(35 downto 1));

    -- redist31_highABits_uid617_pT2_uid373_invPolyEval_b_1(DELAY,1035)
    redist31_highABits_uid617_pT2_uid373_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 35, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => highABits_uid617_pT2_uid373_invPolyEval_b, xout => redist31_highABits_uid617_pT2_uid373_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- lev3_a0high_uid618_pT2_uid373_invPolyEval(ADD,617)@37
    lev3_a0high_uid618_pT2_uid373_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 35 => redist31_highABits_uid617_pT2_uid373_invPolyEval_b_1_q(34)) & redist31_highABits_uid617_pT2_uid373_invPolyEval_b_1_q));
    lev3_a0high_uid618_pT2_uid373_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000000000000000000000" & sm1_uid606_pT2_uid373_invPolyEval_q));
    lev3_a0high_uid618_pT2_uid373_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev3_a0high_uid618_pT2_uid373_invPolyEval_a) + SIGNED(lev3_a0high_uid618_pT2_uid373_invPolyEval_b));
    lev3_a0high_uid618_pT2_uid373_invPolyEval_q <= lev3_a0high_uid618_pT2_uid373_invPolyEval_o(35 downto 0);

    -- lowRangeA_uid616_pT2_uid373_invPolyEval(BITSELECT,615)@36
    lowRangeA_uid616_pT2_uid373_invPolyEval_in <= lev2_a0_uid615_pT2_uid373_invPolyEval_q(0 downto 0);
    lowRangeA_uid616_pT2_uid373_invPolyEval_b <= lowRangeA_uid616_pT2_uid373_invPolyEval_in(0 downto 0);

    -- redist32_lowRangeA_uid616_pT2_uid373_invPolyEval_b_1(DELAY,1036)
    redist32_lowRangeA_uid616_pT2_uid373_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => lowRangeA_uid616_pT2_uid373_invPolyEval_b, xout => redist32_lowRangeA_uid616_pT2_uid373_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- lev3_a0_uid619_pT2_uid373_invPolyEval(BITJOIN,618)@37
    lev3_a0_uid619_pT2_uid373_invPolyEval_q <= lev3_a0high_uid618_pT2_uid373_invPolyEval_q & redist32_lowRangeA_uid616_pT2_uid373_invPolyEval_b_1_q;

    -- osig_uid620_pT2_uid373_invPolyEval(BITSELECT,619)@37
    osig_uid620_pT2_uid373_invPolyEval_in <= STD_LOGIC_VECTOR(lev3_a0_uid619_pT2_uid373_invPolyEval_q(32 downto 0));
    osig_uid620_pT2_uid373_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid620_pT2_uid373_invPolyEval_in(32 downto 8));

    -- redist30_osig_uid620_pT2_uid373_invPolyEval_b_1(DELAY,1034)
    redist30_osig_uid620_pT2_uid373_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 25, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => osig_uid620_pT2_uid373_invPolyEval_b, xout => redist30_osig_uid620_pT2_uid373_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- redist12_yAddr_uid110_fpArctan2Test_merged_bit_select_b_8(DELAY,1016)
    redist12_yAddr_uid110_fpArctan2Test_merged_bit_select_b_8 : dspba_delay
    GENERIC MAP ( width => 8, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist11_yAddr_uid110_fpArctan2Test_merged_bit_select_b_2_q, xout => redist12_yAddr_uid110_fpArctan2Test_merged_bit_select_b_8_q, clk => clk, aclr => areset );

    -- memoryC0_uid353_atan2Tables_lutmem(DUALMEM,961)@36 + 2
    -- in j@20000000
    memoryC0_uid353_atan2Tables_lutmem_aa <= redist12_yAddr_uid110_fpArctan2Test_merged_bit_select_b_8_q;
    memoryC0_uid353_atan2Tables_lutmem_reset0 <= areset;
    memoryC0_uid353_atan2Tables_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 31,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "CORDIC_0002_memoryC0_uid353_atan2Tables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid353_atan2Tables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid353_atan2Tables_lutmem_aa,
        q_a => memoryC0_uid353_atan2Tables_lutmem_ir
    );
    memoryC0_uid353_atan2Tables_lutmem_r <= memoryC0_uid353_atan2Tables_lutmem_ir(30 downto 0);

    -- cIncludingRoundingBit_uid375_invPolyEval(BITJOIN,374)@38
    cIncludingRoundingBit_uid375_invPolyEval_q <= memoryC0_uid353_atan2Tables_lutmem_r & rndBit_uid374_invPolyEval_q;

    -- ts2_uid377_invPolyEval(ADD,376)@38
    ts2_uid377_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 34 => cIncludingRoundingBit_uid375_invPolyEval_q(33)) & cIncludingRoundingBit_uid375_invPolyEval_q));
    ts2_uid377_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 25 => redist30_osig_uid620_pT2_uid373_invPolyEval_b_1_q(24)) & redist30_osig_uid620_pT2_uid373_invPolyEval_b_1_q));
    ts2_uid377_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts2_uid377_invPolyEval_a) + SIGNED(ts2_uid377_invPolyEval_b));
    ts2_uid377_invPolyEval_q <= ts2_uid377_invPolyEval_o(34 downto 0);

    -- s2_uid378_invPolyEval(BITSELECT,377)@38
    s2_uid378_invPolyEval_b <= STD_LOGIC_VECTOR(ts2_uid377_invPolyEval_q(34 downto 1));

    -- fxpAtanXOXRes_uid113_fpArctan2Test(BITSELECT,112)@38
    fxpAtanXOXRes_uid113_fpArctan2Test_in <= s2_uid378_invPolyEval_b(31 downto 0);
    fxpAtanXOXRes_uid113_fpArctan2Test_b <= fxpAtanXOXRes_uid113_fpArctan2Test_in(31 downto 5);

    -- redist68_fxpAtanXOXRes_uid113_fpArctan2Test_b_1(DELAY,1072)
    redist68_fxpAtanXOXRes_uid113_fpArctan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fxpAtanXOXRes_uid113_fpArctan2Test_b, xout => redist68_fxpAtanXOXRes_uid113_fpArctan2Test_b_1_q, clk => clk, aclr => areset );

    -- mulXAtanXOXRes_uid114_fpArctan2Test_bs2_merged_bit_select(BITSELECT,992)@39
    mulXAtanXOXRes_uid114_fpArctan2Test_bs2_merged_bit_select_b <= redist68_fxpAtanXOXRes_uid113_fpArctan2Test_b_1_q(17 downto 0);
    mulXAtanXOXRes_uid114_fpArctan2Test_bs2_merged_bit_select_c <= redist68_fxpAtanXOXRes_uid113_fpArctan2Test_b_1_q(26 downto 18);

    -- mulXAtanXOXRes_uid114_fpArctan2Test_im6(MULT,874)@39 + 2
    mulXAtanXOXRes_uid114_fpArctan2Test_im6_a0 <= mulXAtanXOXRes_uid114_fpArctan2Test_bs2_merged_bit_select_b;
    mulXAtanXOXRes_uid114_fpArctan2Test_im6_b0 <= redist16_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_c_11_q;
    mulXAtanXOXRes_uid114_fpArctan2Test_im6_reset <= areset;
    mulXAtanXOXRes_uid114_fpArctan2Test_im6_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 6,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => mulXAtanXOXRes_uid114_fpArctan2Test_im6_a0,
        datab => mulXAtanXOXRes_uid114_fpArctan2Test_im6_b0,
        clken => VCC_q(0),
        aclr => mulXAtanXOXRes_uid114_fpArctan2Test_im6_reset,
        clock => clk,
        result => mulXAtanXOXRes_uid114_fpArctan2Test_im6_s1
    );
    mulXAtanXOXRes_uid114_fpArctan2Test_im6_q <= mulXAtanXOXRes_uid114_fpArctan2Test_im6_s1;

    -- redist19_mulXAtanXOXRes_uid114_fpArctan2Test_im6_q_1(DELAY,1023)
    redist19_mulXAtanXOXRes_uid114_fpArctan2Test_im6_q_1 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => mulXAtanXOXRes_uid114_fpArctan2Test_im6_q, xout => redist19_mulXAtanXOXRes_uid114_fpArctan2Test_im6_q_1_q, clk => clk, aclr => areset );

    -- mulXAtanXOXRes_uid114_fpArctan2Test_align_15(BITSHIFT,883)@42
    mulXAtanXOXRes_uid114_fpArctan2Test_align_15_qint <= redist19_mulXAtanXOXRes_uid114_fpArctan2Test_im6_q_1_q & "000000000000000000";
    mulXAtanXOXRes_uid114_fpArctan2Test_align_15_q <= mulXAtanXOXRes_uid114_fpArctan2Test_align_15_qint(41 downto 0);

    -- redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_notEnable(LOGICAL,1105)
    redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_nor(LOGICAL,1106)
    redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_nor_q <= not (redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_notEnable_q or redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_sticky_ena_q);

    -- redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_mem_last(CONSTANT,1102)
    redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_mem_last_q <= "0111";

    -- redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_cmp(LOGICAL,1103)
    redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_cmp_q <= "1" WHEN redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_mem_last_q = redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_rdcnt_q ELSE "0";

    -- redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_cmpReg(REG,1104)
    redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_cmpReg_q <= STD_LOGIC_VECTOR(redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_cmp_q);
        END IF;
    END PROCESS;

    -- redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_sticky_ena(REG,1107)
    redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_nor_q = "1") THEN
                redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_sticky_ena_q <= STD_LOGIC_VECTOR(redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_enaAnd(LOGICAL,1108)
    redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_enaAnd_q <= redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_sticky_ena_q and VCC_q;

    -- redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_rdcnt(COUNTER,1100)
    -- low=0, high=8, step=1, init=0
    redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_rdcnt_i <= TO_UNSIGNED(0, 4);
            redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_rdcnt_i = TO_UNSIGNED(7, 4)) THEN
                redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_rdcnt_eq <= '1';
            ELSE
                redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_rdcnt_eq <= '0';
            END IF;
            IF (redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_rdcnt_eq = '1') THEN
                redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_rdcnt_i <= redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_rdcnt_i + 8;
            ELSE
                redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_rdcnt_i <= redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_rdcnt_i, 4)));

    -- redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_inputreg(DELAY,1098)
    redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_inputreg : dspba_delay
    GENERIC MAP ( width => 18, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b, xout => redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_inputreg_q, clk => clk, aclr => areset );

    -- redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_wraddr(REG,1101)
    redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_wraddr_q <= "1000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_wraddr_q <= STD_LOGIC_VECTOR(redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_mem(DUALMEM,1099)
    redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_mem_ia <= STD_LOGIC_VECTOR(redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_inputreg_q);
    redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_mem_aa <= redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_wraddr_q;
    redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_mem_ab <= redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_rdcnt_q;
    redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_mem_reset0 <= areset;
    redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 18,
        widthad_a => 4,
        numwords_a => 9,
        width_b => 18,
        widthad_b => 4,
        numwords_b => 9,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken1 => redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_mem_reset0,
        clock1 => clk,
        address_a => redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_mem_aa,
        data_a => redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_mem_ab,
        q_b => redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_mem_iq
    );
    redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_mem_q <= redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_mem_iq(17 downto 0);

    -- mulXAtanXOXRes_uid114_fpArctan2Test_im3(MULT,871)@39 + 2
    mulXAtanXOXRes_uid114_fpArctan2Test_im3_a0 <= redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_mem_q;
    mulXAtanXOXRes_uid114_fpArctan2Test_im3_b0 <= mulXAtanXOXRes_uid114_fpArctan2Test_bs2_merged_bit_select_c;
    mulXAtanXOXRes_uid114_fpArctan2Test_im3_reset <= areset;
    mulXAtanXOXRes_uid114_fpArctan2Test_im3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 9,
        lpm_widthp => 27,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => mulXAtanXOXRes_uid114_fpArctan2Test_im3_a0,
        datab => mulXAtanXOXRes_uid114_fpArctan2Test_im3_b0,
        clken => VCC_q(0),
        aclr => mulXAtanXOXRes_uid114_fpArctan2Test_im3_reset,
        clock => clk,
        result => mulXAtanXOXRes_uid114_fpArctan2Test_im3_s1
    );
    mulXAtanXOXRes_uid114_fpArctan2Test_im3_q <= mulXAtanXOXRes_uid114_fpArctan2Test_im3_s1;

    -- mulXAtanXOXRes_uid114_fpArctan2Test_align_13(BITSHIFT,881)@41
    mulXAtanXOXRes_uid114_fpArctan2Test_align_13_qint <= mulXAtanXOXRes_uid114_fpArctan2Test_im3_q & "000000000000000000";
    mulXAtanXOXRes_uid114_fpArctan2Test_align_13_q <= mulXAtanXOXRes_uid114_fpArctan2Test_align_13_qint(44 downto 0);

    -- mulXAtanXOXRes_uid114_fpArctan2Test_im9(MULT,877)@39 + 2
    mulXAtanXOXRes_uid114_fpArctan2Test_im9_a0 <= mulXAtanXOXRes_uid114_fpArctan2Test_bs2_merged_bit_select_c;
    mulXAtanXOXRes_uid114_fpArctan2Test_im9_b0 <= redist16_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_c_11_q;
    mulXAtanXOXRes_uid114_fpArctan2Test_im9_reset <= areset;
    mulXAtanXOXRes_uid114_fpArctan2Test_im9_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 9,
        lpm_widthb => 6,
        lpm_widthp => 15,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => mulXAtanXOXRes_uid114_fpArctan2Test_im9_a0,
        datab => mulXAtanXOXRes_uid114_fpArctan2Test_im9_b0,
        clken => VCC_q(0),
        aclr => mulXAtanXOXRes_uid114_fpArctan2Test_im9_reset,
        clock => clk,
        result => mulXAtanXOXRes_uid114_fpArctan2Test_im9_s1
    );
    mulXAtanXOXRes_uid114_fpArctan2Test_im9_q <= mulXAtanXOXRes_uid114_fpArctan2Test_im9_s1;

    -- mulXAtanXOXRes_uid114_fpArctan2Test_im0(MULT,868)@39 + 2
    mulXAtanXOXRes_uid114_fpArctan2Test_im0_a0 <= redist15_mulXAtanXOXRes_uid114_fpArctan2Test_bs1_merged_bit_select_b_11_mem_q;
    mulXAtanXOXRes_uid114_fpArctan2Test_im0_b0 <= mulXAtanXOXRes_uid114_fpArctan2Test_bs2_merged_bit_select_b;
    mulXAtanXOXRes_uid114_fpArctan2Test_im0_reset <= areset;
    mulXAtanXOXRes_uid114_fpArctan2Test_im0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 18,
        lpm_widthp => 36,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => mulXAtanXOXRes_uid114_fpArctan2Test_im0_a0,
        datab => mulXAtanXOXRes_uid114_fpArctan2Test_im0_b0,
        clken => VCC_q(0),
        aclr => mulXAtanXOXRes_uid114_fpArctan2Test_im0_reset,
        clock => clk,
        result => mulXAtanXOXRes_uid114_fpArctan2Test_im0_s1
    );
    mulXAtanXOXRes_uid114_fpArctan2Test_im0_q <= mulXAtanXOXRes_uid114_fpArctan2Test_im0_s1;

    -- mulXAtanXOXRes_uid114_fpArctan2Test_join_12(BITJOIN,880)@41
    mulXAtanXOXRes_uid114_fpArctan2Test_join_12_q <= mulXAtanXOXRes_uid114_fpArctan2Test_im9_q & mulXAtanXOXRes_uid114_fpArctan2Test_im0_q;

    -- mulXAtanXOXRes_uid114_fpArctan2Test_result_add_0_0(ADD,885)@41 + 1
    mulXAtanXOXRes_uid114_fpArctan2Test_result_add_0_0_a <= STD_LOGIC_VECTOR("0" & mulXAtanXOXRes_uid114_fpArctan2Test_join_12_q);
    mulXAtanXOXRes_uid114_fpArctan2Test_result_add_0_0_b <= STD_LOGIC_VECTOR("0000000" & mulXAtanXOXRes_uid114_fpArctan2Test_align_13_q);
    mulXAtanXOXRes_uid114_fpArctan2Test_result_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mulXAtanXOXRes_uid114_fpArctan2Test_result_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            mulXAtanXOXRes_uid114_fpArctan2Test_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(mulXAtanXOXRes_uid114_fpArctan2Test_result_add_0_0_a) + UNSIGNED(mulXAtanXOXRes_uid114_fpArctan2Test_result_add_0_0_b));
        END IF;
    END PROCESS;
    mulXAtanXOXRes_uid114_fpArctan2Test_result_add_0_0_q <= mulXAtanXOXRes_uid114_fpArctan2Test_result_add_0_0_o(51 downto 0);

    -- mulXAtanXOXRes_uid114_fpArctan2Test_result_add_1_0(ADD,886)@42
    mulXAtanXOXRes_uid114_fpArctan2Test_result_add_1_0_a <= STD_LOGIC_VECTOR("0" & mulXAtanXOXRes_uid114_fpArctan2Test_result_add_0_0_q);
    mulXAtanXOXRes_uid114_fpArctan2Test_result_add_1_0_b <= STD_LOGIC_VECTOR("00000000000" & mulXAtanXOXRes_uid114_fpArctan2Test_align_15_q);
    mulXAtanXOXRes_uid114_fpArctan2Test_result_add_1_0_o <= STD_LOGIC_VECTOR(UNSIGNED(mulXAtanXOXRes_uid114_fpArctan2Test_result_add_1_0_a) + UNSIGNED(mulXAtanXOXRes_uid114_fpArctan2Test_result_add_1_0_b));
    mulXAtanXOXRes_uid114_fpArctan2Test_result_add_1_0_q <= mulXAtanXOXRes_uid114_fpArctan2Test_result_add_1_0_o(52 downto 0);

    -- normBit_uid115_fpArctan2Test(BITSELECT,114)@42
    normBit_uid115_fpArctan2Test_in <= STD_LOGIC_VECTOR(mulXAtanXOXRes_uid114_fpArctan2Test_result_add_1_0_q(49 downto 0));
    normBit_uid115_fpArctan2Test_b <= STD_LOGIC_VECTOR(normBit_uid115_fpArctan2Test_in(49 downto 49));

    -- redist67_normBit_uid115_fpArctan2Test_b_1(DELAY,1071)
    redist67_normBit_uid115_fpArctan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => normBit_uid115_fpArctan2Test_b, xout => redist67_normBit_uid115_fpArctan2Test_b_1_q, clk => clk, aclr => areset );

    -- invNormBit_uid119_fpArctan2Test(LOGICAL,118)@43
    invNormBit_uid119_fpArctan2Test_q <= not (redist67_normBit_uid115_fpArctan2Test_b_1_q);

    -- redist17_expU_uid93_fpArctan2Test_merged_bit_select_b_16_inputreg(DELAY,1109)
    redist17_expU_uid93_fpArctan2Test_merged_bit_select_b_16_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expU_uid93_fpArctan2Test_merged_bit_select_b, xout => redist17_expU_uid93_fpArctan2Test_merged_bit_select_b_16_inputreg_q, clk => clk, aclr => areset );

    -- redist17_expU_uid93_fpArctan2Test_merged_bit_select_b_16(DELAY,1021)
    redist17_expU_uid93_fpArctan2Test_merged_bit_select_b_16 : dspba_delay
    GENERIC MAP ( width => 8, depth => 15, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist17_expU_uid93_fpArctan2Test_merged_bit_select_b_16_inputreg_q, xout => redist17_expU_uid93_fpArctan2Test_merged_bit_select_b_16_q, clk => clk, aclr => areset );

    -- expRPath3Ext_uid120_fpArctan2Test(SUB,119)@43
    expRPath3Ext_uid120_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & redist17_expU_uid93_fpArctan2Test_merged_bit_select_b_16_q);
    expRPath3Ext_uid120_fpArctan2Test_b <= STD_LOGIC_VECTOR("00000000" & invNormBit_uid119_fpArctan2Test_q);
    expRPath3Ext_uid120_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(expRPath3Ext_uid120_fpArctan2Test_a) - UNSIGNED(expRPath3Ext_uid120_fpArctan2Test_b));
    expRPath3Ext_uid120_fpArctan2Test_q <= expRPath3Ext_uid120_fpArctan2Test_o(8 downto 0);

    -- expRPath3PreRnd_uid121_fpArctan2Test(BITSELECT,120)@43
    expRPath3PreRnd_uid121_fpArctan2Test_in <= expRPath3Ext_uid120_fpArctan2Test_q(7 downto 0);
    expRPath3PreRnd_uid121_fpArctan2Test_b <= expRPath3PreRnd_uid121_fpArctan2Test_in(7 downto 0);

    -- redist64_expRPath3PreRnd_uid121_fpArctan2Test_b_1(DELAY,1068)
    redist64_expRPath3PreRnd_uid121_fpArctan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRPath3PreRnd_uid121_fpArctan2Test_b, xout => redist64_expRPath3PreRnd_uid121_fpArctan2Test_b_1_q, clk => clk, aclr => areset );

    -- fracRPath3High_uid116_fpArctan2Test(BITSELECT,115)@42
    fracRPath3High_uid116_fpArctan2Test_in <= mulXAtanXOXRes_uid114_fpArctan2Test_result_add_1_0_q(48 downto 0);
    fracRPath3High_uid116_fpArctan2Test_b <= fracRPath3High_uid116_fpArctan2Test_in(48 downto 25);

    -- redist66_fracRPath3High_uid116_fpArctan2Test_b_1(DELAY,1070)
    redist66_fracRPath3High_uid116_fpArctan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPath3High_uid116_fpArctan2Test_b, xout => redist66_fracRPath3High_uid116_fpArctan2Test_b_1_q, clk => clk, aclr => areset );

    -- fracRPath3Low_uid117_fpArctan2Test(BITSELECT,116)@42
    fracRPath3Low_uid117_fpArctan2Test_in <= mulXAtanXOXRes_uid114_fpArctan2Test_result_add_1_0_q(47 downto 0);
    fracRPath3Low_uid117_fpArctan2Test_b <= fracRPath3Low_uid117_fpArctan2Test_in(47 downto 24);

    -- redist65_fracRPath3Low_uid117_fpArctan2Test_b_1(DELAY,1069)
    redist65_fracRPath3Low_uid117_fpArctan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPath3Low_uid117_fpArctan2Test_b, xout => redist65_fracRPath3Low_uid117_fpArctan2Test_b_1_q, clk => clk, aclr => areset );

    -- fracRPath3Pre_uid118_fpArctan2Test(MUX,117)@43 + 1
    fracRPath3Pre_uid118_fpArctan2Test_s <= redist67_normBit_uid115_fpArctan2Test_b_1_q;
    fracRPath3Pre_uid118_fpArctan2Test_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPath3Pre_uid118_fpArctan2Test_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRPath3Pre_uid118_fpArctan2Test_s) IS
                WHEN "0" => fracRPath3Pre_uid118_fpArctan2Test_q <= redist65_fracRPath3Low_uid117_fpArctan2Test_b_1_q;
                WHEN "1" => fracRPath3Pre_uid118_fpArctan2Test_q <= redist66_fracRPath3High_uid116_fpArctan2Test_b_1_q;
                WHEN OTHERS => fracRPath3Pre_uid118_fpArctan2Test_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- expFracRPath3PreRnd_uid122_fpArctan2Test(BITJOIN,121)@44
    expFracRPath3PreRnd_uid122_fpArctan2Test_q <= redist64_expRPath3PreRnd_uid121_fpArctan2Test_b_1_q & fracRPath3Pre_uid118_fpArctan2Test_q;

    -- fracRPath3PostRnd_uid125_fpArctan2Test(ADD,124)@44
    fracRPath3PostRnd_uid125_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & expFracRPath3PreRnd_uid122_fpArctan2Test_q);
    fracRPath3PostRnd_uid125_fpArctan2Test_b <= STD_LOGIC_VECTOR("00000000000000000000000000000000" & VCC_q);
    fracRPath3PostRnd_uid125_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(fracRPath3PostRnd_uid125_fpArctan2Test_a) + UNSIGNED(fracRPath3PostRnd_uid125_fpArctan2Test_b));
    fracRPath3PostRnd_uid125_fpArctan2Test_q <= fracRPath3PostRnd_uid125_fpArctan2Test_o(32 downto 0);

    -- fracRPath3_uid126_fpArctan2Test_merged_bit_select(BITSELECT,993)@44
    fracRPath3_uid126_fpArctan2Test_merged_bit_select_in <= fracRPath3PostRnd_uid125_fpArctan2Test_q(31 downto 0);
    fracRPath3_uid126_fpArctan2Test_merged_bit_select_b <= fracRPath3_uid126_fpArctan2Test_merged_bit_select_in(23 downto 1);
    fracRPath3_uid126_fpArctan2Test_merged_bit_select_c <= fracRPath3_uid126_fpArctan2Test_merged_bit_select_in(31 downto 24);

    -- redist9_fracRPath3_uid126_fpArctan2Test_merged_bit_select_b_3(DELAY,1013)
    redist9_fracRPath3_uid126_fpArctan2Test_merged_bit_select_b_3 : dspba_delay
    GENERIC MAP ( width => 23, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPath3_uid126_fpArctan2Test_merged_bit_select_b, xout => redist9_fracRPath3_uid126_fpArctan2Test_merged_bit_select_b_3_q, clk => clk, aclr => areset );

    -- rightShiftStage1Idx3Rng3_uid918_fxpOp2Path2_uid134_fpArctan2Test(BITSELECT,917)@44
    rightShiftStage1Idx3Rng3_uid918_fxpOp2Path2_uid134_fpArctan2Test_b <= rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_mfinal_q(24 downto 3);

    -- rightShiftStage1Idx3_uid920_fxpOp2Path2_uid134_fpArctan2Test(BITJOIN,919)@44
    rightShiftStage1Idx3_uid920_fxpOp2Path2_uid134_fpArctan2Test_q <= aboveLeftY_bottomExtension_uid424_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_q & rightShiftStage1Idx3Rng3_uid918_fxpOp2Path2_uid134_fpArctan2Test_b;

    -- rightShiftStage1Idx2Rng2_uid915_fxpOp2Path2_uid134_fpArctan2Test(BITSELECT,914)@44
    rightShiftStage1Idx2Rng2_uid915_fxpOp2Path2_uid134_fpArctan2Test_b <= rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_mfinal_q(24 downto 2);

    -- rightShiftStage1Idx2_uid917_fxpOp2Path2_uid134_fpArctan2Test(BITJOIN,916)@44
    rightShiftStage1Idx2_uid917_fxpOp2Path2_uid134_fpArctan2Test_q <= padACst_uid167_fpArctan2Test_q & rightShiftStage1Idx2Rng2_uid915_fxpOp2Path2_uid134_fpArctan2Test_b;

    -- rightShiftStage1Idx1Rng1_uid912_fxpOp2Path2_uid134_fpArctan2Test(BITSELECT,911)@44
    rightShiftStage1Idx1Rng1_uid912_fxpOp2Path2_uid134_fpArctan2Test_b <= rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_mfinal_q(24 downto 1);

    -- rightShiftStage1Idx1_uid914_fxpOp2Path2_uid134_fpArctan2Test(BITJOIN,913)@44
    rightShiftStage1Idx1_uid914_fxpOp2Path2_uid134_fpArctan2Test_q <= GND_q & rightShiftStage1Idx1Rng1_uid912_fxpOp2Path2_uid134_fpArctan2Test_b;

    -- rightShiftStage0Idx7_uid909_fxpOp2Path2_uid134_fpArctan2Test(CONSTANT,908)
    rightShiftStage0Idx7_uid909_fxpOp2Path2_uid134_fpArctan2Test_q <= "0000000000000000000000000";

    -- oFracRPath2_uid132_fpArctan2Test(BITJOIN,131)@44
    oFracRPath2_uid132_fpArctan2Test_q <= VCC_q & fracRPath3Pre_uid118_fpArctan2Test_q;

    -- rightShiftStage0Idx6Rng24_uid906_fxpOp2Path2_uid134_fpArctan2Test(BITSELECT,905)@44
    rightShiftStage0Idx6Rng24_uid906_fxpOp2Path2_uid134_fpArctan2Test_b <= oFracRPath2_uid132_fpArctan2Test_q(24 downto 24);

    -- rightShiftStage0Idx6_uid908_fxpOp2Path2_uid134_fpArctan2Test(BITJOIN,907)@44
    rightShiftStage0Idx6_uid908_fxpOp2Path2_uid134_fpArctan2Test_q <= padConst_uid163_fpArctan2Test_q & rightShiftStage0Idx6Rng24_uid906_fxpOp2Path2_uid134_fpArctan2Test_b;

    -- rightShiftStage0Idx5Pad20_uid904_fxpOp2Path2_uid134_fpArctan2Test(CONSTANT,903)
    rightShiftStage0Idx5Pad20_uid904_fxpOp2Path2_uid134_fpArctan2Test_q <= "00000000000000000000";

    -- rightShiftStage0Idx5Rng20_uid903_fxpOp2Path2_uid134_fpArctan2Test(BITSELECT,902)@44
    rightShiftStage0Idx5Rng20_uid903_fxpOp2Path2_uid134_fpArctan2Test_b <= oFracRPath2_uid132_fpArctan2Test_q(24 downto 20);

    -- rightShiftStage0Idx5_uid905_fxpOp2Path2_uid134_fpArctan2Test(BITJOIN,904)@44
    rightShiftStage0Idx5_uid905_fxpOp2Path2_uid134_fpArctan2Test_q <= rightShiftStage0Idx5Pad20_uid904_fxpOp2Path2_uid134_fpArctan2Test_q & rightShiftStage0Idx5Rng20_uid903_fxpOp2Path2_uid134_fpArctan2Test_b;

    -- rightShiftStage0Idx4Pad16_uid901_fxpOp2Path2_uid134_fpArctan2Test(CONSTANT,900)
    rightShiftStage0Idx4Pad16_uid901_fxpOp2Path2_uid134_fpArctan2Test_q <= "0000000000000000";

    -- rightShiftStage0Idx4Rng16_uid900_fxpOp2Path2_uid134_fpArctan2Test(BITSELECT,899)@44
    rightShiftStage0Idx4Rng16_uid900_fxpOp2Path2_uid134_fpArctan2Test_b <= oFracRPath2_uid132_fpArctan2Test_q(24 downto 16);

    -- rightShiftStage0Idx4_uid902_fxpOp2Path2_uid134_fpArctan2Test(BITJOIN,901)@44
    rightShiftStage0Idx4_uid902_fxpOp2Path2_uid134_fpArctan2Test_q <= rightShiftStage0Idx4Pad16_uid901_fxpOp2Path2_uid134_fpArctan2Test_q & rightShiftStage0Idx4Rng16_uid900_fxpOp2Path2_uid134_fpArctan2Test_b;

    -- rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_msplit_1(MUX,980)@44
    rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_msplit_1_s <= rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_selLSBs_merged_bit_select_b;
    rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_msplit_1_combproc: PROCESS (rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_msplit_1_s, rightShiftStage0Idx4_uid902_fxpOp2Path2_uid134_fpArctan2Test_q, rightShiftStage0Idx5_uid905_fxpOp2Path2_uid134_fpArctan2Test_q, rightShiftStage0Idx6_uid908_fxpOp2Path2_uid134_fpArctan2Test_q, rightShiftStage0Idx7_uid909_fxpOp2Path2_uid134_fpArctan2Test_q)
    BEGIN
        CASE (rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_msplit_1_s) IS
            WHEN "00" => rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_msplit_1_q <= rightShiftStage0Idx4_uid902_fxpOp2Path2_uid134_fpArctan2Test_q;
            WHEN "01" => rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_msplit_1_q <= rightShiftStage0Idx5_uid905_fxpOp2Path2_uid134_fpArctan2Test_q;
            WHEN "10" => rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_msplit_1_q <= rightShiftStage0Idx6_uid908_fxpOp2Path2_uid134_fpArctan2Test_q;
            WHEN "11" => rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_msplit_1_q <= rightShiftStage0Idx7_uid909_fxpOp2Path2_uid134_fpArctan2Test_q;
            WHEN OTHERS => rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_msplit_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage0Idx3Rng12_uid897_fxpOp2Path2_uid134_fpArctan2Test(BITSELECT,896)@44
    rightShiftStage0Idx3Rng12_uid897_fxpOp2Path2_uid134_fpArctan2Test_b <= oFracRPath2_uid132_fpArctan2Test_q(24 downto 12);

    -- rightShiftStage0Idx3_uid899_fxpOp2Path2_uid134_fpArctan2Test(BITJOIN,898)@44
    rightShiftStage0Idx3_uid899_fxpOp2Path2_uid134_fpArctan2Test_q <= leftShiftStage0Idx6Pad12_uid855_fxpU_uid107_fpArctan2Test_q & rightShiftStage0Idx3Rng12_uid897_fxpOp2Path2_uid134_fpArctan2Test_b;

    -- rightShiftStage0Idx2Rng8_uid894_fxpOp2Path2_uid134_fpArctan2Test(BITSELECT,893)@44
    rightShiftStage0Idx2Rng8_uid894_fxpOp2Path2_uid134_fpArctan2Test_b <= oFracRPath2_uid132_fpArctan2Test_q(24 downto 8);

    -- rightShiftStage0Idx2_uid896_fxpOp2Path2_uid134_fpArctan2Test(BITJOIN,895)@44
    rightShiftStage0Idx2_uid896_fxpOp2Path2_uid134_fpArctan2Test_q <= cstAllZWE_uid52_fpArctan2Test_q & rightShiftStage0Idx2Rng8_uid894_fxpOp2Path2_uid134_fpArctan2Test_b;

    -- rightShiftStage0Idx1Rng4_uid891_fxpOp2Path2_uid134_fpArctan2Test(BITSELECT,890)@44
    rightShiftStage0Idx1Rng4_uid891_fxpOp2Path2_uid134_fpArctan2Test_b <= oFracRPath2_uid132_fpArctan2Test_q(24 downto 4);

    -- rightShiftStage0Idx1_uid893_fxpOp2Path2_uid134_fpArctan2Test(BITJOIN,892)@44
    rightShiftStage0Idx1_uid893_fxpOp2Path2_uid134_fpArctan2Test_q <= topRangeY_bottomExtension_uid535_pT1_uid366_invPolyEval_q & rightShiftStage0Idx1Rng4_uid891_fxpOp2Path2_uid134_fpArctan2Test_b;

    -- rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_msplit_0(MUX,979)@44
    rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_msplit_0_s <= rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_selLSBs_merged_bit_select_b;
    rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_msplit_0_combproc: PROCESS (rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_msplit_0_s, oFracRPath2_uid132_fpArctan2Test_q, rightShiftStage0Idx1_uid893_fxpOp2Path2_uid134_fpArctan2Test_q, rightShiftStage0Idx2_uid896_fxpOp2Path2_uid134_fpArctan2Test_q, rightShiftStage0Idx3_uid899_fxpOp2Path2_uid134_fpArctan2Test_q)
    BEGIN
        CASE (rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_msplit_0_s) IS
            WHEN "00" => rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_msplit_0_q <= oFracRPath2_uid132_fpArctan2Test_q;
            WHEN "01" => rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_msplit_0_q <= rightShiftStage0Idx1_uid893_fxpOp2Path2_uid134_fpArctan2Test_q;
            WHEN "10" => rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_msplit_0_q <= rightShiftStage0Idx2_uid896_fxpOp2Path2_uid134_fpArctan2Test_q;
            WHEN "11" => rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_msplit_0_q <= rightShiftStage0Idx3_uid899_fxpOp2Path2_uid134_fpArctan2Test_q;
            WHEN OTHERS => rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_msplit_0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_selLSBs_merged_bit_select(BITSELECT,1002)@44
    rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_selLSBs_merged_bit_select_b <= rightShiftStageSel4Dto2_uid910_fxpOp2Path2_uid134_fpArctan2Test_merged_bit_select_b(1 downto 0);
    rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_selLSBs_merged_bit_select_c <= rightShiftStageSel4Dto2_uid910_fxpOp2Path2_uid134_fpArctan2Test_merged_bit_select_b(2 downto 2);

    -- rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_mfinal(MUX,981)@44
    rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_mfinal_s <= rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_selLSBs_merged_bit_select_c;
    rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_mfinal_combproc: PROCESS (rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_mfinal_s, rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_msplit_0_q, rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_msplit_1_q)
    BEGIN
        CASE (rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_mfinal_s) IS
            WHEN "0" => rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_mfinal_q <= rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_msplit_0_q;
            WHEN "1" => rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_mfinal_q <= rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_msplit_1_q;
            WHEN OTHERS => rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_mfinal_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- cstWFP2_uid58_fpArctan2Test(CONSTANT,57)
    cstWFP2_uid58_fpArctan2Test_q <= "00011001";

    -- cstBiasMWF_uid55_fpArctan2Test(CONSTANT,54)
    cstBiasMWF_uid55_fpArctan2Test_q <= "01101000";

    -- shiftOut_uid129_fpArctan2Test(COMPARE,128)@43
    shiftOut_uid129_fpArctan2Test_a <= STD_LOGIC_VECTOR("00" & redist17_expU_uid93_fpArctan2Test_merged_bit_select_b_16_q);
    shiftOut_uid129_fpArctan2Test_b <= STD_LOGIC_VECTOR("00" & cstBiasMWF_uid55_fpArctan2Test_q);
    shiftOut_uid129_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftOut_uid129_fpArctan2Test_a) - UNSIGNED(shiftOut_uid129_fpArctan2Test_b));
    shiftOut_uid129_fpArctan2Test_c(0) <= shiftOut_uid129_fpArctan2Test_o(9);

    -- shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged(SUB,887)@43 + 1
    shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_a <= STD_LOGIC_VECTOR("0" & cstBias_uid53_fpArctan2Test_q);
    shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_b <= STD_LOGIC_VECTOR("0" & expRPath3PreRnd_uid121_fpArctan2Test_b);
    shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_i <= "0" & cstWFP2_uid58_fpArctan2Test_q;
    shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (shiftOut_uid129_fpArctan2Test_c = "1") THEN
                shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_o <= shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_i;
            ELSE
                shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_a) - UNSIGNED(shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_b));
            END IF;
        END IF;
    END PROCESS;
    shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_q <= shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_o(7 downto 0);

    -- sValPostSOutR_uid133_fpArctan2Test(BITSELECT,132)@44
    sValPostSOutR_uid133_fpArctan2Test_in <= shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_q(4 downto 0);
    sValPostSOutR_uid133_fpArctan2Test_b <= sValPostSOutR_uid133_fpArctan2Test_in(4 downto 0);

    -- rightShiftStageSel4Dto2_uid910_fxpOp2Path2_uid134_fpArctan2Test_merged_bit_select(BITSELECT,994)@44
    rightShiftStageSel4Dto2_uid910_fxpOp2Path2_uid134_fpArctan2Test_merged_bit_select_b <= sValPostSOutR_uid133_fpArctan2Test_b(4 downto 2);
    rightShiftStageSel4Dto2_uid910_fxpOp2Path2_uid134_fpArctan2Test_merged_bit_select_c <= sValPostSOutR_uid133_fpArctan2Test_b(1 downto 0);

    -- rightShiftStage1_uid922_fxpOp2Path2_uid134_fpArctan2Test(MUX,921)@44 + 1
    rightShiftStage1_uid922_fxpOp2Path2_uid134_fpArctan2Test_s <= rightShiftStageSel4Dto2_uid910_fxpOp2Path2_uid134_fpArctan2Test_merged_bit_select_c;
    rightShiftStage1_uid922_fxpOp2Path2_uid134_fpArctan2Test_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage1_uid922_fxpOp2Path2_uid134_fpArctan2Test_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage1_uid922_fxpOp2Path2_uid134_fpArctan2Test_s) IS
                WHEN "00" => rightShiftStage1_uid922_fxpOp2Path2_uid134_fpArctan2Test_q <= rightShiftStage0_uid911_fxpOp2Path2_uid134_fpArctan2Test_mfinal_q;
                WHEN "01" => rightShiftStage1_uid922_fxpOp2Path2_uid134_fpArctan2Test_q <= rightShiftStage1Idx1_uid914_fxpOp2Path2_uid134_fpArctan2Test_q;
                WHEN "10" => rightShiftStage1_uid922_fxpOp2Path2_uid134_fpArctan2Test_q <= rightShiftStage1Idx2_uid917_fxpOp2Path2_uid134_fpArctan2Test_q;
                WHEN "11" => rightShiftStage1_uid922_fxpOp2Path2_uid134_fpArctan2Test_q <= rightShiftStage1Idx3_uid920_fxpOp2Path2_uid134_fpArctan2Test_q;
                WHEN OTHERS => rightShiftStage1_uid922_fxpOp2Path2_uid134_fpArctan2Test_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- bPostPad_uid136_fpArctan2Test(BITJOIN,135)@45
    bPostPad_uid136_fpArctan2Test_q <= rightShiftStage1_uid922_fxpOp2Path2_uid134_fpArctan2Test_q & GND_q;

    -- path2Diff_uid137_fpArctan2Test(SUB,136)@45
    path2Diff_uid137_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & piO2_uid79_fpArctan2Test_q);
    path2Diff_uid137_fpArctan2Test_b <= STD_LOGIC_VECTOR("0" & bPostPad_uid136_fpArctan2Test_q);
    path2Diff_uid137_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(path2Diff_uid137_fpArctan2Test_a) - UNSIGNED(path2Diff_uid137_fpArctan2Test_b));
    path2Diff_uid137_fpArctan2Test_q <= path2Diff_uid137_fpArctan2Test_o(26 downto 0);

    -- normBitPath2Diff_uid138_fpArctan2Test(BITSELECT,137)@45
    normBitPath2Diff_uid138_fpArctan2Test_in <= STD_LOGIC_VECTOR(path2Diff_uid137_fpArctan2Test_q(25 downto 0));
    normBitPath2Diff_uid138_fpArctan2Test_b <= STD_LOGIC_VECTOR(normBitPath2Diff_uid138_fpArctan2Test_in(25 downto 25));

    -- redist63_normBitPath2Diff_uid138_fpArctan2Test_b_1(DELAY,1067)
    redist63_normBitPath2Diff_uid138_fpArctan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => normBitPath2Diff_uid138_fpArctan2Test_b, xout => redist63_normBitPath2Diff_uid138_fpArctan2Test_b_1_q, clk => clk, aclr => areset );

    -- expRPath2_uid142_fpArctan2Test(MUX,141)@46
    expRPath2_uid142_fpArctan2Test_s <= redist63_normBitPath2Diff_uid138_fpArctan2Test_b_1_q;
    expRPath2_uid142_fpArctan2Test_combproc: PROCESS (expRPath2_uid142_fpArctan2Test_s, cstBiasM1_uid54_fpArctan2Test_q, cstBias_uid53_fpArctan2Test_q)
    BEGIN
        CASE (expRPath2_uid142_fpArctan2Test_s) IS
            WHEN "0" => expRPath2_uid142_fpArctan2Test_q <= cstBiasM1_uid54_fpArctan2Test_q;
            WHEN "1" => expRPath2_uid142_fpArctan2Test_q <= cstBias_uid53_fpArctan2Test_q;
            WHEN OTHERS => expRPath2_uid142_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- path2DiffHigh_uid139_fpArctan2Test(BITSELECT,138)@45
    path2DiffHigh_uid139_fpArctan2Test_in <= path2Diff_uid137_fpArctan2Test_q(24 downto 0);
    path2DiffHigh_uid139_fpArctan2Test_b <= path2DiffHigh_uid139_fpArctan2Test_in(24 downto 1);

    -- path2DiffLow_uid140_fpArctan2Test(BITSELECT,139)@45
    path2DiffLow_uid140_fpArctan2Test_in <= path2Diff_uid137_fpArctan2Test_q(23 downto 0);
    path2DiffLow_uid140_fpArctan2Test_b <= path2DiffLow_uid140_fpArctan2Test_in(23 downto 0);

    -- fracRPath2_uid141_fpArctan2Test(MUX,140)@45 + 1
    fracRPath2_uid141_fpArctan2Test_s <= normBitPath2Diff_uid138_fpArctan2Test_b;
    fracRPath2_uid141_fpArctan2Test_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPath2_uid141_fpArctan2Test_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRPath2_uid141_fpArctan2Test_s) IS
                WHEN "0" => fracRPath2_uid141_fpArctan2Test_q <= path2DiffLow_uid140_fpArctan2Test_b;
                WHEN "1" => fracRPath2_uid141_fpArctan2Test_q <= path2DiffHigh_uid139_fpArctan2Test_b;
                WHEN OTHERS => fracRPath2_uid141_fpArctan2Test_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- expFracConc_uid145_fpArctan2Test(BITJOIN,144)@46
    expFracConc_uid145_fpArctan2Test_q <= expRPath2_uid142_fpArctan2Test_q & fracRPath2_uid141_fpArctan2Test_q;

    -- expFracRPath2PostRnd_uid146_fpArctan2Test(ADD,145)@46
    expFracRPath2PostRnd_uid146_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & expFracConc_uid145_fpArctan2Test_q);
    expFracRPath2PostRnd_uid146_fpArctan2Test_b <= STD_LOGIC_VECTOR("00000000000000000000000000000000" & VCC_q);
    expFracRPath2PostRnd_uid146_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRPath2PostRnd_uid146_fpArctan2Test_a) + UNSIGNED(expFracRPath2PostRnd_uid146_fpArctan2Test_b));
    expFracRPath2PostRnd_uid146_fpArctan2Test_q <= expFracRPath2PostRnd_uid146_fpArctan2Test_o(32 downto 0);

    -- fracRPath2_uid147_fpArctan2Test_merged_bit_select(BITSELECT,995)@46
    fracRPath2_uid147_fpArctan2Test_merged_bit_select_in <= expFracRPath2PostRnd_uid146_fpArctan2Test_q(31 downto 0);
    fracRPath2_uid147_fpArctan2Test_merged_bit_select_b <= fracRPath2_uid147_fpArctan2Test_merged_bit_select_in(23 downto 1);
    fracRPath2_uid147_fpArctan2Test_merged_bit_select_c <= fracRPath2_uid147_fpArctan2Test_merged_bit_select_in(31 downto 24);

    -- redist7_fracRPath2_uid147_fpArctan2Test_merged_bit_select_b_1(DELAY,1011)
    redist7_fracRPath2_uid147_fpArctan2Test_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPath2_uid147_fpArctan2Test_merged_bit_select_b, xout => redist7_fracRPath2_uid147_fpArctan2Test_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- redist77_fracX_uid47_fpArctan2Test_b_30_notEnable(LOGICAL,1131)
    redist77_fracX_uid47_fpArctan2Test_b_30_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist77_fracX_uid47_fpArctan2Test_b_30_nor(LOGICAL,1132)
    redist77_fracX_uid47_fpArctan2Test_b_30_nor_q <= not (redist77_fracX_uid47_fpArctan2Test_b_30_notEnable_q or redist77_fracX_uid47_fpArctan2Test_b_30_sticky_ena_q);

    -- redist77_fracX_uid47_fpArctan2Test_b_30_mem_last(CONSTANT,1128)
    redist77_fracX_uid47_fpArctan2Test_b_30_mem_last_q <= "010010";

    -- redist77_fracX_uid47_fpArctan2Test_b_30_cmp(LOGICAL,1129)
    redist77_fracX_uid47_fpArctan2Test_b_30_cmp_b <= STD_LOGIC_VECTOR("0" & redist77_fracX_uid47_fpArctan2Test_b_30_rdcnt_q);
    redist77_fracX_uid47_fpArctan2Test_b_30_cmp_q <= "1" WHEN redist77_fracX_uid47_fpArctan2Test_b_30_mem_last_q = redist77_fracX_uid47_fpArctan2Test_b_30_cmp_b ELSE "0";

    -- redist77_fracX_uid47_fpArctan2Test_b_30_cmpReg(REG,1130)
    redist77_fracX_uid47_fpArctan2Test_b_30_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist77_fracX_uid47_fpArctan2Test_b_30_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist77_fracX_uid47_fpArctan2Test_b_30_cmpReg_q <= STD_LOGIC_VECTOR(redist77_fracX_uid47_fpArctan2Test_b_30_cmp_q);
        END IF;
    END PROCESS;

    -- redist77_fracX_uid47_fpArctan2Test_b_30_sticky_ena(REG,1133)
    redist77_fracX_uid47_fpArctan2Test_b_30_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist77_fracX_uid47_fpArctan2Test_b_30_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist77_fracX_uid47_fpArctan2Test_b_30_nor_q = "1") THEN
                redist77_fracX_uid47_fpArctan2Test_b_30_sticky_ena_q <= STD_LOGIC_VECTOR(redist77_fracX_uid47_fpArctan2Test_b_30_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist77_fracX_uid47_fpArctan2Test_b_30_enaAnd(LOGICAL,1134)
    redist77_fracX_uid47_fpArctan2Test_b_30_enaAnd_q <= redist77_fracX_uid47_fpArctan2Test_b_30_sticky_ena_q and VCC_q;

    -- redist77_fracX_uid47_fpArctan2Test_b_30_rdcnt(COUNTER,1126)
    -- low=0, high=19, step=1, init=0
    redist77_fracX_uid47_fpArctan2Test_b_30_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist77_fracX_uid47_fpArctan2Test_b_30_rdcnt_i <= TO_UNSIGNED(0, 5);
            redist77_fracX_uid47_fpArctan2Test_b_30_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist77_fracX_uid47_fpArctan2Test_b_30_rdcnt_i = TO_UNSIGNED(18, 5)) THEN
                redist77_fracX_uid47_fpArctan2Test_b_30_rdcnt_eq <= '1';
            ELSE
                redist77_fracX_uid47_fpArctan2Test_b_30_rdcnt_eq <= '0';
            END IF;
            IF (redist77_fracX_uid47_fpArctan2Test_b_30_rdcnt_eq = '1') THEN
                redist77_fracX_uid47_fpArctan2Test_b_30_rdcnt_i <= redist77_fracX_uid47_fpArctan2Test_b_30_rdcnt_i + 13;
            ELSE
                redist77_fracX_uid47_fpArctan2Test_b_30_rdcnt_i <= redist77_fracX_uid47_fpArctan2Test_b_30_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist77_fracX_uid47_fpArctan2Test_b_30_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist77_fracX_uid47_fpArctan2Test_b_30_rdcnt_i, 5)));

    -- redist77_fracX_uid47_fpArctan2Test_b_30_wraddr(REG,1127)
    redist77_fracX_uid47_fpArctan2Test_b_30_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist77_fracX_uid47_fpArctan2Test_b_30_wraddr_q <= "10011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist77_fracX_uid47_fpArctan2Test_b_30_wraddr_q <= STD_LOGIC_VECTOR(redist77_fracX_uid47_fpArctan2Test_b_30_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist77_fracX_uid47_fpArctan2Test_b_30_mem(DUALMEM,1125)
    redist77_fracX_uid47_fpArctan2Test_b_30_mem_ia <= STD_LOGIC_VECTOR(redist76_fracX_uid47_fpArctan2Test_b_8_outputreg_q);
    redist77_fracX_uid47_fpArctan2Test_b_30_mem_aa <= redist77_fracX_uid47_fpArctan2Test_b_30_wraddr_q;
    redist77_fracX_uid47_fpArctan2Test_b_30_mem_ab <= redist77_fracX_uid47_fpArctan2Test_b_30_rdcnt_q;
    redist77_fracX_uid47_fpArctan2Test_b_30_mem_reset0 <= areset;
    redist77_fracX_uid47_fpArctan2Test_b_30_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 5,
        numwords_a => 20,
        width_b => 23,
        widthad_b => 5,
        numwords_b => 20,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken1 => redist77_fracX_uid47_fpArctan2Test_b_30_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist77_fracX_uid47_fpArctan2Test_b_30_mem_reset0,
        clock1 => clk,
        address_a => redist77_fracX_uid47_fpArctan2Test_b_30_mem_aa,
        data_a => redist77_fracX_uid47_fpArctan2Test_b_30_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist77_fracX_uid47_fpArctan2Test_b_30_mem_ab,
        q_b => redist77_fracX_uid47_fpArctan2Test_b_30_mem_iq
    );
    redist77_fracX_uid47_fpArctan2Test_b_30_mem_q <= redist77_fracX_uid47_fpArctan2Test_b_30_mem_iq(22 downto 0);

    -- redist77_fracX_uid47_fpArctan2Test_b_30_outputreg(DELAY,1124)
    redist77_fracX_uid47_fpArctan2Test_b_30_outputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist77_fracX_uid47_fpArctan2Test_b_30_mem_q, xout => redist77_fracX_uid47_fpArctan2Test_b_30_outputreg_q, clk => clk, aclr => areset );

    -- xyInInf_uid88_fpArctan2Test(LOGICAL,87)@16 + 1
    xyInInf_uid88_fpArctan2Test_qi <= excI_xIn_uid15_fpArctan2Test_q and excI_yIn_uid29_fpArctan2Test_q;
    xyInInf_uid88_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xyInInf_uid88_fpArctan2Test_qi, xout => xyInInf_uid88_fpArctan2Test_q, clk => clk, aclr => areset );

    -- redist72_xyInInf_uid88_fpArctan2Test_q_10(DELAY,1076)
    redist72_xyInInf_uid88_fpArctan2Test_q_10 : dspba_delay
    GENERIC MAP ( width => 1, depth => 9, reset_kind => "ASYNC" )
    PORT MAP ( xin => xyInInf_uid88_fpArctan2Test_q, xout => redist72_xyInInf_uid88_fpArctan2Test_q_10_q, clk => clk, aclr => areset );

    -- expXIsBias_uid77_fpArctan2Test(LOGICAL,76)@25
    expXIsBias_uid77_fpArctan2Test_q <= "1" WHEN expX_uid46_fpArctan2Test_b = cstBias_uid53_fpArctan2Test_q ELSE "0";

    -- updatedY_uid75_fpArctan2Test(BITJOIN,74)@25
    updatedY_uid75_fpArctan2Test_q <= cstZeroWF_uid7_fpArctan2Test_q & cstZeroWF_uid7_fpArctan2Test_q;

    -- fracXIsZero_uid74_fpArctan2Test(LOGICAL,75)@25
    fracXIsZero_uid74_fpArctan2Test_a <= STD_LOGIC_VECTOR("00000000000000000000000" & redist76_fracX_uid47_fpArctan2Test_b_8_outputreg_q);
    fracXIsZero_uid74_fpArctan2Test_q <= "1" WHEN fracXIsZero_uid74_fpArctan2Test_a = updatedY_uid75_fpArctan2Test_q ELSE "0";

    -- inIsOne_uid78_fpArctan2Test(LOGICAL,77)@25 + 1
    inIsOne_uid78_fpArctan2Test_qi <= fracXIsZero_uid74_fpArctan2Test_q and expXIsBias_uid77_fpArctan2Test_q;
    inIsOne_uid78_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => inIsOne_uid78_fpArctan2Test_qi, xout => inIsOne_uid78_fpArctan2Test_q, clk => clk, aclr => areset );

    -- arctanIsConst_uid89_fpArctan2Test(LOGICAL,88)@26 + 1
    arctanIsConst_uid89_fpArctan2Test_qi <= excI_div_uid69_fpArctan2Test_q or inIsOne_uid78_fpArctan2Test_q or redist72_xyInInf_uid88_fpArctan2Test_q_10_q;
    arctanIsConst_uid89_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => arctanIsConst_uid89_fpArctan2Test_qi, xout => arctanIsConst_uid89_fpArctan2Test_q, clk => clk, aclr => areset );

    -- redist71_arctanIsConst_uid89_fpArctan2Test_q_17(DELAY,1075)
    redist71_arctanIsConst_uid89_fpArctan2Test_q_17 : dspba_delay
    GENERIC MAP ( width => 1, depth => 16, reset_kind => "ASYNC" )
    PORT MAP ( xin => arctanIsConst_uid89_fpArctan2Test_q, xout => redist71_arctanIsConst_uid89_fpArctan2Test_q_17_q, clk => clk, aclr => areset );

    -- biasMwShift_uid96_fpArctan2Test(CONSTANT,95)
    biasMwShift_uid96_fpArctan2Test_q <= "01110011";

    -- atanUIsU_uid97_fpArctan2Test(COMPARE,96)@43
    atanUIsU_uid97_fpArctan2Test_a <= STD_LOGIC_VECTOR("00" & biasMwShift_uid96_fpArctan2Test_q);
    atanUIsU_uid97_fpArctan2Test_b <= STD_LOGIC_VECTOR("00" & redist17_expU_uid93_fpArctan2Test_merged_bit_select_b_16_q);
    atanUIsU_uid97_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(atanUIsU_uid97_fpArctan2Test_a) - UNSIGNED(atanUIsU_uid97_fpArctan2Test_b));
    atanUIsU_uid97_fpArctan2Test_n(0) <= not (atanUIsU_uid97_fpArctan2Test_o(9));

    -- redist70_path2_uid90_fpArctan2Test_n_17(DELAY,1074)
    redist70_path2_uid90_fpArctan2Test_n_17 : dspba_delay
    GENERIC MAP ( width => 1, depth => 16, reset_kind => "ASYNC" )
    PORT MAP ( xin => path2_uid90_fpArctan2Test_n, xout => redist70_path2_uid90_fpArctan2Test_n_17_q, clk => clk, aclr => areset );

    -- pathSelBits_uid149_fpArctan2Test(BITJOIN,148)@43
    pathSelBits_uid149_fpArctan2Test_q <= redist71_arctanIsConst_uid89_fpArctan2Test_q_17_q & atanUIsU_uid97_fpArctan2Test_n & redist70_path2_uid90_fpArctan2Test_n_17_q;

    -- fracOutMuxSelEnc_uid150_fpArctan2Test(LOOKUP,149)@43 + 1
    fracOutMuxSelEnc_uid150_fpArctan2Test_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracOutMuxSelEnc_uid150_fpArctan2Test_q <= "10";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (pathSelBits_uid149_fpArctan2Test_q) IS
                WHEN "000" => fracOutMuxSelEnc_uid150_fpArctan2Test_q <= "10";
                WHEN "001" => fracOutMuxSelEnc_uid150_fpArctan2Test_q <= "01";
                WHEN "010" => fracOutMuxSelEnc_uid150_fpArctan2Test_q <= "00";
                WHEN "011" => fracOutMuxSelEnc_uid150_fpArctan2Test_q <= "01";
                WHEN "100" => fracOutMuxSelEnc_uid150_fpArctan2Test_q <= "11";
                WHEN "101" => fracOutMuxSelEnc_uid150_fpArctan2Test_q <= "11";
                WHEN "110" => fracOutMuxSelEnc_uid150_fpArctan2Test_q <= "11";
                WHEN "111" => fracOutMuxSelEnc_uid150_fpArctan2Test_q <= "11";
                WHEN OTHERS => -- unreachable
                               fracOutMuxSelEnc_uid150_fpArctan2Test_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- redist62_fracOutMuxSelEnc_uid150_fpArctan2Test_q_4(DELAY,1066)
    redist62_fracOutMuxSelEnc_uid150_fpArctan2Test_q_4 : dspba_delay
    GENERIC MAP ( width => 2, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracOutMuxSelEnc_uid150_fpArctan2Test_q, xout => redist62_fracOutMuxSelEnc_uid150_fpArctan2Test_q_4_q, clk => clk, aclr => areset );

    -- fracRCalc_uid152_fpArctan2Test(MUX,151)@47 + 1
    fracRCalc_uid152_fpArctan2Test_s <= redist62_fracOutMuxSelEnc_uid150_fpArctan2Test_q_4_q;
    fracRCalc_uid152_fpArctan2Test_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRCalc_uid152_fpArctan2Test_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRCalc_uid152_fpArctan2Test_s) IS
                WHEN "00" => fracRCalc_uid152_fpArctan2Test_q <= redist77_fracX_uid47_fpArctan2Test_b_30_outputreg_q;
                WHEN "01" => fracRCalc_uid152_fpArctan2Test_q <= redist7_fracRPath2_uid147_fpArctan2Test_merged_bit_select_b_1_q;
                WHEN "10" => fracRCalc_uid152_fpArctan2Test_q <= redist9_fracRPath3_uid126_fpArctan2Test_merged_bit_select_b_3_q;
                WHEN "11" => fracRCalc_uid152_fpArctan2Test_q <= fracOutCst_uid151_fpArctan2Test_merged_bit_select_b;
                WHEN OTHERS => fracRCalc_uid152_fpArctan2Test_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist60_fracRCalc_uid152_fpArctan2Test_q_2(DELAY,1064)
    redist60_fracRCalc_uid152_fpArctan2Test_q_2 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRCalc_uid152_fpArctan2Test_q, xout => redist60_fracRCalc_uid152_fpArctan2Test_q_2_q, clk => clk, aclr => areset );

    -- oFracRCalc_uid162_fpArctan2Test(BITJOIN,161)@49
    oFracRCalc_uid162_fpArctan2Test_q <= VCC_q & redist60_fracRCalc_uid152_fpArctan2Test_q_2_q;

    -- padConst_uid163_fpArctan2Test(CONSTANT,162)
    padConst_uid163_fpArctan2Test_q <= "000000000000000000000000";

    -- rightPaddedIn_uid164_fpArctan2Test(BITJOIN,163)@49
    rightPaddedIn_uid164_fpArctan2Test_q <= oFracRCalc_uid162_fpArctan2Test_q & padConst_uid163_fpArctan2Test_q;

    -- rightShiftStage0Idx7Rng28_uid945_fxpAlignedRes_uid163_fpArctan2Test(BITSELECT,944)@49
    rightShiftStage0Idx7Rng28_uid945_fxpAlignedRes_uid163_fpArctan2Test_b <= rightPaddedIn_uid164_fpArctan2Test_q(47 downto 28);

    -- rightShiftStage0Idx7_uid947_fxpAlignedRes_uid163_fpArctan2Test(BITJOIN,946)@49
    rightShiftStage0Idx7_uid947_fxpAlignedRes_uid163_fpArctan2Test_q <= rightShiftStage0Idx7Pad28_uid946_fxpAlignedRes_uid163_fpArctan2Test_q & rightShiftStage0Idx7Rng28_uid945_fxpAlignedRes_uid163_fpArctan2Test_b;

    -- rightShiftStage0Idx6Rng24_uid942_fxpAlignedRes_uid163_fpArctan2Test(BITSELECT,941)@49
    rightShiftStage0Idx6Rng24_uid942_fxpAlignedRes_uid163_fpArctan2Test_b <= rightPaddedIn_uid164_fpArctan2Test_q(47 downto 24);

    -- rightShiftStage0Idx6_uid944_fxpAlignedRes_uid163_fpArctan2Test(BITJOIN,943)@49
    rightShiftStage0Idx6_uid944_fxpAlignedRes_uid163_fpArctan2Test_q <= padConst_uid163_fpArctan2Test_q & rightShiftStage0Idx6Rng24_uid942_fxpAlignedRes_uid163_fpArctan2Test_b;

    -- rightShiftStage0Idx5Rng20_uid939_fxpAlignedRes_uid163_fpArctan2Test(BITSELECT,938)@49
    rightShiftStage0Idx5Rng20_uid939_fxpAlignedRes_uid163_fpArctan2Test_b <= rightPaddedIn_uid164_fpArctan2Test_q(47 downto 20);

    -- rightShiftStage0Idx5_uid941_fxpAlignedRes_uid163_fpArctan2Test(BITJOIN,940)@49
    rightShiftStage0Idx5_uid941_fxpAlignedRes_uid163_fpArctan2Test_q <= rightShiftStage0Idx5Pad20_uid904_fxpOp2Path2_uid134_fpArctan2Test_q & rightShiftStage0Idx5Rng20_uid939_fxpAlignedRes_uid163_fpArctan2Test_b;

    -- rightShiftStage0Idx4Rng16_uid936_fxpAlignedRes_uid163_fpArctan2Test(BITSELECT,935)@49
    rightShiftStage0Idx4Rng16_uid936_fxpAlignedRes_uid163_fpArctan2Test_b <= rightPaddedIn_uid164_fpArctan2Test_q(47 downto 16);

    -- rightShiftStage0Idx4_uid938_fxpAlignedRes_uid163_fpArctan2Test(BITJOIN,937)@49
    rightShiftStage0Idx4_uid938_fxpAlignedRes_uid163_fpArctan2Test_q <= rightShiftStage0Idx4Pad16_uid901_fxpOp2Path2_uid134_fpArctan2Test_q & rightShiftStage0Idx4Rng16_uid936_fxpAlignedRes_uid163_fpArctan2Test_b;

    -- rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_msplit_1(MUX,985)@49
    rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_msplit_1_s <= rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_selLSBs_merged_bit_select_b;
    rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_msplit_1_combproc: PROCESS (rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_msplit_1_s, rightShiftStage0Idx4_uid938_fxpAlignedRes_uid163_fpArctan2Test_q, rightShiftStage0Idx5_uid941_fxpAlignedRes_uid163_fpArctan2Test_q, rightShiftStage0Idx6_uid944_fxpAlignedRes_uid163_fpArctan2Test_q, rightShiftStage0Idx7_uid947_fxpAlignedRes_uid163_fpArctan2Test_q)
    BEGIN
        CASE (rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_msplit_1_s) IS
            WHEN "00" => rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_msplit_1_q <= rightShiftStage0Idx4_uid938_fxpAlignedRes_uid163_fpArctan2Test_q;
            WHEN "01" => rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_msplit_1_q <= rightShiftStage0Idx5_uid941_fxpAlignedRes_uid163_fpArctan2Test_q;
            WHEN "10" => rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_msplit_1_q <= rightShiftStage0Idx6_uid944_fxpAlignedRes_uid163_fpArctan2Test_q;
            WHEN "11" => rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_msplit_1_q <= rightShiftStage0Idx7_uid947_fxpAlignedRes_uid163_fpArctan2Test_q;
            WHEN OTHERS => rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_msplit_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage0Idx3Rng12_uid933_fxpAlignedRes_uid163_fpArctan2Test(BITSELECT,932)@49
    rightShiftStage0Idx3Rng12_uid933_fxpAlignedRes_uid163_fpArctan2Test_b <= rightPaddedIn_uid164_fpArctan2Test_q(47 downto 12);

    -- rightShiftStage0Idx3_uid935_fxpAlignedRes_uid163_fpArctan2Test(BITJOIN,934)@49
    rightShiftStage0Idx3_uid935_fxpAlignedRes_uid163_fpArctan2Test_q <= leftShiftStage0Idx6Pad12_uid855_fxpU_uid107_fpArctan2Test_q & rightShiftStage0Idx3Rng12_uid933_fxpAlignedRes_uid163_fpArctan2Test_b;

    -- rightShiftStage0Idx2Rng8_uid930_fxpAlignedRes_uid163_fpArctan2Test(BITSELECT,929)@49
    rightShiftStage0Idx2Rng8_uid930_fxpAlignedRes_uid163_fpArctan2Test_b <= rightPaddedIn_uid164_fpArctan2Test_q(47 downto 8);

    -- rightShiftStage0Idx2_uid932_fxpAlignedRes_uid163_fpArctan2Test(BITJOIN,931)@49
    rightShiftStage0Idx2_uid932_fxpAlignedRes_uid163_fpArctan2Test_q <= cstAllZWE_uid52_fpArctan2Test_q & rightShiftStage0Idx2Rng8_uid930_fxpAlignedRes_uid163_fpArctan2Test_b;

    -- rightShiftStage0Idx1Rng4_uid927_fxpAlignedRes_uid163_fpArctan2Test(BITSELECT,926)@49
    rightShiftStage0Idx1Rng4_uid927_fxpAlignedRes_uid163_fpArctan2Test_b <= rightPaddedIn_uid164_fpArctan2Test_q(47 downto 4);

    -- rightShiftStage0Idx1_uid929_fxpAlignedRes_uid163_fpArctan2Test(BITJOIN,928)@49
    rightShiftStage0Idx1_uid929_fxpAlignedRes_uid163_fpArctan2Test_q <= topRangeY_bottomExtension_uid535_pT1_uid366_invPolyEval_q & rightShiftStage0Idx1Rng4_uid927_fxpAlignedRes_uid163_fpArctan2Test_b;

    -- rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_msplit_0(MUX,984)@49
    rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_msplit_0_s <= rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_selLSBs_merged_bit_select_b;
    rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_msplit_0_combproc: PROCESS (rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_msplit_0_s, rightPaddedIn_uid164_fpArctan2Test_q, rightShiftStage0Idx1_uid929_fxpAlignedRes_uid163_fpArctan2Test_q, rightShiftStage0Idx2_uid932_fxpAlignedRes_uid163_fpArctan2Test_q, rightShiftStage0Idx3_uid935_fxpAlignedRes_uid163_fpArctan2Test_q)
    BEGIN
        CASE (rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_msplit_0_s) IS
            WHEN "00" => rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_msplit_0_q <= rightPaddedIn_uid164_fpArctan2Test_q;
            WHEN "01" => rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_msplit_0_q <= rightShiftStage0Idx1_uid929_fxpAlignedRes_uid163_fpArctan2Test_q;
            WHEN "10" => rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_msplit_0_q <= rightShiftStage0Idx2_uid932_fxpAlignedRes_uid163_fpArctan2Test_q;
            WHEN "11" => rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_msplit_0_q <= rightShiftStage0Idx3_uid935_fxpAlignedRes_uid163_fpArctan2Test_q;
            WHEN OTHERS => rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_msplit_0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_selLSBs_merged_bit_select(BITSELECT,1003)@49
    rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_selLSBs_merged_bit_select_b <= rightShiftStageSel4Dto2_uid948_fxpAlignedRes_uid163_fpArctan2Test_merged_bit_select_b(1 downto 0);
    rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_selLSBs_merged_bit_select_c <= rightShiftStageSel4Dto2_uid948_fxpAlignedRes_uid163_fpArctan2Test_merged_bit_select_b(2 downto 2);

    -- rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_mfinal(MUX,986)@49
    rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_mfinal_s <= rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_selLSBs_merged_bit_select_c;
    rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_mfinal_combproc: PROCESS (rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_mfinal_s, rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_msplit_0_q, rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_msplit_1_q)
    BEGIN
        CASE (rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_mfinal_s) IS
            WHEN "0" => rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_mfinal_q <= rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_msplit_0_q;
            WHEN "1" => rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_mfinal_q <= rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_msplit_1_q;
            WHEN OTHERS => rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_mfinal_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- cstWFP1_uid57_fpArctan2Test(CONSTANT,56)
    cstWFP1_uid57_fpArctan2Test_q <= "00011000";

    -- zwEwF_uid36_fpArctan2Test(CONSTANT,35)
    zwEwF_uid36_fpArctan2Test_q <= "0000000000000000000000000000000";

    -- yInExpFrac_uid39_fpArctan2Test(BITJOIN,38)@0
    yInExpFrac_uid39_fpArctan2Test_q <= exp_yIn_uid23_fpArctan2Test_b & frac_yIn_uid24_fpArctan2Test_b;

    -- yInZero_uid40_fpArctan2Test(LOGICAL,39)@0 + 1
    yInZero_uid40_fpArctan2Test_qi <= "1" WHEN yInExpFrac_uid39_fpArctan2Test_q = zwEwF_uid36_fpArctan2Test_q ELSE "0";
    yInZero_uid40_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yInZero_uid40_fpArctan2Test_qi, xout => yInZero_uid40_fpArctan2Test_q, clk => clk, aclr => areset );

    -- redist81_yInZero_uid40_fpArctan2Test_q_25(DELAY,1085)
    redist81_yInZero_uid40_fpArctan2Test_q_25 : dspba_delay
    GENERIC MAP ( width => 1, depth => 24, reset_kind => "ASYNC" )
    PORT MAP ( xin => yInZero_uid40_fpArctan2Test_q, xout => redist81_yInZero_uid40_fpArctan2Test_q_25_q, clk => clk, aclr => areset );

    -- redist82_yInZero_uid40_fpArctan2Test_q_48(DELAY,1086)
    redist82_yInZero_uid40_fpArctan2Test_q_48 : dspba_delay
    GENERIC MAP ( width => 1, depth => 23, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist81_yInZero_uid40_fpArctan2Test_q_25_q, xout => redist82_yInZero_uid40_fpArctan2Test_q_48_q, clk => clk, aclr => areset );

    -- sOutAlignRes_uid157_fpArctan2Test(COMPARE,156)@48
    sOutAlignRes_uid157_fpArctan2Test_a <= STD_LOGIC_VECTOR("00" & expRCalc_uid154_fpArctan2Test_q);
    sOutAlignRes_uid157_fpArctan2Test_b <= STD_LOGIC_VECTOR("00" & cstBiasMWF_uid55_fpArctan2Test_q);
    sOutAlignRes_uid157_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(sOutAlignRes_uid157_fpArctan2Test_a) - UNSIGNED(sOutAlignRes_uid157_fpArctan2Test_b));
    sOutAlignRes_uid157_fpArctan2Test_c(0) <= sOutAlignRes_uid157_fpArctan2Test_o(9);

    -- yInZOrsOutAlignRes_uid158_fpArctan2Test(LOGICAL,157)@48
    yInZOrsOutAlignRes_uid158_fpArctan2Test_q <= sOutAlignRes_uid157_fpArctan2Test_c or redist82_yInZero_uid40_fpArctan2Test_q_48_q;

    -- redist10_fracRPath3_uid126_fpArctan2Test_merged_bit_select_c_3(DELAY,1014)
    redist10_fracRPath3_uid126_fpArctan2Test_merged_bit_select_c_3 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPath3_uid126_fpArctan2Test_merged_bit_select_c, xout => redist10_fracRPath3_uid126_fpArctan2Test_merged_bit_select_c_3_q, clk => clk, aclr => areset );

    -- redist8_fracRPath2_uid147_fpArctan2Test_merged_bit_select_c_1(DELAY,1012)
    redist8_fracRPath2_uid147_fpArctan2Test_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPath2_uid147_fpArctan2Test_merged_bit_select_c, xout => redist8_fracRPath2_uid147_fpArctan2Test_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- redist79_expX_uid46_fpArctan2Test_b_22_notEnable(LOGICAL,1142)
    redist79_expX_uid46_fpArctan2Test_b_22_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist79_expX_uid46_fpArctan2Test_b_22_nor(LOGICAL,1143)
    redist79_expX_uid46_fpArctan2Test_b_22_nor_q <= not (redist79_expX_uid46_fpArctan2Test_b_22_notEnable_q or redist79_expX_uid46_fpArctan2Test_b_22_sticky_ena_q);

    -- redist79_expX_uid46_fpArctan2Test_b_22_mem_last(CONSTANT,1139)
    redist79_expX_uid46_fpArctan2Test_b_22_mem_last_q <= "010001";

    -- redist79_expX_uid46_fpArctan2Test_b_22_cmp(LOGICAL,1140)
    redist79_expX_uid46_fpArctan2Test_b_22_cmp_b <= STD_LOGIC_VECTOR("0" & redist79_expX_uid46_fpArctan2Test_b_22_rdcnt_q);
    redist79_expX_uid46_fpArctan2Test_b_22_cmp_q <= "1" WHEN redist79_expX_uid46_fpArctan2Test_b_22_mem_last_q = redist79_expX_uid46_fpArctan2Test_b_22_cmp_b ELSE "0";

    -- redist79_expX_uid46_fpArctan2Test_b_22_cmpReg(REG,1141)
    redist79_expX_uid46_fpArctan2Test_b_22_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist79_expX_uid46_fpArctan2Test_b_22_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist79_expX_uid46_fpArctan2Test_b_22_cmpReg_q <= STD_LOGIC_VECTOR(redist79_expX_uid46_fpArctan2Test_b_22_cmp_q);
        END IF;
    END PROCESS;

    -- redist79_expX_uid46_fpArctan2Test_b_22_sticky_ena(REG,1144)
    redist79_expX_uid46_fpArctan2Test_b_22_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist79_expX_uid46_fpArctan2Test_b_22_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist79_expX_uid46_fpArctan2Test_b_22_nor_q = "1") THEN
                redist79_expX_uid46_fpArctan2Test_b_22_sticky_ena_q <= STD_LOGIC_VECTOR(redist79_expX_uid46_fpArctan2Test_b_22_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist79_expX_uid46_fpArctan2Test_b_22_enaAnd(LOGICAL,1145)
    redist79_expX_uid46_fpArctan2Test_b_22_enaAnd_q <= redist79_expX_uid46_fpArctan2Test_b_22_sticky_ena_q and VCC_q;

    -- redist79_expX_uid46_fpArctan2Test_b_22_rdcnt(COUNTER,1137)
    -- low=0, high=18, step=1, init=0
    redist79_expX_uid46_fpArctan2Test_b_22_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist79_expX_uid46_fpArctan2Test_b_22_rdcnt_i <= TO_UNSIGNED(0, 5);
            redist79_expX_uid46_fpArctan2Test_b_22_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist79_expX_uid46_fpArctan2Test_b_22_rdcnt_i = TO_UNSIGNED(17, 5)) THEN
                redist79_expX_uid46_fpArctan2Test_b_22_rdcnt_eq <= '1';
            ELSE
                redist79_expX_uid46_fpArctan2Test_b_22_rdcnt_eq <= '0';
            END IF;
            IF (redist79_expX_uid46_fpArctan2Test_b_22_rdcnt_eq = '1') THEN
                redist79_expX_uid46_fpArctan2Test_b_22_rdcnt_i <= redist79_expX_uid46_fpArctan2Test_b_22_rdcnt_i + 14;
            ELSE
                redist79_expX_uid46_fpArctan2Test_b_22_rdcnt_i <= redist79_expX_uid46_fpArctan2Test_b_22_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist79_expX_uid46_fpArctan2Test_b_22_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist79_expX_uid46_fpArctan2Test_b_22_rdcnt_i, 5)));

    -- redist79_expX_uid46_fpArctan2Test_b_22_wraddr(REG,1138)
    redist79_expX_uid46_fpArctan2Test_b_22_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist79_expX_uid46_fpArctan2Test_b_22_wraddr_q <= "10010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist79_expX_uid46_fpArctan2Test_b_22_wraddr_q <= STD_LOGIC_VECTOR(redist79_expX_uid46_fpArctan2Test_b_22_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist79_expX_uid46_fpArctan2Test_b_22_mem(DUALMEM,1136)
    redist79_expX_uid46_fpArctan2Test_b_22_mem_ia <= STD_LOGIC_VECTOR(redist78_expX_uid46_fpArctan2Test_b_1_q);
    redist79_expX_uid46_fpArctan2Test_b_22_mem_aa <= redist79_expX_uid46_fpArctan2Test_b_22_wraddr_q;
    redist79_expX_uid46_fpArctan2Test_b_22_mem_ab <= redist79_expX_uid46_fpArctan2Test_b_22_rdcnt_q;
    redist79_expX_uid46_fpArctan2Test_b_22_mem_reset0 <= areset;
    redist79_expX_uid46_fpArctan2Test_b_22_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 5,
        numwords_a => 19,
        width_b => 8,
        widthad_b => 5,
        numwords_b => 19,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken1 => redist79_expX_uid46_fpArctan2Test_b_22_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist79_expX_uid46_fpArctan2Test_b_22_mem_reset0,
        clock1 => clk,
        address_a => redist79_expX_uid46_fpArctan2Test_b_22_mem_aa,
        data_a => redist79_expX_uid46_fpArctan2Test_b_22_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist79_expX_uid46_fpArctan2Test_b_22_mem_ab,
        q_b => redist79_expX_uid46_fpArctan2Test_b_22_mem_iq
    );
    redist79_expX_uid46_fpArctan2Test_b_22_mem_q <= redist79_expX_uid46_fpArctan2Test_b_22_mem_iq(7 downto 0);

    -- redist79_expX_uid46_fpArctan2Test_b_22_outputreg(DELAY,1135)
    redist79_expX_uid46_fpArctan2Test_b_22_outputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist79_expX_uid46_fpArctan2Test_b_22_mem_q, xout => redist79_expX_uid46_fpArctan2Test_b_22_outputreg_q, clk => clk, aclr => areset );

    -- expRCalc_uid154_fpArctan2Test(MUX,153)@47 + 1
    expRCalc_uid154_fpArctan2Test_s <= redist62_fracOutMuxSelEnc_uid150_fpArctan2Test_q_4_q;
    expRCalc_uid154_fpArctan2Test_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRCalc_uid154_fpArctan2Test_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (expRCalc_uid154_fpArctan2Test_s) IS
                WHEN "00" => expRCalc_uid154_fpArctan2Test_q <= redist79_expX_uid46_fpArctan2Test_b_22_outputreg_q;
                WHEN "01" => expRCalc_uid154_fpArctan2Test_q <= redist8_fracRPath2_uid147_fpArctan2Test_merged_bit_select_c_1_q;
                WHEN "10" => expRCalc_uid154_fpArctan2Test_q <= redist10_fracRPath3_uid126_fpArctan2Test_merged_bit_select_c_3_q;
                WHEN "11" => expRCalc_uid154_fpArctan2Test_q <= fracOutCst_uid151_fpArctan2Test_merged_bit_select_c;
                WHEN OTHERS => expRCalc_uid154_fpArctan2Test_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged(SUB,923)@48 + 1
    sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_a <= STD_LOGIC_VECTOR("0" & cstBias_uid53_fpArctan2Test_q);
    sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_b <= STD_LOGIC_VECTOR("0" & expRCalc_uid154_fpArctan2Test_q);
    sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_i <= "0" & cstWFP1_uid57_fpArctan2Test_q;
    sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (yInZOrsOutAlignRes_uid158_fpArctan2Test_q = "1") THEN
                sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_o <= sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_i;
            ELSE
                sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_o <= STD_LOGIC_VECTOR(UNSIGNED(sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_a) - UNSIGNED(sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_b));
            END IF;
        END IF;
    END PROCESS;
    sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_q <= sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_o(7 downto 0);

    -- sValPostSOutRange_uid161_fpArctan2Test(BITSELECT,160)@49
    sValPostSOutRange_uid161_fpArctan2Test_in <= sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_q(4 downto 0);
    sValPostSOutRange_uid161_fpArctan2Test_b <= sValPostSOutRange_uid161_fpArctan2Test_in(4 downto 0);

    -- rightShiftStageSel4Dto2_uid948_fxpAlignedRes_uid163_fpArctan2Test_merged_bit_select(BITSELECT,996)@49
    rightShiftStageSel4Dto2_uid948_fxpAlignedRes_uid163_fpArctan2Test_merged_bit_select_b <= sValPostSOutRange_uid161_fpArctan2Test_b(4 downto 2);
    rightShiftStageSel4Dto2_uid948_fxpAlignedRes_uid163_fpArctan2Test_merged_bit_select_c <= sValPostSOutRange_uid161_fpArctan2Test_b(1 downto 0);

    -- rightShiftStage1_uid960_fxpAlignedRes_uid163_fpArctan2Test(MUX,959)@49 + 1
    rightShiftStage1_uid960_fxpAlignedRes_uid163_fpArctan2Test_s <= rightShiftStageSel4Dto2_uid948_fxpAlignedRes_uid163_fpArctan2Test_merged_bit_select_c;
    rightShiftStage1_uid960_fxpAlignedRes_uid163_fpArctan2Test_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage1_uid960_fxpAlignedRes_uid163_fpArctan2Test_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage1_uid960_fxpAlignedRes_uid163_fpArctan2Test_s) IS
                WHEN "00" => rightShiftStage1_uid960_fxpAlignedRes_uid163_fpArctan2Test_q <= rightShiftStage0_uid949_fxpAlignedRes_uid163_fpArctan2Test_mfinal_q;
                WHEN "01" => rightShiftStage1_uid960_fxpAlignedRes_uid163_fpArctan2Test_q <= rightShiftStage1Idx1_uid952_fxpAlignedRes_uid163_fpArctan2Test_q;
                WHEN "10" => rightShiftStage1_uid960_fxpAlignedRes_uid163_fpArctan2Test_q <= rightShiftStage1Idx2_uid955_fxpAlignedRes_uid163_fpArctan2Test_q;
                WHEN "11" => rightShiftStage1_uid960_fxpAlignedRes_uid163_fpArctan2Test_q <= rightShiftStage1Idx3_uid958_fxpAlignedRes_uid163_fpArctan2Test_q;
                WHEN OTHERS => rightShiftStage1_uid960_fxpAlignedRes_uid163_fpArctan2Test_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- cstPi_uid155_fpArctan2Test(CONSTANT,154)
    cstPi_uid155_fpArctan2Test_q <= "11001001000011111101101010100010001000010110100";

    -- aPostPad_uid168_fpArctan2Test(BITJOIN,167)@50
    aPostPad_uid168_fpArctan2Test_q <= cstPi_uid155_fpArctan2Test_q & padACst_uid167_fpArctan2Test_q;

    -- subRes_uid169_fpArctan2Test(SUB,168)@50
    subRes_uid169_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & aPostPad_uid168_fpArctan2Test_q);
    subRes_uid169_fpArctan2Test_b <= STD_LOGIC_VECTOR("00" & rightShiftStage1_uid960_fxpAlignedRes_uid163_fpArctan2Test_q);
    subRes_uid169_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(subRes_uid169_fpArctan2Test_a) - UNSIGNED(subRes_uid169_fpArctan2Test_b));
    subRes_uid169_fpArctan2Test_q <= subRes_uid169_fpArctan2Test_o(49 downto 0);

    -- subResNormBit_uid170_fpArctan2Test(BITSELECT,169)@50
    subResNormBit_uid170_fpArctan2Test_in <= STD_LOGIC_VECTOR(subRes_uid169_fpArctan2Test_q(48 downto 0));
    subResNormBit_uid170_fpArctan2Test_b <= STD_LOGIC_VECTOR(subResNormBit_uid170_fpArctan2Test_in(48 downto 48));

    -- expRSub_uid174_fpArctan2Test(MUX,173)@50
    expRSub_uid174_fpArctan2Test_s <= subResNormBit_uid170_fpArctan2Test_b;
    expRSub_uid174_fpArctan2Test_combproc: PROCESS (expRSub_uid174_fpArctan2Test_s, cstBias_uid53_fpArctan2Test_q, cstBiasP1_uid56_fpArctan2Test_q)
    BEGIN
        CASE (expRSub_uid174_fpArctan2Test_s) IS
            WHEN "0" => expRSub_uid174_fpArctan2Test_q <= cstBias_uid53_fpArctan2Test_q;
            WHEN "1" => expRSub_uid174_fpArctan2Test_q <= cstBiasP1_uid56_fpArctan2Test_q;
            WHEN OTHERS => expRSub_uid174_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist59_expRCalc_uid154_fpArctan2Test_q_3(DELAY,1063)
    redist59_expRCalc_uid154_fpArctan2Test_q_3 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRCalc_uid154_fpArctan2Test_q, xout => redist59_expRCalc_uid154_fpArctan2Test_q_3_q, clk => clk, aclr => areset );

    -- xInExpFrac_uid43_fpArctan2Test(BITJOIN,42)@0
    xInExpFrac_uid43_fpArctan2Test_q <= exp_xIn_uid9_fpArctan2Test_b & frac_xIn_uid10_fpArctan2Test_b;

    -- xInZero_uid44_fpArctan2Test(LOGICAL,43)@0 + 1
    xInZero_uid44_fpArctan2Test_qi <= "1" WHEN xInExpFrac_uid43_fpArctan2Test_q = zwEwF_uid36_fpArctan2Test_q ELSE "0";
    xInZero_uid44_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xInZero_uid44_fpArctan2Test_qi, xout => xInZero_uid44_fpArctan2Test_q, clk => clk, aclr => areset );

    -- redist80_xInZero_uid44_fpArctan2Test_q_25(DELAY,1084)
    redist80_xInZero_uid44_fpArctan2Test_q_25 : dspba_delay
    GENERIC MAP ( width => 1, depth => 24, reset_kind => "ASYNC" )
    PORT MAP ( xin => xInZero_uid44_fpArctan2Test_q, xout => redist80_xInZero_uid44_fpArctan2Test_q_25_q, clk => clk, aclr => areset );

    -- redist84_xInSign_uid35_fpArctan2Test_b_25(DELAY,1088)
    redist84_xInSign_uid35_fpArctan2Test_b_25 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist83_xInSign_uid35_fpArctan2Test_b_17_q, xout => redist84_xInSign_uid35_fpArctan2Test_b_25_q, clk => clk, aclr => areset );

    -- xInIsLTEZero_uid175_fpArctan2Test(LOGICAL,174)@25 + 1
    xInIsLTEZero_uid175_fpArctan2Test_qi <= redist84_xInSign_uid35_fpArctan2Test_b_25_q or redist80_xInZero_uid44_fpArctan2Test_q_25_q;
    xInIsLTEZero_uid175_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xInIsLTEZero_uid175_fpArctan2Test_qi, xout => xInIsLTEZero_uid175_fpArctan2Test_q, clk => clk, aclr => areset );

    -- redist57_xInIsLTEZero_uid175_fpArctan2Test_q_25(DELAY,1061)
    redist57_xInIsLTEZero_uid175_fpArctan2Test_q_25 : dspba_delay
    GENERIC MAP ( width => 1, depth => 24, reset_kind => "ASYNC" )
    PORT MAP ( xin => xInIsLTEZero_uid175_fpArctan2Test_q, xout => redist57_xInIsLTEZero_uid175_fpArctan2Test_q_25_q, clk => clk, aclr => areset );

    -- expRFinal_uid177_fpArctan2Test(MUX,176)@50 + 1
    expRFinal_uid177_fpArctan2Test_s <= redist57_xInIsLTEZero_uid175_fpArctan2Test_q_25_q;
    expRFinal_uid177_fpArctan2Test_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRFinal_uid177_fpArctan2Test_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (expRFinal_uid177_fpArctan2Test_s) IS
                WHEN "0" => expRFinal_uid177_fpArctan2Test_q <= redist59_expRCalc_uid154_fpArctan2Test_q_3_q;
                WHEN "1" => expRFinal_uid177_fpArctan2Test_q <= expRSub_uid174_fpArctan2Test_q;
                WHEN OTHERS => expRFinal_uid177_fpArctan2Test_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- cstAllZWE_uid52_fpArctan2Test(CONSTANT,51)
    cstAllZWE_uid52_fpArctan2Test_q <= "00000000";

    -- invXInSign_uid179_fpArctan2Test(LOGICAL,178)@25
    invXInSign_uid179_fpArctan2Test_q <= not (redist84_xInSign_uid35_fpArctan2Test_b_25_q);

    -- excRZero2_uid180_fpArctan2Test(LOGICAL,179)@25
    excRZero2_uid180_fpArctan2Test_q <= redist80_xInZero_uid44_fpArctan2Test_q_25_q and redist81_yInZero_uid40_fpArctan2Test_q_25_q and invXInSign_uid179_fpArctan2Test_q;

    -- invYInSign_uid178_fpArctan2Test(LOGICAL,177)@25
    invYInSign_uid178_fpArctan2Test_q <= not (redist86_yInSign_uid34_fpArctan2Test_b_25_q);

    -- excRZero1_uid181_fpArctan2Test(LOGICAL,180)@25
    excRZero1_uid181_fpArctan2Test_q <= excZ_div_uid450_uid65_fpArctan2Test_q and invYInSign_uid178_fpArctan2Test_q and invXInSign_uid179_fpArctan2Test_q;

    -- excRZero_uid182_fpArctan2Test(LOGICAL,181)@25 + 1
    excRZero_uid182_fpArctan2Test_qi <= excRZero1_uid181_fpArctan2Test_q or excRZero2_uid180_fpArctan2Test_q;
    excRZero_uid182_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRZero_uid182_fpArctan2Test_qi, xout => excRZero_uid182_fpArctan2Test_q, clk => clk, aclr => areset );

    -- redist56_excRZero_uid182_fpArctan2Test_q_26(DELAY,1060)
    redist56_excRZero_uid182_fpArctan2Test_q_26 : dspba_delay
    GENERIC MAP ( width => 1, depth => 25, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRZero_uid182_fpArctan2Test_q, xout => redist56_excRZero_uid182_fpArctan2Test_q_26_q, clk => clk, aclr => areset );

    -- excSelBits_uid184_fpArctan2Test(BITJOIN,183)@51
    excSelBits_uid184_fpArctan2Test_q <= redist55_excRNaN_uid183_fpArctan2Test_q_35_q & GND_q & redist56_excRZero_uid182_fpArctan2Test_q_26_q;

    -- outMuxSelEnc_uid185_fpArctan2Test(LOOKUP,184)@51
    outMuxSelEnc_uid185_fpArctan2Test_combproc: PROCESS (excSelBits_uid184_fpArctan2Test_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excSelBits_uid184_fpArctan2Test_q) IS
            WHEN "000" => outMuxSelEnc_uid185_fpArctan2Test_q <= "01";
            WHEN "001" => outMuxSelEnc_uid185_fpArctan2Test_q <= "00";
            WHEN "010" => outMuxSelEnc_uid185_fpArctan2Test_q <= "10";
            WHEN "011" => outMuxSelEnc_uid185_fpArctan2Test_q <= "01";
            WHEN "100" => outMuxSelEnc_uid185_fpArctan2Test_q <= "11";
            WHEN "101" => outMuxSelEnc_uid185_fpArctan2Test_q <= "01";
            WHEN "110" => outMuxSelEnc_uid185_fpArctan2Test_q <= "01";
            WHEN "111" => outMuxSelEnc_uid185_fpArctan2Test_q <= "01";
            WHEN OTHERS => -- unreachable
                           outMuxSelEnc_uid185_fpArctan2Test_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid188_fpArctan2Test(MUX,187)@51
    expRPostExc_uid188_fpArctan2Test_s <= outMuxSelEnc_uid185_fpArctan2Test_q;
    expRPostExc_uid188_fpArctan2Test_combproc: PROCESS (expRPostExc_uid188_fpArctan2Test_s, cstAllZWE_uid52_fpArctan2Test_q, expRFinal_uid177_fpArctan2Test_q, cstAllOWE_uid6_fpArctan2Test_q)
    BEGIN
        CASE (expRPostExc_uid188_fpArctan2Test_s) IS
            WHEN "00" => expRPostExc_uid188_fpArctan2Test_q <= cstAllZWE_uid52_fpArctan2Test_q;
            WHEN "01" => expRPostExc_uid188_fpArctan2Test_q <= expRFinal_uid177_fpArctan2Test_q;
            WHEN "10" => expRPostExc_uid188_fpArctan2Test_q <= cstAllOWE_uid6_fpArctan2Test_q;
            WHEN "11" => expRPostExc_uid188_fpArctan2Test_q <= cstAllOWE_uid6_fpArctan2Test_q;
            WHEN OTHERS => expRPostExc_uid188_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- subResHigh_uid171_fpArctan2Test(BITSELECT,170)@50
    subResHigh_uid171_fpArctan2Test_in <= subRes_uid169_fpArctan2Test_q(47 downto 0);
    subResHigh_uid171_fpArctan2Test_b <= subResHigh_uid171_fpArctan2Test_in(47 downto 25);

    -- subResLow_uid172_fpArctan2Test(BITSELECT,171)@50
    subResLow_uid172_fpArctan2Test_in <= subRes_uid169_fpArctan2Test_q(46 downto 0);
    subResLow_uid172_fpArctan2Test_b <= subResLow_uid172_fpArctan2Test_in(46 downto 24);

    -- fracRSub_uid173_fpArctan2Test(MUX,172)@50 + 1
    fracRSub_uid173_fpArctan2Test_s <= subResNormBit_uid170_fpArctan2Test_b;
    fracRSub_uid173_fpArctan2Test_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRSub_uid173_fpArctan2Test_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRSub_uid173_fpArctan2Test_s) IS
                WHEN "0" => fracRSub_uid173_fpArctan2Test_q <= subResLow_uid172_fpArctan2Test_b;
                WHEN "1" => fracRSub_uid173_fpArctan2Test_q <= subResHigh_uid171_fpArctan2Test_b;
                WHEN OTHERS => fracRSub_uid173_fpArctan2Test_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist61_fracRCalc_uid152_fpArctan2Test_q_4(DELAY,1065)
    redist61_fracRCalc_uid152_fpArctan2Test_q_4 : dspba_delay
    GENERIC MAP ( width => 23, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist60_fracRCalc_uid152_fpArctan2Test_q_2_q, xout => redist61_fracRCalc_uid152_fpArctan2Test_q_4_q, clk => clk, aclr => areset );

    -- redist58_xInIsLTEZero_uid175_fpArctan2Test_q_26(DELAY,1062)
    redist58_xInIsLTEZero_uid175_fpArctan2Test_q_26 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist57_xInIsLTEZero_uid175_fpArctan2Test_q_25_q, xout => redist58_xInIsLTEZero_uid175_fpArctan2Test_q_26_q, clk => clk, aclr => areset );

    -- fracRFinal_uid176_fpArctan2Test(MUX,175)@51
    fracRFinal_uid176_fpArctan2Test_s <= redist58_xInIsLTEZero_uid175_fpArctan2Test_q_26_q;
    fracRFinal_uid176_fpArctan2Test_combproc: PROCESS (fracRFinal_uid176_fpArctan2Test_s, redist61_fracRCalc_uid152_fpArctan2Test_q_4_q, fracRSub_uid173_fpArctan2Test_q)
    BEGIN
        CASE (fracRFinal_uid176_fpArctan2Test_s) IS
            WHEN "0" => fracRFinal_uid176_fpArctan2Test_q <= redist61_fracRCalc_uid152_fpArctan2Test_q_4_q;
            WHEN "1" => fracRFinal_uid176_fpArctan2Test_q <= fracRSub_uid173_fpArctan2Test_q;
            WHEN OTHERS => fracRFinal_uid176_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPostExc_uid187_fpArctan2Test(MUX,186)@51
    fracRPostExc_uid187_fpArctan2Test_s <= outMuxSelEnc_uid185_fpArctan2Test_q;
    fracRPostExc_uid187_fpArctan2Test_combproc: PROCESS (fracRPostExc_uid187_fpArctan2Test_s, cstZeroWF_uid7_fpArctan2Test_q, fracRFinal_uid176_fpArctan2Test_q, cstNaNWF_uid51_fpArctan2Test_q)
    BEGIN
        CASE (fracRPostExc_uid187_fpArctan2Test_s) IS
            WHEN "00" => fracRPostExc_uid187_fpArctan2Test_q <= cstZeroWF_uid7_fpArctan2Test_q;
            WHEN "01" => fracRPostExc_uid187_fpArctan2Test_q <= fracRFinal_uid176_fpArctan2Test_q;
            WHEN "10" => fracRPostExc_uid187_fpArctan2Test_q <= cstZeroWF_uid7_fpArctan2Test_q;
            WHEN "11" => fracRPostExc_uid187_fpArctan2Test_q <= cstNaNWF_uid51_fpArctan2Test_q;
            WHEN OTHERS => fracRPostExc_uid187_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid191_fpArctan2Test(BITJOIN,190)@51
    R_uid191_fpArctan2Test_q <= signR_uid190_fpArctan2Test_q & expRPostExc_uid188_fpArctan2Test_q & fracRPostExc_uid187_fpArctan2Test_q;

    -- xOut(GPOUT,4)@51
    q <= R_uid191_fpArctan2Test_q;

END normal;
