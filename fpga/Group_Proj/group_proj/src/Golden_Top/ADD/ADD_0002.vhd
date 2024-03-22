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

-- VHDL created from ADD_0002
-- VHDL created on Thu Mar 07 09:58:08 2024


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

entity ADD_0002 is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        b : in std_logic_vector(31 downto 0);  -- float32_m23
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end ADD_0002;

architecture normal of ADD_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracX_uid6_fpAddTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal expFracY_uid7_fpAddTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal xGTEy_uid8_fpAddTest_a : STD_LOGIC_VECTOR (32 downto 0);
    signal xGTEy_uid8_fpAddTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal xGTEy_uid8_fpAddTest_o : STD_LOGIC_VECTOR (32 downto 0);
    signal xGTEy_uid8_fpAddTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal sigY_uid9_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracY_uid10_fpAddTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expY_uid11_fpAddTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal ypn_uid12_fpAddTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal aSig_uid16_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aSig_uid16_fpAddTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bSig_uid17_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal bSig_uid17_fpAddTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal cstAllOWE_uid18_fpAddTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstZeroWF_uid19_fpAddTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstAllZWE_uid20_fpAddTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal exp_aSig_uid21_fpAddTest_in : STD_LOGIC_VECTOR (30 downto 0);
    signal exp_aSig_uid21_fpAddTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_aSig_uid22_fpAddTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal frac_aSig_uid22_fpAddTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_aSig_uid16_uid23_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_aSig_uid16_uid23_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid24_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid24_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid25_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid25_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid26_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_aSig_uid27_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_aSig_uid28_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_aSig_uid28_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid29_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid30_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_aSig_uid31_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_bSig_uid35_fpAddTest_in : STD_LOGIC_VECTOR (30 downto 0);
    signal exp_bSig_uid35_fpAddTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_bSig_uid36_fpAddTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal frac_bSig_uid36_fpAddTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_bSig_uid17_uid37_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_bSig_uid17_uid37_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid38_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid38_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid39_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid40_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_bSig_uid41_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_bSig_uid41_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_bSig_uid42_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_bSig_uid42_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid43_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid44_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_bSig_uid45_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_bSig_uid45_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigA_uid50_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal sigB_uid51_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal effSub_uid52_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid56_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid56_fpAddTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal oFracB_uid59_fpAddTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal expAmExpB_uid60_fpAddTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expAmExpB_uid60_fpAddTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expAmExpB_uid60_fpAddTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expAmExpB_uid60_fpAddTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal oFracA_uid64_fpAddTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal oFracAE_uid65_fpAddTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal oFracBR_uid67_fpAddTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal oFracBREX_uid68_fpAddTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal oFracBREX_uid68_fpAddTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal oFracBREXC2_uid69_fpAddTest_a : STD_LOGIC_VECTOR (27 downto 0);
    signal oFracBREXC2_uid69_fpAddTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal oFracBREXC2_uid69_fpAddTest_o : STD_LOGIC_VECTOR (27 downto 0);
    signal oFracBREXC2_uid69_fpAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal oFracBREXC2_uid70_fpAddTest_in : STD_LOGIC_VECTOR (26 downto 0);
    signal oFracBREXC2_uid70_fpAddTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal fracAddResult_uid72_fpAddTest_a : STD_LOGIC_VECTOR (27 downto 0);
    signal fracAddResult_uid72_fpAddTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal fracAddResult_uid72_fpAddTest_o : STD_LOGIC_VECTOR (27 downto 0);
    signal fracAddResult_uid72_fpAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal fracAddResultNoSignExt_uid73_fpAddTest_in : STD_LOGIC_VECTOR (26 downto 0);
    signal fracAddResultNoSignExt_uid73_fpAddTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal cAmA_uid76_fpAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal aMinusA_uid77_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal aMinusA_uid77_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expInc_uid78_fpAddTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expInc_uid78_fpAddTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expInc_uid78_fpAddTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expInc_uid78_fpAddTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expPostNorm_uid79_fpAddTest_a : STD_LOGIC_VECTOR (9 downto 0);
    signal expPostNorm_uid79_fpAddTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal expPostNorm_uid79_fpAddTest_o : STD_LOGIC_VECTOR (9 downto 0);
    signal expPostNorm_uid79_fpAddTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal fracPostNormRndRange_uid80_fpAddTest_in : STD_LOGIC_VECTOR (25 downto 0);
    signal fracPostNormRndRange_uid80_fpAddTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal expFracR_uid81_fpAddTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal wEP2AllOwE_uid82_fpAddTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal rndExp_uid83_fpAddTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal rOvf_uid84_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdf_uid85_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPreExc_uid86_fpAddTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExc_uid86_fpAddTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPreExc_uid87_fpAddTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal expRPreExc_uid87_fpAddTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal regInputs_uid88_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZeroVInC_uid89_fpAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal excRZero_uid90_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rInfOvf_uid91_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal rInfOvf_uid91_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInfVInC_uid92_fpAddTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal excRInf_uid93_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN2_uid94_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAIBISub_uid95_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid96_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid97_fpAddTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid98_fpAddTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal invAMinusA_uid99_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRReg_uid100_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigBBInf_uid101_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigAAInf_uid102_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInf_uid103_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAZBZSigASigB_uid104_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excBZARSigA_uid105_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRZero_uid106_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInfRZRReg_uid107_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInfRZRReg_uid107_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcRNaN_uid108_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid109_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid109_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneFracRPostExc2_uid110_fpAddTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPostExc_uid113_fpAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid113_fpAddTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid117_fpAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid117_fpAddTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal R_uid118_fpAddTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zs_uid120_lzCountVal_uid74_fpAddTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid121_lzCountVal_uid74_fpAddTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid122_lzCountVal_uid74_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mO_uid123_lzCountVal_uid74_fpAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal vStage_uid124_lzCountVal_uid74_fpAddTest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal vStage_uid124_lzCountVal_uid74_fpAddTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal cStage_uid125_lzCountVal_uid74_fpAddTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vStagei_uid127_lzCountVal_uid74_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid127_lzCountVal_uid74_fpAddTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid130_lzCountVal_uid74_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid130_lzCountVal_uid74_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid133_lzCountVal_uid74_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid133_lzCountVal_uid74_fpAddTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal zs_uid134_lzCountVal_uid74_fpAddTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid136_lzCountVal_uid74_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid139_lzCountVal_uid74_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid139_lzCountVal_uid74_fpAddTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal zs_uid140_lzCountVal_uid74_fpAddTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid142_lzCountVal_uid74_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid145_lzCountVal_uid74_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid145_lzCountVal_uid74_fpAddTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid147_lzCountVal_uid74_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid148_lzCountVal_uid74_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid149_lzCountVal_uid74_fpAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal xMSB_uid151_alignmentShifter_uid71_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftedOut_uid154_alignmentShifter_uid71_fpAddTest_a : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid154_alignmentShifter_uid71_fpAddTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid154_alignmentShifter_uid71_fpAddTest_o : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid154_alignmentShifter_uid71_fpAddTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal seMsb_to4_uid155_in : STD_LOGIC_VECTOR (3 downto 0);
    signal seMsb_to4_uid155_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage0Idx1Rng4_uid156_alignmentShifter_uid71_fpAddTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStage0Idx1_uid157_alignmentShifter_uid71_fpAddTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal seMsb_to8_uid158_in : STD_LOGIC_VECTOR (7 downto 0);
    signal seMsb_to8_uid158_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage0Idx2Rng8_uid159_alignmentShifter_uid71_fpAddTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal rightShiftStage0Idx2_uid160_alignmentShifter_uid71_fpAddTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal seMsb_to12_uid161_in : STD_LOGIC_VECTOR (11 downto 0);
    signal seMsb_to12_uid161_b : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage0Idx3Rng12_uid162_alignmentShifter_uid71_fpAddTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal rightShiftStage0Idx3_uid163_alignmentShifter_uid71_fpAddTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal seMsb_to16_uid164_in : STD_LOGIC_VECTOR (15 downto 0);
    signal seMsb_to16_uid164_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage0Idx4Rng16_uid165_alignmentShifter_uid71_fpAddTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage0Idx4_uid166_alignmentShifter_uid71_fpAddTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal seMsb_to20_uid167_in : STD_LOGIC_VECTOR (19 downto 0);
    signal seMsb_to20_uid167_b : STD_LOGIC_VECTOR (19 downto 0);
    signal rightShiftStage0Idx5Rng20_uid168_alignmentShifter_uid71_fpAddTest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal rightShiftStage0Idx5_uid169_alignmentShifter_uid71_fpAddTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal seMsb_to24_uid170_in : STD_LOGIC_VECTOR (23 downto 0);
    signal seMsb_to24_uid170_b : STD_LOGIC_VECTOR (23 downto 0);
    signal rightShiftStage0Idx6Rng24_uid171_alignmentShifter_uid71_fpAddTest_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage0Idx6_uid172_alignmentShifter_uid71_fpAddTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal stageIndexName_to27_uid173_in : STD_LOGIC_VECTOR (26 downto 0);
    signal stageIndexName_to27_uid173_b : STD_LOGIC_VECTOR (26 downto 0);
    signal rightShiftStage1Idx1Rng1_uid177_alignmentShifter_uid71_fpAddTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal rightShiftStage1Idx1_uid178_alignmentShifter_uid71_fpAddTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal seMsb_to2_uid179_in : STD_LOGIC_VECTOR (1 downto 0);
    signal seMsb_to2_uid179_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1Idx2Rng2_uid180_alignmentShifter_uid71_fpAddTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal rightShiftStage1Idx2_uid181_alignmentShifter_uid71_fpAddTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal seMsb_to3_uid182_in : STD_LOGIC_VECTOR (2 downto 0);
    signal seMsb_to3_uid182_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage1Idx3Rng3_uid183_alignmentShifter_uid71_fpAddTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal rightShiftStage1Idx3_uid184_alignmentShifter_uid71_fpAddTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal rightShiftStage1_uid186_alignmentShifter_uid71_fpAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid186_alignmentShifter_uid71_fpAddTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal r_uid189_alignmentShifter_uid71_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid189_alignmentShifter_uid71_fpAddTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage0Idx1Rng4_uid194_fracPostNorm_uid75_fpAddTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal leftShiftStage0Idx1Rng4_uid194_fracPostNorm_uid75_fpAddTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal leftShiftStage0Idx1_uid195_fracPostNorm_uid75_fpAddTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage0Idx2Rng8_uid197_fracPostNorm_uid75_fpAddTest_in : STD_LOGIC_VECTOR (18 downto 0);
    signal leftShiftStage0Idx2Rng8_uid197_fracPostNorm_uid75_fpAddTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal leftShiftStage0Idx2_uid198_fracPostNorm_uid75_fpAddTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage0Idx3Pad12_uid199_fracPostNorm_uid75_fpAddTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal leftShiftStage0Idx3Rng12_uid200_fracPostNorm_uid75_fpAddTest_in : STD_LOGIC_VECTOR (14 downto 0);
    signal leftShiftStage0Idx3Rng12_uid200_fracPostNorm_uid75_fpAddTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal leftShiftStage0Idx3_uid201_fracPostNorm_uid75_fpAddTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage0Idx4_uid204_fracPostNorm_uid75_fpAddTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage0Idx5Pad20_uid205_fracPostNorm_uid75_fpAddTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal leftShiftStage0Idx5Rng20_uid206_fracPostNorm_uid75_fpAddTest_in : STD_LOGIC_VECTOR (6 downto 0);
    signal leftShiftStage0Idx5Rng20_uid206_fracPostNorm_uid75_fpAddTest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal leftShiftStage0Idx5_uid207_fracPostNorm_uid75_fpAddTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage0Idx6Pad24_uid208_fracPostNorm_uid75_fpAddTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx6Rng24_uid209_fracPostNorm_uid75_fpAddTest_in : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage0Idx6Rng24_uid209_fracPostNorm_uid75_fpAddTest_b : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage0Idx6_uid210_fracPostNorm_uid75_fpAddTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage0Idx7_uid211_fracPostNorm_uid75_fpAddTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage1Idx1Rng1_uid215_fracPostNorm_uid75_fpAddTest_in : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx1Rng1_uid215_fracPostNorm_uid75_fpAddTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx1_uid216_fracPostNorm_uid75_fpAddTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage1Idx2Rng2_uid218_fracPostNorm_uid75_fpAddTest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal leftShiftStage1Idx2Rng2_uid218_fracPostNorm_uid75_fpAddTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal leftShiftStage1Idx2_uid219_fracPostNorm_uid75_fpAddTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage1Idx3Pad3_uid220_fracPostNorm_uid75_fpAddTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage1Idx3Rng3_uid221_fracPostNorm_uid75_fpAddTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage1Idx3Rng3_uid221_fracPostNorm_uid75_fpAddTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage1Idx3_uid222_fracPostNorm_uid75_fpAddTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage1_uid224_fracPostNorm_uid75_fpAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid224_fracPostNorm_uid75_fpAddTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_msplit_0_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_msplit_0_q : STD_LOGIC_VECTOR (26 downto 0);
    signal rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_msplit_1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_msplit_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_mfinal_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_mfinal_q : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_msplit_0_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_msplit_0_q : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_msplit_1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_msplit_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_mfinal_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_mfinal_q : STD_LOGIC_VECTOR (26 downto 0);
    signal rightShiftStageSel4Dto2_uid175_alignmentShifter_uid71_fpAddTest_merged_bit_select_in : STD_LOGIC_VECTOR (4 downto 0);
    signal rightShiftStageSel4Dto2_uid175_alignmentShifter_uid71_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStageSel4Dto2_uid175_alignmentShifter_uid71_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid129_lzCountVal_uid74_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid129_lzCountVal_uid74_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid135_lzCountVal_uid74_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid135_lzCountVal_uid74_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid141_lzCountVal_uid74_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid141_lzCountVal_uid74_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel4Dto2_uid212_fracPostNorm_uid75_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStageSel4Dto2_uid212_fracPostNorm_uid75_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_selLSBs_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_selLSBs_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_selLSBs_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_selLSBs_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_rVStage_uid129_lzCountVal_uid74_fpAddTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist1_rVStage_uid129_lzCountVal_uid74_fpAddTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist2_rightShiftStageSel4Dto2_uid175_alignmentShifter_uid71_fpAddTest_merged_bit_select_b_2_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist3_rightShiftStageSel4Dto2_uid175_alignmentShifter_uid71_fpAddTest_merged_bit_select_c_2_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist4_stageIndexName_to27_uid173_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist5_shiftedOut_uid154_alignmentShifter_uid71_fpAddTest_n_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_r_uid149_lzCountVal_uid74_fpAddTest_q_1_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist7_vStage_uid124_lzCountVal_uid74_fpAddTest_b_2_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist8_vCount_uid122_lzCountVal_uid74_fpAddTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_expRPreExc_uid87_fpAddTest_b_2_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist10_fracRPreExc_uid86_fpAddTest_b_2_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist11_fracPostNormRndRange_uid80_fpAddTest_b_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist12_fracAddResultNoSignExt_uid73_fpAddTest_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist13_fracAddResultNoSignExt_uid73_fpAddTest_b_3_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist14_oFracBREXC2_uid70_fpAddTest_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist15_effSub_uid52_fpAddTest_q_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_sigB_uid51_fpAddTest_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_sigB_uid51_fpAddTest_b_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_sigA_uid50_fpAddTest_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_sigA_uid50_fpAddTest_b_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_excR_bSig_uid45_fpAddTest_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_excN_bSig_uid42_fpAddTest_q_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_excI_bSig_uid41_fpAddTest_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_excI_bSig_uid41_fpAddTest_q_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_excZ_bSig_uid17_uid37_fpAddTest_q_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_frac_bSig_uid36_fpAddTest_b_2_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist26_exp_bSig_uid35_fpAddTest_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist27_excI_aSig_uid27_fpAddTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_fracXIsZero_uid25_fpAddTest_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_frac_aSig_uid22_fpAddTest_b_4_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist30_exp_aSig_uid21_fpAddTest_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist31_exp_aSig_uid21_fpAddTest_b_7_q : STD_LOGIC_VECTOR (7 downto 0);

begin


    -- cAmA_uid76_fpAddTest(CONSTANT,75)
    cAmA_uid76_fpAddTest_q <= "11011";

    -- zs_uid120_lzCountVal_uid74_fpAddTest(CONSTANT,119)
    zs_uid120_lzCountVal_uid74_fpAddTest_q <= "0000000000000000";

    -- sigY_uid9_fpAddTest(BITSELECT,8)@0
    sigY_uid9_fpAddTest_b <= STD_LOGIC_VECTOR(b(31 downto 31));

    -- expY_uid11_fpAddTest(BITSELECT,10)@0
    expY_uid11_fpAddTest_b <= b(30 downto 23);

    -- fracY_uid10_fpAddTest(BITSELECT,9)@0
    fracY_uid10_fpAddTest_b <= b(22 downto 0);

    -- ypn_uid12_fpAddTest(BITJOIN,11)@0
    ypn_uid12_fpAddTest_q <= sigY_uid9_fpAddTest_b & expY_uid11_fpAddTest_b & fracY_uid10_fpAddTest_b;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- expFracY_uid7_fpAddTest(BITSELECT,6)@0
    expFracY_uid7_fpAddTest_b <= b(30 downto 0);

    -- expFracX_uid6_fpAddTest(BITSELECT,5)@0
    expFracX_uid6_fpAddTest_b <= a(30 downto 0);

    -- xGTEy_uid8_fpAddTest(COMPARE,7)@0
    xGTEy_uid8_fpAddTest_a <= STD_LOGIC_VECTOR("00" & expFracX_uid6_fpAddTest_b);
    xGTEy_uid8_fpAddTest_b <= STD_LOGIC_VECTOR("00" & expFracY_uid7_fpAddTest_b);
    xGTEy_uid8_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xGTEy_uid8_fpAddTest_a) - UNSIGNED(xGTEy_uid8_fpAddTest_b));
    xGTEy_uid8_fpAddTest_n(0) <= not (xGTEy_uid8_fpAddTest_o(32));

    -- bSig_uid17_fpAddTest(MUX,16)@0
    bSig_uid17_fpAddTest_s <= xGTEy_uid8_fpAddTest_n;
    bSig_uid17_fpAddTest_combproc: PROCESS (bSig_uid17_fpAddTest_s, a, ypn_uid12_fpAddTest_q)
    BEGIN
        CASE (bSig_uid17_fpAddTest_s) IS
            WHEN "0" => bSig_uid17_fpAddTest_q <= a;
            WHEN "1" => bSig_uid17_fpAddTest_q <= ypn_uid12_fpAddTest_q;
            WHEN OTHERS => bSig_uid17_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigB_uid51_fpAddTest(BITSELECT,50)@0
    sigB_uid51_fpAddTest_b <= STD_LOGIC_VECTOR(bSig_uid17_fpAddTest_q(31 downto 31));

    -- redist16_sigB_uid51_fpAddTest_b_2(DELAY,258)
    redist16_sigB_uid51_fpAddTest_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigB_uid51_fpAddTest_b, xout => redist16_sigB_uid51_fpAddTest_b_2_q, clk => clk, aclr => areset );

    -- aSig_uid16_fpAddTest(MUX,15)@0
    aSig_uid16_fpAddTest_s <= xGTEy_uid8_fpAddTest_n;
    aSig_uid16_fpAddTest_combproc: PROCESS (aSig_uid16_fpAddTest_s, ypn_uid12_fpAddTest_q, a)
    BEGIN
        CASE (aSig_uid16_fpAddTest_s) IS
            WHEN "0" => aSig_uid16_fpAddTest_q <= ypn_uid12_fpAddTest_q;
            WHEN "1" => aSig_uid16_fpAddTest_q <= a;
            WHEN OTHERS => aSig_uid16_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigA_uid50_fpAddTest(BITSELECT,49)@0
    sigA_uid50_fpAddTest_b <= STD_LOGIC_VECTOR(aSig_uid16_fpAddTest_q(31 downto 31));

    -- redist18_sigA_uid50_fpAddTest_b_2(DELAY,260)
    redist18_sigA_uid50_fpAddTest_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigA_uid50_fpAddTest_b, xout => redist18_sigA_uid50_fpAddTest_b_2_q, clk => clk, aclr => areset );

    -- effSub_uid52_fpAddTest(LOGICAL,51)@2
    effSub_uid52_fpAddTest_q <= redist18_sigA_uid50_fpAddTest_b_2_q xor redist16_sigB_uid51_fpAddTest_b_2_q;

    -- cstAllZWE_uid20_fpAddTest(CONSTANT,19)
    cstAllZWE_uid20_fpAddTest_q <= "00000000";

    -- exp_bSig_uid35_fpAddTest(BITSELECT,34)@0
    exp_bSig_uid35_fpAddTest_in <= bSig_uid17_fpAddTest_q(30 downto 0);
    exp_bSig_uid35_fpAddTest_b <= exp_bSig_uid35_fpAddTest_in(30 downto 23);

    -- redist26_exp_bSig_uid35_fpAddTest_b_1(DELAY,268)
    redist26_exp_bSig_uid35_fpAddTest_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => exp_bSig_uid35_fpAddTest_b, xout => redist26_exp_bSig_uid35_fpAddTest_b_1_q, clk => clk, aclr => areset );

    -- excZ_bSig_uid17_uid37_fpAddTest(LOGICAL,36)@1 + 1
    excZ_bSig_uid17_uid37_fpAddTest_qi <= "1" WHEN redist26_exp_bSig_uid35_fpAddTest_b_1_q = cstAllZWE_uid20_fpAddTest_q ELSE "0";
    excZ_bSig_uid17_uid37_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_bSig_uid17_uid37_fpAddTest_qi, xout => excZ_bSig_uid17_uid37_fpAddTest_q, clk => clk, aclr => areset );

    -- InvExpXIsZero_uid44_fpAddTest(LOGICAL,43)@2
    InvExpXIsZero_uid44_fpAddTest_q <= not (excZ_bSig_uid17_uid37_fpAddTest_q);

    -- cstZeroWF_uid19_fpAddTest(CONSTANT,18)
    cstZeroWF_uid19_fpAddTest_q <= "00000000000000000000000";

    -- frac_bSig_uid36_fpAddTest(BITSELECT,35)@0
    frac_bSig_uid36_fpAddTest_in <= bSig_uid17_fpAddTest_q(22 downto 0);
    frac_bSig_uid36_fpAddTest_b <= frac_bSig_uid36_fpAddTest_in(22 downto 0);

    -- redist25_frac_bSig_uid36_fpAddTest_b_2(DELAY,267)
    redist25_frac_bSig_uid36_fpAddTest_b_2 : dspba_delay
    GENERIC MAP ( width => 23, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => frac_bSig_uid36_fpAddTest_b, xout => redist25_frac_bSig_uid36_fpAddTest_b_2_q, clk => clk, aclr => areset );

    -- fracBz_uid56_fpAddTest(MUX,55)@2
    fracBz_uid56_fpAddTest_s <= excZ_bSig_uid17_uid37_fpAddTest_q;
    fracBz_uid56_fpAddTest_combproc: PROCESS (fracBz_uid56_fpAddTest_s, redist25_frac_bSig_uid36_fpAddTest_b_2_q, cstZeroWF_uid19_fpAddTest_q)
    BEGIN
        CASE (fracBz_uid56_fpAddTest_s) IS
            WHEN "0" => fracBz_uid56_fpAddTest_q <= redist25_frac_bSig_uid36_fpAddTest_b_2_q;
            WHEN "1" => fracBz_uid56_fpAddTest_q <= cstZeroWF_uid19_fpAddTest_q;
            WHEN OTHERS => fracBz_uid56_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oFracB_uid59_fpAddTest(BITJOIN,58)@2
    oFracB_uid59_fpAddTest_q <= InvExpXIsZero_uid44_fpAddTest_q & fracBz_uid56_fpAddTest_q;

    -- oFracBR_uid67_fpAddTest(BITJOIN,66)@2
    oFracBR_uid67_fpAddTest_q <= GND_q & oFracB_uid59_fpAddTest_q & GND_q & GND_q;

    -- oFracBREX_uid68_fpAddTest(LOGICAL,67)@2
    oFracBREX_uid68_fpAddTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 1 => effSub_uid52_fpAddTest_q(0)) & effSub_uid52_fpAddTest_q));
    oFracBREX_uid68_fpAddTest_q <= oFracBR_uid67_fpAddTest_q xor oFracBREX_uid68_fpAddTest_b;

    -- oFracBREXC2_uid69_fpAddTest(ADD,68)@2
    oFracBREXC2_uid69_fpAddTest_a <= STD_LOGIC_VECTOR("0" & oFracBREX_uid68_fpAddTest_q);
    oFracBREXC2_uid69_fpAddTest_b <= STD_LOGIC_VECTOR("000000000000000000000000000" & effSub_uid52_fpAddTest_q);
    oFracBREXC2_uid69_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(oFracBREXC2_uid69_fpAddTest_a) + UNSIGNED(oFracBREXC2_uid69_fpAddTest_b));
    oFracBREXC2_uid69_fpAddTest_q <= oFracBREXC2_uid69_fpAddTest_o(27 downto 0);

    -- oFracBREXC2_uid70_fpAddTest(BITSELECT,69)@2
    oFracBREXC2_uid70_fpAddTest_in <= STD_LOGIC_VECTOR(oFracBREXC2_uid69_fpAddTest_q(26 downto 0));
    oFracBREXC2_uid70_fpAddTest_b <= STD_LOGIC_VECTOR(oFracBREXC2_uid70_fpAddTest_in(26 downto 0));

    -- redist14_oFracBREXC2_uid70_fpAddTest_b_1(DELAY,256)
    redist14_oFracBREXC2_uid70_fpAddTest_b_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracBREXC2_uid70_fpAddTest_b, xout => redist14_oFracBREXC2_uid70_fpAddTest_b_1_q, clk => clk, aclr => areset );

    -- xMSB_uid151_alignmentShifter_uid71_fpAddTest(BITSELECT,150)@3
    xMSB_uid151_alignmentShifter_uid71_fpAddTest_b <= STD_LOGIC_VECTOR(redist14_oFracBREXC2_uid70_fpAddTest_b_1_q(26 downto 26));

    -- stageIndexName_to27_uid173(BITSELECT,172)@3
    stageIndexName_to27_uid173_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 1 => xMSB_uid151_alignmentShifter_uid71_fpAddTest_b(0)) & xMSB_uid151_alignmentShifter_uid71_fpAddTest_b));
    stageIndexName_to27_uid173_b <= STD_LOGIC_VECTOR(stageIndexName_to27_uid173_in(26 downto 0));

    -- redist4_stageIndexName_to27_uid173_b_1(DELAY,246)
    redist4_stageIndexName_to27_uid173_b_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => stageIndexName_to27_uid173_b, xout => redist4_stageIndexName_to27_uid173_b_1_q, clk => clk, aclr => areset );

    -- seMsb_to3_uid182(BITSELECT,181)@3
    seMsb_to3_uid182_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((2 downto 1 => xMSB_uid151_alignmentShifter_uid71_fpAddTest_b(0)) & xMSB_uid151_alignmentShifter_uid71_fpAddTest_b));
    seMsb_to3_uid182_b <= STD_LOGIC_VECTOR(seMsb_to3_uid182_in(2 downto 0));

    -- rightShiftStage1Idx3Rng3_uid183_alignmentShifter_uid71_fpAddTest(BITSELECT,182)@3
    rightShiftStage1Idx3Rng3_uid183_alignmentShifter_uid71_fpAddTest_b <= rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_mfinal_q(26 downto 3);

    -- rightShiftStage1Idx3_uid184_alignmentShifter_uid71_fpAddTest(BITJOIN,183)@3
    rightShiftStage1Idx3_uid184_alignmentShifter_uid71_fpAddTest_q <= seMsb_to3_uid182_b & rightShiftStage1Idx3Rng3_uid183_alignmentShifter_uid71_fpAddTest_b;

    -- seMsb_to2_uid179(BITSELECT,178)@3
    seMsb_to2_uid179_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((1 downto 1 => xMSB_uid151_alignmentShifter_uid71_fpAddTest_b(0)) & xMSB_uid151_alignmentShifter_uid71_fpAddTest_b));
    seMsb_to2_uid179_b <= STD_LOGIC_VECTOR(seMsb_to2_uid179_in(1 downto 0));

    -- rightShiftStage1Idx2Rng2_uid180_alignmentShifter_uid71_fpAddTest(BITSELECT,179)@3
    rightShiftStage1Idx2Rng2_uid180_alignmentShifter_uid71_fpAddTest_b <= rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_mfinal_q(26 downto 2);

    -- rightShiftStage1Idx2_uid181_alignmentShifter_uid71_fpAddTest(BITJOIN,180)@3
    rightShiftStage1Idx2_uid181_alignmentShifter_uid71_fpAddTest_q <= seMsb_to2_uid179_b & rightShiftStage1Idx2Rng2_uid180_alignmentShifter_uid71_fpAddTest_b;

    -- rightShiftStage1Idx1Rng1_uid177_alignmentShifter_uid71_fpAddTest(BITSELECT,176)@3
    rightShiftStage1Idx1Rng1_uid177_alignmentShifter_uid71_fpAddTest_b <= rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_mfinal_q(26 downto 1);

    -- rightShiftStage1Idx1_uid178_alignmentShifter_uid71_fpAddTest(BITJOIN,177)@3
    rightShiftStage1Idx1_uid178_alignmentShifter_uid71_fpAddTest_q <= xMSB_uid151_alignmentShifter_uid71_fpAddTest_b & rightShiftStage1Idx1Rng1_uid177_alignmentShifter_uid71_fpAddTest_b;

    -- seMsb_to24_uid170(BITSELECT,169)@3
    seMsb_to24_uid170_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 1 => xMSB_uid151_alignmentShifter_uid71_fpAddTest_b(0)) & xMSB_uid151_alignmentShifter_uid71_fpAddTest_b));
    seMsb_to24_uid170_b <= STD_LOGIC_VECTOR(seMsb_to24_uid170_in(23 downto 0));

    -- rightShiftStage0Idx6Rng24_uid171_alignmentShifter_uid71_fpAddTest(BITSELECT,170)@3
    rightShiftStage0Idx6Rng24_uid171_alignmentShifter_uid71_fpAddTest_b <= redist14_oFracBREXC2_uid70_fpAddTest_b_1_q(26 downto 24);

    -- rightShiftStage0Idx6_uid172_alignmentShifter_uid71_fpAddTest(BITJOIN,171)@3
    rightShiftStage0Idx6_uid172_alignmentShifter_uid71_fpAddTest_q <= seMsb_to24_uid170_b & rightShiftStage0Idx6Rng24_uid171_alignmentShifter_uid71_fpAddTest_b;

    -- seMsb_to20_uid167(BITSELECT,166)@3
    seMsb_to20_uid167_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 1 => xMSB_uid151_alignmentShifter_uid71_fpAddTest_b(0)) & xMSB_uid151_alignmentShifter_uid71_fpAddTest_b));
    seMsb_to20_uid167_b <= STD_LOGIC_VECTOR(seMsb_to20_uid167_in(19 downto 0));

    -- rightShiftStage0Idx5Rng20_uid168_alignmentShifter_uid71_fpAddTest(BITSELECT,167)@3
    rightShiftStage0Idx5Rng20_uid168_alignmentShifter_uid71_fpAddTest_b <= redist14_oFracBREXC2_uid70_fpAddTest_b_1_q(26 downto 20);

    -- rightShiftStage0Idx5_uid169_alignmentShifter_uid71_fpAddTest(BITJOIN,168)@3
    rightShiftStage0Idx5_uid169_alignmentShifter_uid71_fpAddTest_q <= seMsb_to20_uid167_b & rightShiftStage0Idx5Rng20_uid168_alignmentShifter_uid71_fpAddTest_b;

    -- seMsb_to16_uid164(BITSELECT,163)@3
    seMsb_to16_uid164_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 1 => xMSB_uid151_alignmentShifter_uid71_fpAddTest_b(0)) & xMSB_uid151_alignmentShifter_uid71_fpAddTest_b));
    seMsb_to16_uid164_b <= STD_LOGIC_VECTOR(seMsb_to16_uid164_in(15 downto 0));

    -- rightShiftStage0Idx4Rng16_uid165_alignmentShifter_uid71_fpAddTest(BITSELECT,164)@3
    rightShiftStage0Idx4Rng16_uid165_alignmentShifter_uid71_fpAddTest_b <= redist14_oFracBREXC2_uid70_fpAddTest_b_1_q(26 downto 16);

    -- rightShiftStage0Idx4_uid166_alignmentShifter_uid71_fpAddTest(BITJOIN,165)@3
    rightShiftStage0Idx4_uid166_alignmentShifter_uid71_fpAddTest_q <= seMsb_to16_uid164_b & rightShiftStage0Idx4Rng16_uid165_alignmentShifter_uid71_fpAddTest_b;

    -- rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_msplit_1(MUX,228)@3
    rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_msplit_1_s <= rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_selLSBs_merged_bit_select_b;
    rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_msplit_1_combproc: PROCESS (rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_msplit_1_s, rightShiftStage0Idx4_uid166_alignmentShifter_uid71_fpAddTest_q, rightShiftStage0Idx5_uid169_alignmentShifter_uid71_fpAddTest_q, rightShiftStage0Idx6_uid172_alignmentShifter_uid71_fpAddTest_q, stageIndexName_to27_uid173_b)
    BEGIN
        CASE (rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_msplit_1_s) IS
            WHEN "00" => rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_msplit_1_q <= rightShiftStage0Idx4_uid166_alignmentShifter_uid71_fpAddTest_q;
            WHEN "01" => rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_msplit_1_q <= rightShiftStage0Idx5_uid169_alignmentShifter_uid71_fpAddTest_q;
            WHEN "10" => rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_msplit_1_q <= rightShiftStage0Idx6_uid172_alignmentShifter_uid71_fpAddTest_q;
            WHEN "11" => rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_msplit_1_q <= stageIndexName_to27_uid173_b;
            WHEN OTHERS => rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_msplit_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- seMsb_to12_uid161(BITSELECT,160)@3
    seMsb_to12_uid161_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 1 => xMSB_uid151_alignmentShifter_uid71_fpAddTest_b(0)) & xMSB_uid151_alignmentShifter_uid71_fpAddTest_b));
    seMsb_to12_uid161_b <= STD_LOGIC_VECTOR(seMsb_to12_uid161_in(11 downto 0));

    -- rightShiftStage0Idx3Rng12_uid162_alignmentShifter_uid71_fpAddTest(BITSELECT,161)@3
    rightShiftStage0Idx3Rng12_uid162_alignmentShifter_uid71_fpAddTest_b <= redist14_oFracBREXC2_uid70_fpAddTest_b_1_q(26 downto 12);

    -- rightShiftStage0Idx3_uid163_alignmentShifter_uid71_fpAddTest(BITJOIN,162)@3
    rightShiftStage0Idx3_uid163_alignmentShifter_uid71_fpAddTest_q <= seMsb_to12_uid161_b & rightShiftStage0Idx3Rng12_uid162_alignmentShifter_uid71_fpAddTest_b;

    -- seMsb_to8_uid158(BITSELECT,157)@3
    seMsb_to8_uid158_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((7 downto 1 => xMSB_uid151_alignmentShifter_uid71_fpAddTest_b(0)) & xMSB_uid151_alignmentShifter_uid71_fpAddTest_b));
    seMsb_to8_uid158_b <= STD_LOGIC_VECTOR(seMsb_to8_uid158_in(7 downto 0));

    -- rightShiftStage0Idx2Rng8_uid159_alignmentShifter_uid71_fpAddTest(BITSELECT,158)@3
    rightShiftStage0Idx2Rng8_uid159_alignmentShifter_uid71_fpAddTest_b <= redist14_oFracBREXC2_uid70_fpAddTest_b_1_q(26 downto 8);

    -- rightShiftStage0Idx2_uid160_alignmentShifter_uid71_fpAddTest(BITJOIN,159)@3
    rightShiftStage0Idx2_uid160_alignmentShifter_uid71_fpAddTest_q <= seMsb_to8_uid158_b & rightShiftStage0Idx2Rng8_uid159_alignmentShifter_uid71_fpAddTest_b;

    -- seMsb_to4_uid155(BITSELECT,154)@3
    seMsb_to4_uid155_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 1 => xMSB_uid151_alignmentShifter_uid71_fpAddTest_b(0)) & xMSB_uid151_alignmentShifter_uid71_fpAddTest_b));
    seMsb_to4_uid155_b <= STD_LOGIC_VECTOR(seMsb_to4_uid155_in(3 downto 0));

    -- rightShiftStage0Idx1Rng4_uid156_alignmentShifter_uid71_fpAddTest(BITSELECT,155)@3
    rightShiftStage0Idx1Rng4_uid156_alignmentShifter_uid71_fpAddTest_b <= redist14_oFracBREXC2_uid70_fpAddTest_b_1_q(26 downto 4);

    -- rightShiftStage0Idx1_uid157_alignmentShifter_uid71_fpAddTest(BITJOIN,156)@3
    rightShiftStage0Idx1_uid157_alignmentShifter_uid71_fpAddTest_q <= seMsb_to4_uid155_b & rightShiftStage0Idx1Rng4_uid156_alignmentShifter_uid71_fpAddTest_b;

    -- rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_msplit_0(MUX,227)@3
    rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_msplit_0_s <= rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_selLSBs_merged_bit_select_b;
    rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_msplit_0_combproc: PROCESS (rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_msplit_0_s, redist14_oFracBREXC2_uid70_fpAddTest_b_1_q, rightShiftStage0Idx1_uid157_alignmentShifter_uid71_fpAddTest_q, rightShiftStage0Idx2_uid160_alignmentShifter_uid71_fpAddTest_q, rightShiftStage0Idx3_uid163_alignmentShifter_uid71_fpAddTest_q)
    BEGIN
        CASE (rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_msplit_0_s) IS
            WHEN "00" => rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_msplit_0_q <= redist14_oFracBREXC2_uid70_fpAddTest_b_1_q;
            WHEN "01" => rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_msplit_0_q <= rightShiftStage0Idx1_uid157_alignmentShifter_uid71_fpAddTest_q;
            WHEN "10" => rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_msplit_0_q <= rightShiftStage0Idx2_uid160_alignmentShifter_uid71_fpAddTest_q;
            WHEN "11" => rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_msplit_0_q <= rightShiftStage0Idx3_uid163_alignmentShifter_uid71_fpAddTest_q;
            WHEN OTHERS => rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_msplit_0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- exp_aSig_uid21_fpAddTest(BITSELECT,20)@0
    exp_aSig_uid21_fpAddTest_in <= aSig_uid16_fpAddTest_q(30 downto 0);
    exp_aSig_uid21_fpAddTest_b <= exp_aSig_uid21_fpAddTest_in(30 downto 23);

    -- redist30_exp_aSig_uid21_fpAddTest_b_1(DELAY,272)
    redist30_exp_aSig_uid21_fpAddTest_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => exp_aSig_uid21_fpAddTest_b, xout => redist30_exp_aSig_uid21_fpAddTest_b_1_q, clk => clk, aclr => areset );

    -- expAmExpB_uid60_fpAddTest(SUB,59)@1
    expAmExpB_uid60_fpAddTest_a <= STD_LOGIC_VECTOR("0" & redist30_exp_aSig_uid21_fpAddTest_b_1_q);
    expAmExpB_uid60_fpAddTest_b <= STD_LOGIC_VECTOR("0" & redist26_exp_bSig_uid35_fpAddTest_b_1_q);
    expAmExpB_uid60_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expAmExpB_uid60_fpAddTest_a) - UNSIGNED(expAmExpB_uid60_fpAddTest_b));
    expAmExpB_uid60_fpAddTest_q <= expAmExpB_uid60_fpAddTest_o(8 downto 0);

    -- rightShiftStageSel4Dto2_uid175_alignmentShifter_uid71_fpAddTest_merged_bit_select(BITSELECT,235)@1
    rightShiftStageSel4Dto2_uid175_alignmentShifter_uid71_fpAddTest_merged_bit_select_in <= expAmExpB_uid60_fpAddTest_q(4 downto 0);
    rightShiftStageSel4Dto2_uid175_alignmentShifter_uid71_fpAddTest_merged_bit_select_b <= rightShiftStageSel4Dto2_uid175_alignmentShifter_uid71_fpAddTest_merged_bit_select_in(4 downto 2);
    rightShiftStageSel4Dto2_uid175_alignmentShifter_uid71_fpAddTest_merged_bit_select_c <= rightShiftStageSel4Dto2_uid175_alignmentShifter_uid71_fpAddTest_merged_bit_select_in(1 downto 0);

    -- redist2_rightShiftStageSel4Dto2_uid175_alignmentShifter_uid71_fpAddTest_merged_bit_select_b_2(DELAY,244)
    redist2_rightShiftStageSel4Dto2_uid175_alignmentShifter_uid71_fpAddTest_merged_bit_select_b_2 : dspba_delay
    GENERIC MAP ( width => 3, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStageSel4Dto2_uid175_alignmentShifter_uid71_fpAddTest_merged_bit_select_b, xout => redist2_rightShiftStageSel4Dto2_uid175_alignmentShifter_uid71_fpAddTest_merged_bit_select_b_2_q, clk => clk, aclr => areset );

    -- rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_selLSBs_merged_bit_select(BITSELECT,240)@3
    rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_selLSBs_merged_bit_select_b <= redist2_rightShiftStageSel4Dto2_uid175_alignmentShifter_uid71_fpAddTest_merged_bit_select_b_2_q(1 downto 0);
    rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_selLSBs_merged_bit_select_c <= redist2_rightShiftStageSel4Dto2_uid175_alignmentShifter_uid71_fpAddTest_merged_bit_select_b_2_q(2 downto 2);

    -- rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_mfinal(MUX,229)@3
    rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_mfinal_s <= rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_selLSBs_merged_bit_select_c;
    rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_mfinal_combproc: PROCESS (rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_mfinal_s, rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_msplit_0_q, rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_msplit_1_q)
    BEGIN
        CASE (rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_mfinal_s) IS
            WHEN "0" => rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_mfinal_q <= rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_msplit_0_q;
            WHEN "1" => rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_mfinal_q <= rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_msplit_1_q;
            WHEN OTHERS => rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_mfinal_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist3_rightShiftStageSel4Dto2_uid175_alignmentShifter_uid71_fpAddTest_merged_bit_select_c_2(DELAY,245)
    redist3_rightShiftStageSel4Dto2_uid175_alignmentShifter_uid71_fpAddTest_merged_bit_select_c_2 : dspba_delay
    GENERIC MAP ( width => 2, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStageSel4Dto2_uid175_alignmentShifter_uid71_fpAddTest_merged_bit_select_c, xout => redist3_rightShiftStageSel4Dto2_uid175_alignmentShifter_uid71_fpAddTest_merged_bit_select_c_2_q, clk => clk, aclr => areset );

    -- rightShiftStage1_uid186_alignmentShifter_uid71_fpAddTest(MUX,185)@3 + 1
    rightShiftStage1_uid186_alignmentShifter_uid71_fpAddTest_s <= redist3_rightShiftStageSel4Dto2_uid175_alignmentShifter_uid71_fpAddTest_merged_bit_select_c_2_q;
    rightShiftStage1_uid186_alignmentShifter_uid71_fpAddTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage1_uid186_alignmentShifter_uid71_fpAddTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage1_uid186_alignmentShifter_uid71_fpAddTest_s) IS
                WHEN "00" => rightShiftStage1_uid186_alignmentShifter_uid71_fpAddTest_q <= rightShiftStage0_uid176_alignmentShifter_uid71_fpAddTest_mfinal_q;
                WHEN "01" => rightShiftStage1_uid186_alignmentShifter_uid71_fpAddTest_q <= rightShiftStage1Idx1_uid178_alignmentShifter_uid71_fpAddTest_q;
                WHEN "10" => rightShiftStage1_uid186_alignmentShifter_uid71_fpAddTest_q <= rightShiftStage1Idx2_uid181_alignmentShifter_uid71_fpAddTest_q;
                WHEN "11" => rightShiftStage1_uid186_alignmentShifter_uid71_fpAddTest_q <= rightShiftStage1Idx3_uid184_alignmentShifter_uid71_fpAddTest_q;
                WHEN OTHERS => rightShiftStage1_uid186_alignmentShifter_uid71_fpAddTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- shiftedOut_uid154_alignmentShifter_uid71_fpAddTest(COMPARE,153)@1 + 1
    shiftedOut_uid154_alignmentShifter_uid71_fpAddTest_a <= STD_LOGIC_VECTOR("00" & expAmExpB_uid60_fpAddTest_q);
    shiftedOut_uid154_alignmentShifter_uid71_fpAddTest_b <= STD_LOGIC_VECTOR("000000" & cAmA_uid76_fpAddTest_q);
    shiftedOut_uid154_alignmentShifter_uid71_fpAddTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftedOut_uid154_alignmentShifter_uid71_fpAddTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            shiftedOut_uid154_alignmentShifter_uid71_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid154_alignmentShifter_uid71_fpAddTest_a) - UNSIGNED(shiftedOut_uid154_alignmentShifter_uid71_fpAddTest_b));
        END IF;
    END PROCESS;
    shiftedOut_uid154_alignmentShifter_uid71_fpAddTest_n(0) <= not (shiftedOut_uid154_alignmentShifter_uid71_fpAddTest_o(10));

    -- redist5_shiftedOut_uid154_alignmentShifter_uid71_fpAddTest_n_3(DELAY,247)
    redist5_shiftedOut_uid154_alignmentShifter_uid71_fpAddTest_n_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => shiftedOut_uid154_alignmentShifter_uid71_fpAddTest_n, xout => redist5_shiftedOut_uid154_alignmentShifter_uid71_fpAddTest_n_3_q, clk => clk, aclr => areset );

    -- r_uid189_alignmentShifter_uid71_fpAddTest(MUX,188)@4
    r_uid189_alignmentShifter_uid71_fpAddTest_s <= redist5_shiftedOut_uid154_alignmentShifter_uid71_fpAddTest_n_3_q;
    r_uid189_alignmentShifter_uid71_fpAddTest_combproc: PROCESS (r_uid189_alignmentShifter_uid71_fpAddTest_s, rightShiftStage1_uid186_alignmentShifter_uid71_fpAddTest_q, redist4_stageIndexName_to27_uid173_b_1_q)
    BEGIN
        CASE (r_uid189_alignmentShifter_uid71_fpAddTest_s) IS
            WHEN "0" => r_uid189_alignmentShifter_uid71_fpAddTest_q <= rightShiftStage1_uid186_alignmentShifter_uid71_fpAddTest_q;
            WHEN "1" => r_uid189_alignmentShifter_uid71_fpAddTest_q <= redist4_stageIndexName_to27_uid173_b_1_q;
            WHEN OTHERS => r_uid189_alignmentShifter_uid71_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- frac_aSig_uid22_fpAddTest(BITSELECT,21)@0
    frac_aSig_uid22_fpAddTest_in <= aSig_uid16_fpAddTest_q(22 downto 0);
    frac_aSig_uid22_fpAddTest_b <= frac_aSig_uid22_fpAddTest_in(22 downto 0);

    -- redist29_frac_aSig_uid22_fpAddTest_b_4(DELAY,271)
    redist29_frac_aSig_uid22_fpAddTest_b_4 : dspba_delay
    GENERIC MAP ( width => 23, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => frac_aSig_uid22_fpAddTest_b, xout => redist29_frac_aSig_uid22_fpAddTest_b_4_q, clk => clk, aclr => areset );

    -- oFracA_uid64_fpAddTest(BITJOIN,63)@4
    oFracA_uid64_fpAddTest_q <= VCC_q & redist29_frac_aSig_uid22_fpAddTest_b_4_q;

    -- oFracAE_uid65_fpAddTest(BITJOIN,64)@4
    oFracAE_uid65_fpAddTest_q <= GND_q & oFracA_uid64_fpAddTest_q & GND_q & GND_q;

    -- fracAddResult_uid72_fpAddTest(ADD,71)@4
    fracAddResult_uid72_fpAddTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => oFracAE_uid65_fpAddTest_q(26)) & oFracAE_uid65_fpAddTest_q));
    fracAddResult_uid72_fpAddTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => r_uid189_alignmentShifter_uid71_fpAddTest_q(26)) & r_uid189_alignmentShifter_uid71_fpAddTest_q));
    fracAddResult_uid72_fpAddTest_o <= STD_LOGIC_VECTOR(SIGNED(fracAddResult_uid72_fpAddTest_a) + SIGNED(fracAddResult_uid72_fpAddTest_b));
    fracAddResult_uid72_fpAddTest_q <= fracAddResult_uid72_fpAddTest_o(27 downto 0);

    -- fracAddResultNoSignExt_uid73_fpAddTest(BITSELECT,72)@4
    fracAddResultNoSignExt_uid73_fpAddTest_in <= fracAddResult_uid72_fpAddTest_q(26 downto 0);
    fracAddResultNoSignExt_uid73_fpAddTest_b <= fracAddResultNoSignExt_uid73_fpAddTest_in(26 downto 0);

    -- redist12_fracAddResultNoSignExt_uid73_fpAddTest_b_1(DELAY,254)
    redist12_fracAddResultNoSignExt_uid73_fpAddTest_b_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracAddResultNoSignExt_uid73_fpAddTest_b, xout => redist12_fracAddResultNoSignExt_uid73_fpAddTest_b_1_q, clk => clk, aclr => areset );

    -- rVStage_uid121_lzCountVal_uid74_fpAddTest(BITSELECT,120)@5
    rVStage_uid121_lzCountVal_uid74_fpAddTest_b <= redist12_fracAddResultNoSignExt_uid73_fpAddTest_b_1_q(26 downto 11);

    -- vCount_uid122_lzCountVal_uid74_fpAddTest(LOGICAL,121)@5
    vCount_uid122_lzCountVal_uid74_fpAddTest_q <= "1" WHEN rVStage_uid121_lzCountVal_uid74_fpAddTest_b = zs_uid120_lzCountVal_uid74_fpAddTest_q ELSE "0";

    -- redist8_vCount_uid122_lzCountVal_uid74_fpAddTest_q_1(DELAY,250)
    redist8_vCount_uid122_lzCountVal_uid74_fpAddTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid122_lzCountVal_uid74_fpAddTest_q, xout => redist8_vCount_uid122_lzCountVal_uid74_fpAddTest_q_1_q, clk => clk, aclr => areset );

    -- vStage_uid124_lzCountVal_uid74_fpAddTest(BITSELECT,123)@5
    vStage_uid124_lzCountVal_uid74_fpAddTest_in <= redist12_fracAddResultNoSignExt_uid73_fpAddTest_b_1_q(10 downto 0);
    vStage_uid124_lzCountVal_uid74_fpAddTest_b <= vStage_uid124_lzCountVal_uid74_fpAddTest_in(10 downto 0);

    -- mO_uid123_lzCountVal_uid74_fpAddTest(CONSTANT,122)
    mO_uid123_lzCountVal_uid74_fpAddTest_q <= "11111";

    -- cStage_uid125_lzCountVal_uid74_fpAddTest(BITJOIN,124)@5
    cStage_uid125_lzCountVal_uid74_fpAddTest_q <= vStage_uid124_lzCountVal_uid74_fpAddTest_b & mO_uid123_lzCountVal_uid74_fpAddTest_q;

    -- vStagei_uid127_lzCountVal_uid74_fpAddTest(MUX,126)@5
    vStagei_uid127_lzCountVal_uid74_fpAddTest_s <= vCount_uid122_lzCountVal_uid74_fpAddTest_q;
    vStagei_uid127_lzCountVal_uid74_fpAddTest_combproc: PROCESS (vStagei_uid127_lzCountVal_uid74_fpAddTest_s, rVStage_uid121_lzCountVal_uid74_fpAddTest_b, cStage_uid125_lzCountVal_uid74_fpAddTest_q)
    BEGIN
        CASE (vStagei_uid127_lzCountVal_uid74_fpAddTest_s) IS
            WHEN "0" => vStagei_uid127_lzCountVal_uid74_fpAddTest_q <= rVStage_uid121_lzCountVal_uid74_fpAddTest_b;
            WHEN "1" => vStagei_uid127_lzCountVal_uid74_fpAddTest_q <= cStage_uid125_lzCountVal_uid74_fpAddTest_q;
            WHEN OTHERS => vStagei_uid127_lzCountVal_uid74_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid129_lzCountVal_uid74_fpAddTest_merged_bit_select(BITSELECT,236)@5
    rVStage_uid129_lzCountVal_uid74_fpAddTest_merged_bit_select_b <= vStagei_uid127_lzCountVal_uid74_fpAddTest_q(15 downto 8);
    rVStage_uid129_lzCountVal_uid74_fpAddTest_merged_bit_select_c <= vStagei_uid127_lzCountVal_uid74_fpAddTest_q(7 downto 0);

    -- vCount_uid130_lzCountVal_uid74_fpAddTest(LOGICAL,129)@5 + 1
    vCount_uid130_lzCountVal_uid74_fpAddTest_qi <= "1" WHEN rVStage_uid129_lzCountVal_uid74_fpAddTest_merged_bit_select_b = cstAllZWE_uid20_fpAddTest_q ELSE "0";
    vCount_uid130_lzCountVal_uid74_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid130_lzCountVal_uid74_fpAddTest_qi, xout => vCount_uid130_lzCountVal_uid74_fpAddTest_q, clk => clk, aclr => areset );

    -- zs_uid134_lzCountVal_uid74_fpAddTest(CONSTANT,133)
    zs_uid134_lzCountVal_uid74_fpAddTest_q <= "0000";

    -- redist1_rVStage_uid129_lzCountVal_uid74_fpAddTest_merged_bit_select_c_1(DELAY,243)
    redist1_rVStage_uid129_lzCountVal_uid74_fpAddTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid129_lzCountVal_uid74_fpAddTest_merged_bit_select_c, xout => redist1_rVStage_uid129_lzCountVal_uid74_fpAddTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- redist0_rVStage_uid129_lzCountVal_uid74_fpAddTest_merged_bit_select_b_1(DELAY,242)
    redist0_rVStage_uid129_lzCountVal_uid74_fpAddTest_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid129_lzCountVal_uid74_fpAddTest_merged_bit_select_b, xout => redist0_rVStage_uid129_lzCountVal_uid74_fpAddTest_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- vStagei_uid133_lzCountVal_uid74_fpAddTest(MUX,132)@6
    vStagei_uid133_lzCountVal_uid74_fpAddTest_s <= vCount_uid130_lzCountVal_uid74_fpAddTest_q;
    vStagei_uid133_lzCountVal_uid74_fpAddTest_combproc: PROCESS (vStagei_uid133_lzCountVal_uid74_fpAddTest_s, redist0_rVStage_uid129_lzCountVal_uid74_fpAddTest_merged_bit_select_b_1_q, redist1_rVStage_uid129_lzCountVal_uid74_fpAddTest_merged_bit_select_c_1_q)
    BEGIN
        CASE (vStagei_uid133_lzCountVal_uid74_fpAddTest_s) IS
            WHEN "0" => vStagei_uid133_lzCountVal_uid74_fpAddTest_q <= redist0_rVStage_uid129_lzCountVal_uid74_fpAddTest_merged_bit_select_b_1_q;
            WHEN "1" => vStagei_uid133_lzCountVal_uid74_fpAddTest_q <= redist1_rVStage_uid129_lzCountVal_uid74_fpAddTest_merged_bit_select_c_1_q;
            WHEN OTHERS => vStagei_uid133_lzCountVal_uid74_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid135_lzCountVal_uid74_fpAddTest_merged_bit_select(BITSELECT,237)@6
    rVStage_uid135_lzCountVal_uid74_fpAddTest_merged_bit_select_b <= vStagei_uid133_lzCountVal_uid74_fpAddTest_q(7 downto 4);
    rVStage_uid135_lzCountVal_uid74_fpAddTest_merged_bit_select_c <= vStagei_uid133_lzCountVal_uid74_fpAddTest_q(3 downto 0);

    -- vCount_uid136_lzCountVal_uid74_fpAddTest(LOGICAL,135)@6
    vCount_uid136_lzCountVal_uid74_fpAddTest_q <= "1" WHEN rVStage_uid135_lzCountVal_uid74_fpAddTest_merged_bit_select_b = zs_uid134_lzCountVal_uid74_fpAddTest_q ELSE "0";

    -- zs_uid140_lzCountVal_uid74_fpAddTest(CONSTANT,139)
    zs_uid140_lzCountVal_uid74_fpAddTest_q <= "00";

    -- vStagei_uid139_lzCountVal_uid74_fpAddTest(MUX,138)@6
    vStagei_uid139_lzCountVal_uid74_fpAddTest_s <= vCount_uid136_lzCountVal_uid74_fpAddTest_q;
    vStagei_uid139_lzCountVal_uid74_fpAddTest_combproc: PROCESS (vStagei_uid139_lzCountVal_uid74_fpAddTest_s, rVStage_uid135_lzCountVal_uid74_fpAddTest_merged_bit_select_b, rVStage_uid135_lzCountVal_uid74_fpAddTest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid139_lzCountVal_uid74_fpAddTest_s) IS
            WHEN "0" => vStagei_uid139_lzCountVal_uid74_fpAddTest_q <= rVStage_uid135_lzCountVal_uid74_fpAddTest_merged_bit_select_b;
            WHEN "1" => vStagei_uid139_lzCountVal_uid74_fpAddTest_q <= rVStage_uid135_lzCountVal_uid74_fpAddTest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid139_lzCountVal_uid74_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid141_lzCountVal_uid74_fpAddTest_merged_bit_select(BITSELECT,238)@6
    rVStage_uid141_lzCountVal_uid74_fpAddTest_merged_bit_select_b <= vStagei_uid139_lzCountVal_uid74_fpAddTest_q(3 downto 2);
    rVStage_uid141_lzCountVal_uid74_fpAddTest_merged_bit_select_c <= vStagei_uid139_lzCountVal_uid74_fpAddTest_q(1 downto 0);

    -- vCount_uid142_lzCountVal_uid74_fpAddTest(LOGICAL,141)@6
    vCount_uid142_lzCountVal_uid74_fpAddTest_q <= "1" WHEN rVStage_uid141_lzCountVal_uid74_fpAddTest_merged_bit_select_b = zs_uid140_lzCountVal_uid74_fpAddTest_q ELSE "0";

    -- vStagei_uid145_lzCountVal_uid74_fpAddTest(MUX,144)@6
    vStagei_uid145_lzCountVal_uid74_fpAddTest_s <= vCount_uid142_lzCountVal_uid74_fpAddTest_q;
    vStagei_uid145_lzCountVal_uid74_fpAddTest_combproc: PROCESS (vStagei_uid145_lzCountVal_uid74_fpAddTest_s, rVStage_uid141_lzCountVal_uid74_fpAddTest_merged_bit_select_b, rVStage_uid141_lzCountVal_uid74_fpAddTest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid145_lzCountVal_uid74_fpAddTest_s) IS
            WHEN "0" => vStagei_uid145_lzCountVal_uid74_fpAddTest_q <= rVStage_uid141_lzCountVal_uid74_fpAddTest_merged_bit_select_b;
            WHEN "1" => vStagei_uid145_lzCountVal_uid74_fpAddTest_q <= rVStage_uid141_lzCountVal_uid74_fpAddTest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid145_lzCountVal_uid74_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid147_lzCountVal_uid74_fpAddTest(BITSELECT,146)@6
    rVStage_uid147_lzCountVal_uid74_fpAddTest_b <= vStagei_uid145_lzCountVal_uid74_fpAddTest_q(1 downto 1);

    -- vCount_uid148_lzCountVal_uid74_fpAddTest(LOGICAL,147)@6
    vCount_uid148_lzCountVal_uid74_fpAddTest_q <= "1" WHEN rVStage_uid147_lzCountVal_uid74_fpAddTest_b = GND_q ELSE "0";

    -- r_uid149_lzCountVal_uid74_fpAddTest(BITJOIN,148)@6
    r_uid149_lzCountVal_uid74_fpAddTest_q <= redist8_vCount_uid122_lzCountVal_uid74_fpAddTest_q_1_q & vCount_uid130_lzCountVal_uid74_fpAddTest_q & vCount_uid136_lzCountVal_uid74_fpAddTest_q & vCount_uid142_lzCountVal_uid74_fpAddTest_q & vCount_uid148_lzCountVal_uid74_fpAddTest_q;

    -- redist6_r_uid149_lzCountVal_uid74_fpAddTest_q_1(DELAY,248)
    redist6_r_uid149_lzCountVal_uid74_fpAddTest_q_1 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => r_uid149_lzCountVal_uid74_fpAddTest_q, xout => redist6_r_uid149_lzCountVal_uid74_fpAddTest_q_1_q, clk => clk, aclr => areset );

    -- aMinusA_uid77_fpAddTest(LOGICAL,76)@7 + 1
    aMinusA_uid77_fpAddTest_qi <= "1" WHEN redist6_r_uid149_lzCountVal_uid74_fpAddTest_q_1_q = cAmA_uid76_fpAddTest_q ELSE "0";
    aMinusA_uid77_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aMinusA_uid77_fpAddTest_qi, xout => aMinusA_uid77_fpAddTest_q, clk => clk, aclr => areset );

    -- invAMinusA_uid99_fpAddTest(LOGICAL,98)@8
    invAMinusA_uid99_fpAddTest_q <= not (aMinusA_uid77_fpAddTest_q);

    -- redist19_sigA_uid50_fpAddTest_b_8(DELAY,261)
    redist19_sigA_uid50_fpAddTest_b_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist18_sigA_uid50_fpAddTest_b_2_q, xout => redist19_sigA_uid50_fpAddTest_b_8_q, clk => clk, aclr => areset );

    -- cstAllOWE_uid18_fpAddTest(CONSTANT,17)
    cstAllOWE_uid18_fpAddTest_q <= "11111111";

    -- expXIsMax_uid38_fpAddTest(LOGICAL,37)@1 + 1
    expXIsMax_uid38_fpAddTest_qi <= "1" WHEN redist26_exp_bSig_uid35_fpAddTest_b_1_q = cstAllOWE_uid18_fpAddTest_q ELSE "0";
    expXIsMax_uid38_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid38_fpAddTest_qi, xout => expXIsMax_uid38_fpAddTest_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid43_fpAddTest(LOGICAL,42)@2
    invExpXIsMax_uid43_fpAddTest_q <= not (expXIsMax_uid38_fpAddTest_q);

    -- excR_bSig_uid45_fpAddTest(LOGICAL,44)@2 + 1
    excR_bSig_uid45_fpAddTest_qi <= InvExpXIsZero_uid44_fpAddTest_q and invExpXIsMax_uid43_fpAddTest_q;
    excR_bSig_uid45_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excR_bSig_uid45_fpAddTest_qi, xout => excR_bSig_uid45_fpAddTest_q, clk => clk, aclr => areset );

    -- redist20_excR_bSig_uid45_fpAddTest_q_6(DELAY,262)
    redist20_excR_bSig_uid45_fpAddTest_q_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => excR_bSig_uid45_fpAddTest_q, xout => redist20_excR_bSig_uid45_fpAddTest_q_6_q, clk => clk, aclr => areset );

    -- redist31_exp_aSig_uid21_fpAddTest_b_7(DELAY,273)
    redist31_exp_aSig_uid21_fpAddTest_b_7 : dspba_delay
    GENERIC MAP ( width => 8, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist30_exp_aSig_uid21_fpAddTest_b_1_q, xout => redist31_exp_aSig_uid21_fpAddTest_b_7_q, clk => clk, aclr => areset );

    -- expXIsMax_uid24_fpAddTest(LOGICAL,23)@7 + 1
    expXIsMax_uid24_fpAddTest_qi <= "1" WHEN redist31_exp_aSig_uid21_fpAddTest_b_7_q = cstAllOWE_uid18_fpAddTest_q ELSE "0";
    expXIsMax_uid24_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid24_fpAddTest_qi, xout => expXIsMax_uid24_fpAddTest_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid29_fpAddTest(LOGICAL,28)@8
    invExpXIsMax_uid29_fpAddTest_q <= not (expXIsMax_uid24_fpAddTest_q);

    -- excZ_aSig_uid16_uid23_fpAddTest(LOGICAL,22)@7 + 1
    excZ_aSig_uid16_uid23_fpAddTest_qi <= "1" WHEN redist31_exp_aSig_uid21_fpAddTest_b_7_q = cstAllZWE_uid20_fpAddTest_q ELSE "0";
    excZ_aSig_uid16_uid23_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_aSig_uid16_uid23_fpAddTest_qi, xout => excZ_aSig_uid16_uid23_fpAddTest_q, clk => clk, aclr => areset );

    -- InvExpXIsZero_uid30_fpAddTest(LOGICAL,29)@8
    InvExpXIsZero_uid30_fpAddTest_q <= not (excZ_aSig_uid16_uid23_fpAddTest_q);

    -- excR_aSig_uid31_fpAddTest(LOGICAL,30)@8
    excR_aSig_uid31_fpAddTest_q <= InvExpXIsZero_uid30_fpAddTest_q and invExpXIsMax_uid29_fpAddTest_q;

    -- signRReg_uid100_fpAddTest(LOGICAL,99)@8
    signRReg_uid100_fpAddTest_q <= excR_aSig_uid31_fpAddTest_q and redist20_excR_bSig_uid45_fpAddTest_q_6_q and redist19_sigA_uid50_fpAddTest_b_8_q and invAMinusA_uid99_fpAddTest_q;

    -- redist17_sigB_uid51_fpAddTest_b_8(DELAY,259)
    redist17_sigB_uid51_fpAddTest_b_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist16_sigB_uid51_fpAddTest_b_2_q, xout => redist17_sigB_uid51_fpAddTest_b_8_q, clk => clk, aclr => areset );

    -- redist24_excZ_bSig_uid17_uid37_fpAddTest_q_7(DELAY,266)
    redist24_excZ_bSig_uid17_uid37_fpAddTest_q_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_bSig_uid17_uid37_fpAddTest_q, xout => redist24_excZ_bSig_uid17_uid37_fpAddTest_q_7_q, clk => clk, aclr => areset );

    -- excAZBZSigASigB_uid104_fpAddTest(LOGICAL,103)@8
    excAZBZSigASigB_uid104_fpAddTest_q <= excZ_aSig_uid16_uid23_fpAddTest_q and redist24_excZ_bSig_uid17_uid37_fpAddTest_q_7_q and redist19_sigA_uid50_fpAddTest_b_8_q and redist17_sigB_uid51_fpAddTest_b_8_q;

    -- excBZARSigA_uid105_fpAddTest(LOGICAL,104)@8
    excBZARSigA_uid105_fpAddTest_q <= redist24_excZ_bSig_uid17_uid37_fpAddTest_q_7_q and excR_aSig_uid31_fpAddTest_q and redist19_sigA_uid50_fpAddTest_b_8_q;

    -- signRZero_uid106_fpAddTest(LOGICAL,105)@8
    signRZero_uid106_fpAddTest_q <= excBZARSigA_uid105_fpAddTest_q or excAZBZSigASigB_uid104_fpAddTest_q;

    -- fracXIsZero_uid39_fpAddTest(LOGICAL,38)@2
    fracXIsZero_uid39_fpAddTest_q <= "1" WHEN cstZeroWF_uid19_fpAddTest_q = redist25_frac_bSig_uid36_fpAddTest_b_2_q ELSE "0";

    -- excI_bSig_uid41_fpAddTest(LOGICAL,40)@2 + 1
    excI_bSig_uid41_fpAddTest_qi <= expXIsMax_uid38_fpAddTest_q and fracXIsZero_uid39_fpAddTest_q;
    excI_bSig_uid41_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_bSig_uid41_fpAddTest_qi, xout => excI_bSig_uid41_fpAddTest_q, clk => clk, aclr => areset );

    -- redist22_excI_bSig_uid41_fpAddTest_q_6(DELAY,264)
    redist22_excI_bSig_uid41_fpAddTest_q_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_bSig_uid41_fpAddTest_q, xout => redist22_excI_bSig_uid41_fpAddTest_q_6_q, clk => clk, aclr => areset );

    -- sigBBInf_uid101_fpAddTest(LOGICAL,100)@8
    sigBBInf_uid101_fpAddTest_q <= redist17_sigB_uid51_fpAddTest_b_8_q and redist22_excI_bSig_uid41_fpAddTest_q_6_q;

    -- fracXIsZero_uid25_fpAddTest(LOGICAL,24)@4 + 1
    fracXIsZero_uid25_fpAddTest_qi <= "1" WHEN cstZeroWF_uid19_fpAddTest_q = redist29_frac_aSig_uid22_fpAddTest_b_4_q ELSE "0";
    fracXIsZero_uid25_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid25_fpAddTest_qi, xout => fracXIsZero_uid25_fpAddTest_q, clk => clk, aclr => areset );

    -- redist28_fracXIsZero_uid25_fpAddTest_q_4(DELAY,270)
    redist28_fracXIsZero_uid25_fpAddTest_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid25_fpAddTest_q, xout => redist28_fracXIsZero_uid25_fpAddTest_q_4_q, clk => clk, aclr => areset );

    -- excI_aSig_uid27_fpAddTest(LOGICAL,26)@8
    excI_aSig_uid27_fpAddTest_q <= expXIsMax_uid24_fpAddTest_q and redist28_fracXIsZero_uid25_fpAddTest_q_4_q;

    -- sigAAInf_uid102_fpAddTest(LOGICAL,101)@8
    sigAAInf_uid102_fpAddTest_q <= redist19_sigA_uid50_fpAddTest_b_8_q and excI_aSig_uid27_fpAddTest_q;

    -- signRInf_uid103_fpAddTest(LOGICAL,102)@8
    signRInf_uid103_fpAddTest_q <= sigAAInf_uid102_fpAddTest_q or sigBBInf_uid101_fpAddTest_q;

    -- signRInfRZRReg_uid107_fpAddTest(LOGICAL,106)@8 + 1
    signRInfRZRReg_uid107_fpAddTest_qi <= signRInf_uid103_fpAddTest_q or signRZero_uid106_fpAddTest_q or signRReg_uid100_fpAddTest_q;
    signRInfRZRReg_uid107_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRInfRZRReg_uid107_fpAddTest_qi, xout => signRInfRZRReg_uid107_fpAddTest_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid40_fpAddTest(LOGICAL,39)@2
    fracXIsNotZero_uid40_fpAddTest_q <= not (fracXIsZero_uid39_fpAddTest_q);

    -- excN_bSig_uid42_fpAddTest(LOGICAL,41)@2 + 1
    excN_bSig_uid42_fpAddTest_qi <= expXIsMax_uid38_fpAddTest_q and fracXIsNotZero_uid40_fpAddTest_q;
    excN_bSig_uid42_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_bSig_uid42_fpAddTest_qi, xout => excN_bSig_uid42_fpAddTest_q, clk => clk, aclr => areset );

    -- redist21_excN_bSig_uid42_fpAddTest_q_7(DELAY,263)
    redist21_excN_bSig_uid42_fpAddTest_q_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_bSig_uid42_fpAddTest_q, xout => redist21_excN_bSig_uid42_fpAddTest_q_7_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid26_fpAddTest(LOGICAL,25)@8
    fracXIsNotZero_uid26_fpAddTest_q <= not (redist28_fracXIsZero_uid25_fpAddTest_q_4_q);

    -- excN_aSig_uid28_fpAddTest(LOGICAL,27)@8 + 1
    excN_aSig_uid28_fpAddTest_qi <= expXIsMax_uid24_fpAddTest_q and fracXIsNotZero_uid26_fpAddTest_q;
    excN_aSig_uid28_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_aSig_uid28_fpAddTest_qi, xout => excN_aSig_uid28_fpAddTest_q, clk => clk, aclr => areset );

    -- excRNaN2_uid94_fpAddTest(LOGICAL,93)@9
    excRNaN2_uid94_fpAddTest_q <= excN_aSig_uid28_fpAddTest_q or redist21_excN_bSig_uid42_fpAddTest_q_7_q;

    -- redist15_effSub_uid52_fpAddTest_q_7(DELAY,257)
    redist15_effSub_uid52_fpAddTest_q_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "ASYNC" )
    PORT MAP ( xin => effSub_uid52_fpAddTest_q, xout => redist15_effSub_uid52_fpAddTest_q_7_q, clk => clk, aclr => areset );

    -- redist23_excI_bSig_uid41_fpAddTest_q_7(DELAY,265)
    redist23_excI_bSig_uid41_fpAddTest_q_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist22_excI_bSig_uid41_fpAddTest_q_6_q, xout => redist23_excI_bSig_uid41_fpAddTest_q_7_q, clk => clk, aclr => areset );

    -- redist27_excI_aSig_uid27_fpAddTest_q_1(DELAY,269)
    redist27_excI_aSig_uid27_fpAddTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_aSig_uid27_fpAddTest_q, xout => redist27_excI_aSig_uid27_fpAddTest_q_1_q, clk => clk, aclr => areset );

    -- excAIBISub_uid95_fpAddTest(LOGICAL,94)@9
    excAIBISub_uid95_fpAddTest_q <= redist27_excI_aSig_uid27_fpAddTest_q_1_q and redist23_excI_bSig_uid41_fpAddTest_q_7_q and redist15_effSub_uid52_fpAddTest_q_7_q;

    -- excRNaN_uid96_fpAddTest(LOGICAL,95)@9
    excRNaN_uid96_fpAddTest_q <= excAIBISub_uid95_fpAddTest_q or excRNaN2_uid94_fpAddTest_q;

    -- invExcRNaN_uid108_fpAddTest(LOGICAL,107)@9
    invExcRNaN_uid108_fpAddTest_q <= not (excRNaN_uid96_fpAddTest_q);

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- signRPostExc_uid109_fpAddTest(LOGICAL,108)@9 + 1
    signRPostExc_uid109_fpAddTest_qi <= invExcRNaN_uid108_fpAddTest_q and signRInfRZRReg_uid107_fpAddTest_q;
    signRPostExc_uid109_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRPostExc_uid109_fpAddTest_qi, xout => signRPostExc_uid109_fpAddTest_q, clk => clk, aclr => areset );

    -- expInc_uid78_fpAddTest(ADD,77)@7
    expInc_uid78_fpAddTest_a <= STD_LOGIC_VECTOR("0" & redist31_exp_aSig_uid21_fpAddTest_b_7_q);
    expInc_uid78_fpAddTest_b <= STD_LOGIC_VECTOR("00000000" & VCC_q);
    expInc_uid78_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expInc_uid78_fpAddTest_a) + UNSIGNED(expInc_uid78_fpAddTest_b));
    expInc_uid78_fpAddTest_q <= expInc_uid78_fpAddTest_o(8 downto 0);

    -- expPostNorm_uid79_fpAddTest(SUB,78)@7 + 1
    expPostNorm_uid79_fpAddTest_a <= STD_LOGIC_VECTOR("0" & expInc_uid78_fpAddTest_q);
    expPostNorm_uid79_fpAddTest_b <= STD_LOGIC_VECTOR("00000" & redist6_r_uid149_lzCountVal_uid74_fpAddTest_q_1_q);
    expPostNorm_uid79_fpAddTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expPostNorm_uid79_fpAddTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expPostNorm_uid79_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expPostNorm_uid79_fpAddTest_a) - UNSIGNED(expPostNorm_uid79_fpAddTest_b));
        END IF;
    END PROCESS;
    expPostNorm_uid79_fpAddTest_q <= expPostNorm_uid79_fpAddTest_o(9 downto 0);

    -- leftShiftStage1Idx3Rng3_uid221_fracPostNorm_uid75_fpAddTest(BITSELECT,220)@7
    leftShiftStage1Idx3Rng3_uid221_fracPostNorm_uid75_fpAddTest_in <= leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_mfinal_q(23 downto 0);
    leftShiftStage1Idx3Rng3_uid221_fracPostNorm_uid75_fpAddTest_b <= leftShiftStage1Idx3Rng3_uid221_fracPostNorm_uid75_fpAddTest_in(23 downto 0);

    -- leftShiftStage1Idx3Pad3_uid220_fracPostNorm_uid75_fpAddTest(CONSTANT,219)
    leftShiftStage1Idx3Pad3_uid220_fracPostNorm_uid75_fpAddTest_q <= "000";

    -- leftShiftStage1Idx3_uid222_fracPostNorm_uid75_fpAddTest(BITJOIN,221)@7
    leftShiftStage1Idx3_uid222_fracPostNorm_uid75_fpAddTest_q <= leftShiftStage1Idx3Rng3_uid221_fracPostNorm_uid75_fpAddTest_b & leftShiftStage1Idx3Pad3_uid220_fracPostNorm_uid75_fpAddTest_q;

    -- leftShiftStage1Idx2Rng2_uid218_fracPostNorm_uid75_fpAddTest(BITSELECT,217)@7
    leftShiftStage1Idx2Rng2_uid218_fracPostNorm_uid75_fpAddTest_in <= leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_mfinal_q(24 downto 0);
    leftShiftStage1Idx2Rng2_uid218_fracPostNorm_uid75_fpAddTest_b <= leftShiftStage1Idx2Rng2_uid218_fracPostNorm_uid75_fpAddTest_in(24 downto 0);

    -- leftShiftStage1Idx2_uid219_fracPostNorm_uid75_fpAddTest(BITJOIN,218)@7
    leftShiftStage1Idx2_uid219_fracPostNorm_uid75_fpAddTest_q <= leftShiftStage1Idx2Rng2_uid218_fracPostNorm_uid75_fpAddTest_b & zs_uid140_lzCountVal_uid74_fpAddTest_q;

    -- leftShiftStage1Idx1Rng1_uid215_fracPostNorm_uid75_fpAddTest(BITSELECT,214)@7
    leftShiftStage1Idx1Rng1_uid215_fracPostNorm_uid75_fpAddTest_in <= leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_mfinal_q(25 downto 0);
    leftShiftStage1Idx1Rng1_uid215_fracPostNorm_uid75_fpAddTest_b <= leftShiftStage1Idx1Rng1_uid215_fracPostNorm_uid75_fpAddTest_in(25 downto 0);

    -- leftShiftStage1Idx1_uid216_fracPostNorm_uid75_fpAddTest(BITJOIN,215)@7
    leftShiftStage1Idx1_uid216_fracPostNorm_uid75_fpAddTest_q <= leftShiftStage1Idx1Rng1_uid215_fracPostNorm_uid75_fpAddTest_b & GND_q;

    -- leftShiftStage0Idx7_uid211_fracPostNorm_uid75_fpAddTest(CONSTANT,210)
    leftShiftStage0Idx7_uid211_fracPostNorm_uid75_fpAddTest_q <= "000000000000000000000000000";

    -- redist13_fracAddResultNoSignExt_uid73_fpAddTest_b_3(DELAY,255)
    redist13_fracAddResultNoSignExt_uid73_fpAddTest_b_3 : dspba_delay
    GENERIC MAP ( width => 27, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist12_fracAddResultNoSignExt_uid73_fpAddTest_b_1_q, xout => redist13_fracAddResultNoSignExt_uid73_fpAddTest_b_3_q, clk => clk, aclr => areset );

    -- leftShiftStage0Idx6Rng24_uid209_fracPostNorm_uid75_fpAddTest(BITSELECT,208)@7
    leftShiftStage0Idx6Rng24_uid209_fracPostNorm_uid75_fpAddTest_in <= redist13_fracAddResultNoSignExt_uid73_fpAddTest_b_3_q(2 downto 0);
    leftShiftStage0Idx6Rng24_uid209_fracPostNorm_uid75_fpAddTest_b <= leftShiftStage0Idx6Rng24_uid209_fracPostNorm_uid75_fpAddTest_in(2 downto 0);

    -- leftShiftStage0Idx6Pad24_uid208_fracPostNorm_uid75_fpAddTest(CONSTANT,207)
    leftShiftStage0Idx6Pad24_uid208_fracPostNorm_uid75_fpAddTest_q <= "000000000000000000000000";

    -- leftShiftStage0Idx6_uid210_fracPostNorm_uid75_fpAddTest(BITJOIN,209)@7
    leftShiftStage0Idx6_uid210_fracPostNorm_uid75_fpAddTest_q <= leftShiftStage0Idx6Rng24_uid209_fracPostNorm_uid75_fpAddTest_b & leftShiftStage0Idx6Pad24_uid208_fracPostNorm_uid75_fpAddTest_q;

    -- leftShiftStage0Idx5Rng20_uid206_fracPostNorm_uid75_fpAddTest(BITSELECT,205)@7
    leftShiftStage0Idx5Rng20_uid206_fracPostNorm_uid75_fpAddTest_in <= redist13_fracAddResultNoSignExt_uid73_fpAddTest_b_3_q(6 downto 0);
    leftShiftStage0Idx5Rng20_uid206_fracPostNorm_uid75_fpAddTest_b <= leftShiftStage0Idx5Rng20_uid206_fracPostNorm_uid75_fpAddTest_in(6 downto 0);

    -- leftShiftStage0Idx5Pad20_uid205_fracPostNorm_uid75_fpAddTest(CONSTANT,204)
    leftShiftStage0Idx5Pad20_uid205_fracPostNorm_uid75_fpAddTest_q <= "00000000000000000000";

    -- leftShiftStage0Idx5_uid207_fracPostNorm_uid75_fpAddTest(BITJOIN,206)@7
    leftShiftStage0Idx5_uid207_fracPostNorm_uid75_fpAddTest_q <= leftShiftStage0Idx5Rng20_uid206_fracPostNorm_uid75_fpAddTest_b & leftShiftStage0Idx5Pad20_uid205_fracPostNorm_uid75_fpAddTest_q;

    -- redist7_vStage_uid124_lzCountVal_uid74_fpAddTest_b_2(DELAY,249)
    redist7_vStage_uid124_lzCountVal_uid74_fpAddTest_b_2 : dspba_delay
    GENERIC MAP ( width => 11, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => vStage_uid124_lzCountVal_uid74_fpAddTest_b, xout => redist7_vStage_uid124_lzCountVal_uid74_fpAddTest_b_2_q, clk => clk, aclr => areset );

    -- leftShiftStage0Idx4_uid204_fracPostNorm_uid75_fpAddTest(BITJOIN,203)@7
    leftShiftStage0Idx4_uid204_fracPostNorm_uid75_fpAddTest_q <= redist7_vStage_uid124_lzCountVal_uid74_fpAddTest_b_2_q & zs_uid120_lzCountVal_uid74_fpAddTest_q;

    -- leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_msplit_1(MUX,233)@7
    leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_msplit_1_s <= leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_selLSBs_merged_bit_select_b;
    leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_msplit_1_combproc: PROCESS (leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_msplit_1_s, leftShiftStage0Idx4_uid204_fracPostNorm_uid75_fpAddTest_q, leftShiftStage0Idx5_uid207_fracPostNorm_uid75_fpAddTest_q, leftShiftStage0Idx6_uid210_fracPostNorm_uid75_fpAddTest_q, leftShiftStage0Idx7_uid211_fracPostNorm_uid75_fpAddTest_q)
    BEGIN
        CASE (leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_msplit_1_s) IS
            WHEN "00" => leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_msplit_1_q <= leftShiftStage0Idx4_uid204_fracPostNorm_uid75_fpAddTest_q;
            WHEN "01" => leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_msplit_1_q <= leftShiftStage0Idx5_uid207_fracPostNorm_uid75_fpAddTest_q;
            WHEN "10" => leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_msplit_1_q <= leftShiftStage0Idx6_uid210_fracPostNorm_uid75_fpAddTest_q;
            WHEN "11" => leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_msplit_1_q <= leftShiftStage0Idx7_uid211_fracPostNorm_uid75_fpAddTest_q;
            WHEN OTHERS => leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_msplit_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage0Idx3Rng12_uid200_fracPostNorm_uid75_fpAddTest(BITSELECT,199)@7
    leftShiftStage0Idx3Rng12_uid200_fracPostNorm_uid75_fpAddTest_in <= redist13_fracAddResultNoSignExt_uid73_fpAddTest_b_3_q(14 downto 0);
    leftShiftStage0Idx3Rng12_uid200_fracPostNorm_uid75_fpAddTest_b <= leftShiftStage0Idx3Rng12_uid200_fracPostNorm_uid75_fpAddTest_in(14 downto 0);

    -- leftShiftStage0Idx3Pad12_uid199_fracPostNorm_uid75_fpAddTest(CONSTANT,198)
    leftShiftStage0Idx3Pad12_uid199_fracPostNorm_uid75_fpAddTest_q <= "000000000000";

    -- leftShiftStage0Idx3_uid201_fracPostNorm_uid75_fpAddTest(BITJOIN,200)@7
    leftShiftStage0Idx3_uid201_fracPostNorm_uid75_fpAddTest_q <= leftShiftStage0Idx3Rng12_uid200_fracPostNorm_uid75_fpAddTest_b & leftShiftStage0Idx3Pad12_uid199_fracPostNorm_uid75_fpAddTest_q;

    -- leftShiftStage0Idx2Rng8_uid197_fracPostNorm_uid75_fpAddTest(BITSELECT,196)@7
    leftShiftStage0Idx2Rng8_uid197_fracPostNorm_uid75_fpAddTest_in <= redist13_fracAddResultNoSignExt_uid73_fpAddTest_b_3_q(18 downto 0);
    leftShiftStage0Idx2Rng8_uid197_fracPostNorm_uid75_fpAddTest_b <= leftShiftStage0Idx2Rng8_uid197_fracPostNorm_uid75_fpAddTest_in(18 downto 0);

    -- leftShiftStage0Idx2_uid198_fracPostNorm_uid75_fpAddTest(BITJOIN,197)@7
    leftShiftStage0Idx2_uid198_fracPostNorm_uid75_fpAddTest_q <= leftShiftStage0Idx2Rng8_uid197_fracPostNorm_uid75_fpAddTest_b & cstAllZWE_uid20_fpAddTest_q;

    -- leftShiftStage0Idx1Rng4_uid194_fracPostNorm_uid75_fpAddTest(BITSELECT,193)@7
    leftShiftStage0Idx1Rng4_uid194_fracPostNorm_uid75_fpAddTest_in <= redist13_fracAddResultNoSignExt_uid73_fpAddTest_b_3_q(22 downto 0);
    leftShiftStage0Idx1Rng4_uid194_fracPostNorm_uid75_fpAddTest_b <= leftShiftStage0Idx1Rng4_uid194_fracPostNorm_uid75_fpAddTest_in(22 downto 0);

    -- leftShiftStage0Idx1_uid195_fracPostNorm_uid75_fpAddTest(BITJOIN,194)@7
    leftShiftStage0Idx1_uid195_fracPostNorm_uid75_fpAddTest_q <= leftShiftStage0Idx1Rng4_uid194_fracPostNorm_uid75_fpAddTest_b & zs_uid134_lzCountVal_uid74_fpAddTest_q;

    -- leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_msplit_0(MUX,232)@7
    leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_msplit_0_s <= leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_selLSBs_merged_bit_select_b;
    leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_msplit_0_combproc: PROCESS (leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_msplit_0_s, redist13_fracAddResultNoSignExt_uid73_fpAddTest_b_3_q, leftShiftStage0Idx1_uid195_fracPostNorm_uid75_fpAddTest_q, leftShiftStage0Idx2_uid198_fracPostNorm_uid75_fpAddTest_q, leftShiftStage0Idx3_uid201_fracPostNorm_uid75_fpAddTest_q)
    BEGIN
        CASE (leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_msplit_0_s) IS
            WHEN "00" => leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_msplit_0_q <= redist13_fracAddResultNoSignExt_uid73_fpAddTest_b_3_q;
            WHEN "01" => leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_msplit_0_q <= leftShiftStage0Idx1_uid195_fracPostNorm_uid75_fpAddTest_q;
            WHEN "10" => leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_msplit_0_q <= leftShiftStage0Idx2_uid198_fracPostNorm_uid75_fpAddTest_q;
            WHEN "11" => leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_msplit_0_q <= leftShiftStage0Idx3_uid201_fracPostNorm_uid75_fpAddTest_q;
            WHEN OTHERS => leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_msplit_0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_selLSBs_merged_bit_select(BITSELECT,241)@7
    leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_selLSBs_merged_bit_select_b <= leftShiftStageSel4Dto2_uid212_fracPostNorm_uid75_fpAddTest_merged_bit_select_b(1 downto 0);
    leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_selLSBs_merged_bit_select_c <= leftShiftStageSel4Dto2_uid212_fracPostNorm_uid75_fpAddTest_merged_bit_select_b(2 downto 2);

    -- leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_mfinal(MUX,234)@7
    leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_mfinal_s <= leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_selLSBs_merged_bit_select_c;
    leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_mfinal_combproc: PROCESS (leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_mfinal_s, leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_msplit_0_q, leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_msplit_1_q)
    BEGIN
        CASE (leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_mfinal_s) IS
            WHEN "0" => leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_mfinal_q <= leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_msplit_0_q;
            WHEN "1" => leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_mfinal_q <= leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_msplit_1_q;
            WHEN OTHERS => leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_mfinal_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStageSel4Dto2_uid212_fracPostNorm_uid75_fpAddTest_merged_bit_select(BITSELECT,239)@7
    leftShiftStageSel4Dto2_uid212_fracPostNorm_uid75_fpAddTest_merged_bit_select_b <= redist6_r_uid149_lzCountVal_uid74_fpAddTest_q_1_q(4 downto 2);
    leftShiftStageSel4Dto2_uid212_fracPostNorm_uid75_fpAddTest_merged_bit_select_c <= redist6_r_uid149_lzCountVal_uid74_fpAddTest_q_1_q(1 downto 0);

    -- leftShiftStage1_uid224_fracPostNorm_uid75_fpAddTest(MUX,223)@7
    leftShiftStage1_uid224_fracPostNorm_uid75_fpAddTest_s <= leftShiftStageSel4Dto2_uid212_fracPostNorm_uid75_fpAddTest_merged_bit_select_c;
    leftShiftStage1_uid224_fracPostNorm_uid75_fpAddTest_combproc: PROCESS (leftShiftStage1_uid224_fracPostNorm_uid75_fpAddTest_s, leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_mfinal_q, leftShiftStage1Idx1_uid216_fracPostNorm_uid75_fpAddTest_q, leftShiftStage1Idx2_uid219_fracPostNorm_uid75_fpAddTest_q, leftShiftStage1Idx3_uid222_fracPostNorm_uid75_fpAddTest_q)
    BEGIN
        CASE (leftShiftStage1_uid224_fracPostNorm_uid75_fpAddTest_s) IS
            WHEN "00" => leftShiftStage1_uid224_fracPostNorm_uid75_fpAddTest_q <= leftShiftStage0_uid213_fracPostNorm_uid75_fpAddTest_mfinal_q;
            WHEN "01" => leftShiftStage1_uid224_fracPostNorm_uid75_fpAddTest_q <= leftShiftStage1Idx1_uid216_fracPostNorm_uid75_fpAddTest_q;
            WHEN "10" => leftShiftStage1_uid224_fracPostNorm_uid75_fpAddTest_q <= leftShiftStage1Idx2_uid219_fracPostNorm_uid75_fpAddTest_q;
            WHEN "11" => leftShiftStage1_uid224_fracPostNorm_uid75_fpAddTest_q <= leftShiftStage1Idx3_uid222_fracPostNorm_uid75_fpAddTest_q;
            WHEN OTHERS => leftShiftStage1_uid224_fracPostNorm_uid75_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracPostNormRndRange_uid80_fpAddTest(BITSELECT,79)@7
    fracPostNormRndRange_uid80_fpAddTest_in <= leftShiftStage1_uid224_fracPostNorm_uid75_fpAddTest_q(25 downto 0);
    fracPostNormRndRange_uid80_fpAddTest_b <= fracPostNormRndRange_uid80_fpAddTest_in(25 downto 2);

    -- redist11_fracPostNormRndRange_uid80_fpAddTest_b_1(DELAY,253)
    redist11_fracPostNormRndRange_uid80_fpAddTest_b_1 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracPostNormRndRange_uid80_fpAddTest_b, xout => redist11_fracPostNormRndRange_uid80_fpAddTest_b_1_q, clk => clk, aclr => areset );

    -- expFracR_uid81_fpAddTest(BITJOIN,80)@8
    expFracR_uid81_fpAddTest_q <= expPostNorm_uid79_fpAddTest_q & redist11_fracPostNormRndRange_uid80_fpAddTest_b_1_q;

    -- expRPreExc_uid87_fpAddTest(BITSELECT,86)@8
    expRPreExc_uid87_fpAddTest_in <= expFracR_uid81_fpAddTest_q(31 downto 0);
    expRPreExc_uid87_fpAddTest_b <= expRPreExc_uid87_fpAddTest_in(31 downto 24);

    -- redist9_expRPreExc_uid87_fpAddTest_b_2(DELAY,251)
    redist9_expRPreExc_uid87_fpAddTest_b_2 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRPreExc_uid87_fpAddTest_b, xout => redist9_expRPreExc_uid87_fpAddTest_b_2_q, clk => clk, aclr => areset );

    -- wEP2AllOwE_uid82_fpAddTest(CONSTANT,81)
    wEP2AllOwE_uid82_fpAddTest_q <= "0011111111";

    -- rndExp_uid83_fpAddTest(BITSELECT,82)@8
    rndExp_uid83_fpAddTest_b <= expFracR_uid81_fpAddTest_q(33 downto 24);

    -- rOvf_uid84_fpAddTest(LOGICAL,83)@8
    rOvf_uid84_fpAddTest_q <= "1" WHEN rndExp_uid83_fpAddTest_b = wEP2AllOwE_uid82_fpAddTest_q ELSE "0";

    -- regInputs_uid88_fpAddTest(LOGICAL,87)@8
    regInputs_uid88_fpAddTest_q <= excR_aSig_uid31_fpAddTest_q and redist20_excR_bSig_uid45_fpAddTest_q_6_q;

    -- rInfOvf_uid91_fpAddTest(LOGICAL,90)@8 + 1
    rInfOvf_uid91_fpAddTest_qi <= regInputs_uid88_fpAddTest_q and rOvf_uid84_fpAddTest_q;
    rInfOvf_uid91_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rInfOvf_uid91_fpAddTest_qi, xout => rInfOvf_uid91_fpAddTest_q, clk => clk, aclr => areset );

    -- excRInfVInC_uid92_fpAddTest(BITJOIN,91)@9
    excRInfVInC_uid92_fpAddTest_q <= rInfOvf_uid91_fpAddTest_q & redist21_excN_bSig_uid42_fpAddTest_q_7_q & excN_aSig_uid28_fpAddTest_q & redist23_excI_bSig_uid41_fpAddTest_q_7_q & redist27_excI_aSig_uid27_fpAddTest_q_1_q & redist15_effSub_uid52_fpAddTest_q_7_q;

    -- excRInf_uid93_fpAddTest(LOOKUP,92)@9
    excRInf_uid93_fpAddTest_combproc: PROCESS (excRInfVInC_uid92_fpAddTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excRInfVInC_uid92_fpAddTest_q) IS
            WHEN "000000" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "000001" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "000010" => excRInf_uid93_fpAddTest_q <= "1";
            WHEN "000011" => excRInf_uid93_fpAddTest_q <= "1";
            WHEN "000100" => excRInf_uid93_fpAddTest_q <= "1";
            WHEN "000101" => excRInf_uid93_fpAddTest_q <= "1";
            WHEN "000110" => excRInf_uid93_fpAddTest_q <= "1";
            WHEN "000111" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "001000" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "001001" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "001010" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "001011" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "001100" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "001101" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "001110" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "001111" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "010000" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "010001" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "010010" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "010011" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "010100" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "010101" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "010110" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "010111" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "011000" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "011001" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "011010" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "011011" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "011100" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "011101" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "011110" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "011111" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "100000" => excRInf_uid93_fpAddTest_q <= "1";
            WHEN "100001" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "100010" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "100011" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "100100" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "100101" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "100110" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "100111" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "101000" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "101001" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "101010" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "101011" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "101100" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "101101" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "101110" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "101111" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "110000" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "110001" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "110010" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "110011" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "110100" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "110101" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "110110" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "110111" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "111000" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "111001" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "111010" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "111011" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "111100" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "111101" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "111110" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "111111" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN OTHERS => -- unreachable
                           excRInf_uid93_fpAddTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- rUdf_uid85_fpAddTest(BITSELECT,84)@8
    rUdf_uid85_fpAddTest_b <= STD_LOGIC_VECTOR(expFracR_uid81_fpAddTest_q(33 downto 33));

    -- excRZeroVInC_uid89_fpAddTest(BITJOIN,88)@8
    excRZeroVInC_uid89_fpAddTest_q <= aMinusA_uid77_fpAddTest_q & rUdf_uid85_fpAddTest_b & regInputs_uid88_fpAddTest_q & redist24_excZ_bSig_uid17_uid37_fpAddTest_q_7_q & excZ_aSig_uid16_uid23_fpAddTest_q;

    -- excRZero_uid90_fpAddTest(LOOKUP,89)@8 + 1
    excRZero_uid90_fpAddTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excRZero_uid90_fpAddTest_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (excRZeroVInC_uid89_fpAddTest_q) IS
                WHEN "00000" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "00001" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "00010" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "00011" => excRZero_uid90_fpAddTest_q <= "1";
                WHEN "00100" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "00101" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "00110" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "00111" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "01000" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "01001" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "01010" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "01011" => excRZero_uid90_fpAddTest_q <= "1";
                WHEN "01100" => excRZero_uid90_fpAddTest_q <= "1";
                WHEN "01101" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "01110" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "01111" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "10000" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "10001" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "10010" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "10011" => excRZero_uid90_fpAddTest_q <= "1";
                WHEN "10100" => excRZero_uid90_fpAddTest_q <= "1";
                WHEN "10101" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "10110" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "10111" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "11000" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "11001" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "11010" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "11011" => excRZero_uid90_fpAddTest_q <= "1";
                WHEN "11100" => excRZero_uid90_fpAddTest_q <= "1";
                WHEN "11101" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "11110" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "11111" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN OTHERS => -- unreachable
                               excRZero_uid90_fpAddTest_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- concExc_uid97_fpAddTest(BITJOIN,96)@9
    concExc_uid97_fpAddTest_q <= excRNaN_uid96_fpAddTest_q & excRInf_uid93_fpAddTest_q & excRZero_uid90_fpAddTest_q;

    -- excREnc_uid98_fpAddTest(LOOKUP,97)@9 + 1
    excREnc_uid98_fpAddTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excREnc_uid98_fpAddTest_q <= "01";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (concExc_uid97_fpAddTest_q) IS
                WHEN "000" => excREnc_uid98_fpAddTest_q <= "01";
                WHEN "001" => excREnc_uid98_fpAddTest_q <= "00";
                WHEN "010" => excREnc_uid98_fpAddTest_q <= "10";
                WHEN "011" => excREnc_uid98_fpAddTest_q <= "10";
                WHEN "100" => excREnc_uid98_fpAddTest_q <= "11";
                WHEN "101" => excREnc_uid98_fpAddTest_q <= "11";
                WHEN "110" => excREnc_uid98_fpAddTest_q <= "11";
                WHEN "111" => excREnc_uid98_fpAddTest_q <= "11";
                WHEN OTHERS => -- unreachable
                               excREnc_uid98_fpAddTest_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- expRPostExc_uid117_fpAddTest(MUX,116)@10
    expRPostExc_uid117_fpAddTest_s <= excREnc_uid98_fpAddTest_q;
    expRPostExc_uid117_fpAddTest_combproc: PROCESS (expRPostExc_uid117_fpAddTest_s, cstAllZWE_uid20_fpAddTest_q, redist9_expRPreExc_uid87_fpAddTest_b_2_q, cstAllOWE_uid18_fpAddTest_q)
    BEGIN
        CASE (expRPostExc_uid117_fpAddTest_s) IS
            WHEN "00" => expRPostExc_uid117_fpAddTest_q <= cstAllZWE_uid20_fpAddTest_q;
            WHEN "01" => expRPostExc_uid117_fpAddTest_q <= redist9_expRPreExc_uid87_fpAddTest_b_2_q;
            WHEN "10" => expRPostExc_uid117_fpAddTest_q <= cstAllOWE_uid18_fpAddTest_q;
            WHEN "11" => expRPostExc_uid117_fpAddTest_q <= cstAllOWE_uid18_fpAddTest_q;
            WHEN OTHERS => expRPostExc_uid117_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid110_fpAddTest(CONSTANT,109)
    oneFracRPostExc2_uid110_fpAddTest_q <= "00000000000000000000001";

    -- fracRPreExc_uid86_fpAddTest(BITSELECT,85)@8
    fracRPreExc_uid86_fpAddTest_in <= expFracR_uid81_fpAddTest_q(23 downto 0);
    fracRPreExc_uid86_fpAddTest_b <= fracRPreExc_uid86_fpAddTest_in(23 downto 1);

    -- redist10_fracRPreExc_uid86_fpAddTest_b_2(DELAY,252)
    redist10_fracRPreExc_uid86_fpAddTest_b_2 : dspba_delay
    GENERIC MAP ( width => 23, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPreExc_uid86_fpAddTest_b, xout => redist10_fracRPreExc_uid86_fpAddTest_b_2_q, clk => clk, aclr => areset );

    -- fracRPostExc_uid113_fpAddTest(MUX,112)@10
    fracRPostExc_uid113_fpAddTest_s <= excREnc_uid98_fpAddTest_q;
    fracRPostExc_uid113_fpAddTest_combproc: PROCESS (fracRPostExc_uid113_fpAddTest_s, cstZeroWF_uid19_fpAddTest_q, redist10_fracRPreExc_uid86_fpAddTest_b_2_q, oneFracRPostExc2_uid110_fpAddTest_q)
    BEGIN
        CASE (fracRPostExc_uid113_fpAddTest_s) IS
            WHEN "00" => fracRPostExc_uid113_fpAddTest_q <= cstZeroWF_uid19_fpAddTest_q;
            WHEN "01" => fracRPostExc_uid113_fpAddTest_q <= redist10_fracRPreExc_uid86_fpAddTest_b_2_q;
            WHEN "10" => fracRPostExc_uid113_fpAddTest_q <= cstZeroWF_uid19_fpAddTest_q;
            WHEN "11" => fracRPostExc_uid113_fpAddTest_q <= oneFracRPostExc2_uid110_fpAddTest_q;
            WHEN OTHERS => fracRPostExc_uid113_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid118_fpAddTest(BITJOIN,117)@10
    R_uid118_fpAddTest_q <= signRPostExc_uid109_fpAddTest_q & expRPostExc_uid117_fpAddTest_q & fracRPostExc_uid113_fpAddTest_q;

    -- xOut(GPOUT,4)@10
    q <= R_uid118_fpAddTest_q;

END normal;
