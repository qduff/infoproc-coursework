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

-- VHDL created from SUB_0002
-- VHDL created on Thu Mar 07 09:42:32 2024


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

entity SUB_0002 is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        b : in std_logic_vector(31 downto 0);  -- float32_m23
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end SUB_0002;

architecture normal of SUB_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracX_uid6_fpSubTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal expFracY_uid7_fpSubTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal xGTEy_uid8_fpSubTest_a : STD_LOGIC_VECTOR (32 downto 0);
    signal xGTEy_uid8_fpSubTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal xGTEy_uid8_fpSubTest_o : STD_LOGIC_VECTOR (32 downto 0);
    signal xGTEy_uid8_fpSubTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal sigY_uid9_fpSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal invSigY_uid10_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracY_uid11_fpSubTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expY_uid12_fpSubTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal ypn_uid13_fpSubTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal aSig_uid17_fpSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aSig_uid17_fpSubTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bSig_uid18_fpSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal bSig_uid18_fpSubTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal cstAllOWE_uid19_fpSubTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstZeroWF_uid20_fpSubTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstAllZWE_uid21_fpSubTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal exp_aSig_uid22_fpSubTest_in : STD_LOGIC_VECTOR (30 downto 0);
    signal exp_aSig_uid22_fpSubTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_aSig_uid23_fpSubTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal frac_aSig_uid23_fpSubTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_aSig_uid17_uid24_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_aSig_uid17_uid24_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid25_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid25_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid26_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid26_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid27_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_aSig_uid28_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_aSig_uid29_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_aSig_uid29_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid30_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid31_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_aSig_uid32_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_bSig_uid36_fpSubTest_in : STD_LOGIC_VECTOR (30 downto 0);
    signal exp_bSig_uid36_fpSubTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_bSig_uid37_fpSubTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal frac_bSig_uid37_fpSubTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_bSig_uid18_uid38_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_bSig_uid18_uid38_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid39_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid39_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid40_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid41_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_bSig_uid42_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_bSig_uid42_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_bSig_uid43_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_bSig_uid43_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid44_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid45_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_bSig_uid46_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_bSig_uid46_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigA_uid51_fpSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal sigB_uid52_fpSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal effSub_uid53_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid57_fpSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid57_fpSubTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal oFracB_uid60_fpSubTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal expAmExpB_uid61_fpSubTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expAmExpB_uid61_fpSubTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expAmExpB_uid61_fpSubTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expAmExpB_uid61_fpSubTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal oFracA_uid65_fpSubTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal oFracAE_uid66_fpSubTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal oFracBR_uid68_fpSubTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal oFracBREX_uid69_fpSubTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal oFracBREX_uid69_fpSubTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal oFracBREXC2_uid70_fpSubTest_a : STD_LOGIC_VECTOR (27 downto 0);
    signal oFracBREXC2_uid70_fpSubTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal oFracBREXC2_uid70_fpSubTest_o : STD_LOGIC_VECTOR (27 downto 0);
    signal oFracBREXC2_uid70_fpSubTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal oFracBREXC2_uid71_fpSubTest_in : STD_LOGIC_VECTOR (26 downto 0);
    signal oFracBREXC2_uid71_fpSubTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal fracAddResult_uid73_fpSubTest_a : STD_LOGIC_VECTOR (27 downto 0);
    signal fracAddResult_uid73_fpSubTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal fracAddResult_uid73_fpSubTest_o : STD_LOGIC_VECTOR (27 downto 0);
    signal fracAddResult_uid73_fpSubTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal fracAddResultNoSignExt_uid74_fpSubTest_in : STD_LOGIC_VECTOR (26 downto 0);
    signal fracAddResultNoSignExt_uid74_fpSubTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal cAmA_uid77_fpSubTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal aMinusA_uid78_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal aMinusA_uid78_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expInc_uid79_fpSubTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expInc_uid79_fpSubTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expInc_uid79_fpSubTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expInc_uid79_fpSubTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expPostNorm_uid80_fpSubTest_a : STD_LOGIC_VECTOR (9 downto 0);
    signal expPostNorm_uid80_fpSubTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal expPostNorm_uid80_fpSubTest_o : STD_LOGIC_VECTOR (9 downto 0);
    signal expPostNorm_uid80_fpSubTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal fracPostNormRndRange_uid81_fpSubTest_in : STD_LOGIC_VECTOR (25 downto 0);
    signal fracPostNormRndRange_uid81_fpSubTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal expFracR_uid82_fpSubTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal wEP2AllOwE_uid83_fpSubTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal rndExp_uid84_fpSubTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal rOvf_uid85_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdf_uid86_fpSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPreExc_uid87_fpSubTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExc_uid87_fpSubTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPreExc_uid88_fpSubTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal expRPreExc_uid88_fpSubTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal regInputs_uid89_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZeroVInC_uid90_fpSubTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal excRZero_uid91_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rInfOvf_uid92_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal rInfOvf_uid92_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInfVInC_uid93_fpSubTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal excRInf_uid94_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN2_uid95_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAIBISub_uid96_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid97_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid98_fpSubTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid99_fpSubTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal invAMinusA_uid100_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRReg_uid101_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigBBInf_uid102_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigAAInf_uid103_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInf_uid104_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAZBZSigASigB_uid105_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excBZARSigA_uid106_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRZero_uid107_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInfRZRReg_uid108_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInfRZRReg_uid108_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcRNaN_uid109_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid110_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid110_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneFracRPostExc2_uid111_fpSubTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPostExc_uid114_fpSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid114_fpSubTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid118_fpSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid118_fpSubTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal R_uid119_fpSubTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zs_uid121_lzCountVal_uid75_fpSubTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid122_lzCountVal_uid75_fpSubTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid123_lzCountVal_uid75_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mO_uid124_lzCountVal_uid75_fpSubTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal vStage_uid125_lzCountVal_uid75_fpSubTest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal vStage_uid125_lzCountVal_uid75_fpSubTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal cStage_uid126_lzCountVal_uid75_fpSubTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vStagei_uid128_lzCountVal_uid75_fpSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid128_lzCountVal_uid75_fpSubTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid131_lzCountVal_uid75_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid131_lzCountVal_uid75_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid134_lzCountVal_uid75_fpSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid134_lzCountVal_uid75_fpSubTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal zs_uid135_lzCountVal_uid75_fpSubTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid137_lzCountVal_uid75_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid140_lzCountVal_uid75_fpSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid140_lzCountVal_uid75_fpSubTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal zs_uid141_lzCountVal_uid75_fpSubTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid143_lzCountVal_uid75_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid146_lzCountVal_uid75_fpSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid146_lzCountVal_uid75_fpSubTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid148_lzCountVal_uid75_fpSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid149_lzCountVal_uid75_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid150_lzCountVal_uid75_fpSubTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal xMSB_uid152_alignmentShifter_uid72_fpSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftedOut_uid155_alignmentShifter_uid72_fpSubTest_a : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid155_alignmentShifter_uid72_fpSubTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid155_alignmentShifter_uid72_fpSubTest_o : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid155_alignmentShifter_uid72_fpSubTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal seMsb_to4_uid156_in : STD_LOGIC_VECTOR (3 downto 0);
    signal seMsb_to4_uid156_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage0Idx1Rng4_uid157_alignmentShifter_uid72_fpSubTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStage0Idx1_uid158_alignmentShifter_uid72_fpSubTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal seMsb_to8_uid159_in : STD_LOGIC_VECTOR (7 downto 0);
    signal seMsb_to8_uid159_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage0Idx2Rng8_uid160_alignmentShifter_uid72_fpSubTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal rightShiftStage0Idx2_uid161_alignmentShifter_uid72_fpSubTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal seMsb_to12_uid162_in : STD_LOGIC_VECTOR (11 downto 0);
    signal seMsb_to12_uid162_b : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage0Idx3Rng12_uid163_alignmentShifter_uid72_fpSubTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal rightShiftStage0Idx3_uid164_alignmentShifter_uid72_fpSubTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal seMsb_to16_uid165_in : STD_LOGIC_VECTOR (15 downto 0);
    signal seMsb_to16_uid165_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage0Idx4Rng16_uid166_alignmentShifter_uid72_fpSubTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage0Idx4_uid167_alignmentShifter_uid72_fpSubTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal seMsb_to20_uid168_in : STD_LOGIC_VECTOR (19 downto 0);
    signal seMsb_to20_uid168_b : STD_LOGIC_VECTOR (19 downto 0);
    signal rightShiftStage0Idx5Rng20_uid169_alignmentShifter_uid72_fpSubTest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal rightShiftStage0Idx5_uid170_alignmentShifter_uid72_fpSubTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal seMsb_to24_uid171_in : STD_LOGIC_VECTOR (23 downto 0);
    signal seMsb_to24_uid171_b : STD_LOGIC_VECTOR (23 downto 0);
    signal rightShiftStage0Idx6Rng24_uid172_alignmentShifter_uid72_fpSubTest_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage0Idx6_uid173_alignmentShifter_uid72_fpSubTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal stageIndexName_to27_uid174_in : STD_LOGIC_VECTOR (26 downto 0);
    signal stageIndexName_to27_uid174_b : STD_LOGIC_VECTOR (26 downto 0);
    signal rightShiftStage1Idx1Rng1_uid178_alignmentShifter_uid72_fpSubTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal rightShiftStage1Idx1_uid179_alignmentShifter_uid72_fpSubTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal seMsb_to2_uid180_in : STD_LOGIC_VECTOR (1 downto 0);
    signal seMsb_to2_uid180_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1Idx2Rng2_uid181_alignmentShifter_uid72_fpSubTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal rightShiftStage1Idx2_uid182_alignmentShifter_uid72_fpSubTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal seMsb_to3_uid183_in : STD_LOGIC_VECTOR (2 downto 0);
    signal seMsb_to3_uid183_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage1Idx3Rng3_uid184_alignmentShifter_uid72_fpSubTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal rightShiftStage1Idx3_uid185_alignmentShifter_uid72_fpSubTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal rightShiftStage1_uid187_alignmentShifter_uid72_fpSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid187_alignmentShifter_uid72_fpSubTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal r_uid190_alignmentShifter_uid72_fpSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid190_alignmentShifter_uid72_fpSubTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage0Idx1Rng4_uid195_fracPostNorm_uid76_fpSubTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal leftShiftStage0Idx1Rng4_uid195_fracPostNorm_uid76_fpSubTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal leftShiftStage0Idx1_uid196_fracPostNorm_uid76_fpSubTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage0Idx2Rng8_uid198_fracPostNorm_uid76_fpSubTest_in : STD_LOGIC_VECTOR (18 downto 0);
    signal leftShiftStage0Idx2Rng8_uid198_fracPostNorm_uid76_fpSubTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal leftShiftStage0Idx2_uid199_fracPostNorm_uid76_fpSubTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage0Idx3Pad12_uid200_fracPostNorm_uid76_fpSubTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal leftShiftStage0Idx3Rng12_uid201_fracPostNorm_uid76_fpSubTest_in : STD_LOGIC_VECTOR (14 downto 0);
    signal leftShiftStage0Idx3Rng12_uid201_fracPostNorm_uid76_fpSubTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal leftShiftStage0Idx3_uid202_fracPostNorm_uid76_fpSubTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage0Idx4_uid205_fracPostNorm_uid76_fpSubTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage0Idx5Pad20_uid206_fracPostNorm_uid76_fpSubTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal leftShiftStage0Idx5Rng20_uid207_fracPostNorm_uid76_fpSubTest_in : STD_LOGIC_VECTOR (6 downto 0);
    signal leftShiftStage0Idx5Rng20_uid207_fracPostNorm_uid76_fpSubTest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal leftShiftStage0Idx5_uid208_fracPostNorm_uid76_fpSubTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage0Idx6Pad24_uid209_fracPostNorm_uid76_fpSubTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx6Rng24_uid210_fracPostNorm_uid76_fpSubTest_in : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage0Idx6Rng24_uid210_fracPostNorm_uid76_fpSubTest_b : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage0Idx6_uid211_fracPostNorm_uid76_fpSubTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage0Idx7_uid212_fracPostNorm_uid76_fpSubTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage1Idx1Rng1_uid216_fracPostNorm_uid76_fpSubTest_in : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx1Rng1_uid216_fracPostNorm_uid76_fpSubTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx1_uid217_fracPostNorm_uid76_fpSubTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage1Idx2Rng2_uid219_fracPostNorm_uid76_fpSubTest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal leftShiftStage1Idx2Rng2_uid219_fracPostNorm_uid76_fpSubTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal leftShiftStage1Idx2_uid220_fracPostNorm_uid76_fpSubTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage1Idx3Pad3_uid221_fracPostNorm_uid76_fpSubTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage1Idx3Rng3_uid222_fracPostNorm_uid76_fpSubTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage1Idx3Rng3_uid222_fracPostNorm_uid76_fpSubTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage1Idx3_uid223_fracPostNorm_uid76_fpSubTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage1_uid225_fracPostNorm_uid76_fpSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid225_fracPostNorm_uid76_fpSubTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_msplit_0_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_msplit_0_q : STD_LOGIC_VECTOR (26 downto 0);
    signal rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_msplit_1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_msplit_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_mfinal_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_mfinal_q : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_msplit_0_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_msplit_0_q : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_msplit_1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_msplit_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_mfinal_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_mfinal_q : STD_LOGIC_VECTOR (26 downto 0);
    signal rightShiftStageSel4Dto2_uid176_alignmentShifter_uid72_fpSubTest_merged_bit_select_in : STD_LOGIC_VECTOR (4 downto 0);
    signal rightShiftStageSel4Dto2_uid176_alignmentShifter_uid72_fpSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStageSel4Dto2_uid176_alignmentShifter_uid72_fpSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid130_lzCountVal_uid75_fpSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid130_lzCountVal_uid75_fpSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid136_lzCountVal_uid75_fpSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid136_lzCountVal_uid75_fpSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid142_lzCountVal_uid75_fpSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid142_lzCountVal_uid75_fpSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel4Dto2_uid213_fracPostNorm_uid76_fpSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStageSel4Dto2_uid213_fracPostNorm_uid76_fpSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_selLSBs_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_selLSBs_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_selLSBs_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_selLSBs_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_rVStage_uid130_lzCountVal_uid75_fpSubTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist1_rVStage_uid130_lzCountVal_uid75_fpSubTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist2_rightShiftStageSel4Dto2_uid176_alignmentShifter_uid72_fpSubTest_merged_bit_select_b_2_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist3_rightShiftStageSel4Dto2_uid176_alignmentShifter_uid72_fpSubTest_merged_bit_select_c_2_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist4_stageIndexName_to27_uid174_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist5_shiftedOut_uid155_alignmentShifter_uid72_fpSubTest_n_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_r_uid150_lzCountVal_uid75_fpSubTest_q_1_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist7_vStage_uid125_lzCountVal_uid75_fpSubTest_b_2_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist8_vCount_uid123_lzCountVal_uid75_fpSubTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_expRPreExc_uid88_fpSubTest_b_2_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist10_fracRPreExc_uid87_fpSubTest_b_2_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist11_fracPostNormRndRange_uid81_fpSubTest_b_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist12_fracAddResultNoSignExt_uid74_fpSubTest_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist13_fracAddResultNoSignExt_uid74_fpSubTest_b_3_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist14_oFracBREXC2_uid71_fpSubTest_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist15_effSub_uid53_fpSubTest_q_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_sigB_uid52_fpSubTest_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_sigB_uid52_fpSubTest_b_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_sigA_uid51_fpSubTest_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_sigA_uid51_fpSubTest_b_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_excR_bSig_uid46_fpSubTest_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_excN_bSig_uid43_fpSubTest_q_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_excI_bSig_uid42_fpSubTest_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_excI_bSig_uid42_fpSubTest_q_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_excZ_bSig_uid18_uid38_fpSubTest_q_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_frac_bSig_uid37_fpSubTest_b_2_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist26_exp_bSig_uid36_fpSubTest_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist27_excI_aSig_uid28_fpSubTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_fracXIsZero_uid26_fpSubTest_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_frac_aSig_uid23_fpSubTest_b_4_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist30_exp_aSig_uid22_fpSubTest_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist31_exp_aSig_uid22_fpSubTest_b_7_q : STD_LOGIC_VECTOR (7 downto 0);

begin


    -- cAmA_uid77_fpSubTest(CONSTANT,76)
    cAmA_uid77_fpSubTest_q <= "11011";

    -- zs_uid121_lzCountVal_uid75_fpSubTest(CONSTANT,120)
    zs_uid121_lzCountVal_uid75_fpSubTest_q <= "0000000000000000";

    -- sigY_uid9_fpSubTest(BITSELECT,8)@0
    sigY_uid9_fpSubTest_b <= STD_LOGIC_VECTOR(b(31 downto 31));

    -- invSigY_uid10_fpSubTest(LOGICAL,9)@0
    invSigY_uid10_fpSubTest_q <= not (sigY_uid9_fpSubTest_b);

    -- expY_uid12_fpSubTest(BITSELECT,11)@0
    expY_uid12_fpSubTest_b <= b(30 downto 23);

    -- fracY_uid11_fpSubTest(BITSELECT,10)@0
    fracY_uid11_fpSubTest_b <= b(22 downto 0);

    -- ypn_uid13_fpSubTest(BITJOIN,12)@0
    ypn_uid13_fpSubTest_q <= invSigY_uid10_fpSubTest_q & expY_uid12_fpSubTest_b & fracY_uid11_fpSubTest_b;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- expFracY_uid7_fpSubTest(BITSELECT,6)@0
    expFracY_uid7_fpSubTest_b <= b(30 downto 0);

    -- expFracX_uid6_fpSubTest(BITSELECT,5)@0
    expFracX_uid6_fpSubTest_b <= a(30 downto 0);

    -- xGTEy_uid8_fpSubTest(COMPARE,7)@0
    xGTEy_uid8_fpSubTest_a <= STD_LOGIC_VECTOR("00" & expFracX_uid6_fpSubTest_b);
    xGTEy_uid8_fpSubTest_b <= STD_LOGIC_VECTOR("00" & expFracY_uid7_fpSubTest_b);
    xGTEy_uid8_fpSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xGTEy_uid8_fpSubTest_a) - UNSIGNED(xGTEy_uid8_fpSubTest_b));
    xGTEy_uid8_fpSubTest_n(0) <= not (xGTEy_uid8_fpSubTest_o(32));

    -- bSig_uid18_fpSubTest(MUX,17)@0
    bSig_uid18_fpSubTest_s <= xGTEy_uid8_fpSubTest_n;
    bSig_uid18_fpSubTest_combproc: PROCESS (bSig_uid18_fpSubTest_s, a, ypn_uid13_fpSubTest_q)
    BEGIN
        CASE (bSig_uid18_fpSubTest_s) IS
            WHEN "0" => bSig_uid18_fpSubTest_q <= a;
            WHEN "1" => bSig_uid18_fpSubTest_q <= ypn_uid13_fpSubTest_q;
            WHEN OTHERS => bSig_uid18_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigB_uid52_fpSubTest(BITSELECT,51)@0
    sigB_uid52_fpSubTest_b <= STD_LOGIC_VECTOR(bSig_uid18_fpSubTest_q(31 downto 31));

    -- redist16_sigB_uid52_fpSubTest_b_2(DELAY,259)
    redist16_sigB_uid52_fpSubTest_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigB_uid52_fpSubTest_b, xout => redist16_sigB_uid52_fpSubTest_b_2_q, clk => clk, aclr => areset );

    -- aSig_uid17_fpSubTest(MUX,16)@0
    aSig_uid17_fpSubTest_s <= xGTEy_uid8_fpSubTest_n;
    aSig_uid17_fpSubTest_combproc: PROCESS (aSig_uid17_fpSubTest_s, ypn_uid13_fpSubTest_q, a)
    BEGIN
        CASE (aSig_uid17_fpSubTest_s) IS
            WHEN "0" => aSig_uid17_fpSubTest_q <= ypn_uid13_fpSubTest_q;
            WHEN "1" => aSig_uid17_fpSubTest_q <= a;
            WHEN OTHERS => aSig_uid17_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigA_uid51_fpSubTest(BITSELECT,50)@0
    sigA_uid51_fpSubTest_b <= STD_LOGIC_VECTOR(aSig_uid17_fpSubTest_q(31 downto 31));

    -- redist18_sigA_uid51_fpSubTest_b_2(DELAY,261)
    redist18_sigA_uid51_fpSubTest_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigA_uid51_fpSubTest_b, xout => redist18_sigA_uid51_fpSubTest_b_2_q, clk => clk, aclr => areset );

    -- effSub_uid53_fpSubTest(LOGICAL,52)@2
    effSub_uid53_fpSubTest_q <= redist18_sigA_uid51_fpSubTest_b_2_q xor redist16_sigB_uid52_fpSubTest_b_2_q;

    -- cstAllZWE_uid21_fpSubTest(CONSTANT,20)
    cstAllZWE_uid21_fpSubTest_q <= "00000000";

    -- exp_bSig_uid36_fpSubTest(BITSELECT,35)@0
    exp_bSig_uid36_fpSubTest_in <= bSig_uid18_fpSubTest_q(30 downto 0);
    exp_bSig_uid36_fpSubTest_b <= exp_bSig_uid36_fpSubTest_in(30 downto 23);

    -- redist26_exp_bSig_uid36_fpSubTest_b_1(DELAY,269)
    redist26_exp_bSig_uid36_fpSubTest_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => exp_bSig_uid36_fpSubTest_b, xout => redist26_exp_bSig_uid36_fpSubTest_b_1_q, clk => clk, aclr => areset );

    -- excZ_bSig_uid18_uid38_fpSubTest(LOGICAL,37)@1 + 1
    excZ_bSig_uid18_uid38_fpSubTest_qi <= "1" WHEN redist26_exp_bSig_uid36_fpSubTest_b_1_q = cstAllZWE_uid21_fpSubTest_q ELSE "0";
    excZ_bSig_uid18_uid38_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_bSig_uid18_uid38_fpSubTest_qi, xout => excZ_bSig_uid18_uid38_fpSubTest_q, clk => clk, aclr => areset );

    -- InvExpXIsZero_uid45_fpSubTest(LOGICAL,44)@2
    InvExpXIsZero_uid45_fpSubTest_q <= not (excZ_bSig_uid18_uid38_fpSubTest_q);

    -- cstZeroWF_uid20_fpSubTest(CONSTANT,19)
    cstZeroWF_uid20_fpSubTest_q <= "00000000000000000000000";

    -- frac_bSig_uid37_fpSubTest(BITSELECT,36)@0
    frac_bSig_uid37_fpSubTest_in <= bSig_uid18_fpSubTest_q(22 downto 0);
    frac_bSig_uid37_fpSubTest_b <= frac_bSig_uid37_fpSubTest_in(22 downto 0);

    -- redist25_frac_bSig_uid37_fpSubTest_b_2(DELAY,268)
    redist25_frac_bSig_uid37_fpSubTest_b_2 : dspba_delay
    GENERIC MAP ( width => 23, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => frac_bSig_uid37_fpSubTest_b, xout => redist25_frac_bSig_uid37_fpSubTest_b_2_q, clk => clk, aclr => areset );

    -- fracBz_uid57_fpSubTest(MUX,56)@2
    fracBz_uid57_fpSubTest_s <= excZ_bSig_uid18_uid38_fpSubTest_q;
    fracBz_uid57_fpSubTest_combproc: PROCESS (fracBz_uid57_fpSubTest_s, redist25_frac_bSig_uid37_fpSubTest_b_2_q, cstZeroWF_uid20_fpSubTest_q)
    BEGIN
        CASE (fracBz_uid57_fpSubTest_s) IS
            WHEN "0" => fracBz_uid57_fpSubTest_q <= redist25_frac_bSig_uid37_fpSubTest_b_2_q;
            WHEN "1" => fracBz_uid57_fpSubTest_q <= cstZeroWF_uid20_fpSubTest_q;
            WHEN OTHERS => fracBz_uid57_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oFracB_uid60_fpSubTest(BITJOIN,59)@2
    oFracB_uid60_fpSubTest_q <= InvExpXIsZero_uid45_fpSubTest_q & fracBz_uid57_fpSubTest_q;

    -- oFracBR_uid68_fpSubTest(BITJOIN,67)@2
    oFracBR_uid68_fpSubTest_q <= GND_q & oFracB_uid60_fpSubTest_q & GND_q & GND_q;

    -- oFracBREX_uid69_fpSubTest(LOGICAL,68)@2
    oFracBREX_uid69_fpSubTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 1 => effSub_uid53_fpSubTest_q(0)) & effSub_uid53_fpSubTest_q));
    oFracBREX_uid69_fpSubTest_q <= oFracBR_uid68_fpSubTest_q xor oFracBREX_uid69_fpSubTest_b;

    -- oFracBREXC2_uid70_fpSubTest(ADD,69)@2
    oFracBREXC2_uid70_fpSubTest_a <= STD_LOGIC_VECTOR("0" & oFracBREX_uid69_fpSubTest_q);
    oFracBREXC2_uid70_fpSubTest_b <= STD_LOGIC_VECTOR("000000000000000000000000000" & effSub_uid53_fpSubTest_q);
    oFracBREXC2_uid70_fpSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(oFracBREXC2_uid70_fpSubTest_a) + UNSIGNED(oFracBREXC2_uid70_fpSubTest_b));
    oFracBREXC2_uid70_fpSubTest_q <= oFracBREXC2_uid70_fpSubTest_o(27 downto 0);

    -- oFracBREXC2_uid71_fpSubTest(BITSELECT,70)@2
    oFracBREXC2_uid71_fpSubTest_in <= STD_LOGIC_VECTOR(oFracBREXC2_uid70_fpSubTest_q(26 downto 0));
    oFracBREXC2_uid71_fpSubTest_b <= STD_LOGIC_VECTOR(oFracBREXC2_uid71_fpSubTest_in(26 downto 0));

    -- redist14_oFracBREXC2_uid71_fpSubTest_b_1(DELAY,257)
    redist14_oFracBREXC2_uid71_fpSubTest_b_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracBREXC2_uid71_fpSubTest_b, xout => redist14_oFracBREXC2_uid71_fpSubTest_b_1_q, clk => clk, aclr => areset );

    -- xMSB_uid152_alignmentShifter_uid72_fpSubTest(BITSELECT,151)@3
    xMSB_uid152_alignmentShifter_uid72_fpSubTest_b <= STD_LOGIC_VECTOR(redist14_oFracBREXC2_uid71_fpSubTest_b_1_q(26 downto 26));

    -- stageIndexName_to27_uid174(BITSELECT,173)@3
    stageIndexName_to27_uid174_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 1 => xMSB_uid152_alignmentShifter_uid72_fpSubTest_b(0)) & xMSB_uid152_alignmentShifter_uid72_fpSubTest_b));
    stageIndexName_to27_uid174_b <= STD_LOGIC_VECTOR(stageIndexName_to27_uid174_in(26 downto 0));

    -- redist4_stageIndexName_to27_uid174_b_1(DELAY,247)
    redist4_stageIndexName_to27_uid174_b_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => stageIndexName_to27_uid174_b, xout => redist4_stageIndexName_to27_uid174_b_1_q, clk => clk, aclr => areset );

    -- seMsb_to3_uid183(BITSELECT,182)@3
    seMsb_to3_uid183_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((2 downto 1 => xMSB_uid152_alignmentShifter_uid72_fpSubTest_b(0)) & xMSB_uid152_alignmentShifter_uid72_fpSubTest_b));
    seMsb_to3_uid183_b <= STD_LOGIC_VECTOR(seMsb_to3_uid183_in(2 downto 0));

    -- rightShiftStage1Idx3Rng3_uid184_alignmentShifter_uid72_fpSubTest(BITSELECT,183)@3
    rightShiftStage1Idx3Rng3_uid184_alignmentShifter_uid72_fpSubTest_b <= rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_mfinal_q(26 downto 3);

    -- rightShiftStage1Idx3_uid185_alignmentShifter_uid72_fpSubTest(BITJOIN,184)@3
    rightShiftStage1Idx3_uid185_alignmentShifter_uid72_fpSubTest_q <= seMsb_to3_uid183_b & rightShiftStage1Idx3Rng3_uid184_alignmentShifter_uid72_fpSubTest_b;

    -- seMsb_to2_uid180(BITSELECT,179)@3
    seMsb_to2_uid180_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((1 downto 1 => xMSB_uid152_alignmentShifter_uid72_fpSubTest_b(0)) & xMSB_uid152_alignmentShifter_uid72_fpSubTest_b));
    seMsb_to2_uid180_b <= STD_LOGIC_VECTOR(seMsb_to2_uid180_in(1 downto 0));

    -- rightShiftStage1Idx2Rng2_uid181_alignmentShifter_uid72_fpSubTest(BITSELECT,180)@3
    rightShiftStage1Idx2Rng2_uid181_alignmentShifter_uid72_fpSubTest_b <= rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_mfinal_q(26 downto 2);

    -- rightShiftStage1Idx2_uid182_alignmentShifter_uid72_fpSubTest(BITJOIN,181)@3
    rightShiftStage1Idx2_uid182_alignmentShifter_uid72_fpSubTest_q <= seMsb_to2_uid180_b & rightShiftStage1Idx2Rng2_uid181_alignmentShifter_uid72_fpSubTest_b;

    -- rightShiftStage1Idx1Rng1_uid178_alignmentShifter_uid72_fpSubTest(BITSELECT,177)@3
    rightShiftStage1Idx1Rng1_uid178_alignmentShifter_uid72_fpSubTest_b <= rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_mfinal_q(26 downto 1);

    -- rightShiftStage1Idx1_uid179_alignmentShifter_uid72_fpSubTest(BITJOIN,178)@3
    rightShiftStage1Idx1_uid179_alignmentShifter_uid72_fpSubTest_q <= xMSB_uid152_alignmentShifter_uid72_fpSubTest_b & rightShiftStage1Idx1Rng1_uid178_alignmentShifter_uid72_fpSubTest_b;

    -- seMsb_to24_uid171(BITSELECT,170)@3
    seMsb_to24_uid171_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 1 => xMSB_uid152_alignmentShifter_uid72_fpSubTest_b(0)) & xMSB_uid152_alignmentShifter_uid72_fpSubTest_b));
    seMsb_to24_uid171_b <= STD_LOGIC_VECTOR(seMsb_to24_uid171_in(23 downto 0));

    -- rightShiftStage0Idx6Rng24_uid172_alignmentShifter_uid72_fpSubTest(BITSELECT,171)@3
    rightShiftStage0Idx6Rng24_uid172_alignmentShifter_uid72_fpSubTest_b <= redist14_oFracBREXC2_uid71_fpSubTest_b_1_q(26 downto 24);

    -- rightShiftStage0Idx6_uid173_alignmentShifter_uid72_fpSubTest(BITJOIN,172)@3
    rightShiftStage0Idx6_uid173_alignmentShifter_uid72_fpSubTest_q <= seMsb_to24_uid171_b & rightShiftStage0Idx6Rng24_uid172_alignmentShifter_uid72_fpSubTest_b;

    -- seMsb_to20_uid168(BITSELECT,167)@3
    seMsb_to20_uid168_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 1 => xMSB_uid152_alignmentShifter_uid72_fpSubTest_b(0)) & xMSB_uid152_alignmentShifter_uid72_fpSubTest_b));
    seMsb_to20_uid168_b <= STD_LOGIC_VECTOR(seMsb_to20_uid168_in(19 downto 0));

    -- rightShiftStage0Idx5Rng20_uid169_alignmentShifter_uid72_fpSubTest(BITSELECT,168)@3
    rightShiftStage0Idx5Rng20_uid169_alignmentShifter_uid72_fpSubTest_b <= redist14_oFracBREXC2_uid71_fpSubTest_b_1_q(26 downto 20);

    -- rightShiftStage0Idx5_uid170_alignmentShifter_uid72_fpSubTest(BITJOIN,169)@3
    rightShiftStage0Idx5_uid170_alignmentShifter_uid72_fpSubTest_q <= seMsb_to20_uid168_b & rightShiftStage0Idx5Rng20_uid169_alignmentShifter_uid72_fpSubTest_b;

    -- seMsb_to16_uid165(BITSELECT,164)@3
    seMsb_to16_uid165_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 1 => xMSB_uid152_alignmentShifter_uid72_fpSubTest_b(0)) & xMSB_uid152_alignmentShifter_uid72_fpSubTest_b));
    seMsb_to16_uid165_b <= STD_LOGIC_VECTOR(seMsb_to16_uid165_in(15 downto 0));

    -- rightShiftStage0Idx4Rng16_uid166_alignmentShifter_uid72_fpSubTest(BITSELECT,165)@3
    rightShiftStage0Idx4Rng16_uid166_alignmentShifter_uid72_fpSubTest_b <= redist14_oFracBREXC2_uid71_fpSubTest_b_1_q(26 downto 16);

    -- rightShiftStage0Idx4_uid167_alignmentShifter_uid72_fpSubTest(BITJOIN,166)@3
    rightShiftStage0Idx4_uid167_alignmentShifter_uid72_fpSubTest_q <= seMsb_to16_uid165_b & rightShiftStage0Idx4Rng16_uid166_alignmentShifter_uid72_fpSubTest_b;

    -- rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_msplit_1(MUX,229)@3
    rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_msplit_1_s <= rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_selLSBs_merged_bit_select_b;
    rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_msplit_1_combproc: PROCESS (rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_msplit_1_s, rightShiftStage0Idx4_uid167_alignmentShifter_uid72_fpSubTest_q, rightShiftStage0Idx5_uid170_alignmentShifter_uid72_fpSubTest_q, rightShiftStage0Idx6_uid173_alignmentShifter_uid72_fpSubTest_q, stageIndexName_to27_uid174_b)
    BEGIN
        CASE (rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_msplit_1_s) IS
            WHEN "00" => rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_msplit_1_q <= rightShiftStage0Idx4_uid167_alignmentShifter_uid72_fpSubTest_q;
            WHEN "01" => rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_msplit_1_q <= rightShiftStage0Idx5_uid170_alignmentShifter_uid72_fpSubTest_q;
            WHEN "10" => rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_msplit_1_q <= rightShiftStage0Idx6_uid173_alignmentShifter_uid72_fpSubTest_q;
            WHEN "11" => rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_msplit_1_q <= stageIndexName_to27_uid174_b;
            WHEN OTHERS => rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_msplit_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- seMsb_to12_uid162(BITSELECT,161)@3
    seMsb_to12_uid162_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 1 => xMSB_uid152_alignmentShifter_uid72_fpSubTest_b(0)) & xMSB_uid152_alignmentShifter_uid72_fpSubTest_b));
    seMsb_to12_uid162_b <= STD_LOGIC_VECTOR(seMsb_to12_uid162_in(11 downto 0));

    -- rightShiftStage0Idx3Rng12_uid163_alignmentShifter_uid72_fpSubTest(BITSELECT,162)@3
    rightShiftStage0Idx3Rng12_uid163_alignmentShifter_uid72_fpSubTest_b <= redist14_oFracBREXC2_uid71_fpSubTest_b_1_q(26 downto 12);

    -- rightShiftStage0Idx3_uid164_alignmentShifter_uid72_fpSubTest(BITJOIN,163)@3
    rightShiftStage0Idx3_uid164_alignmentShifter_uid72_fpSubTest_q <= seMsb_to12_uid162_b & rightShiftStage0Idx3Rng12_uid163_alignmentShifter_uid72_fpSubTest_b;

    -- seMsb_to8_uid159(BITSELECT,158)@3
    seMsb_to8_uid159_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((7 downto 1 => xMSB_uid152_alignmentShifter_uid72_fpSubTest_b(0)) & xMSB_uid152_alignmentShifter_uid72_fpSubTest_b));
    seMsb_to8_uid159_b <= STD_LOGIC_VECTOR(seMsb_to8_uid159_in(7 downto 0));

    -- rightShiftStage0Idx2Rng8_uid160_alignmentShifter_uid72_fpSubTest(BITSELECT,159)@3
    rightShiftStage0Idx2Rng8_uid160_alignmentShifter_uid72_fpSubTest_b <= redist14_oFracBREXC2_uid71_fpSubTest_b_1_q(26 downto 8);

    -- rightShiftStage0Idx2_uid161_alignmentShifter_uid72_fpSubTest(BITJOIN,160)@3
    rightShiftStage0Idx2_uid161_alignmentShifter_uid72_fpSubTest_q <= seMsb_to8_uid159_b & rightShiftStage0Idx2Rng8_uid160_alignmentShifter_uid72_fpSubTest_b;

    -- seMsb_to4_uid156(BITSELECT,155)@3
    seMsb_to4_uid156_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 1 => xMSB_uid152_alignmentShifter_uid72_fpSubTest_b(0)) & xMSB_uid152_alignmentShifter_uid72_fpSubTest_b));
    seMsb_to4_uid156_b <= STD_LOGIC_VECTOR(seMsb_to4_uid156_in(3 downto 0));

    -- rightShiftStage0Idx1Rng4_uid157_alignmentShifter_uid72_fpSubTest(BITSELECT,156)@3
    rightShiftStage0Idx1Rng4_uid157_alignmentShifter_uid72_fpSubTest_b <= redist14_oFracBREXC2_uid71_fpSubTest_b_1_q(26 downto 4);

    -- rightShiftStage0Idx1_uid158_alignmentShifter_uid72_fpSubTest(BITJOIN,157)@3
    rightShiftStage0Idx1_uid158_alignmentShifter_uid72_fpSubTest_q <= seMsb_to4_uid156_b & rightShiftStage0Idx1Rng4_uid157_alignmentShifter_uid72_fpSubTest_b;

    -- rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_msplit_0(MUX,228)@3
    rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_msplit_0_s <= rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_selLSBs_merged_bit_select_b;
    rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_msplit_0_combproc: PROCESS (rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_msplit_0_s, redist14_oFracBREXC2_uid71_fpSubTest_b_1_q, rightShiftStage0Idx1_uid158_alignmentShifter_uid72_fpSubTest_q, rightShiftStage0Idx2_uid161_alignmentShifter_uid72_fpSubTest_q, rightShiftStage0Idx3_uid164_alignmentShifter_uid72_fpSubTest_q)
    BEGIN
        CASE (rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_msplit_0_s) IS
            WHEN "00" => rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_msplit_0_q <= redist14_oFracBREXC2_uid71_fpSubTest_b_1_q;
            WHEN "01" => rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_msplit_0_q <= rightShiftStage0Idx1_uid158_alignmentShifter_uid72_fpSubTest_q;
            WHEN "10" => rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_msplit_0_q <= rightShiftStage0Idx2_uid161_alignmentShifter_uid72_fpSubTest_q;
            WHEN "11" => rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_msplit_0_q <= rightShiftStage0Idx3_uid164_alignmentShifter_uid72_fpSubTest_q;
            WHEN OTHERS => rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_msplit_0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- exp_aSig_uid22_fpSubTest(BITSELECT,21)@0
    exp_aSig_uid22_fpSubTest_in <= aSig_uid17_fpSubTest_q(30 downto 0);
    exp_aSig_uid22_fpSubTest_b <= exp_aSig_uid22_fpSubTest_in(30 downto 23);

    -- redist30_exp_aSig_uid22_fpSubTest_b_1(DELAY,273)
    redist30_exp_aSig_uid22_fpSubTest_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => exp_aSig_uid22_fpSubTest_b, xout => redist30_exp_aSig_uid22_fpSubTest_b_1_q, clk => clk, aclr => areset );

    -- expAmExpB_uid61_fpSubTest(SUB,60)@1
    expAmExpB_uid61_fpSubTest_a <= STD_LOGIC_VECTOR("0" & redist30_exp_aSig_uid22_fpSubTest_b_1_q);
    expAmExpB_uid61_fpSubTest_b <= STD_LOGIC_VECTOR("0" & redist26_exp_bSig_uid36_fpSubTest_b_1_q);
    expAmExpB_uid61_fpSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expAmExpB_uid61_fpSubTest_a) - UNSIGNED(expAmExpB_uid61_fpSubTest_b));
    expAmExpB_uid61_fpSubTest_q <= expAmExpB_uid61_fpSubTest_o(8 downto 0);

    -- rightShiftStageSel4Dto2_uid176_alignmentShifter_uid72_fpSubTest_merged_bit_select(BITSELECT,236)@1
    rightShiftStageSel4Dto2_uid176_alignmentShifter_uid72_fpSubTest_merged_bit_select_in <= expAmExpB_uid61_fpSubTest_q(4 downto 0);
    rightShiftStageSel4Dto2_uid176_alignmentShifter_uid72_fpSubTest_merged_bit_select_b <= rightShiftStageSel4Dto2_uid176_alignmentShifter_uid72_fpSubTest_merged_bit_select_in(4 downto 2);
    rightShiftStageSel4Dto2_uid176_alignmentShifter_uid72_fpSubTest_merged_bit_select_c <= rightShiftStageSel4Dto2_uid176_alignmentShifter_uid72_fpSubTest_merged_bit_select_in(1 downto 0);

    -- redist2_rightShiftStageSel4Dto2_uid176_alignmentShifter_uid72_fpSubTest_merged_bit_select_b_2(DELAY,245)
    redist2_rightShiftStageSel4Dto2_uid176_alignmentShifter_uid72_fpSubTest_merged_bit_select_b_2 : dspba_delay
    GENERIC MAP ( width => 3, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStageSel4Dto2_uid176_alignmentShifter_uid72_fpSubTest_merged_bit_select_b, xout => redist2_rightShiftStageSel4Dto2_uid176_alignmentShifter_uid72_fpSubTest_merged_bit_select_b_2_q, clk => clk, aclr => areset );

    -- rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_selLSBs_merged_bit_select(BITSELECT,241)@3
    rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_selLSBs_merged_bit_select_b <= redist2_rightShiftStageSel4Dto2_uid176_alignmentShifter_uid72_fpSubTest_merged_bit_select_b_2_q(1 downto 0);
    rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_selLSBs_merged_bit_select_c <= redist2_rightShiftStageSel4Dto2_uid176_alignmentShifter_uid72_fpSubTest_merged_bit_select_b_2_q(2 downto 2);

    -- rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_mfinal(MUX,230)@3
    rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_mfinal_s <= rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_selLSBs_merged_bit_select_c;
    rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_mfinal_combproc: PROCESS (rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_mfinal_s, rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_msplit_0_q, rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_msplit_1_q)
    BEGIN
        CASE (rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_mfinal_s) IS
            WHEN "0" => rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_mfinal_q <= rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_msplit_0_q;
            WHEN "1" => rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_mfinal_q <= rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_msplit_1_q;
            WHEN OTHERS => rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_mfinal_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist3_rightShiftStageSel4Dto2_uid176_alignmentShifter_uid72_fpSubTest_merged_bit_select_c_2(DELAY,246)
    redist3_rightShiftStageSel4Dto2_uid176_alignmentShifter_uid72_fpSubTest_merged_bit_select_c_2 : dspba_delay
    GENERIC MAP ( width => 2, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStageSel4Dto2_uid176_alignmentShifter_uid72_fpSubTest_merged_bit_select_c, xout => redist3_rightShiftStageSel4Dto2_uid176_alignmentShifter_uid72_fpSubTest_merged_bit_select_c_2_q, clk => clk, aclr => areset );

    -- rightShiftStage1_uid187_alignmentShifter_uid72_fpSubTest(MUX,186)@3 + 1
    rightShiftStage1_uid187_alignmentShifter_uid72_fpSubTest_s <= redist3_rightShiftStageSel4Dto2_uid176_alignmentShifter_uid72_fpSubTest_merged_bit_select_c_2_q;
    rightShiftStage1_uid187_alignmentShifter_uid72_fpSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage1_uid187_alignmentShifter_uid72_fpSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage1_uid187_alignmentShifter_uid72_fpSubTest_s) IS
                WHEN "00" => rightShiftStage1_uid187_alignmentShifter_uid72_fpSubTest_q <= rightShiftStage0_uid177_alignmentShifter_uid72_fpSubTest_mfinal_q;
                WHEN "01" => rightShiftStage1_uid187_alignmentShifter_uid72_fpSubTest_q <= rightShiftStage1Idx1_uid179_alignmentShifter_uid72_fpSubTest_q;
                WHEN "10" => rightShiftStage1_uid187_alignmentShifter_uid72_fpSubTest_q <= rightShiftStage1Idx2_uid182_alignmentShifter_uid72_fpSubTest_q;
                WHEN "11" => rightShiftStage1_uid187_alignmentShifter_uid72_fpSubTest_q <= rightShiftStage1Idx3_uid185_alignmentShifter_uid72_fpSubTest_q;
                WHEN OTHERS => rightShiftStage1_uid187_alignmentShifter_uid72_fpSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- shiftedOut_uid155_alignmentShifter_uid72_fpSubTest(COMPARE,154)@1 + 1
    shiftedOut_uid155_alignmentShifter_uid72_fpSubTest_a <= STD_LOGIC_VECTOR("00" & expAmExpB_uid61_fpSubTest_q);
    shiftedOut_uid155_alignmentShifter_uid72_fpSubTest_b <= STD_LOGIC_VECTOR("000000" & cAmA_uid77_fpSubTest_q);
    shiftedOut_uid155_alignmentShifter_uid72_fpSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftedOut_uid155_alignmentShifter_uid72_fpSubTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            shiftedOut_uid155_alignmentShifter_uid72_fpSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid155_alignmentShifter_uid72_fpSubTest_a) - UNSIGNED(shiftedOut_uid155_alignmentShifter_uid72_fpSubTest_b));
        END IF;
    END PROCESS;
    shiftedOut_uid155_alignmentShifter_uid72_fpSubTest_n(0) <= not (shiftedOut_uid155_alignmentShifter_uid72_fpSubTest_o(10));

    -- redist5_shiftedOut_uid155_alignmentShifter_uid72_fpSubTest_n_3(DELAY,248)
    redist5_shiftedOut_uid155_alignmentShifter_uid72_fpSubTest_n_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => shiftedOut_uid155_alignmentShifter_uid72_fpSubTest_n, xout => redist5_shiftedOut_uid155_alignmentShifter_uid72_fpSubTest_n_3_q, clk => clk, aclr => areset );

    -- r_uid190_alignmentShifter_uid72_fpSubTest(MUX,189)@4
    r_uid190_alignmentShifter_uid72_fpSubTest_s <= redist5_shiftedOut_uid155_alignmentShifter_uid72_fpSubTest_n_3_q;
    r_uid190_alignmentShifter_uid72_fpSubTest_combproc: PROCESS (r_uid190_alignmentShifter_uid72_fpSubTest_s, rightShiftStage1_uid187_alignmentShifter_uid72_fpSubTest_q, redist4_stageIndexName_to27_uid174_b_1_q)
    BEGIN
        CASE (r_uid190_alignmentShifter_uid72_fpSubTest_s) IS
            WHEN "0" => r_uid190_alignmentShifter_uid72_fpSubTest_q <= rightShiftStage1_uid187_alignmentShifter_uid72_fpSubTest_q;
            WHEN "1" => r_uid190_alignmentShifter_uid72_fpSubTest_q <= redist4_stageIndexName_to27_uid174_b_1_q;
            WHEN OTHERS => r_uid190_alignmentShifter_uid72_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- frac_aSig_uid23_fpSubTest(BITSELECT,22)@0
    frac_aSig_uid23_fpSubTest_in <= aSig_uid17_fpSubTest_q(22 downto 0);
    frac_aSig_uid23_fpSubTest_b <= frac_aSig_uid23_fpSubTest_in(22 downto 0);

    -- redist29_frac_aSig_uid23_fpSubTest_b_4(DELAY,272)
    redist29_frac_aSig_uid23_fpSubTest_b_4 : dspba_delay
    GENERIC MAP ( width => 23, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => frac_aSig_uid23_fpSubTest_b, xout => redist29_frac_aSig_uid23_fpSubTest_b_4_q, clk => clk, aclr => areset );

    -- oFracA_uid65_fpSubTest(BITJOIN,64)@4
    oFracA_uid65_fpSubTest_q <= VCC_q & redist29_frac_aSig_uid23_fpSubTest_b_4_q;

    -- oFracAE_uid66_fpSubTest(BITJOIN,65)@4
    oFracAE_uid66_fpSubTest_q <= GND_q & oFracA_uid65_fpSubTest_q & GND_q & GND_q;

    -- fracAddResult_uid73_fpSubTest(ADD,72)@4
    fracAddResult_uid73_fpSubTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => oFracAE_uid66_fpSubTest_q(26)) & oFracAE_uid66_fpSubTest_q));
    fracAddResult_uid73_fpSubTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => r_uid190_alignmentShifter_uid72_fpSubTest_q(26)) & r_uid190_alignmentShifter_uid72_fpSubTest_q));
    fracAddResult_uid73_fpSubTest_o <= STD_LOGIC_VECTOR(SIGNED(fracAddResult_uid73_fpSubTest_a) + SIGNED(fracAddResult_uid73_fpSubTest_b));
    fracAddResult_uid73_fpSubTest_q <= fracAddResult_uid73_fpSubTest_o(27 downto 0);

    -- fracAddResultNoSignExt_uid74_fpSubTest(BITSELECT,73)@4
    fracAddResultNoSignExt_uid74_fpSubTest_in <= fracAddResult_uid73_fpSubTest_q(26 downto 0);
    fracAddResultNoSignExt_uid74_fpSubTest_b <= fracAddResultNoSignExt_uid74_fpSubTest_in(26 downto 0);

    -- redist12_fracAddResultNoSignExt_uid74_fpSubTest_b_1(DELAY,255)
    redist12_fracAddResultNoSignExt_uid74_fpSubTest_b_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracAddResultNoSignExt_uid74_fpSubTest_b, xout => redist12_fracAddResultNoSignExt_uid74_fpSubTest_b_1_q, clk => clk, aclr => areset );

    -- rVStage_uid122_lzCountVal_uid75_fpSubTest(BITSELECT,121)@5
    rVStage_uid122_lzCountVal_uid75_fpSubTest_b <= redist12_fracAddResultNoSignExt_uid74_fpSubTest_b_1_q(26 downto 11);

    -- vCount_uid123_lzCountVal_uid75_fpSubTest(LOGICAL,122)@5
    vCount_uid123_lzCountVal_uid75_fpSubTest_q <= "1" WHEN rVStage_uid122_lzCountVal_uid75_fpSubTest_b = zs_uid121_lzCountVal_uid75_fpSubTest_q ELSE "0";

    -- redist8_vCount_uid123_lzCountVal_uid75_fpSubTest_q_1(DELAY,251)
    redist8_vCount_uid123_lzCountVal_uid75_fpSubTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid123_lzCountVal_uid75_fpSubTest_q, xout => redist8_vCount_uid123_lzCountVal_uid75_fpSubTest_q_1_q, clk => clk, aclr => areset );

    -- vStage_uid125_lzCountVal_uid75_fpSubTest(BITSELECT,124)@5
    vStage_uid125_lzCountVal_uid75_fpSubTest_in <= redist12_fracAddResultNoSignExt_uid74_fpSubTest_b_1_q(10 downto 0);
    vStage_uid125_lzCountVal_uid75_fpSubTest_b <= vStage_uid125_lzCountVal_uid75_fpSubTest_in(10 downto 0);

    -- mO_uid124_lzCountVal_uid75_fpSubTest(CONSTANT,123)
    mO_uid124_lzCountVal_uid75_fpSubTest_q <= "11111";

    -- cStage_uid126_lzCountVal_uid75_fpSubTest(BITJOIN,125)@5
    cStage_uid126_lzCountVal_uid75_fpSubTest_q <= vStage_uid125_lzCountVal_uid75_fpSubTest_b & mO_uid124_lzCountVal_uid75_fpSubTest_q;

    -- vStagei_uid128_lzCountVal_uid75_fpSubTest(MUX,127)@5
    vStagei_uid128_lzCountVal_uid75_fpSubTest_s <= vCount_uid123_lzCountVal_uid75_fpSubTest_q;
    vStagei_uid128_lzCountVal_uid75_fpSubTest_combproc: PROCESS (vStagei_uid128_lzCountVal_uid75_fpSubTest_s, rVStage_uid122_lzCountVal_uid75_fpSubTest_b, cStage_uid126_lzCountVal_uid75_fpSubTest_q)
    BEGIN
        CASE (vStagei_uid128_lzCountVal_uid75_fpSubTest_s) IS
            WHEN "0" => vStagei_uid128_lzCountVal_uid75_fpSubTest_q <= rVStage_uid122_lzCountVal_uid75_fpSubTest_b;
            WHEN "1" => vStagei_uid128_lzCountVal_uid75_fpSubTest_q <= cStage_uid126_lzCountVal_uid75_fpSubTest_q;
            WHEN OTHERS => vStagei_uid128_lzCountVal_uid75_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid130_lzCountVal_uid75_fpSubTest_merged_bit_select(BITSELECT,237)@5
    rVStage_uid130_lzCountVal_uid75_fpSubTest_merged_bit_select_b <= vStagei_uid128_lzCountVal_uid75_fpSubTest_q(15 downto 8);
    rVStage_uid130_lzCountVal_uid75_fpSubTest_merged_bit_select_c <= vStagei_uid128_lzCountVal_uid75_fpSubTest_q(7 downto 0);

    -- vCount_uid131_lzCountVal_uid75_fpSubTest(LOGICAL,130)@5 + 1
    vCount_uid131_lzCountVal_uid75_fpSubTest_qi <= "1" WHEN rVStage_uid130_lzCountVal_uid75_fpSubTest_merged_bit_select_b = cstAllZWE_uid21_fpSubTest_q ELSE "0";
    vCount_uid131_lzCountVal_uid75_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid131_lzCountVal_uid75_fpSubTest_qi, xout => vCount_uid131_lzCountVal_uid75_fpSubTest_q, clk => clk, aclr => areset );

    -- zs_uid135_lzCountVal_uid75_fpSubTest(CONSTANT,134)
    zs_uid135_lzCountVal_uid75_fpSubTest_q <= "0000";

    -- redist1_rVStage_uid130_lzCountVal_uid75_fpSubTest_merged_bit_select_c_1(DELAY,244)
    redist1_rVStage_uid130_lzCountVal_uid75_fpSubTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid130_lzCountVal_uid75_fpSubTest_merged_bit_select_c, xout => redist1_rVStage_uid130_lzCountVal_uid75_fpSubTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- redist0_rVStage_uid130_lzCountVal_uid75_fpSubTest_merged_bit_select_b_1(DELAY,243)
    redist0_rVStage_uid130_lzCountVal_uid75_fpSubTest_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid130_lzCountVal_uid75_fpSubTest_merged_bit_select_b, xout => redist0_rVStage_uid130_lzCountVal_uid75_fpSubTest_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- vStagei_uid134_lzCountVal_uid75_fpSubTest(MUX,133)@6
    vStagei_uid134_lzCountVal_uid75_fpSubTest_s <= vCount_uid131_lzCountVal_uid75_fpSubTest_q;
    vStagei_uid134_lzCountVal_uid75_fpSubTest_combproc: PROCESS (vStagei_uid134_lzCountVal_uid75_fpSubTest_s, redist0_rVStage_uid130_lzCountVal_uid75_fpSubTest_merged_bit_select_b_1_q, redist1_rVStage_uid130_lzCountVal_uid75_fpSubTest_merged_bit_select_c_1_q)
    BEGIN
        CASE (vStagei_uid134_lzCountVal_uid75_fpSubTest_s) IS
            WHEN "0" => vStagei_uid134_lzCountVal_uid75_fpSubTest_q <= redist0_rVStage_uid130_lzCountVal_uid75_fpSubTest_merged_bit_select_b_1_q;
            WHEN "1" => vStagei_uid134_lzCountVal_uid75_fpSubTest_q <= redist1_rVStage_uid130_lzCountVal_uid75_fpSubTest_merged_bit_select_c_1_q;
            WHEN OTHERS => vStagei_uid134_lzCountVal_uid75_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid136_lzCountVal_uid75_fpSubTest_merged_bit_select(BITSELECT,238)@6
    rVStage_uid136_lzCountVal_uid75_fpSubTest_merged_bit_select_b <= vStagei_uid134_lzCountVal_uid75_fpSubTest_q(7 downto 4);
    rVStage_uid136_lzCountVal_uid75_fpSubTest_merged_bit_select_c <= vStagei_uid134_lzCountVal_uid75_fpSubTest_q(3 downto 0);

    -- vCount_uid137_lzCountVal_uid75_fpSubTest(LOGICAL,136)@6
    vCount_uid137_lzCountVal_uid75_fpSubTest_q <= "1" WHEN rVStage_uid136_lzCountVal_uid75_fpSubTest_merged_bit_select_b = zs_uid135_lzCountVal_uid75_fpSubTest_q ELSE "0";

    -- zs_uid141_lzCountVal_uid75_fpSubTest(CONSTANT,140)
    zs_uid141_lzCountVal_uid75_fpSubTest_q <= "00";

    -- vStagei_uid140_lzCountVal_uid75_fpSubTest(MUX,139)@6
    vStagei_uid140_lzCountVal_uid75_fpSubTest_s <= vCount_uid137_lzCountVal_uid75_fpSubTest_q;
    vStagei_uid140_lzCountVal_uid75_fpSubTest_combproc: PROCESS (vStagei_uid140_lzCountVal_uid75_fpSubTest_s, rVStage_uid136_lzCountVal_uid75_fpSubTest_merged_bit_select_b, rVStage_uid136_lzCountVal_uid75_fpSubTest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid140_lzCountVal_uid75_fpSubTest_s) IS
            WHEN "0" => vStagei_uid140_lzCountVal_uid75_fpSubTest_q <= rVStage_uid136_lzCountVal_uid75_fpSubTest_merged_bit_select_b;
            WHEN "1" => vStagei_uid140_lzCountVal_uid75_fpSubTest_q <= rVStage_uid136_lzCountVal_uid75_fpSubTest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid140_lzCountVal_uid75_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid142_lzCountVal_uid75_fpSubTest_merged_bit_select(BITSELECT,239)@6
    rVStage_uid142_lzCountVal_uid75_fpSubTest_merged_bit_select_b <= vStagei_uid140_lzCountVal_uid75_fpSubTest_q(3 downto 2);
    rVStage_uid142_lzCountVal_uid75_fpSubTest_merged_bit_select_c <= vStagei_uid140_lzCountVal_uid75_fpSubTest_q(1 downto 0);

    -- vCount_uid143_lzCountVal_uid75_fpSubTest(LOGICAL,142)@6
    vCount_uid143_lzCountVal_uid75_fpSubTest_q <= "1" WHEN rVStage_uid142_lzCountVal_uid75_fpSubTest_merged_bit_select_b = zs_uid141_lzCountVal_uid75_fpSubTest_q ELSE "0";

    -- vStagei_uid146_lzCountVal_uid75_fpSubTest(MUX,145)@6
    vStagei_uid146_lzCountVal_uid75_fpSubTest_s <= vCount_uid143_lzCountVal_uid75_fpSubTest_q;
    vStagei_uid146_lzCountVal_uid75_fpSubTest_combproc: PROCESS (vStagei_uid146_lzCountVal_uid75_fpSubTest_s, rVStage_uid142_lzCountVal_uid75_fpSubTest_merged_bit_select_b, rVStage_uid142_lzCountVal_uid75_fpSubTest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid146_lzCountVal_uid75_fpSubTest_s) IS
            WHEN "0" => vStagei_uid146_lzCountVal_uid75_fpSubTest_q <= rVStage_uid142_lzCountVal_uid75_fpSubTest_merged_bit_select_b;
            WHEN "1" => vStagei_uid146_lzCountVal_uid75_fpSubTest_q <= rVStage_uid142_lzCountVal_uid75_fpSubTest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid146_lzCountVal_uid75_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid148_lzCountVal_uid75_fpSubTest(BITSELECT,147)@6
    rVStage_uid148_lzCountVal_uid75_fpSubTest_b <= vStagei_uid146_lzCountVal_uid75_fpSubTest_q(1 downto 1);

    -- vCount_uid149_lzCountVal_uid75_fpSubTest(LOGICAL,148)@6
    vCount_uid149_lzCountVal_uid75_fpSubTest_q <= "1" WHEN rVStage_uid148_lzCountVal_uid75_fpSubTest_b = GND_q ELSE "0";

    -- r_uid150_lzCountVal_uid75_fpSubTest(BITJOIN,149)@6
    r_uid150_lzCountVal_uid75_fpSubTest_q <= redist8_vCount_uid123_lzCountVal_uid75_fpSubTest_q_1_q & vCount_uid131_lzCountVal_uid75_fpSubTest_q & vCount_uid137_lzCountVal_uid75_fpSubTest_q & vCount_uid143_lzCountVal_uid75_fpSubTest_q & vCount_uid149_lzCountVal_uid75_fpSubTest_q;

    -- redist6_r_uid150_lzCountVal_uid75_fpSubTest_q_1(DELAY,249)
    redist6_r_uid150_lzCountVal_uid75_fpSubTest_q_1 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => r_uid150_lzCountVal_uid75_fpSubTest_q, xout => redist6_r_uid150_lzCountVal_uid75_fpSubTest_q_1_q, clk => clk, aclr => areset );

    -- aMinusA_uid78_fpSubTest(LOGICAL,77)@7 + 1
    aMinusA_uid78_fpSubTest_qi <= "1" WHEN redist6_r_uid150_lzCountVal_uid75_fpSubTest_q_1_q = cAmA_uid77_fpSubTest_q ELSE "0";
    aMinusA_uid78_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aMinusA_uid78_fpSubTest_qi, xout => aMinusA_uid78_fpSubTest_q, clk => clk, aclr => areset );

    -- invAMinusA_uid100_fpSubTest(LOGICAL,99)@8
    invAMinusA_uid100_fpSubTest_q <= not (aMinusA_uid78_fpSubTest_q);

    -- redist19_sigA_uid51_fpSubTest_b_8(DELAY,262)
    redist19_sigA_uid51_fpSubTest_b_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist18_sigA_uid51_fpSubTest_b_2_q, xout => redist19_sigA_uid51_fpSubTest_b_8_q, clk => clk, aclr => areset );

    -- cstAllOWE_uid19_fpSubTest(CONSTANT,18)
    cstAllOWE_uid19_fpSubTest_q <= "11111111";

    -- expXIsMax_uid39_fpSubTest(LOGICAL,38)@1 + 1
    expXIsMax_uid39_fpSubTest_qi <= "1" WHEN redist26_exp_bSig_uid36_fpSubTest_b_1_q = cstAllOWE_uid19_fpSubTest_q ELSE "0";
    expXIsMax_uid39_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid39_fpSubTest_qi, xout => expXIsMax_uid39_fpSubTest_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid44_fpSubTest(LOGICAL,43)@2
    invExpXIsMax_uid44_fpSubTest_q <= not (expXIsMax_uid39_fpSubTest_q);

    -- excR_bSig_uid46_fpSubTest(LOGICAL,45)@2 + 1
    excR_bSig_uid46_fpSubTest_qi <= InvExpXIsZero_uid45_fpSubTest_q and invExpXIsMax_uid44_fpSubTest_q;
    excR_bSig_uid46_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excR_bSig_uid46_fpSubTest_qi, xout => excR_bSig_uid46_fpSubTest_q, clk => clk, aclr => areset );

    -- redist20_excR_bSig_uid46_fpSubTest_q_6(DELAY,263)
    redist20_excR_bSig_uid46_fpSubTest_q_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => excR_bSig_uid46_fpSubTest_q, xout => redist20_excR_bSig_uid46_fpSubTest_q_6_q, clk => clk, aclr => areset );

    -- redist31_exp_aSig_uid22_fpSubTest_b_7(DELAY,274)
    redist31_exp_aSig_uid22_fpSubTest_b_7 : dspba_delay
    GENERIC MAP ( width => 8, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist30_exp_aSig_uid22_fpSubTest_b_1_q, xout => redist31_exp_aSig_uid22_fpSubTest_b_7_q, clk => clk, aclr => areset );

    -- expXIsMax_uid25_fpSubTest(LOGICAL,24)@7 + 1
    expXIsMax_uid25_fpSubTest_qi <= "1" WHEN redist31_exp_aSig_uid22_fpSubTest_b_7_q = cstAllOWE_uid19_fpSubTest_q ELSE "0";
    expXIsMax_uid25_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid25_fpSubTest_qi, xout => expXIsMax_uid25_fpSubTest_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid30_fpSubTest(LOGICAL,29)@8
    invExpXIsMax_uid30_fpSubTest_q <= not (expXIsMax_uid25_fpSubTest_q);

    -- excZ_aSig_uid17_uid24_fpSubTest(LOGICAL,23)@7 + 1
    excZ_aSig_uid17_uid24_fpSubTest_qi <= "1" WHEN redist31_exp_aSig_uid22_fpSubTest_b_7_q = cstAllZWE_uid21_fpSubTest_q ELSE "0";
    excZ_aSig_uid17_uid24_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_aSig_uid17_uid24_fpSubTest_qi, xout => excZ_aSig_uid17_uid24_fpSubTest_q, clk => clk, aclr => areset );

    -- InvExpXIsZero_uid31_fpSubTest(LOGICAL,30)@8
    InvExpXIsZero_uid31_fpSubTest_q <= not (excZ_aSig_uid17_uid24_fpSubTest_q);

    -- excR_aSig_uid32_fpSubTest(LOGICAL,31)@8
    excR_aSig_uid32_fpSubTest_q <= InvExpXIsZero_uid31_fpSubTest_q and invExpXIsMax_uid30_fpSubTest_q;

    -- signRReg_uid101_fpSubTest(LOGICAL,100)@8
    signRReg_uid101_fpSubTest_q <= excR_aSig_uid32_fpSubTest_q and redist20_excR_bSig_uid46_fpSubTest_q_6_q and redist19_sigA_uid51_fpSubTest_b_8_q and invAMinusA_uid100_fpSubTest_q;

    -- redist17_sigB_uid52_fpSubTest_b_8(DELAY,260)
    redist17_sigB_uid52_fpSubTest_b_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist16_sigB_uid52_fpSubTest_b_2_q, xout => redist17_sigB_uid52_fpSubTest_b_8_q, clk => clk, aclr => areset );

    -- redist24_excZ_bSig_uid18_uid38_fpSubTest_q_7(DELAY,267)
    redist24_excZ_bSig_uid18_uid38_fpSubTest_q_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_bSig_uid18_uid38_fpSubTest_q, xout => redist24_excZ_bSig_uid18_uid38_fpSubTest_q_7_q, clk => clk, aclr => areset );

    -- excAZBZSigASigB_uid105_fpSubTest(LOGICAL,104)@8
    excAZBZSigASigB_uid105_fpSubTest_q <= excZ_aSig_uid17_uid24_fpSubTest_q and redist24_excZ_bSig_uid18_uid38_fpSubTest_q_7_q and redist19_sigA_uid51_fpSubTest_b_8_q and redist17_sigB_uid52_fpSubTest_b_8_q;

    -- excBZARSigA_uid106_fpSubTest(LOGICAL,105)@8
    excBZARSigA_uid106_fpSubTest_q <= redist24_excZ_bSig_uid18_uid38_fpSubTest_q_7_q and excR_aSig_uid32_fpSubTest_q and redist19_sigA_uid51_fpSubTest_b_8_q;

    -- signRZero_uid107_fpSubTest(LOGICAL,106)@8
    signRZero_uid107_fpSubTest_q <= excBZARSigA_uid106_fpSubTest_q or excAZBZSigASigB_uid105_fpSubTest_q;

    -- fracXIsZero_uid40_fpSubTest(LOGICAL,39)@2
    fracXIsZero_uid40_fpSubTest_q <= "1" WHEN cstZeroWF_uid20_fpSubTest_q = redist25_frac_bSig_uid37_fpSubTest_b_2_q ELSE "0";

    -- excI_bSig_uid42_fpSubTest(LOGICAL,41)@2 + 1
    excI_bSig_uid42_fpSubTest_qi <= expXIsMax_uid39_fpSubTest_q and fracXIsZero_uid40_fpSubTest_q;
    excI_bSig_uid42_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_bSig_uid42_fpSubTest_qi, xout => excI_bSig_uid42_fpSubTest_q, clk => clk, aclr => areset );

    -- redist22_excI_bSig_uid42_fpSubTest_q_6(DELAY,265)
    redist22_excI_bSig_uid42_fpSubTest_q_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_bSig_uid42_fpSubTest_q, xout => redist22_excI_bSig_uid42_fpSubTest_q_6_q, clk => clk, aclr => areset );

    -- sigBBInf_uid102_fpSubTest(LOGICAL,101)@8
    sigBBInf_uid102_fpSubTest_q <= redist17_sigB_uid52_fpSubTest_b_8_q and redist22_excI_bSig_uid42_fpSubTest_q_6_q;

    -- fracXIsZero_uid26_fpSubTest(LOGICAL,25)@4 + 1
    fracXIsZero_uid26_fpSubTest_qi <= "1" WHEN cstZeroWF_uid20_fpSubTest_q = redist29_frac_aSig_uid23_fpSubTest_b_4_q ELSE "0";
    fracXIsZero_uid26_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid26_fpSubTest_qi, xout => fracXIsZero_uid26_fpSubTest_q, clk => clk, aclr => areset );

    -- redist28_fracXIsZero_uid26_fpSubTest_q_4(DELAY,271)
    redist28_fracXIsZero_uid26_fpSubTest_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid26_fpSubTest_q, xout => redist28_fracXIsZero_uid26_fpSubTest_q_4_q, clk => clk, aclr => areset );

    -- excI_aSig_uid28_fpSubTest(LOGICAL,27)@8
    excI_aSig_uid28_fpSubTest_q <= expXIsMax_uid25_fpSubTest_q and redist28_fracXIsZero_uid26_fpSubTest_q_4_q;

    -- sigAAInf_uid103_fpSubTest(LOGICAL,102)@8
    sigAAInf_uid103_fpSubTest_q <= redist19_sigA_uid51_fpSubTest_b_8_q and excI_aSig_uid28_fpSubTest_q;

    -- signRInf_uid104_fpSubTest(LOGICAL,103)@8
    signRInf_uid104_fpSubTest_q <= sigAAInf_uid103_fpSubTest_q or sigBBInf_uid102_fpSubTest_q;

    -- signRInfRZRReg_uid108_fpSubTest(LOGICAL,107)@8 + 1
    signRInfRZRReg_uid108_fpSubTest_qi <= signRInf_uid104_fpSubTest_q or signRZero_uid107_fpSubTest_q or signRReg_uid101_fpSubTest_q;
    signRInfRZRReg_uid108_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRInfRZRReg_uid108_fpSubTest_qi, xout => signRInfRZRReg_uid108_fpSubTest_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid41_fpSubTest(LOGICAL,40)@2
    fracXIsNotZero_uid41_fpSubTest_q <= not (fracXIsZero_uid40_fpSubTest_q);

    -- excN_bSig_uid43_fpSubTest(LOGICAL,42)@2 + 1
    excN_bSig_uid43_fpSubTest_qi <= expXIsMax_uid39_fpSubTest_q and fracXIsNotZero_uid41_fpSubTest_q;
    excN_bSig_uid43_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_bSig_uid43_fpSubTest_qi, xout => excN_bSig_uid43_fpSubTest_q, clk => clk, aclr => areset );

    -- redist21_excN_bSig_uid43_fpSubTest_q_7(DELAY,264)
    redist21_excN_bSig_uid43_fpSubTest_q_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_bSig_uid43_fpSubTest_q, xout => redist21_excN_bSig_uid43_fpSubTest_q_7_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid27_fpSubTest(LOGICAL,26)@8
    fracXIsNotZero_uid27_fpSubTest_q <= not (redist28_fracXIsZero_uid26_fpSubTest_q_4_q);

    -- excN_aSig_uid29_fpSubTest(LOGICAL,28)@8 + 1
    excN_aSig_uid29_fpSubTest_qi <= expXIsMax_uid25_fpSubTest_q and fracXIsNotZero_uid27_fpSubTest_q;
    excN_aSig_uid29_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_aSig_uid29_fpSubTest_qi, xout => excN_aSig_uid29_fpSubTest_q, clk => clk, aclr => areset );

    -- excRNaN2_uid95_fpSubTest(LOGICAL,94)@9
    excRNaN2_uid95_fpSubTest_q <= excN_aSig_uid29_fpSubTest_q or redist21_excN_bSig_uid43_fpSubTest_q_7_q;

    -- redist15_effSub_uid53_fpSubTest_q_7(DELAY,258)
    redist15_effSub_uid53_fpSubTest_q_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "ASYNC" )
    PORT MAP ( xin => effSub_uid53_fpSubTest_q, xout => redist15_effSub_uid53_fpSubTest_q_7_q, clk => clk, aclr => areset );

    -- redist23_excI_bSig_uid42_fpSubTest_q_7(DELAY,266)
    redist23_excI_bSig_uid42_fpSubTest_q_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist22_excI_bSig_uid42_fpSubTest_q_6_q, xout => redist23_excI_bSig_uid42_fpSubTest_q_7_q, clk => clk, aclr => areset );

    -- redist27_excI_aSig_uid28_fpSubTest_q_1(DELAY,270)
    redist27_excI_aSig_uid28_fpSubTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_aSig_uid28_fpSubTest_q, xout => redist27_excI_aSig_uid28_fpSubTest_q_1_q, clk => clk, aclr => areset );

    -- excAIBISub_uid96_fpSubTest(LOGICAL,95)@9
    excAIBISub_uid96_fpSubTest_q <= redist27_excI_aSig_uid28_fpSubTest_q_1_q and redist23_excI_bSig_uid42_fpSubTest_q_7_q and redist15_effSub_uid53_fpSubTest_q_7_q;

    -- excRNaN_uid97_fpSubTest(LOGICAL,96)@9
    excRNaN_uid97_fpSubTest_q <= excAIBISub_uid96_fpSubTest_q or excRNaN2_uid95_fpSubTest_q;

    -- invExcRNaN_uid109_fpSubTest(LOGICAL,108)@9
    invExcRNaN_uid109_fpSubTest_q <= not (excRNaN_uid97_fpSubTest_q);

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- signRPostExc_uid110_fpSubTest(LOGICAL,109)@9 + 1
    signRPostExc_uid110_fpSubTest_qi <= invExcRNaN_uid109_fpSubTest_q and signRInfRZRReg_uid108_fpSubTest_q;
    signRPostExc_uid110_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRPostExc_uid110_fpSubTest_qi, xout => signRPostExc_uid110_fpSubTest_q, clk => clk, aclr => areset );

    -- expInc_uid79_fpSubTest(ADD,78)@7
    expInc_uid79_fpSubTest_a <= STD_LOGIC_VECTOR("0" & redist31_exp_aSig_uid22_fpSubTest_b_7_q);
    expInc_uid79_fpSubTest_b <= STD_LOGIC_VECTOR("00000000" & VCC_q);
    expInc_uid79_fpSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expInc_uid79_fpSubTest_a) + UNSIGNED(expInc_uid79_fpSubTest_b));
    expInc_uid79_fpSubTest_q <= expInc_uid79_fpSubTest_o(8 downto 0);

    -- expPostNorm_uid80_fpSubTest(SUB,79)@7 + 1
    expPostNorm_uid80_fpSubTest_a <= STD_LOGIC_VECTOR("0" & expInc_uid79_fpSubTest_q);
    expPostNorm_uid80_fpSubTest_b <= STD_LOGIC_VECTOR("00000" & redist6_r_uid150_lzCountVal_uid75_fpSubTest_q_1_q);
    expPostNorm_uid80_fpSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expPostNorm_uid80_fpSubTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expPostNorm_uid80_fpSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expPostNorm_uid80_fpSubTest_a) - UNSIGNED(expPostNorm_uid80_fpSubTest_b));
        END IF;
    END PROCESS;
    expPostNorm_uid80_fpSubTest_q <= expPostNorm_uid80_fpSubTest_o(9 downto 0);

    -- leftShiftStage1Idx3Rng3_uid222_fracPostNorm_uid76_fpSubTest(BITSELECT,221)@7
    leftShiftStage1Idx3Rng3_uid222_fracPostNorm_uid76_fpSubTest_in <= leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_mfinal_q(23 downto 0);
    leftShiftStage1Idx3Rng3_uid222_fracPostNorm_uid76_fpSubTest_b <= leftShiftStage1Idx3Rng3_uid222_fracPostNorm_uid76_fpSubTest_in(23 downto 0);

    -- leftShiftStage1Idx3Pad3_uid221_fracPostNorm_uid76_fpSubTest(CONSTANT,220)
    leftShiftStage1Idx3Pad3_uid221_fracPostNorm_uid76_fpSubTest_q <= "000";

    -- leftShiftStage1Idx3_uid223_fracPostNorm_uid76_fpSubTest(BITJOIN,222)@7
    leftShiftStage1Idx3_uid223_fracPostNorm_uid76_fpSubTest_q <= leftShiftStage1Idx3Rng3_uid222_fracPostNorm_uid76_fpSubTest_b & leftShiftStage1Idx3Pad3_uid221_fracPostNorm_uid76_fpSubTest_q;

    -- leftShiftStage1Idx2Rng2_uid219_fracPostNorm_uid76_fpSubTest(BITSELECT,218)@7
    leftShiftStage1Idx2Rng2_uid219_fracPostNorm_uid76_fpSubTest_in <= leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_mfinal_q(24 downto 0);
    leftShiftStage1Idx2Rng2_uid219_fracPostNorm_uid76_fpSubTest_b <= leftShiftStage1Idx2Rng2_uid219_fracPostNorm_uid76_fpSubTest_in(24 downto 0);

    -- leftShiftStage1Idx2_uid220_fracPostNorm_uid76_fpSubTest(BITJOIN,219)@7
    leftShiftStage1Idx2_uid220_fracPostNorm_uid76_fpSubTest_q <= leftShiftStage1Idx2Rng2_uid219_fracPostNorm_uid76_fpSubTest_b & zs_uid141_lzCountVal_uid75_fpSubTest_q;

    -- leftShiftStage1Idx1Rng1_uid216_fracPostNorm_uid76_fpSubTest(BITSELECT,215)@7
    leftShiftStage1Idx1Rng1_uid216_fracPostNorm_uid76_fpSubTest_in <= leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_mfinal_q(25 downto 0);
    leftShiftStage1Idx1Rng1_uid216_fracPostNorm_uid76_fpSubTest_b <= leftShiftStage1Idx1Rng1_uid216_fracPostNorm_uid76_fpSubTest_in(25 downto 0);

    -- leftShiftStage1Idx1_uid217_fracPostNorm_uid76_fpSubTest(BITJOIN,216)@7
    leftShiftStage1Idx1_uid217_fracPostNorm_uid76_fpSubTest_q <= leftShiftStage1Idx1Rng1_uid216_fracPostNorm_uid76_fpSubTest_b & GND_q;

    -- leftShiftStage0Idx7_uid212_fracPostNorm_uid76_fpSubTest(CONSTANT,211)
    leftShiftStage0Idx7_uid212_fracPostNorm_uid76_fpSubTest_q <= "000000000000000000000000000";

    -- redist13_fracAddResultNoSignExt_uid74_fpSubTest_b_3(DELAY,256)
    redist13_fracAddResultNoSignExt_uid74_fpSubTest_b_3 : dspba_delay
    GENERIC MAP ( width => 27, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist12_fracAddResultNoSignExt_uid74_fpSubTest_b_1_q, xout => redist13_fracAddResultNoSignExt_uid74_fpSubTest_b_3_q, clk => clk, aclr => areset );

    -- leftShiftStage0Idx6Rng24_uid210_fracPostNorm_uid76_fpSubTest(BITSELECT,209)@7
    leftShiftStage0Idx6Rng24_uid210_fracPostNorm_uid76_fpSubTest_in <= redist13_fracAddResultNoSignExt_uid74_fpSubTest_b_3_q(2 downto 0);
    leftShiftStage0Idx6Rng24_uid210_fracPostNorm_uid76_fpSubTest_b <= leftShiftStage0Idx6Rng24_uid210_fracPostNorm_uid76_fpSubTest_in(2 downto 0);

    -- leftShiftStage0Idx6Pad24_uid209_fracPostNorm_uid76_fpSubTest(CONSTANT,208)
    leftShiftStage0Idx6Pad24_uid209_fracPostNorm_uid76_fpSubTest_q <= "000000000000000000000000";

    -- leftShiftStage0Idx6_uid211_fracPostNorm_uid76_fpSubTest(BITJOIN,210)@7
    leftShiftStage0Idx6_uid211_fracPostNorm_uid76_fpSubTest_q <= leftShiftStage0Idx6Rng24_uid210_fracPostNorm_uid76_fpSubTest_b & leftShiftStage0Idx6Pad24_uid209_fracPostNorm_uid76_fpSubTest_q;

    -- leftShiftStage0Idx5Rng20_uid207_fracPostNorm_uid76_fpSubTest(BITSELECT,206)@7
    leftShiftStage0Idx5Rng20_uid207_fracPostNorm_uid76_fpSubTest_in <= redist13_fracAddResultNoSignExt_uid74_fpSubTest_b_3_q(6 downto 0);
    leftShiftStage0Idx5Rng20_uid207_fracPostNorm_uid76_fpSubTest_b <= leftShiftStage0Idx5Rng20_uid207_fracPostNorm_uid76_fpSubTest_in(6 downto 0);

    -- leftShiftStage0Idx5Pad20_uid206_fracPostNorm_uid76_fpSubTest(CONSTANT,205)
    leftShiftStage0Idx5Pad20_uid206_fracPostNorm_uid76_fpSubTest_q <= "00000000000000000000";

    -- leftShiftStage0Idx5_uid208_fracPostNorm_uid76_fpSubTest(BITJOIN,207)@7
    leftShiftStage0Idx5_uid208_fracPostNorm_uid76_fpSubTest_q <= leftShiftStage0Idx5Rng20_uid207_fracPostNorm_uid76_fpSubTest_b & leftShiftStage0Idx5Pad20_uid206_fracPostNorm_uid76_fpSubTest_q;

    -- redist7_vStage_uid125_lzCountVal_uid75_fpSubTest_b_2(DELAY,250)
    redist7_vStage_uid125_lzCountVal_uid75_fpSubTest_b_2 : dspba_delay
    GENERIC MAP ( width => 11, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => vStage_uid125_lzCountVal_uid75_fpSubTest_b, xout => redist7_vStage_uid125_lzCountVal_uid75_fpSubTest_b_2_q, clk => clk, aclr => areset );

    -- leftShiftStage0Idx4_uid205_fracPostNorm_uid76_fpSubTest(BITJOIN,204)@7
    leftShiftStage0Idx4_uid205_fracPostNorm_uid76_fpSubTest_q <= redist7_vStage_uid125_lzCountVal_uid75_fpSubTest_b_2_q & zs_uid121_lzCountVal_uid75_fpSubTest_q;

    -- leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_msplit_1(MUX,234)@7
    leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_msplit_1_s <= leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_selLSBs_merged_bit_select_b;
    leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_msplit_1_combproc: PROCESS (leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_msplit_1_s, leftShiftStage0Idx4_uid205_fracPostNorm_uid76_fpSubTest_q, leftShiftStage0Idx5_uid208_fracPostNorm_uid76_fpSubTest_q, leftShiftStage0Idx6_uid211_fracPostNorm_uid76_fpSubTest_q, leftShiftStage0Idx7_uid212_fracPostNorm_uid76_fpSubTest_q)
    BEGIN
        CASE (leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_msplit_1_s) IS
            WHEN "00" => leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_msplit_1_q <= leftShiftStage0Idx4_uid205_fracPostNorm_uid76_fpSubTest_q;
            WHEN "01" => leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_msplit_1_q <= leftShiftStage0Idx5_uid208_fracPostNorm_uid76_fpSubTest_q;
            WHEN "10" => leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_msplit_1_q <= leftShiftStage0Idx6_uid211_fracPostNorm_uid76_fpSubTest_q;
            WHEN "11" => leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_msplit_1_q <= leftShiftStage0Idx7_uid212_fracPostNorm_uid76_fpSubTest_q;
            WHEN OTHERS => leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_msplit_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage0Idx3Rng12_uid201_fracPostNorm_uid76_fpSubTest(BITSELECT,200)@7
    leftShiftStage0Idx3Rng12_uid201_fracPostNorm_uid76_fpSubTest_in <= redist13_fracAddResultNoSignExt_uid74_fpSubTest_b_3_q(14 downto 0);
    leftShiftStage0Idx3Rng12_uid201_fracPostNorm_uid76_fpSubTest_b <= leftShiftStage0Idx3Rng12_uid201_fracPostNorm_uid76_fpSubTest_in(14 downto 0);

    -- leftShiftStage0Idx3Pad12_uid200_fracPostNorm_uid76_fpSubTest(CONSTANT,199)
    leftShiftStage0Idx3Pad12_uid200_fracPostNorm_uid76_fpSubTest_q <= "000000000000";

    -- leftShiftStage0Idx3_uid202_fracPostNorm_uid76_fpSubTest(BITJOIN,201)@7
    leftShiftStage0Idx3_uid202_fracPostNorm_uid76_fpSubTest_q <= leftShiftStage0Idx3Rng12_uid201_fracPostNorm_uid76_fpSubTest_b & leftShiftStage0Idx3Pad12_uid200_fracPostNorm_uid76_fpSubTest_q;

    -- leftShiftStage0Idx2Rng8_uid198_fracPostNorm_uid76_fpSubTest(BITSELECT,197)@7
    leftShiftStage0Idx2Rng8_uid198_fracPostNorm_uid76_fpSubTest_in <= redist13_fracAddResultNoSignExt_uid74_fpSubTest_b_3_q(18 downto 0);
    leftShiftStage0Idx2Rng8_uid198_fracPostNorm_uid76_fpSubTest_b <= leftShiftStage0Idx2Rng8_uid198_fracPostNorm_uid76_fpSubTest_in(18 downto 0);

    -- leftShiftStage0Idx2_uid199_fracPostNorm_uid76_fpSubTest(BITJOIN,198)@7
    leftShiftStage0Idx2_uid199_fracPostNorm_uid76_fpSubTest_q <= leftShiftStage0Idx2Rng8_uid198_fracPostNorm_uid76_fpSubTest_b & cstAllZWE_uid21_fpSubTest_q;

    -- leftShiftStage0Idx1Rng4_uid195_fracPostNorm_uid76_fpSubTest(BITSELECT,194)@7
    leftShiftStage0Idx1Rng4_uid195_fracPostNorm_uid76_fpSubTest_in <= redist13_fracAddResultNoSignExt_uid74_fpSubTest_b_3_q(22 downto 0);
    leftShiftStage0Idx1Rng4_uid195_fracPostNorm_uid76_fpSubTest_b <= leftShiftStage0Idx1Rng4_uid195_fracPostNorm_uid76_fpSubTest_in(22 downto 0);

    -- leftShiftStage0Idx1_uid196_fracPostNorm_uid76_fpSubTest(BITJOIN,195)@7
    leftShiftStage0Idx1_uid196_fracPostNorm_uid76_fpSubTest_q <= leftShiftStage0Idx1Rng4_uid195_fracPostNorm_uid76_fpSubTest_b & zs_uid135_lzCountVal_uid75_fpSubTest_q;

    -- leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_msplit_0(MUX,233)@7
    leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_msplit_0_s <= leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_selLSBs_merged_bit_select_b;
    leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_msplit_0_combproc: PROCESS (leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_msplit_0_s, redist13_fracAddResultNoSignExt_uid74_fpSubTest_b_3_q, leftShiftStage0Idx1_uid196_fracPostNorm_uid76_fpSubTest_q, leftShiftStage0Idx2_uid199_fracPostNorm_uid76_fpSubTest_q, leftShiftStage0Idx3_uid202_fracPostNorm_uid76_fpSubTest_q)
    BEGIN
        CASE (leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_msplit_0_s) IS
            WHEN "00" => leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_msplit_0_q <= redist13_fracAddResultNoSignExt_uid74_fpSubTest_b_3_q;
            WHEN "01" => leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_msplit_0_q <= leftShiftStage0Idx1_uid196_fracPostNorm_uid76_fpSubTest_q;
            WHEN "10" => leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_msplit_0_q <= leftShiftStage0Idx2_uid199_fracPostNorm_uid76_fpSubTest_q;
            WHEN "11" => leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_msplit_0_q <= leftShiftStage0Idx3_uid202_fracPostNorm_uid76_fpSubTest_q;
            WHEN OTHERS => leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_msplit_0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_selLSBs_merged_bit_select(BITSELECT,242)@7
    leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_selLSBs_merged_bit_select_b <= leftShiftStageSel4Dto2_uid213_fracPostNorm_uid76_fpSubTest_merged_bit_select_b(1 downto 0);
    leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_selLSBs_merged_bit_select_c <= leftShiftStageSel4Dto2_uid213_fracPostNorm_uid76_fpSubTest_merged_bit_select_b(2 downto 2);

    -- leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_mfinal(MUX,235)@7
    leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_mfinal_s <= leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_selLSBs_merged_bit_select_c;
    leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_mfinal_combproc: PROCESS (leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_mfinal_s, leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_msplit_0_q, leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_msplit_1_q)
    BEGIN
        CASE (leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_mfinal_s) IS
            WHEN "0" => leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_mfinal_q <= leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_msplit_0_q;
            WHEN "1" => leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_mfinal_q <= leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_msplit_1_q;
            WHEN OTHERS => leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_mfinal_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStageSel4Dto2_uid213_fracPostNorm_uid76_fpSubTest_merged_bit_select(BITSELECT,240)@7
    leftShiftStageSel4Dto2_uid213_fracPostNorm_uid76_fpSubTest_merged_bit_select_b <= redist6_r_uid150_lzCountVal_uid75_fpSubTest_q_1_q(4 downto 2);
    leftShiftStageSel4Dto2_uid213_fracPostNorm_uid76_fpSubTest_merged_bit_select_c <= redist6_r_uid150_lzCountVal_uid75_fpSubTest_q_1_q(1 downto 0);

    -- leftShiftStage1_uid225_fracPostNorm_uid76_fpSubTest(MUX,224)@7
    leftShiftStage1_uid225_fracPostNorm_uid76_fpSubTest_s <= leftShiftStageSel4Dto2_uid213_fracPostNorm_uid76_fpSubTest_merged_bit_select_c;
    leftShiftStage1_uid225_fracPostNorm_uid76_fpSubTest_combproc: PROCESS (leftShiftStage1_uid225_fracPostNorm_uid76_fpSubTest_s, leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_mfinal_q, leftShiftStage1Idx1_uid217_fracPostNorm_uid76_fpSubTest_q, leftShiftStage1Idx2_uid220_fracPostNorm_uid76_fpSubTest_q, leftShiftStage1Idx3_uid223_fracPostNorm_uid76_fpSubTest_q)
    BEGIN
        CASE (leftShiftStage1_uid225_fracPostNorm_uid76_fpSubTest_s) IS
            WHEN "00" => leftShiftStage1_uid225_fracPostNorm_uid76_fpSubTest_q <= leftShiftStage0_uid214_fracPostNorm_uid76_fpSubTest_mfinal_q;
            WHEN "01" => leftShiftStage1_uid225_fracPostNorm_uid76_fpSubTest_q <= leftShiftStage1Idx1_uid217_fracPostNorm_uid76_fpSubTest_q;
            WHEN "10" => leftShiftStage1_uid225_fracPostNorm_uid76_fpSubTest_q <= leftShiftStage1Idx2_uid220_fracPostNorm_uid76_fpSubTest_q;
            WHEN "11" => leftShiftStage1_uid225_fracPostNorm_uid76_fpSubTest_q <= leftShiftStage1Idx3_uid223_fracPostNorm_uid76_fpSubTest_q;
            WHEN OTHERS => leftShiftStage1_uid225_fracPostNorm_uid76_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracPostNormRndRange_uid81_fpSubTest(BITSELECT,80)@7
    fracPostNormRndRange_uid81_fpSubTest_in <= leftShiftStage1_uid225_fracPostNorm_uid76_fpSubTest_q(25 downto 0);
    fracPostNormRndRange_uid81_fpSubTest_b <= fracPostNormRndRange_uid81_fpSubTest_in(25 downto 2);

    -- redist11_fracPostNormRndRange_uid81_fpSubTest_b_1(DELAY,254)
    redist11_fracPostNormRndRange_uid81_fpSubTest_b_1 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracPostNormRndRange_uid81_fpSubTest_b, xout => redist11_fracPostNormRndRange_uid81_fpSubTest_b_1_q, clk => clk, aclr => areset );

    -- expFracR_uid82_fpSubTest(BITJOIN,81)@8
    expFracR_uid82_fpSubTest_q <= expPostNorm_uid80_fpSubTest_q & redist11_fracPostNormRndRange_uid81_fpSubTest_b_1_q;

    -- expRPreExc_uid88_fpSubTest(BITSELECT,87)@8
    expRPreExc_uid88_fpSubTest_in <= expFracR_uid82_fpSubTest_q(31 downto 0);
    expRPreExc_uid88_fpSubTest_b <= expRPreExc_uid88_fpSubTest_in(31 downto 24);

    -- redist9_expRPreExc_uid88_fpSubTest_b_2(DELAY,252)
    redist9_expRPreExc_uid88_fpSubTest_b_2 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRPreExc_uid88_fpSubTest_b, xout => redist9_expRPreExc_uid88_fpSubTest_b_2_q, clk => clk, aclr => areset );

    -- wEP2AllOwE_uid83_fpSubTest(CONSTANT,82)
    wEP2AllOwE_uid83_fpSubTest_q <= "0011111111";

    -- rndExp_uid84_fpSubTest(BITSELECT,83)@8
    rndExp_uid84_fpSubTest_b <= expFracR_uid82_fpSubTest_q(33 downto 24);

    -- rOvf_uid85_fpSubTest(LOGICAL,84)@8
    rOvf_uid85_fpSubTest_q <= "1" WHEN rndExp_uid84_fpSubTest_b = wEP2AllOwE_uid83_fpSubTest_q ELSE "0";

    -- regInputs_uid89_fpSubTest(LOGICAL,88)@8
    regInputs_uid89_fpSubTest_q <= excR_aSig_uid32_fpSubTest_q and redist20_excR_bSig_uid46_fpSubTest_q_6_q;

    -- rInfOvf_uid92_fpSubTest(LOGICAL,91)@8 + 1
    rInfOvf_uid92_fpSubTest_qi <= regInputs_uid89_fpSubTest_q and rOvf_uid85_fpSubTest_q;
    rInfOvf_uid92_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rInfOvf_uid92_fpSubTest_qi, xout => rInfOvf_uid92_fpSubTest_q, clk => clk, aclr => areset );

    -- excRInfVInC_uid93_fpSubTest(BITJOIN,92)@9
    excRInfVInC_uid93_fpSubTest_q <= rInfOvf_uid92_fpSubTest_q & redist21_excN_bSig_uid43_fpSubTest_q_7_q & excN_aSig_uid29_fpSubTest_q & redist23_excI_bSig_uid42_fpSubTest_q_7_q & redist27_excI_aSig_uid28_fpSubTest_q_1_q & redist15_effSub_uid53_fpSubTest_q_7_q;

    -- excRInf_uid94_fpSubTest(LOOKUP,93)@9
    excRInf_uid94_fpSubTest_combproc: PROCESS (excRInfVInC_uid93_fpSubTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excRInfVInC_uid93_fpSubTest_q) IS
            WHEN "000000" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "000001" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "000010" => excRInf_uid94_fpSubTest_q <= "1";
            WHEN "000011" => excRInf_uid94_fpSubTest_q <= "1";
            WHEN "000100" => excRInf_uid94_fpSubTest_q <= "1";
            WHEN "000101" => excRInf_uid94_fpSubTest_q <= "1";
            WHEN "000110" => excRInf_uid94_fpSubTest_q <= "1";
            WHEN "000111" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "001000" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "001001" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "001010" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "001011" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "001100" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "001101" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "001110" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "001111" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "010000" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "010001" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "010010" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "010011" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "010100" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "010101" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "010110" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "010111" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "011000" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "011001" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "011010" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "011011" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "011100" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "011101" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "011110" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "011111" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "100000" => excRInf_uid94_fpSubTest_q <= "1";
            WHEN "100001" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "100010" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "100011" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "100100" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "100101" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "100110" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "100111" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "101000" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "101001" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "101010" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "101011" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "101100" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "101101" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "101110" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "101111" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "110000" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "110001" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "110010" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "110011" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "110100" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "110101" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "110110" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "110111" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "111000" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "111001" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "111010" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "111011" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "111100" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "111101" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "111110" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN "111111" => excRInf_uid94_fpSubTest_q <= "0";
            WHEN OTHERS => -- unreachable
                           excRInf_uid94_fpSubTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- rUdf_uid86_fpSubTest(BITSELECT,85)@8
    rUdf_uid86_fpSubTest_b <= STD_LOGIC_VECTOR(expFracR_uid82_fpSubTest_q(33 downto 33));

    -- excRZeroVInC_uid90_fpSubTest(BITJOIN,89)@8
    excRZeroVInC_uid90_fpSubTest_q <= aMinusA_uid78_fpSubTest_q & rUdf_uid86_fpSubTest_b & regInputs_uid89_fpSubTest_q & redist24_excZ_bSig_uid18_uid38_fpSubTest_q_7_q & excZ_aSig_uid17_uid24_fpSubTest_q;

    -- excRZero_uid91_fpSubTest(LOOKUP,90)@8 + 1
    excRZero_uid91_fpSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excRZero_uid91_fpSubTest_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (excRZeroVInC_uid90_fpSubTest_q) IS
                WHEN "00000" => excRZero_uid91_fpSubTest_q <= "0";
                WHEN "00001" => excRZero_uid91_fpSubTest_q <= "0";
                WHEN "00010" => excRZero_uid91_fpSubTest_q <= "0";
                WHEN "00011" => excRZero_uid91_fpSubTest_q <= "1";
                WHEN "00100" => excRZero_uid91_fpSubTest_q <= "0";
                WHEN "00101" => excRZero_uid91_fpSubTest_q <= "0";
                WHEN "00110" => excRZero_uid91_fpSubTest_q <= "0";
                WHEN "00111" => excRZero_uid91_fpSubTest_q <= "0";
                WHEN "01000" => excRZero_uid91_fpSubTest_q <= "0";
                WHEN "01001" => excRZero_uid91_fpSubTest_q <= "0";
                WHEN "01010" => excRZero_uid91_fpSubTest_q <= "0";
                WHEN "01011" => excRZero_uid91_fpSubTest_q <= "1";
                WHEN "01100" => excRZero_uid91_fpSubTest_q <= "1";
                WHEN "01101" => excRZero_uid91_fpSubTest_q <= "0";
                WHEN "01110" => excRZero_uid91_fpSubTest_q <= "0";
                WHEN "01111" => excRZero_uid91_fpSubTest_q <= "0";
                WHEN "10000" => excRZero_uid91_fpSubTest_q <= "0";
                WHEN "10001" => excRZero_uid91_fpSubTest_q <= "0";
                WHEN "10010" => excRZero_uid91_fpSubTest_q <= "0";
                WHEN "10011" => excRZero_uid91_fpSubTest_q <= "1";
                WHEN "10100" => excRZero_uid91_fpSubTest_q <= "1";
                WHEN "10101" => excRZero_uid91_fpSubTest_q <= "0";
                WHEN "10110" => excRZero_uid91_fpSubTest_q <= "0";
                WHEN "10111" => excRZero_uid91_fpSubTest_q <= "0";
                WHEN "11000" => excRZero_uid91_fpSubTest_q <= "0";
                WHEN "11001" => excRZero_uid91_fpSubTest_q <= "0";
                WHEN "11010" => excRZero_uid91_fpSubTest_q <= "0";
                WHEN "11011" => excRZero_uid91_fpSubTest_q <= "1";
                WHEN "11100" => excRZero_uid91_fpSubTest_q <= "1";
                WHEN "11101" => excRZero_uid91_fpSubTest_q <= "0";
                WHEN "11110" => excRZero_uid91_fpSubTest_q <= "0";
                WHEN "11111" => excRZero_uid91_fpSubTest_q <= "0";
                WHEN OTHERS => -- unreachable
                               excRZero_uid91_fpSubTest_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- concExc_uid98_fpSubTest(BITJOIN,97)@9
    concExc_uid98_fpSubTest_q <= excRNaN_uid97_fpSubTest_q & excRInf_uid94_fpSubTest_q & excRZero_uid91_fpSubTest_q;

    -- excREnc_uid99_fpSubTest(LOOKUP,98)@9 + 1
    excREnc_uid99_fpSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excREnc_uid99_fpSubTest_q <= "01";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (concExc_uid98_fpSubTest_q) IS
                WHEN "000" => excREnc_uid99_fpSubTest_q <= "01";
                WHEN "001" => excREnc_uid99_fpSubTest_q <= "00";
                WHEN "010" => excREnc_uid99_fpSubTest_q <= "10";
                WHEN "011" => excREnc_uid99_fpSubTest_q <= "10";
                WHEN "100" => excREnc_uid99_fpSubTest_q <= "11";
                WHEN "101" => excREnc_uid99_fpSubTest_q <= "11";
                WHEN "110" => excREnc_uid99_fpSubTest_q <= "11";
                WHEN "111" => excREnc_uid99_fpSubTest_q <= "11";
                WHEN OTHERS => -- unreachable
                               excREnc_uid99_fpSubTest_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- expRPostExc_uid118_fpSubTest(MUX,117)@10
    expRPostExc_uid118_fpSubTest_s <= excREnc_uid99_fpSubTest_q;
    expRPostExc_uid118_fpSubTest_combproc: PROCESS (expRPostExc_uid118_fpSubTest_s, cstAllZWE_uid21_fpSubTest_q, redist9_expRPreExc_uid88_fpSubTest_b_2_q, cstAllOWE_uid19_fpSubTest_q)
    BEGIN
        CASE (expRPostExc_uid118_fpSubTest_s) IS
            WHEN "00" => expRPostExc_uid118_fpSubTest_q <= cstAllZWE_uid21_fpSubTest_q;
            WHEN "01" => expRPostExc_uid118_fpSubTest_q <= redist9_expRPreExc_uid88_fpSubTest_b_2_q;
            WHEN "10" => expRPostExc_uid118_fpSubTest_q <= cstAllOWE_uid19_fpSubTest_q;
            WHEN "11" => expRPostExc_uid118_fpSubTest_q <= cstAllOWE_uid19_fpSubTest_q;
            WHEN OTHERS => expRPostExc_uid118_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid111_fpSubTest(CONSTANT,110)
    oneFracRPostExc2_uid111_fpSubTest_q <= "00000000000000000000001";

    -- fracRPreExc_uid87_fpSubTest(BITSELECT,86)@8
    fracRPreExc_uid87_fpSubTest_in <= expFracR_uid82_fpSubTest_q(23 downto 0);
    fracRPreExc_uid87_fpSubTest_b <= fracRPreExc_uid87_fpSubTest_in(23 downto 1);

    -- redist10_fracRPreExc_uid87_fpSubTest_b_2(DELAY,253)
    redist10_fracRPreExc_uid87_fpSubTest_b_2 : dspba_delay
    GENERIC MAP ( width => 23, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPreExc_uid87_fpSubTest_b, xout => redist10_fracRPreExc_uid87_fpSubTest_b_2_q, clk => clk, aclr => areset );

    -- fracRPostExc_uid114_fpSubTest(MUX,113)@10
    fracRPostExc_uid114_fpSubTest_s <= excREnc_uid99_fpSubTest_q;
    fracRPostExc_uid114_fpSubTest_combproc: PROCESS (fracRPostExc_uid114_fpSubTest_s, cstZeroWF_uid20_fpSubTest_q, redist10_fracRPreExc_uid87_fpSubTest_b_2_q, oneFracRPostExc2_uid111_fpSubTest_q)
    BEGIN
        CASE (fracRPostExc_uid114_fpSubTest_s) IS
            WHEN "00" => fracRPostExc_uid114_fpSubTest_q <= cstZeroWF_uid20_fpSubTest_q;
            WHEN "01" => fracRPostExc_uid114_fpSubTest_q <= redist10_fracRPreExc_uid87_fpSubTest_b_2_q;
            WHEN "10" => fracRPostExc_uid114_fpSubTest_q <= cstZeroWF_uid20_fpSubTest_q;
            WHEN "11" => fracRPostExc_uid114_fpSubTest_q <= oneFracRPostExc2_uid111_fpSubTest_q;
            WHEN OTHERS => fracRPostExc_uid114_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid119_fpSubTest(BITJOIN,118)@10
    R_uid119_fpSubTest_q <= signRPostExc_uid110_fpSubTest_q & expRPostExc_uid118_fpSubTest_q & fracRPostExc_uid114_fpSubTest_q;

    -- xOut(GPOUT,4)@10
    q <= R_uid119_fpSubTest_q;

END normal;
