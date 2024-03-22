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

-- VHDL created from DIV_0002
-- VHDL created on Wed Mar 06 09:08:38 2024


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

entity DIV_0002 is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        b : in std_logic_vector(31 downto 0);  -- float32_m23
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end DIV_0002;

architecture normal of DIV_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstBiasM1_uid6_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstBias_uid7_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal expX_uid9_fpDivTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fracX_uid10_fpDivTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal signX_uid11_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expY_uid12_fpDivTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fracY_uid13_fpDivTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal signY_uid14_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal paddingY_uid15_fpDivTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal updatedY_uid16_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal fracYZero_uid15_fpDivTest_a : STD_LOGIC_VECTOR (23 downto 0);
    signal fracYZero_uid15_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid18_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstAllZWE_uid20_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal excZ_x_uid23_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid24_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid25_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid25_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid26_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid27_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid28_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid29_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid30_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid31_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid37_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid38_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid39_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid39_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid40_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_y_uid41_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid42_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid43_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid44_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid45_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid46_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid46_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXmY_uid47_fpDivTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expXmY_uid47_fpDivTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expXmY_uid47_fpDivTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expXmY_uid47_fpDivTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expR_uid48_fpDivTest_a : STD_LOGIC_VECTOR (10 downto 0);
    signal expR_uid48_fpDivTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expR_uid48_fpDivTest_o : STD_LOGIC_VECTOR (10 downto 0);
    signal expR_uid48_fpDivTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal yAddr_uid51_fpDivTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal yPE_uid52_fpDivTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal invY_uid54_fpDivTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal invY_uid54_fpDivTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal invYO_uid55_fpDivTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal invYO_uid55_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal lOAdded_uid57_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal z4_uid60_fpDivTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal oFracXZ4_uid61_fpDivTest_q : STD_LOGIC_VECTOR (28 downto 0);
    signal divValPreNormYPow2Exc_uid63_fpDivTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal divValPreNormYPow2Exc_uid63_fpDivTest_q : STD_LOGIC_VECTOR (28 downto 0);
    signal norm_uid64_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal divValPreNormHigh_uid65_fpDivTest_in : STD_LOGIC_VECTOR (27 downto 0);
    signal divValPreNormHigh_uid65_fpDivTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal divValPreNormLow_uid66_fpDivTest_in : STD_LOGIC_VECTOR (26 downto 0);
    signal divValPreNormLow_uid66_fpDivTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal normFracRnd_uid67_fpDivTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal normFracRnd_uid67_fpDivTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal expFracRnd_uid68_fpDivTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal zeroPaddingInAddition_uid74_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal expFracPostRnd_uid75_fpDivTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal expFracPostRnd_uid76_fpDivTest_a : STD_LOGIC_VECTOR (36 downto 0);
    signal expFracPostRnd_uid76_fpDivTest_b : STD_LOGIC_VECTOR (36 downto 0);
    signal expFracPostRnd_uid76_fpDivTest_o : STD_LOGIC_VECTOR (36 downto 0);
    signal expFracPostRnd_uid76_fpDivTest_q : STD_LOGIC_VECTOR (35 downto 0);
    signal fracXExt_uid77_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal fracPostRndF_uid79_fpDivTest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal fracPostRndF_uid79_fpDivTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracPostRndF_uid80_fpDivTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostRndF_uid80_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal expPostRndFR_uid81_fpDivTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal expPostRndFR_uid81_fpDivTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expPostRndF_uid82_fpDivTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expPostRndF_uid82_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal lOAdded_uid84_fpDivTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal lOAdded_uid87_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal qDivProdNorm_uid90_fpDivTest_in : STD_LOGIC_VECTOR (48 downto 0);
    signal qDivProdNorm_uid90_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal qDivProdFracHigh_uid91_fpDivTest_in : STD_LOGIC_VECTOR (47 downto 0);
    signal qDivProdFracHigh_uid91_fpDivTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal qDivProdFracLow_uid92_fpDivTest_in : STD_LOGIC_VECTOR (46 downto 0);
    signal qDivProdFracLow_uid92_fpDivTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal qDivProdFrac_uid93_fpDivTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal qDivProdFrac_uid93_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal qDivProdExp_opA_uid94_fpDivTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal qDivProdExp_opA_uid94_fpDivTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal qDivProdExp_opA_uid94_fpDivTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal qDivProdExp_opA_uid94_fpDivTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal qDivProdExp_opBs_uid95_fpDivTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal qDivProdExp_opBs_uid95_fpDivTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal qDivProdExp_opBs_uid95_fpDivTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal qDivProdExp_opBs_uid95_fpDivTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal qDivProdExp_uid96_fpDivTest_a : STD_LOGIC_VECTOR (11 downto 0);
    signal qDivProdExp_uid96_fpDivTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal qDivProdExp_uid96_fpDivTest_o : STD_LOGIC_VECTOR (11 downto 0);
    signal qDivProdExp_uid96_fpDivTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal qDivProdFracWF_uid97_fpDivTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal qDivProdLTX_opA_uid98_fpDivTest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal qDivProdLTX_opA_uid98_fpDivTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal qDivProdLTX_opA_uid99_fpDivTest_q : STD_LOGIC_VECTOR (30 downto 0);
    signal qDivProdLTX_opB_uid100_fpDivTest_q : STD_LOGIC_VECTOR (30 downto 0);
    signal qDividerProdLTX_uid101_fpDivTest_a : STD_LOGIC_VECTOR (32 downto 0);
    signal qDividerProdLTX_uid101_fpDivTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal qDividerProdLTX_uid101_fpDivTest_o : STD_LOGIC_VECTOR (32 downto 0);
    signal qDividerProdLTX_uid101_fpDivTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal betweenFPwF_uid102_fpDivTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal betweenFPwF_uid102_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal extraUlp_uid103_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal extraUlp_uid103_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostRndFT_uid104_fpDivTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPreExcExt_uid105_fpDivTest_a : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExcExt_uid105_fpDivTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExcExt_uid105_fpDivTest_o : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExcExt_uid105_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal fracPostRndFPostUlp_uid106_fpDivTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal fracPostRndFPostUlp_uid106_fpDivTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPreExc_uid107_fpDivTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPreExc_uid107_fpDivTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal ovfIncRnd_uid109_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracPostRndInc_uid110_fpDivTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expFracPostRndInc_uid110_fpDivTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expFracPostRndInc_uid110_fpDivTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expFracPostRndInc_uid110_fpDivTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expFracPostRndR_uid111_fpDivTest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracPostRndR_uid111_fpDivTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expRPreExc_uid112_fpDivTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expRPreExc_uid112_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal expRExt_uid114_fpDivTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expUdf_uid115_fpDivTest_a : STD_LOGIC_VECTOR (12 downto 0);
    signal expUdf_uid115_fpDivTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal expUdf_uid115_fpDivTest_o : STD_LOGIC_VECTOR (12 downto 0);
    signal expUdf_uid115_fpDivTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid118_fpDivTest_a : STD_LOGIC_VECTOR (12 downto 0);
    signal expOvf_uid118_fpDivTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal expOvf_uid118_fpDivTest_o : STD_LOGIC_VECTOR (12 downto 0);
    signal expOvf_uid118_fpDivTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal zeroOverReg_uid119_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal zeroOverReg_uid119_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal regOverRegWithUf_uid120_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal regOverRegWithUf_uid120_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xRegOrZero_uid121_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal regOrZeroOverInf_uid122_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal regOrZeroOverInf_uid122_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid123_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRYZ_uid124_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRYROvf_uid125_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYZ_uid126_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYR_uid127_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid128_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid128_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZYZ_uid129_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYI_uid130_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid131_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid131_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid132_fpDivTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid133_fpDivTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal oneFracRPostExc2_uid134_fpDivTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPostExc_uid137_fpDivTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid137_fpDivTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid141_fpDivTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid141_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal invExcRNaN_uid142_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sRPostExc_uid143_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal sRPostExc_uid143_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal divR_uid144_fpDivTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal os_uid148_invTables_q : STD_LOGIC_VECTOR (31 downto 0);
    signal os_uid152_invTables_q : STD_LOGIC_VECTOR (21 downto 0);
    signal yT1_uid160_invPolyEval_b : STD_LOGIC_VECTOR (12 downto 0);
    signal rndBit_uid162_invPolyEval_q : STD_LOGIC_VECTOR (1 downto 0);
    signal cIncludingRoundingBit_uid163_invPolyEval_q : STD_LOGIC_VECTOR (23 downto 0);
    signal ts1_uid165_invPolyEval_a : STD_LOGIC_VECTOR (24 downto 0);
    signal ts1_uid165_invPolyEval_b : STD_LOGIC_VECTOR (24 downto 0);
    signal ts1_uid165_invPolyEval_o : STD_LOGIC_VECTOR (24 downto 0);
    signal ts1_uid165_invPolyEval_q : STD_LOGIC_VECTOR (24 downto 0);
    signal s1_uid166_invPolyEval_b : STD_LOGIC_VECTOR (23 downto 0);
    signal rndBit_uid169_invPolyEval_q : STD_LOGIC_VECTOR (2 downto 0);
    signal cIncludingRoundingBit_uid170_invPolyEval_q : STD_LOGIC_VECTOR (34 downto 0);
    signal ts2_uid172_invPolyEval_a : STD_LOGIC_VECTOR (35 downto 0);
    signal ts2_uid172_invPolyEval_b : STD_LOGIC_VECTOR (35 downto 0);
    signal ts2_uid172_invPolyEval_o : STD_LOGIC_VECTOR (35 downto 0);
    signal ts2_uid172_invPolyEval_q : STD_LOGIC_VECTOR (35 downto 0);
    signal s2_uid173_invPolyEval_b : STD_LOGIC_VECTOR (34 downto 0);
    signal topRangeX_uid183_divValPreNorm_uid59_fpDivTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal topRangeY_uid184_divValPreNorm_uid59_fpDivTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal aboveLeftX_uid189_divValPreNorm_uid59_fpDivTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal aboveLeftY_bottomExtension_uid190_divValPreNorm_uid59_fpDivTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal aboveLeftY_bottomRange_uid191_divValPreNorm_uid59_fpDivTest_in : STD_LOGIC_VECTOR (5 downto 0);
    signal aboveLeftY_bottomRange_uid191_divValPreNorm_uid59_fpDivTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal aboveLeftY_mergedSignalTM_uid192_divValPreNorm_uid59_fpDivTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal rightBottomX_uid194_divValPreNorm_uid59_fpDivTest_in : STD_LOGIC_VECTOR (8 downto 0);
    signal rightBottomX_uid194_divValPreNorm_uid59_fpDivTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal rightBottomY_uid195_divValPreNorm_uid59_fpDivTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal rightBottomX_uid199_divValPreNorm_uid59_fpDivTest_in : STD_LOGIC_VECTOR (17 downto 0);
    signal rightBottomX_uid199_divValPreNorm_uid59_fpDivTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal rightBottomY_uid200_divValPreNorm_uid59_fpDivTest_in : STD_LOGIC_VECTOR (5 downto 0);
    signal rightBottomY_uid200_divValPreNorm_uid59_fpDivTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal aboveLeftX_uid201_divValPreNorm_uid59_fpDivTest_in : STD_LOGIC_VECTOR (8 downto 0);
    signal aboveLeftX_uid201_divValPreNorm_uid59_fpDivTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal aboveLeftY_uid202_divValPreNorm_uid59_fpDivTest_in : STD_LOGIC_VECTOR (14 downto 0);
    signal aboveLeftY_uid202_divValPreNorm_uid59_fpDivTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal n1_uid208_divValPreNorm_uid59_fpDivTest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n0_uid209_divValPreNorm_uid59_fpDivTest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n1_uid210_divValPreNorm_uid59_fpDivTest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n0_uid211_divValPreNorm_uid59_fpDivTest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal sm0_uid222_divValPreNorm_uid59_fpDivTest_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal sm0_uid222_divValPreNorm_uid59_fpDivTest_b0 : STD_LOGIC_VECTOR (17 downto 0);
    signal sm0_uid222_divValPreNorm_uid59_fpDivTest_s1 : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid222_divValPreNorm_uid59_fpDivTest_reset : std_logic;
    signal sm0_uid222_divValPreNorm_uid59_fpDivTest_q : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid223_divValPreNorm_uid59_fpDivTest_a0 : STD_LOGIC_VECTOR (8 downto 0);
    signal sm0_uid223_divValPreNorm_uid59_fpDivTest_b0 : STD_LOGIC_VECTOR (8 downto 0);
    signal sm0_uid223_divValPreNorm_uid59_fpDivTest_s1 : STD_LOGIC_VECTOR (17 downto 0);
    signal sm0_uid223_divValPreNorm_uid59_fpDivTest_reset : std_logic;
    signal sm0_uid223_divValPreNorm_uid59_fpDivTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal sm1_uid224_divValPreNorm_uid59_fpDivTest_a0 : STD_LOGIC_VECTOR (8 downto 0);
    signal sm1_uid224_divValPreNorm_uid59_fpDivTest_b0 : STD_LOGIC_VECTOR (8 downto 0);
    signal sm1_uid224_divValPreNorm_uid59_fpDivTest_s1 : STD_LOGIC_VECTOR (17 downto 0);
    signal sm1_uid224_divValPreNorm_uid59_fpDivTest_reset : std_logic;
    signal sm1_uid224_divValPreNorm_uid59_fpDivTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal sm0_uid225_divValPreNorm_uid59_fpDivTest_a0 : STD_LOGIC_VECTOR (3 downto 0);
    signal sm0_uid225_divValPreNorm_uid59_fpDivTest_b0 : STD_LOGIC_VECTOR (3 downto 0);
    signal sm0_uid225_divValPreNorm_uid59_fpDivTest_s1 : STD_LOGIC_VECTOR (7 downto 0);
    signal sm0_uid225_divValPreNorm_uid59_fpDivTest_reset : std_logic;
    signal sm0_uid225_divValPreNorm_uid59_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal sm1_uid226_divValPreNorm_uid59_fpDivTest_a0 : STD_LOGIC_VECTOR (3 downto 0);
    signal sm1_uid226_divValPreNorm_uid59_fpDivTest_b0 : STD_LOGIC_VECTOR (3 downto 0);
    signal sm1_uid226_divValPreNorm_uid59_fpDivTest_s1 : STD_LOGIC_VECTOR (7 downto 0);
    signal sm1_uid226_divValPreNorm_uid59_fpDivTest_reset : std_logic;
    signal sm1_uid226_divValPreNorm_uid59_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal lev1_a0_uid227_divValPreNorm_uid59_fpDivTest_a : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0_uid227_divValPreNorm_uid59_fpDivTest_b : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0_uid227_divValPreNorm_uid59_fpDivTest_o : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0_uid227_divValPreNorm_uid59_fpDivTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a1high_uid230_divValPreNorm_uid59_fpDivTest_a : STD_LOGIC_VECTOR (17 downto 0);
    signal lev1_a1high_uid230_divValPreNorm_uid59_fpDivTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal lev1_a1high_uid230_divValPreNorm_uid59_fpDivTest_o : STD_LOGIC_VECTOR (17 downto 0);
    signal lev1_a1high_uid230_divValPreNorm_uid59_fpDivTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal lev1_a1_uid231_divValPreNorm_uid59_fpDivTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal lev2_a0_uid232_divValPreNorm_uid59_fpDivTest_a : STD_LOGIC_VECTOR (37 downto 0);
    signal lev2_a0_uid232_divValPreNorm_uid59_fpDivTest_b : STD_LOGIC_VECTOR (37 downto 0);
    signal lev2_a0_uid232_divValPreNorm_uid59_fpDivTest_o : STD_LOGIC_VECTOR (37 downto 0);
    signal lev2_a0_uid232_divValPreNorm_uid59_fpDivTest_q : STD_LOGIC_VECTOR (37 downto 0);
    signal lev3_a0high_uid235_divValPreNorm_uid59_fpDivTest_a : STD_LOGIC_VECTOR (37 downto 0);
    signal lev3_a0high_uid235_divValPreNorm_uid59_fpDivTest_b : STD_LOGIC_VECTOR (37 downto 0);
    signal lev3_a0high_uid235_divValPreNorm_uid59_fpDivTest_o : STD_LOGIC_VECTOR (37 downto 0);
    signal lev3_a0high_uid235_divValPreNorm_uid59_fpDivTest_q : STD_LOGIC_VECTOR (37 downto 0);
    signal lev3_a0_uid236_divValPreNorm_uid59_fpDivTest_q : STD_LOGIC_VECTOR (38 downto 0);
    signal osig_uid237_divValPreNorm_uid59_fpDivTest_in : STD_LOGIC_VECTOR (35 downto 0);
    signal osig_uid237_divValPreNorm_uid59_fpDivTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal nx_mergedSignalTM_uid241_pT1_uid161_invPolyEval_q : STD_LOGIC_VECTOR (13 downto 0);
    signal topRangeX_mergedSignalTM_uid253_pT1_uid161_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal topRangeY_bottomExtension_uid255_pT1_uid161_invPolyEval_q : STD_LOGIC_VECTOR (3 downto 0);
    signal topRangeY_mergedSignalTM_uid257_pT1_uid161_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid259_pT1_uid161_invPolyEval_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid259_pT1_uid161_invPolyEval_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid259_pT1_uid161_invPolyEval_s1 : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid259_pT1_uid161_invPolyEval_reset : std_logic;
    signal sm0_uid259_pT1_uid161_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal osig_uid260_pT1_uid161_invPolyEval_in : STD_LOGIC_VECTOR (32 downto 0);
    signal osig_uid260_pT1_uid161_invPolyEval_b : STD_LOGIC_VECTOR (14 downto 0);
    signal nx_mergedSignalTM_uid264_pT2_uid168_invPolyEval_q : STD_LOGIC_VECTOR (14 downto 0);
    signal topRangeX_bottomExtension_uid274_pT2_uid168_invPolyEval_q : STD_LOGIC_VECTOR (1 downto 0);
    signal topRangeX_mergedSignalTM_uid276_pT2_uid168_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal topRangeY_uid278_pT2_uid168_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal aboveLeftX_uid284_pT2_uid168_invPolyEval_b : STD_LOGIC_VECTOR (7 downto 0);
    signal aboveLeftY_bottomRange_uid286_pT2_uid168_invPolyEval_in : STD_LOGIC_VECTOR (6 downto 0);
    signal aboveLeftY_bottomRange_uid286_pT2_uid168_invPolyEval_b : STD_LOGIC_VECTOR (6 downto 0);
    signal aboveLeftY_mergedSignalTM_uid287_pT2_uid168_invPolyEval_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rightBottomX_uid295_pT2_uid168_invPolyEval_in : STD_LOGIC_VECTOR (6 downto 0);
    signal rightBottomX_uid295_pT2_uid168_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal rightBottomY_uid296_pT2_uid168_invPolyEval_in : STD_LOGIC_VECTOR (6 downto 0);
    signal rightBottomY_uid296_pT2_uid168_invPolyEval_b : STD_LOGIC_VECTOR (4 downto 0);
    signal n1_uid305_pT2_uid168_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal n0_uid306_pT2_uid168_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal sm0_uid319_pT2_uid168_invPolyEval_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid319_pT2_uid168_invPolyEval_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid319_pT2_uid168_invPolyEval_s1 : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid319_pT2_uid168_invPolyEval_reset : std_logic;
    signal sm0_uid319_pT2_uid168_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal sm0_uid320_pT2_uid168_invPolyEval_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal sm0_uid320_pT2_uid168_invPolyEval_b0 : STD_LOGIC_VECTOR (8 downto 0);
    signal sm0_uid320_pT2_uid168_invPolyEval_s1 : STD_LOGIC_VECTOR (16 downto 0);
    signal sm0_uid320_pT2_uid168_invPolyEval_reset : std_logic;
    signal sm0_uid320_pT2_uid168_invPolyEval_q : STD_LOGIC_VECTOR (15 downto 0);
    signal sm0_uid321_pT2_uid168_invPolyEval_a0 : STD_LOGIC_VECTOR (3 downto 0);
    signal sm0_uid321_pT2_uid168_invPolyEval_b0 : STD_LOGIC_VECTOR (3 downto 0);
    signal sm0_uid321_pT2_uid168_invPolyEval_s1 : STD_LOGIC_VECTOR (7 downto 0);
    signal sm0_uid321_pT2_uid168_invPolyEval_reset : std_logic;
    signal sm0_uid321_pT2_uid168_invPolyEval_q : STD_LOGIC_VECTOR (7 downto 0);
    signal lowRangeA_uid322_pT2_uid168_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid322_pT2_uid168_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid323_pT2_uid168_invPolyEval_b : STD_LOGIC_VECTOR (32 downto 0);
    signal lev1_a0high_uid324_pT2_uid168_invPolyEval_a : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid324_pT2_uid168_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid324_pT2_uid168_invPolyEval_o : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid324_pT2_uid168_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0_uid325_pT2_uid168_invPolyEval_q : STD_LOGIC_VECTOR (34 downto 0);
    signal lowRangeA_uid326_pT2_uid168_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid326_pT2_uid168_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid327_pT2_uid168_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal lev2_a0high_uid328_pT2_uid168_invPolyEval_a : STD_LOGIC_VECTOR (35 downto 0);
    signal lev2_a0high_uid328_pT2_uid168_invPolyEval_b : STD_LOGIC_VECTOR (35 downto 0);
    signal lev2_a0high_uid328_pT2_uid168_invPolyEval_o : STD_LOGIC_VECTOR (35 downto 0);
    signal lev2_a0high_uid328_pT2_uid168_invPolyEval_q : STD_LOGIC_VECTOR (34 downto 0);
    signal lev2_a0_uid329_pT2_uid168_invPolyEval_q : STD_LOGIC_VECTOR (35 downto 0);
    signal osig_uid330_pT2_uid168_invPolyEval_in : STD_LOGIC_VECTOR (32 downto 0);
    signal osig_uid330_pT2_uid168_invPolyEval_b : STD_LOGIC_VECTOR (25 downto 0);
    signal qDivProd_uid89_fpDivTest_im0_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal qDivProd_uid89_fpDivTest_im0_b0 : STD_LOGIC_VECTOR (17 downto 0);
    signal qDivProd_uid89_fpDivTest_im0_s1 : STD_LOGIC_VECTOR (35 downto 0);
    signal qDivProd_uid89_fpDivTest_im0_reset : std_logic;
    signal qDivProd_uid89_fpDivTest_im0_q : STD_LOGIC_VECTOR (35 downto 0);
    signal qDivProd_uid89_fpDivTest_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal qDivProd_uid89_fpDivTest_im3_b0 : STD_LOGIC_VECTOR (6 downto 0);
    signal qDivProd_uid89_fpDivTest_im3_s1 : STD_LOGIC_VECTOR (24 downto 0);
    signal qDivProd_uid89_fpDivTest_im3_reset : std_logic;
    signal qDivProd_uid89_fpDivTest_im3_q : STD_LOGIC_VECTOR (24 downto 0);
    signal qDivProd_uid89_fpDivTest_im6_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal qDivProd_uid89_fpDivTest_im6_b0 : STD_LOGIC_VECTOR (5 downto 0);
    signal qDivProd_uid89_fpDivTest_im6_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal qDivProd_uid89_fpDivTest_im6_reset : std_logic;
    signal qDivProd_uid89_fpDivTest_im6_q : STD_LOGIC_VECTOR (23 downto 0);
    signal qDivProd_uid89_fpDivTest_im9_a0 : STD_LOGIC_VECTOR (6 downto 0);
    signal qDivProd_uid89_fpDivTest_im9_b0 : STD_LOGIC_VECTOR (5 downto 0);
    signal qDivProd_uid89_fpDivTest_im9_s1 : STD_LOGIC_VECTOR (12 downto 0);
    signal qDivProd_uid89_fpDivTest_im9_reset : std_logic;
    signal qDivProd_uid89_fpDivTest_im9_q : STD_LOGIC_VECTOR (12 downto 0);
    signal qDivProd_uid89_fpDivTest_join_12_q : STD_LOGIC_VECTOR (48 downto 0);
    signal qDivProd_uid89_fpDivTest_align_13_q : STD_LOGIC_VECTOR (42 downto 0);
    signal qDivProd_uid89_fpDivTest_align_13_qint : STD_LOGIC_VECTOR (42 downto 0);
    signal qDivProd_uid89_fpDivTest_align_15_q : STD_LOGIC_VECTOR (41 downto 0);
    signal qDivProd_uid89_fpDivTest_align_15_qint : STD_LOGIC_VECTOR (41 downto 0);
    signal qDivProd_uid89_fpDivTest_result_add_0_0_a : STD_LOGIC_VECTOR (49 downto 0);
    signal qDivProd_uid89_fpDivTest_result_add_0_0_b : STD_LOGIC_VECTOR (49 downto 0);
    signal qDivProd_uid89_fpDivTest_result_add_0_0_o : STD_LOGIC_VECTOR (49 downto 0);
    signal qDivProd_uid89_fpDivTest_result_add_0_0_q : STD_LOGIC_VECTOR (49 downto 0);
    signal qDivProd_uid89_fpDivTest_result_add_1_0_a : STD_LOGIC_VECTOR (50 downto 0);
    signal qDivProd_uid89_fpDivTest_result_add_1_0_b : STD_LOGIC_VECTOR (50 downto 0);
    signal qDivProd_uid89_fpDivTest_result_add_1_0_o : STD_LOGIC_VECTOR (50 downto 0);
    signal qDivProd_uid89_fpDivTest_result_add_1_0_q : STD_LOGIC_VECTOR (50 downto 0);
    signal memoryC0_uid146_invTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid146_invTables_lutmem_ia : STD_LOGIC_VECTOR (17 downto 0);
    signal memoryC0_uid146_invTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid146_invTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid146_invTables_lutmem_ir : STD_LOGIC_VECTOR (17 downto 0);
    signal memoryC0_uid146_invTables_lutmem_r : STD_LOGIC_VECTOR (17 downto 0);
    signal memoryC0_uid147_invTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid147_invTables_lutmem_ia : STD_LOGIC_VECTOR (13 downto 0);
    signal memoryC0_uid147_invTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid147_invTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid147_invTables_lutmem_ir : STD_LOGIC_VECTOR (13 downto 0);
    signal memoryC0_uid147_invTables_lutmem_r : STD_LOGIC_VECTOR (13 downto 0);
    signal memoryC1_uid150_invTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid150_invTables_lutmem_ia : STD_LOGIC_VECTOR (17 downto 0);
    signal memoryC1_uid150_invTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid150_invTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid150_invTables_lutmem_ir : STD_LOGIC_VECTOR (17 downto 0);
    signal memoryC1_uid150_invTables_lutmem_r : STD_LOGIC_VECTOR (17 downto 0);
    signal memoryC1_uid151_invTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid151_invTables_lutmem_ia : STD_LOGIC_VECTOR (3 downto 0);
    signal memoryC1_uid151_invTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid151_invTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid151_invTables_lutmem_ir : STD_LOGIC_VECTOR (3 downto 0);
    signal memoryC1_uid151_invTables_lutmem_r : STD_LOGIC_VECTOR (3 downto 0);
    signal memoryC2_uid154_invTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid154_invTables_lutmem_ia : STD_LOGIC_VECTOR (12 downto 0);
    signal memoryC2_uid154_invTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid154_invTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid154_invTables_lutmem_ir : STD_LOGIC_VECTOR (12 downto 0);
    signal memoryC2_uid154_invTables_lutmem_r : STD_LOGIC_VECTOR (12 downto 0);
    signal qDivProd_uid89_fpDivTest_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal qDivProd_uid89_fpDivTest_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (6 downto 0);
    signal qDivProd_uid89_fpDivTest_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal qDivProd_uid89_fpDivTest_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal lowRangeA_uid228_divValPreNorm_uid59_fpDivTest_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid228_divValPreNorm_uid59_fpDivTest_merged_bit_select_c : STD_LOGIC_VECTOR (16 downto 0);
    signal lowRangeA_uid233_divValPreNorm_uid59_fpDivTest_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid233_divValPreNorm_uid59_fpDivTest_merged_bit_select_c : STD_LOGIC_VECTOR (36 downto 0);
    signal redist0_lowRangeA_uid228_divValPreNorm_uid59_fpDivTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_qDivProd_uid89_fpDivTest_im6_q_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist2_osig_uid330_pT2_uid168_invPolyEval_b_1_q : STD_LOGIC_VECTOR (25 downto 0);
    signal redist3_highABits_uid327_pT2_uid168_invPolyEval_b_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist4_lowRangeA_uid326_pT2_uid168_invPolyEval_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_n0_uid306_pT2_uid168_invPolyEval_b_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist6_n1_uid305_pT2_uid168_invPolyEval_b_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist7_sm1_uid226_divValPreNorm_uid59_fpDivTest_q_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist8_n0_uid211_divValPreNorm_uid59_fpDivTest_b_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist9_s1_uid166_invPolyEval_b_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist10_sRPostExc_uid143_fpDivTest_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_excREnc_uid133_fpDivTest_q_6_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist12_ovfIncRnd_uid109_fpDivTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_fracPostRndFT_uid104_fpDivTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist14_extraUlp_uid103_fpDivTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_qDivProdLTX_opA_uid98_fpDivTest_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist16_qDivProdFracWF_uid97_fpDivTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist17_qDivProdFracLow_uid92_fpDivTest_b_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist18_qDivProdFracHigh_uid91_fpDivTest_b_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist19_qDivProdNorm_uid90_fpDivTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_expPostRndFR_uid81_fpDivTest_b_3_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist21_expPostRndFR_uid81_fpDivTest_b_7_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist22_fracPostRndF_uid80_fpDivTest_q_5_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist23_lOAdded_uid57_fpDivTest_q_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist24_lOAdded_uid57_fpDivTest_q_4_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist25_invYO_uid55_fpDivTest_b_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_invYO_uid55_fpDivTest_b_10_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_invY_uid54_fpDivTest_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist28_yPE_uid52_fpDivTest_b_2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist29_yPE_uid52_fpDivTest_b_5_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist30_yAddr_uid51_fpDivTest_b_2_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist31_yAddr_uid51_fpDivTest_b_7_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist32_signR_uid46_fpDivTest_q_17_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_fracY_uid13_fpDivTest_b_15_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist35_fracY_uid13_fpDivTest_b_16_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist36_expY_uid12_fpDivTest_b_14_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist37_expY_uid12_fpDivTest_b_16_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist38_expY_uid12_fpDivTest_b_19_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist40_fracX_uid10_fpDivTest_b_15_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist41_fracX_uid10_fpDivTest_b_16_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist42_fracX_uid10_fpDivTest_b_21_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist43_expX_uid9_fpDivTest_b_14_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist44_expX_uid9_fpDivTest_b_16_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist45_expX_uid9_fpDivTest_b_19_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist46_expX_uid9_fpDivTest_b_21_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist33_fracY_uid13_fpDivTest_b_14_outputreg_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist33_fracY_uid13_fpDivTest_b_14_mem_reset0 : std_logic;
    signal redist33_fracY_uid13_fpDivTest_b_14_mem_ia : STD_LOGIC_VECTOR (22 downto 0);
    signal redist33_fracY_uid13_fpDivTest_b_14_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist33_fracY_uid13_fpDivTest_b_14_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist33_fracY_uid13_fpDivTest_b_14_mem_iq : STD_LOGIC_VECTOR (22 downto 0);
    signal redist33_fracY_uid13_fpDivTest_b_14_mem_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist33_fracY_uid13_fpDivTest_b_14_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist33_fracY_uid13_fpDivTest_b_14_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve : boolean;
    attribute preserve of redist33_fracY_uid13_fpDivTest_b_14_rdcnt_i : signal is true;
    signal redist33_fracY_uid13_fpDivTest_b_14_rdcnt_eq : std_logic;
    attribute preserve of redist33_fracY_uid13_fpDivTest_b_14_rdcnt_eq : signal is true;
    signal redist33_fracY_uid13_fpDivTest_b_14_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist33_fracY_uid13_fpDivTest_b_14_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist33_fracY_uid13_fpDivTest_b_14_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist33_fracY_uid13_fpDivTest_b_14_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_fracY_uid13_fpDivTest_b_14_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_fracY_uid13_fpDivTest_b_14_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_fracY_uid13_fpDivTest_b_14_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_fracY_uid13_fpDivTest_b_14_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_fracY_uid13_fpDivTest_b_14_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_fracX_uid10_fpDivTest_b_10_outputreg_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist39_fracX_uid10_fpDivTest_b_10_mem_reset0 : std_logic;
    signal redist39_fracX_uid10_fpDivTest_b_10_mem_ia : STD_LOGIC_VECTOR (22 downto 0);
    signal redist39_fracX_uid10_fpDivTest_b_10_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist39_fracX_uid10_fpDivTest_b_10_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist39_fracX_uid10_fpDivTest_b_10_mem_iq : STD_LOGIC_VECTOR (22 downto 0);
    signal redist39_fracX_uid10_fpDivTest_b_10_mem_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist39_fracX_uid10_fpDivTest_b_10_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist39_fracX_uid10_fpDivTest_b_10_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist39_fracX_uid10_fpDivTest_b_10_rdcnt_i : signal is true;
    signal redist39_fracX_uid10_fpDivTest_b_10_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist39_fracX_uid10_fpDivTest_b_10_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist39_fracX_uid10_fpDivTest_b_10_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist39_fracX_uid10_fpDivTest_b_10_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_fracX_uid10_fpDivTest_b_10_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_fracX_uid10_fpDivTest_b_10_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_fracX_uid10_fpDivTest_b_10_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_fracX_uid10_fpDivTest_b_10_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_fracX_uid10_fpDivTest_b_10_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist33_fracY_uid13_fpDivTest_b_14_notEnable(LOGICAL,413)
    redist33_fracY_uid13_fpDivTest_b_14_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist33_fracY_uid13_fpDivTest_b_14_nor(LOGICAL,414)
    redist33_fracY_uid13_fpDivTest_b_14_nor_q <= not (redist33_fracY_uid13_fpDivTest_b_14_notEnable_q or redist33_fracY_uid13_fpDivTest_b_14_sticky_ena_q);

    -- redist33_fracY_uid13_fpDivTest_b_14_mem_last(CONSTANT,410)
    redist33_fracY_uid13_fpDivTest_b_14_mem_last_q <= "01010";

    -- redist33_fracY_uid13_fpDivTest_b_14_cmp(LOGICAL,411)
    redist33_fracY_uid13_fpDivTest_b_14_cmp_b <= STD_LOGIC_VECTOR("0" & redist33_fracY_uid13_fpDivTest_b_14_rdcnt_q);
    redist33_fracY_uid13_fpDivTest_b_14_cmp_q <= "1" WHEN redist33_fracY_uid13_fpDivTest_b_14_mem_last_q = redist33_fracY_uid13_fpDivTest_b_14_cmp_b ELSE "0";

    -- redist33_fracY_uid13_fpDivTest_b_14_cmpReg(REG,412)
    redist33_fracY_uid13_fpDivTest_b_14_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist33_fracY_uid13_fpDivTest_b_14_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist33_fracY_uid13_fpDivTest_b_14_cmpReg_q <= STD_LOGIC_VECTOR(redist33_fracY_uid13_fpDivTest_b_14_cmp_q);
        END IF;
    END PROCESS;

    -- redist33_fracY_uid13_fpDivTest_b_14_sticky_ena(REG,415)
    redist33_fracY_uid13_fpDivTest_b_14_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist33_fracY_uid13_fpDivTest_b_14_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist33_fracY_uid13_fpDivTest_b_14_nor_q = "1") THEN
                redist33_fracY_uid13_fpDivTest_b_14_sticky_ena_q <= STD_LOGIC_VECTOR(redist33_fracY_uid13_fpDivTest_b_14_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist33_fracY_uid13_fpDivTest_b_14_enaAnd(LOGICAL,416)
    redist33_fracY_uid13_fpDivTest_b_14_enaAnd_q <= redist33_fracY_uid13_fpDivTest_b_14_sticky_ena_q and VCC_q;

    -- redist33_fracY_uid13_fpDivTest_b_14_rdcnt(COUNTER,408)
    -- low=0, high=11, step=1, init=0
    redist33_fracY_uid13_fpDivTest_b_14_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist33_fracY_uid13_fpDivTest_b_14_rdcnt_i <= TO_UNSIGNED(0, 4);
            redist33_fracY_uid13_fpDivTest_b_14_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist33_fracY_uid13_fpDivTest_b_14_rdcnt_i = TO_UNSIGNED(10, 4)) THEN
                redist33_fracY_uid13_fpDivTest_b_14_rdcnt_eq <= '1';
            ELSE
                redist33_fracY_uid13_fpDivTest_b_14_rdcnt_eq <= '0';
            END IF;
            IF (redist33_fracY_uid13_fpDivTest_b_14_rdcnt_eq = '1') THEN
                redist33_fracY_uid13_fpDivTest_b_14_rdcnt_i <= redist33_fracY_uid13_fpDivTest_b_14_rdcnt_i + 5;
            ELSE
                redist33_fracY_uid13_fpDivTest_b_14_rdcnt_i <= redist33_fracY_uid13_fpDivTest_b_14_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist33_fracY_uid13_fpDivTest_b_14_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist33_fracY_uid13_fpDivTest_b_14_rdcnt_i, 4)));

    -- fracY_uid13_fpDivTest(BITSELECT,12)@0
    fracY_uid13_fpDivTest_b <= b(22 downto 0);

    -- redist33_fracY_uid13_fpDivTest_b_14_wraddr(REG,409)
    redist33_fracY_uid13_fpDivTest_b_14_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist33_fracY_uid13_fpDivTest_b_14_wraddr_q <= "1011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist33_fracY_uid13_fpDivTest_b_14_wraddr_q <= STD_LOGIC_VECTOR(redist33_fracY_uid13_fpDivTest_b_14_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist33_fracY_uid13_fpDivTest_b_14_mem(DUALMEM,407)
    redist33_fracY_uid13_fpDivTest_b_14_mem_ia <= STD_LOGIC_VECTOR(fracY_uid13_fpDivTest_b);
    redist33_fracY_uid13_fpDivTest_b_14_mem_aa <= redist33_fracY_uid13_fpDivTest_b_14_wraddr_q;
    redist33_fracY_uid13_fpDivTest_b_14_mem_ab <= redist33_fracY_uid13_fpDivTest_b_14_rdcnt_q;
    redist33_fracY_uid13_fpDivTest_b_14_mem_reset0 <= areset;
    redist33_fracY_uid13_fpDivTest_b_14_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 4,
        numwords_a => 12,
        width_b => 23,
        widthad_b => 4,
        numwords_b => 12,
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
        clocken1 => redist33_fracY_uid13_fpDivTest_b_14_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist33_fracY_uid13_fpDivTest_b_14_mem_reset0,
        clock1 => clk,
        address_a => redist33_fracY_uid13_fpDivTest_b_14_mem_aa,
        data_a => redist33_fracY_uid13_fpDivTest_b_14_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist33_fracY_uid13_fpDivTest_b_14_mem_ab,
        q_b => redist33_fracY_uid13_fpDivTest_b_14_mem_iq
    );
    redist33_fracY_uid13_fpDivTest_b_14_mem_q <= redist33_fracY_uid13_fpDivTest_b_14_mem_iq(22 downto 0);

    -- redist33_fracY_uid13_fpDivTest_b_14_outputreg(DELAY,406)
    redist33_fracY_uid13_fpDivTest_b_14_outputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist33_fracY_uid13_fpDivTest_b_14_mem_q, xout => redist33_fracY_uid13_fpDivTest_b_14_outputreg_q, clk => clk, aclr => areset );

    -- redist34_fracY_uid13_fpDivTest_b_15(DELAY,393)
    redist34_fracY_uid13_fpDivTest_b_15 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist33_fracY_uid13_fpDivTest_b_14_outputreg_q, xout => redist34_fracY_uid13_fpDivTest_b_15_q, clk => clk, aclr => areset );

    -- paddingY_uid15_fpDivTest(CONSTANT,14)
    paddingY_uid15_fpDivTest_q <= "00000000000000000000000";

    -- fracXIsZero_uid39_fpDivTest(LOGICAL,38)@15 + 1
    fracXIsZero_uid39_fpDivTest_qi <= "1" WHEN paddingY_uid15_fpDivTest_q = redist34_fracY_uid13_fpDivTest_b_15_q ELSE "0";
    fracXIsZero_uid39_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid39_fpDivTest_qi, xout => fracXIsZero_uid39_fpDivTest_q, clk => clk, aclr => areset );

    -- cstAllOWE_uid18_fpDivTest(CONSTANT,17)
    cstAllOWE_uid18_fpDivTest_q <= "11111111";

    -- expY_uid12_fpDivTest(BITSELECT,11)@0
    expY_uid12_fpDivTest_b <= b(30 downto 23);

    -- redist36_expY_uid12_fpDivTest_b_14(DELAY,395)
    redist36_expY_uid12_fpDivTest_b_14 : dspba_delay
    GENERIC MAP ( width => 8, depth => 14, reset_kind => "ASYNC" )
    PORT MAP ( xin => expY_uid12_fpDivTest_b, xout => redist36_expY_uid12_fpDivTest_b_14_q, clk => clk, aclr => areset );

    -- redist37_expY_uid12_fpDivTest_b_16(DELAY,396)
    redist37_expY_uid12_fpDivTest_b_16 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist36_expY_uid12_fpDivTest_b_14_q, xout => redist37_expY_uid12_fpDivTest_b_16_q, clk => clk, aclr => areset );

    -- expXIsMax_uid38_fpDivTest(LOGICAL,37)@16
    expXIsMax_uid38_fpDivTest_q <= "1" WHEN redist37_expY_uid12_fpDivTest_b_16_q = cstAllOWE_uid18_fpDivTest_q ELSE "0";

    -- excI_y_uid41_fpDivTest(LOGICAL,40)@16
    excI_y_uid41_fpDivTest_q <= expXIsMax_uid38_fpDivTest_q and fracXIsZero_uid39_fpDivTest_q;

    -- redist39_fracX_uid10_fpDivTest_b_10_notEnable(LOGICAL,424)
    redist39_fracX_uid10_fpDivTest_b_10_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist39_fracX_uid10_fpDivTest_b_10_nor(LOGICAL,425)
    redist39_fracX_uid10_fpDivTest_b_10_nor_q <= not (redist39_fracX_uid10_fpDivTest_b_10_notEnable_q or redist39_fracX_uid10_fpDivTest_b_10_sticky_ena_q);

    -- redist39_fracX_uid10_fpDivTest_b_10_mem_last(CONSTANT,421)
    redist39_fracX_uid10_fpDivTest_b_10_mem_last_q <= "0110";

    -- redist39_fracX_uid10_fpDivTest_b_10_cmp(LOGICAL,422)
    redist39_fracX_uid10_fpDivTest_b_10_cmp_b <= STD_LOGIC_VECTOR("0" & redist39_fracX_uid10_fpDivTest_b_10_rdcnt_q);
    redist39_fracX_uid10_fpDivTest_b_10_cmp_q <= "1" WHEN redist39_fracX_uid10_fpDivTest_b_10_mem_last_q = redist39_fracX_uid10_fpDivTest_b_10_cmp_b ELSE "0";

    -- redist39_fracX_uid10_fpDivTest_b_10_cmpReg(REG,423)
    redist39_fracX_uid10_fpDivTest_b_10_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist39_fracX_uid10_fpDivTest_b_10_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist39_fracX_uid10_fpDivTest_b_10_cmpReg_q <= STD_LOGIC_VECTOR(redist39_fracX_uid10_fpDivTest_b_10_cmp_q);
        END IF;
    END PROCESS;

    -- redist39_fracX_uid10_fpDivTest_b_10_sticky_ena(REG,426)
    redist39_fracX_uid10_fpDivTest_b_10_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist39_fracX_uid10_fpDivTest_b_10_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist39_fracX_uid10_fpDivTest_b_10_nor_q = "1") THEN
                redist39_fracX_uid10_fpDivTest_b_10_sticky_ena_q <= STD_LOGIC_VECTOR(redist39_fracX_uid10_fpDivTest_b_10_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist39_fracX_uid10_fpDivTest_b_10_enaAnd(LOGICAL,427)
    redist39_fracX_uid10_fpDivTest_b_10_enaAnd_q <= redist39_fracX_uid10_fpDivTest_b_10_sticky_ena_q and VCC_q;

    -- redist39_fracX_uid10_fpDivTest_b_10_rdcnt(COUNTER,419)
    -- low=0, high=7, step=1, init=0
    redist39_fracX_uid10_fpDivTest_b_10_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist39_fracX_uid10_fpDivTest_b_10_rdcnt_i <= TO_UNSIGNED(0, 3);
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist39_fracX_uid10_fpDivTest_b_10_rdcnt_i <= redist39_fracX_uid10_fpDivTest_b_10_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist39_fracX_uid10_fpDivTest_b_10_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist39_fracX_uid10_fpDivTest_b_10_rdcnt_i, 3)));

    -- fracX_uid10_fpDivTest(BITSELECT,9)@0
    fracX_uid10_fpDivTest_b <= a(22 downto 0);

    -- redist39_fracX_uid10_fpDivTest_b_10_wraddr(REG,420)
    redist39_fracX_uid10_fpDivTest_b_10_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist39_fracX_uid10_fpDivTest_b_10_wraddr_q <= "111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist39_fracX_uid10_fpDivTest_b_10_wraddr_q <= STD_LOGIC_VECTOR(redist39_fracX_uid10_fpDivTest_b_10_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist39_fracX_uid10_fpDivTest_b_10_mem(DUALMEM,418)
    redist39_fracX_uid10_fpDivTest_b_10_mem_ia <= STD_LOGIC_VECTOR(fracX_uid10_fpDivTest_b);
    redist39_fracX_uid10_fpDivTest_b_10_mem_aa <= redist39_fracX_uid10_fpDivTest_b_10_wraddr_q;
    redist39_fracX_uid10_fpDivTest_b_10_mem_ab <= redist39_fracX_uid10_fpDivTest_b_10_rdcnt_q;
    redist39_fracX_uid10_fpDivTest_b_10_mem_reset0 <= areset;
    redist39_fracX_uid10_fpDivTest_b_10_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 3,
        numwords_a => 8,
        width_b => 23,
        widthad_b => 3,
        numwords_b => 8,
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
        clocken1 => redist39_fracX_uid10_fpDivTest_b_10_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist39_fracX_uid10_fpDivTest_b_10_mem_reset0,
        clock1 => clk,
        address_a => redist39_fracX_uid10_fpDivTest_b_10_mem_aa,
        data_a => redist39_fracX_uid10_fpDivTest_b_10_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist39_fracX_uid10_fpDivTest_b_10_mem_ab,
        q_b => redist39_fracX_uid10_fpDivTest_b_10_mem_iq
    );
    redist39_fracX_uid10_fpDivTest_b_10_mem_q <= redist39_fracX_uid10_fpDivTest_b_10_mem_iq(22 downto 0);

    -- redist39_fracX_uid10_fpDivTest_b_10_outputreg(DELAY,417)
    redist39_fracX_uid10_fpDivTest_b_10_outputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist39_fracX_uid10_fpDivTest_b_10_mem_q, xout => redist39_fracX_uid10_fpDivTest_b_10_outputreg_q, clk => clk, aclr => areset );

    -- redist40_fracX_uid10_fpDivTest_b_15(DELAY,399)
    redist40_fracX_uid10_fpDivTest_b_15 : dspba_delay
    GENERIC MAP ( width => 23, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist39_fracX_uid10_fpDivTest_b_10_outputreg_q, xout => redist40_fracX_uid10_fpDivTest_b_15_q, clk => clk, aclr => areset );

    -- fracXIsZero_uid25_fpDivTest(LOGICAL,24)@15 + 1
    fracXIsZero_uid25_fpDivTest_qi <= "1" WHEN paddingY_uid15_fpDivTest_q = redist40_fracX_uid10_fpDivTest_b_15_q ELSE "0";
    fracXIsZero_uid25_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid25_fpDivTest_qi, xout => fracXIsZero_uid25_fpDivTest_q, clk => clk, aclr => areset );

    -- expX_uid9_fpDivTest(BITSELECT,8)@0
    expX_uid9_fpDivTest_b <= a(30 downto 23);

    -- redist43_expX_uid9_fpDivTest_b_14(DELAY,402)
    redist43_expX_uid9_fpDivTest_b_14 : dspba_delay
    GENERIC MAP ( width => 8, depth => 14, reset_kind => "ASYNC" )
    PORT MAP ( xin => expX_uid9_fpDivTest_b, xout => redist43_expX_uid9_fpDivTest_b_14_q, clk => clk, aclr => areset );

    -- redist44_expX_uid9_fpDivTest_b_16(DELAY,403)
    redist44_expX_uid9_fpDivTest_b_16 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist43_expX_uid9_fpDivTest_b_14_q, xout => redist44_expX_uid9_fpDivTest_b_16_q, clk => clk, aclr => areset );

    -- expXIsMax_uid24_fpDivTest(LOGICAL,23)@16
    expXIsMax_uid24_fpDivTest_q <= "1" WHEN redist44_expX_uid9_fpDivTest_b_16_q = cstAllOWE_uid18_fpDivTest_q ELSE "0";

    -- excI_x_uid27_fpDivTest(LOGICAL,26)@16
    excI_x_uid27_fpDivTest_q <= expXIsMax_uid24_fpDivTest_q and fracXIsZero_uid25_fpDivTest_q;

    -- excXIYI_uid130_fpDivTest(LOGICAL,129)@16
    excXIYI_uid130_fpDivTest_q <= excI_x_uid27_fpDivTest_q and excI_y_uid41_fpDivTest_q;

    -- fracXIsNotZero_uid40_fpDivTest(LOGICAL,39)@16
    fracXIsNotZero_uid40_fpDivTest_q <= not (fracXIsZero_uid39_fpDivTest_q);

    -- excN_y_uid42_fpDivTest(LOGICAL,41)@16
    excN_y_uid42_fpDivTest_q <= expXIsMax_uid38_fpDivTest_q and fracXIsNotZero_uid40_fpDivTest_q;

    -- fracXIsNotZero_uid26_fpDivTest(LOGICAL,25)@16
    fracXIsNotZero_uid26_fpDivTest_q <= not (fracXIsZero_uid25_fpDivTest_q);

    -- excN_x_uid28_fpDivTest(LOGICAL,27)@16
    excN_x_uid28_fpDivTest_q <= expXIsMax_uid24_fpDivTest_q and fracXIsNotZero_uid26_fpDivTest_q;

    -- cstAllZWE_uid20_fpDivTest(CONSTANT,19)
    cstAllZWE_uid20_fpDivTest_q <= "00000000";

    -- excZ_y_uid37_fpDivTest(LOGICAL,36)@16
    excZ_y_uid37_fpDivTest_q <= "1" WHEN redist37_expY_uid12_fpDivTest_b_16_q = cstAllZWE_uid20_fpDivTest_q ELSE "0";

    -- excZ_x_uid23_fpDivTest(LOGICAL,22)@16
    excZ_x_uid23_fpDivTest_q <= "1" WHEN redist44_expX_uid9_fpDivTest_b_16_q = cstAllZWE_uid20_fpDivTest_q ELSE "0";

    -- excXZYZ_uid129_fpDivTest(LOGICAL,128)@16
    excXZYZ_uid129_fpDivTest_q <= excZ_x_uid23_fpDivTest_q and excZ_y_uid37_fpDivTest_q;

    -- excRNaN_uid131_fpDivTest(LOGICAL,130)@16 + 1
    excRNaN_uid131_fpDivTest_qi <= excXZYZ_uid129_fpDivTest_q or excN_x_uid28_fpDivTest_q or excN_y_uid42_fpDivTest_q or excXIYI_uid130_fpDivTest_q;
    excRNaN_uid131_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaN_uid131_fpDivTest_qi, xout => excRNaN_uid131_fpDivTest_q, clk => clk, aclr => areset );

    -- invExcRNaN_uid142_fpDivTest(LOGICAL,141)@17
    invExcRNaN_uid142_fpDivTest_q <= not (excRNaN_uid131_fpDivTest_q);

    -- signY_uid14_fpDivTest(BITSELECT,13)@0
    signY_uid14_fpDivTest_b <= STD_LOGIC_VECTOR(b(31 downto 31));

    -- signX_uid11_fpDivTest(BITSELECT,10)@0
    signX_uid11_fpDivTest_b <= STD_LOGIC_VECTOR(a(31 downto 31));

    -- signR_uid46_fpDivTest(LOGICAL,45)@0 + 1
    signR_uid46_fpDivTest_qi <= signX_uid11_fpDivTest_b xor signY_uid14_fpDivTest_b;
    signR_uid46_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid46_fpDivTest_qi, xout => signR_uid46_fpDivTest_q, clk => clk, aclr => areset );

    -- redist32_signR_uid46_fpDivTest_q_17(DELAY,391)
    redist32_signR_uid46_fpDivTest_q_17 : dspba_delay
    GENERIC MAP ( width => 1, depth => 16, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid46_fpDivTest_q, xout => redist32_signR_uid46_fpDivTest_q_17_q, clk => clk, aclr => areset );

    -- sRPostExc_uid143_fpDivTest(LOGICAL,142)@17 + 1
    sRPostExc_uid143_fpDivTest_qi <= redist32_signR_uid46_fpDivTest_q_17_q and invExcRNaN_uid142_fpDivTest_q;
    sRPostExc_uid143_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sRPostExc_uid143_fpDivTest_qi, xout => sRPostExc_uid143_fpDivTest_q, clk => clk, aclr => areset );

    -- redist10_sRPostExc_uid143_fpDivTest_q_6(DELAY,369)
    redist10_sRPostExc_uid143_fpDivTest_q_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => sRPostExc_uid143_fpDivTest_q, xout => redist10_sRPostExc_uid143_fpDivTest_q_6_q, clk => clk, aclr => areset );

    -- redist41_fracX_uid10_fpDivTest_b_16(DELAY,400)
    redist41_fracX_uid10_fpDivTest_b_16 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist40_fracX_uid10_fpDivTest_b_15_q, xout => redist41_fracX_uid10_fpDivTest_b_16_q, clk => clk, aclr => areset );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- fracXExt_uid77_fpDivTest(BITJOIN,76)@16
    fracXExt_uid77_fpDivTest_q <= redist41_fracX_uid10_fpDivTest_b_16_q & GND_q;

    -- lOAdded_uid57_fpDivTest(BITJOIN,56)@10
    lOAdded_uid57_fpDivTest_q <= VCC_q & redist39_fracX_uid10_fpDivTest_b_10_outputreg_q;

    -- redist23_lOAdded_uid57_fpDivTest_q_1(DELAY,382)
    redist23_lOAdded_uid57_fpDivTest_q_1 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => lOAdded_uid57_fpDivTest_q, xout => redist23_lOAdded_uid57_fpDivTest_q_1_q, clk => clk, aclr => areset );

    -- redist24_lOAdded_uid57_fpDivTest_q_4(DELAY,383)
    redist24_lOAdded_uid57_fpDivTest_q_4 : dspba_delay
    GENERIC MAP ( width => 24, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist23_lOAdded_uid57_fpDivTest_q_1_q, xout => redist24_lOAdded_uid57_fpDivTest_q_4_q, clk => clk, aclr => areset );

    -- z4_uid60_fpDivTest(CONSTANT,59)
    z4_uid60_fpDivTest_q <= "00000";

    -- oFracXZ4_uid61_fpDivTest(BITJOIN,60)@14
    oFracXZ4_uid61_fpDivTest_q <= redist24_lOAdded_uid57_fpDivTest_q_4_q & z4_uid60_fpDivTest_q;

    -- aboveLeftY_uid202_divValPreNorm_uid59_fpDivTest(BITSELECT,201)@11
    aboveLeftY_uid202_divValPreNorm_uid59_fpDivTest_in <= redist23_lOAdded_uid57_fpDivTest_q_1_q(14 downto 0);
    aboveLeftY_uid202_divValPreNorm_uid59_fpDivTest_b <= aboveLeftY_uid202_divValPreNorm_uid59_fpDivTest_in(14 downto 10);

    -- n1_uid210_divValPreNorm_uid59_fpDivTest(BITSELECT,209)@11
    n1_uid210_divValPreNorm_uid59_fpDivTest_b <= aboveLeftY_uid202_divValPreNorm_uid59_fpDivTest_b(4 downto 1);

    -- yAddr_uid51_fpDivTest(BITSELECT,50)@0
    yAddr_uid51_fpDivTest_b <= fracY_uid13_fpDivTest_b(22 downto 14);

    -- memoryC2_uid154_invTables_lutmem(DUALMEM,354)@0 + 2
    -- in j@20000000
    memoryC2_uid154_invTables_lutmem_aa <= yAddr_uid51_fpDivTest_b;
    memoryC2_uid154_invTables_lutmem_reset0 <= areset;
    memoryC2_uid154_invTables_lutmem_dmem : altsyncram
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
        init_file => "DIV_0002_memoryC2_uid154_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid154_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid154_invTables_lutmem_aa,
        q_a => memoryC2_uid154_invTables_lutmem_ir
    );
    memoryC2_uid154_invTables_lutmem_r <= memoryC2_uid154_invTables_lutmem_ir(12 downto 0);

    -- topRangeY_bottomExtension_uid255_pT1_uid161_invPolyEval(CONSTANT,254)
    topRangeY_bottomExtension_uid255_pT1_uid161_invPolyEval_q <= "0000";

    -- topRangeY_mergedSignalTM_uid257_pT1_uid161_invPolyEval(BITJOIN,256)@2
    topRangeY_mergedSignalTM_uid257_pT1_uid161_invPolyEval_q <= memoryC2_uid154_invTables_lutmem_r & topRangeY_bottomExtension_uid255_pT1_uid161_invPolyEval_q;

    -- yPE_uid52_fpDivTest(BITSELECT,51)@0
    yPE_uid52_fpDivTest_b <= b(13 downto 0);

    -- redist28_yPE_uid52_fpDivTest_b_2(DELAY,387)
    redist28_yPE_uid52_fpDivTest_b_2 : dspba_delay
    GENERIC MAP ( width => 14, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yPE_uid52_fpDivTest_b, xout => redist28_yPE_uid52_fpDivTest_b_2_q, clk => clk, aclr => areset );

    -- yT1_uid160_invPolyEval(BITSELECT,159)@2
    yT1_uid160_invPolyEval_b <= redist28_yPE_uid52_fpDivTest_b_2_q(13 downto 1);

    -- nx_mergedSignalTM_uid241_pT1_uid161_invPolyEval(BITJOIN,240)@2
    nx_mergedSignalTM_uid241_pT1_uid161_invPolyEval_q <= GND_q & yT1_uid160_invPolyEval_b;

    -- aboveLeftY_bottomExtension_uid190_divValPreNorm_uid59_fpDivTest(CONSTANT,189)
    aboveLeftY_bottomExtension_uid190_divValPreNorm_uid59_fpDivTest_q <= "000";

    -- topRangeX_mergedSignalTM_uid253_pT1_uid161_invPolyEval(BITJOIN,252)@2
    topRangeX_mergedSignalTM_uid253_pT1_uid161_invPolyEval_q <= nx_mergedSignalTM_uid241_pT1_uid161_invPolyEval_q & aboveLeftY_bottomExtension_uid190_divValPreNorm_uid59_fpDivTest_q;

    -- sm0_uid259_pT1_uid161_invPolyEval(MULT,258)@2 + 2
    sm0_uid259_pT1_uid161_invPolyEval_a0 <= STD_LOGIC_VECTOR(topRangeX_mergedSignalTM_uid253_pT1_uid161_invPolyEval_q);
    sm0_uid259_pT1_uid161_invPolyEval_b0 <= STD_LOGIC_VECTOR(topRangeY_mergedSignalTM_uid257_pT1_uid161_invPolyEval_q);
    sm0_uid259_pT1_uid161_invPolyEval_reset <= areset;
    sm0_uid259_pT1_uid161_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid259_pT1_uid161_invPolyEval_a0,
        datab => sm0_uid259_pT1_uid161_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid259_pT1_uid161_invPolyEval_reset,
        clock => clk,
        result => sm0_uid259_pT1_uid161_invPolyEval_s1
    );
    sm0_uid259_pT1_uid161_invPolyEval_q <= sm0_uid259_pT1_uid161_invPolyEval_s1;

    -- osig_uid260_pT1_uid161_invPolyEval(BITSELECT,259)@4
    osig_uid260_pT1_uid161_invPolyEval_in <= STD_LOGIC_VECTOR(sm0_uid259_pT1_uid161_invPolyEval_q(32 downto 0));
    osig_uid260_pT1_uid161_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid260_pT1_uid161_invPolyEval_in(32 downto 18));

    -- redist30_yAddr_uid51_fpDivTest_b_2(DELAY,389)
    redist30_yAddr_uid51_fpDivTest_b_2 : dspba_delay
    GENERIC MAP ( width => 9, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid51_fpDivTest_b, xout => redist30_yAddr_uid51_fpDivTest_b_2_q, clk => clk, aclr => areset );

    -- memoryC1_uid151_invTables_lutmem(DUALMEM,353)@2 + 2
    -- in j@20000000
    memoryC1_uid151_invTables_lutmem_aa <= redist30_yAddr_uid51_fpDivTest_b_2_q;
    memoryC1_uid151_invTables_lutmem_reset0 <= areset;
    memoryC1_uid151_invTables_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 4,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "DIV_0002_memoryC1_uid151_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid151_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid151_invTables_lutmem_aa,
        q_a => memoryC1_uid151_invTables_lutmem_ir
    );
    memoryC1_uid151_invTables_lutmem_r <= memoryC1_uid151_invTables_lutmem_ir(3 downto 0);

    -- memoryC1_uid150_invTables_lutmem(DUALMEM,352)@2 + 2
    -- in j@20000000
    memoryC1_uid150_invTables_lutmem_aa <= redist30_yAddr_uid51_fpDivTest_b_2_q;
    memoryC1_uid150_invTables_lutmem_reset0 <= areset;
    memoryC1_uid150_invTables_lutmem_dmem : altsyncram
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
        init_file => "DIV_0002_memoryC1_uid150_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid150_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid150_invTables_lutmem_aa,
        q_a => memoryC1_uid150_invTables_lutmem_ir
    );
    memoryC1_uid150_invTables_lutmem_r <= memoryC1_uid150_invTables_lutmem_ir(17 downto 0);

    -- os_uid152_invTables(BITJOIN,151)@4
    os_uid152_invTables_q <= memoryC1_uid151_invTables_lutmem_r & memoryC1_uid150_invTables_lutmem_r;

    -- rndBit_uid162_invPolyEval(CONSTANT,161)
    rndBit_uid162_invPolyEval_q <= "01";

    -- cIncludingRoundingBit_uid163_invPolyEval(BITJOIN,162)@4
    cIncludingRoundingBit_uid163_invPolyEval_q <= os_uid152_invTables_q & rndBit_uid162_invPolyEval_q;

    -- ts1_uid165_invPolyEval(ADD,164)@4
    ts1_uid165_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => cIncludingRoundingBit_uid163_invPolyEval_q(23)) & cIncludingRoundingBit_uid163_invPolyEval_q));
    ts1_uid165_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 15 => osig_uid260_pT1_uid161_invPolyEval_b(14)) & osig_uid260_pT1_uid161_invPolyEval_b));
    ts1_uid165_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts1_uid165_invPolyEval_a) + SIGNED(ts1_uid165_invPolyEval_b));
    ts1_uid165_invPolyEval_q <= ts1_uid165_invPolyEval_o(24 downto 0);

    -- s1_uid166_invPolyEval(BITSELECT,165)@4
    s1_uid166_invPolyEval_b <= STD_LOGIC_VECTOR(ts1_uid165_invPolyEval_q(24 downto 1));

    -- redist9_s1_uid166_invPolyEval_b_1(DELAY,368)
    redist9_s1_uid166_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => s1_uid166_invPolyEval_b, xout => redist9_s1_uid166_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- rightBottomY_uid296_pT2_uid168_invPolyEval(BITSELECT,295)@5
    rightBottomY_uid296_pT2_uid168_invPolyEval_in <= redist9_s1_uid166_invPolyEval_b_1_q(6 downto 0);
    rightBottomY_uid296_pT2_uid168_invPolyEval_b <= rightBottomY_uid296_pT2_uid168_invPolyEval_in(6 downto 2);

    -- n1_uid305_pT2_uid168_invPolyEval(BITSELECT,304)@5
    n1_uid305_pT2_uid168_invPolyEval_b <= rightBottomY_uid296_pT2_uid168_invPolyEval_b(4 downto 1);

    -- redist6_n1_uid305_pT2_uid168_invPolyEval_b_1(DELAY,365)
    redist6_n1_uid305_pT2_uid168_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => n1_uid305_pT2_uid168_invPolyEval_b, xout => redist6_n1_uid305_pT2_uid168_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- redist29_yPE_uid52_fpDivTest_b_5(DELAY,388)
    redist29_yPE_uid52_fpDivTest_b_5 : dspba_delay
    GENERIC MAP ( width => 14, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist28_yPE_uid52_fpDivTest_b_2_q, xout => redist29_yPE_uid52_fpDivTest_b_5_q, clk => clk, aclr => areset );

    -- nx_mergedSignalTM_uid264_pT2_uid168_invPolyEval(BITJOIN,263)@5
    nx_mergedSignalTM_uid264_pT2_uid168_invPolyEval_q <= GND_q & redist29_yPE_uid52_fpDivTest_b_5_q;

    -- rightBottomX_uid295_pT2_uid168_invPolyEval(BITSELECT,294)@5
    rightBottomX_uid295_pT2_uid168_invPolyEval_in <= nx_mergedSignalTM_uid264_pT2_uid168_invPolyEval_q(6 downto 0);
    rightBottomX_uid295_pT2_uid168_invPolyEval_b <= rightBottomX_uid295_pT2_uid168_invPolyEval_in(6 downto 2);

    -- n0_uid306_pT2_uid168_invPolyEval(BITSELECT,305)@5
    n0_uid306_pT2_uid168_invPolyEval_b <= rightBottomX_uid295_pT2_uid168_invPolyEval_b(4 downto 1);

    -- redist5_n0_uid306_pT2_uid168_invPolyEval_b_1(DELAY,364)
    redist5_n0_uid306_pT2_uid168_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => n0_uid306_pT2_uid168_invPolyEval_b, xout => redist5_n0_uid306_pT2_uid168_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- sm0_uid321_pT2_uid168_invPolyEval(MULT,320)@6 + 2
    sm0_uid321_pT2_uid168_invPolyEval_a0 <= redist5_n0_uid306_pT2_uid168_invPolyEval_b_1_q;
    sm0_uid321_pT2_uid168_invPolyEval_b0 <= redist6_n1_uid305_pT2_uid168_invPolyEval_b_1_q;
    sm0_uid321_pT2_uid168_invPolyEval_reset <= areset;
    sm0_uid321_pT2_uid168_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid321_pT2_uid168_invPolyEval_a0,
        datab => sm0_uid321_pT2_uid168_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid321_pT2_uid168_invPolyEval_reset,
        clock => clk,
        result => sm0_uid321_pT2_uid168_invPolyEval_s1
    );
    sm0_uid321_pT2_uid168_invPolyEval_q <= sm0_uid321_pT2_uid168_invPolyEval_s1;

    -- aboveLeftY_bottomRange_uid286_pT2_uid168_invPolyEval(BITSELECT,285)@5
    aboveLeftY_bottomRange_uid286_pT2_uid168_invPolyEval_in <= STD_LOGIC_VECTOR(redist9_s1_uid166_invPolyEval_b_1_q(6 downto 0));
    aboveLeftY_bottomRange_uid286_pT2_uid168_invPolyEval_b <= STD_LOGIC_VECTOR(aboveLeftY_bottomRange_uid286_pT2_uid168_invPolyEval_in(6 downto 0));

    -- aboveLeftY_mergedSignalTM_uid287_pT2_uid168_invPolyEval(BITJOIN,286)@5
    aboveLeftY_mergedSignalTM_uid287_pT2_uid168_invPolyEval_q <= aboveLeftY_bottomRange_uid286_pT2_uid168_invPolyEval_b & GND_q;

    -- aboveLeftX_uid284_pT2_uid168_invPolyEval(BITSELECT,283)@5
    aboveLeftX_uid284_pT2_uid168_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid264_pT2_uid168_invPolyEval_q(14 downto 7));

    -- sm0_uid320_pT2_uid168_invPolyEval(MULT,319)@5 + 2
    sm0_uid320_pT2_uid168_invPolyEval_a0 <= STD_LOGIC_VECTOR(aboveLeftX_uid284_pT2_uid168_invPolyEval_b);
    sm0_uid320_pT2_uid168_invPolyEval_b0 <= '0' & aboveLeftY_mergedSignalTM_uid287_pT2_uid168_invPolyEval_q;
    sm0_uid320_pT2_uid168_invPolyEval_reset <= areset;
    sm0_uid320_pT2_uid168_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid320_pT2_uid168_invPolyEval_a0,
        datab => sm0_uid320_pT2_uid168_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid320_pT2_uid168_invPolyEval_reset,
        clock => clk,
        result => sm0_uid320_pT2_uid168_invPolyEval_s1
    );
    sm0_uid320_pT2_uid168_invPolyEval_q <= sm0_uid320_pT2_uid168_invPolyEval_s1(15 downto 0);

    -- topRangeY_uid278_pT2_uid168_invPolyEval(BITSELECT,277)@5
    topRangeY_uid278_pT2_uid168_invPolyEval_b <= STD_LOGIC_VECTOR(redist9_s1_uid166_invPolyEval_b_1_q(23 downto 7));

    -- topRangeX_bottomExtension_uid274_pT2_uid168_invPolyEval(CONSTANT,273)
    topRangeX_bottomExtension_uid274_pT2_uid168_invPolyEval_q <= "00";

    -- topRangeX_mergedSignalTM_uid276_pT2_uid168_invPolyEval(BITJOIN,275)@5
    topRangeX_mergedSignalTM_uid276_pT2_uid168_invPolyEval_q <= nx_mergedSignalTM_uid264_pT2_uid168_invPolyEval_q & topRangeX_bottomExtension_uid274_pT2_uid168_invPolyEval_q;

    -- sm0_uid319_pT2_uid168_invPolyEval(MULT,318)@5 + 2
    sm0_uid319_pT2_uid168_invPolyEval_a0 <= STD_LOGIC_VECTOR(topRangeX_mergedSignalTM_uid276_pT2_uid168_invPolyEval_q);
    sm0_uid319_pT2_uid168_invPolyEval_b0 <= STD_LOGIC_VECTOR(topRangeY_uid278_pT2_uid168_invPolyEval_b);
    sm0_uid319_pT2_uid168_invPolyEval_reset <= areset;
    sm0_uid319_pT2_uid168_invPolyEval_component : lpm_mult
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
        dataa => sm0_uid319_pT2_uid168_invPolyEval_a0,
        datab => sm0_uid319_pT2_uid168_invPolyEval_b0,
        clken => VCC_q(0),
        aclr => sm0_uid319_pT2_uid168_invPolyEval_reset,
        clock => clk,
        result => sm0_uid319_pT2_uid168_invPolyEval_s1
    );
    sm0_uid319_pT2_uid168_invPolyEval_q <= sm0_uid319_pT2_uid168_invPolyEval_s1;

    -- highABits_uid323_pT2_uid168_invPolyEval(BITSELECT,322)@7
    highABits_uid323_pT2_uid168_invPolyEval_b <= STD_LOGIC_VECTOR(sm0_uid319_pT2_uid168_invPolyEval_q(33 downto 1));

    -- lev1_a0high_uid324_pT2_uid168_invPolyEval(ADD,323)@7
    lev1_a0high_uid324_pT2_uid168_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 33 => highABits_uid323_pT2_uid168_invPolyEval_b(32)) & highABits_uid323_pT2_uid168_invPolyEval_b));
    lev1_a0high_uid324_pT2_uid168_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 16 => sm0_uid320_pT2_uid168_invPolyEval_q(15)) & sm0_uid320_pT2_uid168_invPolyEval_q));
    lev1_a0high_uid324_pT2_uid168_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0high_uid324_pT2_uid168_invPolyEval_a) + SIGNED(lev1_a0high_uid324_pT2_uid168_invPolyEval_b));
    lev1_a0high_uid324_pT2_uid168_invPolyEval_q <= lev1_a0high_uid324_pT2_uid168_invPolyEval_o(33 downto 0);

    -- lowRangeA_uid322_pT2_uid168_invPolyEval(BITSELECT,321)@7
    lowRangeA_uid322_pT2_uid168_invPolyEval_in <= sm0_uid319_pT2_uid168_invPolyEval_q(0 downto 0);
    lowRangeA_uid322_pT2_uid168_invPolyEval_b <= lowRangeA_uid322_pT2_uid168_invPolyEval_in(0 downto 0);

    -- lev1_a0_uid325_pT2_uid168_invPolyEval(BITJOIN,324)@7
    lev1_a0_uid325_pT2_uid168_invPolyEval_q <= lev1_a0high_uid324_pT2_uid168_invPolyEval_q & lowRangeA_uid322_pT2_uid168_invPolyEval_b;

    -- highABits_uid327_pT2_uid168_invPolyEval(BITSELECT,326)@7
    highABits_uid327_pT2_uid168_invPolyEval_b <= STD_LOGIC_VECTOR(lev1_a0_uid325_pT2_uid168_invPolyEval_q(34 downto 1));

    -- redist3_highABits_uid327_pT2_uid168_invPolyEval_b_1(DELAY,362)
    redist3_highABits_uid327_pT2_uid168_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => highABits_uid327_pT2_uid168_invPolyEval_b, xout => redist3_highABits_uid327_pT2_uid168_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- lev2_a0high_uid328_pT2_uid168_invPolyEval(ADD,327)@8
    lev2_a0high_uid328_pT2_uid168_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 34 => redist3_highABits_uid327_pT2_uid168_invPolyEval_b_1_q(33)) & redist3_highABits_uid327_pT2_uid168_invPolyEval_b_1_q));
    lev2_a0high_uid328_pT2_uid168_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000000000000000000000000000" & sm0_uid321_pT2_uid168_invPolyEval_q));
    lev2_a0high_uid328_pT2_uid168_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev2_a0high_uid328_pT2_uid168_invPolyEval_a) + SIGNED(lev2_a0high_uid328_pT2_uid168_invPolyEval_b));
    lev2_a0high_uid328_pT2_uid168_invPolyEval_q <= lev2_a0high_uid328_pT2_uid168_invPolyEval_o(34 downto 0);

    -- lowRangeA_uid326_pT2_uid168_invPolyEval(BITSELECT,325)@7
    lowRangeA_uid326_pT2_uid168_invPolyEval_in <= lev1_a0_uid325_pT2_uid168_invPolyEval_q(0 downto 0);
    lowRangeA_uid326_pT2_uid168_invPolyEval_b <= lowRangeA_uid326_pT2_uid168_invPolyEval_in(0 downto 0);

    -- redist4_lowRangeA_uid326_pT2_uid168_invPolyEval_b_1(DELAY,363)
    redist4_lowRangeA_uid326_pT2_uid168_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => lowRangeA_uid326_pT2_uid168_invPolyEval_b, xout => redist4_lowRangeA_uid326_pT2_uid168_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- lev2_a0_uid329_pT2_uid168_invPolyEval(BITJOIN,328)@8
    lev2_a0_uid329_pT2_uid168_invPolyEval_q <= lev2_a0high_uid328_pT2_uid168_invPolyEval_q & redist4_lowRangeA_uid326_pT2_uid168_invPolyEval_b_1_q;

    -- osig_uid330_pT2_uid168_invPolyEval(BITSELECT,329)@8
    osig_uid330_pT2_uid168_invPolyEval_in <= STD_LOGIC_VECTOR(lev2_a0_uid329_pT2_uid168_invPolyEval_q(32 downto 0));
    osig_uid330_pT2_uid168_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid330_pT2_uid168_invPolyEval_in(32 downto 7));

    -- redist2_osig_uid330_pT2_uid168_invPolyEval_b_1(DELAY,361)
    redist2_osig_uid330_pT2_uid168_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 26, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => osig_uid330_pT2_uid168_invPolyEval_b, xout => redist2_osig_uid330_pT2_uid168_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- redist31_yAddr_uid51_fpDivTest_b_7(DELAY,390)
    redist31_yAddr_uid51_fpDivTest_b_7 : dspba_delay
    GENERIC MAP ( width => 9, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist30_yAddr_uid51_fpDivTest_b_2_q, xout => redist31_yAddr_uid51_fpDivTest_b_7_q, clk => clk, aclr => areset );

    -- memoryC0_uid147_invTables_lutmem(DUALMEM,351)@7 + 2
    -- in j@20000000
    memoryC0_uid147_invTables_lutmem_aa <= redist31_yAddr_uid51_fpDivTest_b_7_q;
    memoryC0_uid147_invTables_lutmem_reset0 <= areset;
    memoryC0_uid147_invTables_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 14,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "DIV_0002_memoryC0_uid147_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid147_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid147_invTables_lutmem_aa,
        q_a => memoryC0_uid147_invTables_lutmem_ir
    );
    memoryC0_uid147_invTables_lutmem_r <= memoryC0_uid147_invTables_lutmem_ir(13 downto 0);

    -- memoryC0_uid146_invTables_lutmem(DUALMEM,350)@7 + 2
    -- in j@20000000
    memoryC0_uid146_invTables_lutmem_aa <= redist31_yAddr_uid51_fpDivTest_b_7_q;
    memoryC0_uid146_invTables_lutmem_reset0 <= areset;
    memoryC0_uid146_invTables_lutmem_dmem : altsyncram
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
        init_file => "DIV_0002_memoryC0_uid146_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "MAX 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid146_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid146_invTables_lutmem_aa,
        q_a => memoryC0_uid146_invTables_lutmem_ir
    );
    memoryC0_uid146_invTables_lutmem_r <= memoryC0_uid146_invTables_lutmem_ir(17 downto 0);

    -- os_uid148_invTables(BITJOIN,147)@9
    os_uid148_invTables_q <= memoryC0_uid147_invTables_lutmem_r & memoryC0_uid146_invTables_lutmem_r;

    -- rndBit_uid169_invPolyEval(CONSTANT,168)
    rndBit_uid169_invPolyEval_q <= "001";

    -- cIncludingRoundingBit_uid170_invPolyEval(BITJOIN,169)@9
    cIncludingRoundingBit_uid170_invPolyEval_q <= os_uid148_invTables_q & rndBit_uid169_invPolyEval_q;

    -- ts2_uid172_invPolyEval(ADD,171)@9
    ts2_uid172_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 35 => cIncludingRoundingBit_uid170_invPolyEval_q(34)) & cIncludingRoundingBit_uid170_invPolyEval_q));
    ts2_uid172_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 26 => redist2_osig_uid330_pT2_uid168_invPolyEval_b_1_q(25)) & redist2_osig_uid330_pT2_uid168_invPolyEval_b_1_q));
    ts2_uid172_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts2_uid172_invPolyEval_a) + SIGNED(ts2_uid172_invPolyEval_b));
    ts2_uid172_invPolyEval_q <= ts2_uid172_invPolyEval_o(35 downto 0);

    -- s2_uid173_invPolyEval(BITSELECT,172)@9
    s2_uid173_invPolyEval_b <= STD_LOGIC_VECTOR(ts2_uid172_invPolyEval_q(35 downto 1));

    -- invY_uid54_fpDivTest(BITSELECT,53)@9
    invY_uid54_fpDivTest_in <= s2_uid173_invPolyEval_b(31 downto 0);
    invY_uid54_fpDivTest_b <= invY_uid54_fpDivTest_in(31 downto 5);

    -- redist27_invY_uid54_fpDivTest_b_1(DELAY,386)
    redist27_invY_uid54_fpDivTest_b_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => invY_uid54_fpDivTest_b, xout => redist27_invY_uid54_fpDivTest_b_1_q, clk => clk, aclr => areset );

    -- aboveLeftX_uid201_divValPreNorm_uid59_fpDivTest(BITSELECT,200)@10
    aboveLeftX_uid201_divValPreNorm_uid59_fpDivTest_in <= redist27_invY_uid54_fpDivTest_b_1_q(8 downto 0);
    aboveLeftX_uid201_divValPreNorm_uid59_fpDivTest_b <= aboveLeftX_uid201_divValPreNorm_uid59_fpDivTest_in(8 downto 4);

    -- n0_uid211_divValPreNorm_uid59_fpDivTest(BITSELECT,210)@10
    n0_uid211_divValPreNorm_uid59_fpDivTest_b <= aboveLeftX_uid201_divValPreNorm_uid59_fpDivTest_b(4 downto 1);

    -- redist8_n0_uid211_divValPreNorm_uid59_fpDivTest_b_1(DELAY,367)
    redist8_n0_uid211_divValPreNorm_uid59_fpDivTest_b_1 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => n0_uid211_divValPreNorm_uid59_fpDivTest_b, xout => redist8_n0_uid211_divValPreNorm_uid59_fpDivTest_b_1_q, clk => clk, aclr => areset );

    -- sm1_uid226_divValPreNorm_uid59_fpDivTest(MULT,225)@11 + 2
    sm1_uid226_divValPreNorm_uid59_fpDivTest_a0 <= redist8_n0_uid211_divValPreNorm_uid59_fpDivTest_b_1_q;
    sm1_uid226_divValPreNorm_uid59_fpDivTest_b0 <= n1_uid210_divValPreNorm_uid59_fpDivTest_b;
    sm1_uid226_divValPreNorm_uid59_fpDivTest_reset <= areset;
    sm1_uid226_divValPreNorm_uid59_fpDivTest_component : lpm_mult
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
        dataa => sm1_uid226_divValPreNorm_uid59_fpDivTest_a0,
        datab => sm1_uid226_divValPreNorm_uid59_fpDivTest_b0,
        clken => VCC_q(0),
        aclr => sm1_uid226_divValPreNorm_uid59_fpDivTest_reset,
        clock => clk,
        result => sm1_uid226_divValPreNorm_uid59_fpDivTest_s1
    );
    sm1_uid226_divValPreNorm_uid59_fpDivTest_q <= sm1_uid226_divValPreNorm_uid59_fpDivTest_s1;

    -- redist7_sm1_uid226_divValPreNorm_uid59_fpDivTest_q_1(DELAY,366)
    redist7_sm1_uid226_divValPreNorm_uid59_fpDivTest_q_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sm1_uid226_divValPreNorm_uid59_fpDivTest_q, xout => redist7_sm1_uid226_divValPreNorm_uid59_fpDivTest_q_1_q, clk => clk, aclr => areset );

    -- lev3_a0high_uid235_divValPreNorm_uid59_fpDivTest(ADD,234)@14
    lev3_a0high_uid235_divValPreNorm_uid59_fpDivTest_a <= STD_LOGIC_VECTOR("0" & lowRangeA_uid233_divValPreNorm_uid59_fpDivTest_merged_bit_select_c);
    lev3_a0high_uid235_divValPreNorm_uid59_fpDivTest_b <= STD_LOGIC_VECTOR("000000000000000000000000000000" & redist7_sm1_uid226_divValPreNorm_uid59_fpDivTest_q_1_q);
    lev3_a0high_uid235_divValPreNorm_uid59_fpDivTest_o <= STD_LOGIC_VECTOR(UNSIGNED(lev3_a0high_uid235_divValPreNorm_uid59_fpDivTest_a) + UNSIGNED(lev3_a0high_uid235_divValPreNorm_uid59_fpDivTest_b));
    lev3_a0high_uid235_divValPreNorm_uid59_fpDivTest_q <= lev3_a0high_uid235_divValPreNorm_uid59_fpDivTest_o(37 downto 0);

    -- rightBottomY_uid200_divValPreNorm_uid59_fpDivTest(BITSELECT,199)@10
    rightBottomY_uid200_divValPreNorm_uid59_fpDivTest_in <= lOAdded_uid57_fpDivTest_q(5 downto 0);
    rightBottomY_uid200_divValPreNorm_uid59_fpDivTest_b <= rightBottomY_uid200_divValPreNorm_uid59_fpDivTest_in(5 downto 1);

    -- n1_uid208_divValPreNorm_uid59_fpDivTest(BITSELECT,207)@10
    n1_uid208_divValPreNorm_uid59_fpDivTest_b <= rightBottomY_uid200_divValPreNorm_uid59_fpDivTest_b(4 downto 1);

    -- rightBottomX_uid199_divValPreNorm_uid59_fpDivTest(BITSELECT,198)@10
    rightBottomX_uid199_divValPreNorm_uid59_fpDivTest_in <= redist27_invY_uid54_fpDivTest_b_1_q(17 downto 0);
    rightBottomX_uid199_divValPreNorm_uid59_fpDivTest_b <= rightBottomX_uid199_divValPreNorm_uid59_fpDivTest_in(17 downto 13);

    -- n0_uid209_divValPreNorm_uid59_fpDivTest(BITSELECT,208)@10
    n0_uid209_divValPreNorm_uid59_fpDivTest_b <= rightBottomX_uid199_divValPreNorm_uid59_fpDivTest_b(4 downto 1);

    -- sm0_uid225_divValPreNorm_uid59_fpDivTest(MULT,224)@10 + 2
    sm0_uid225_divValPreNorm_uid59_fpDivTest_a0 <= n0_uid209_divValPreNorm_uid59_fpDivTest_b;
    sm0_uid225_divValPreNorm_uid59_fpDivTest_b0 <= n1_uid208_divValPreNorm_uid59_fpDivTest_b;
    sm0_uid225_divValPreNorm_uid59_fpDivTest_reset <= areset;
    sm0_uid225_divValPreNorm_uid59_fpDivTest_component : lpm_mult
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
        dataa => sm0_uid225_divValPreNorm_uid59_fpDivTest_a0,
        datab => sm0_uid225_divValPreNorm_uid59_fpDivTest_b0,
        clken => VCC_q(0),
        aclr => sm0_uid225_divValPreNorm_uid59_fpDivTest_reset,
        clock => clk,
        result => sm0_uid225_divValPreNorm_uid59_fpDivTest_s1
    );
    sm0_uid225_divValPreNorm_uid59_fpDivTest_q <= sm0_uid225_divValPreNorm_uid59_fpDivTest_s1;

    -- rightBottomY_uid195_divValPreNorm_uid59_fpDivTest(BITSELECT,194)@10
    rightBottomY_uid195_divValPreNorm_uid59_fpDivTest_b <= lOAdded_uid57_fpDivTest_q(23 downto 15);

    -- rightBottomX_uid194_divValPreNorm_uid59_fpDivTest(BITSELECT,193)@10
    rightBottomX_uid194_divValPreNorm_uid59_fpDivTest_in <= redist27_invY_uid54_fpDivTest_b_1_q(8 downto 0);
    rightBottomX_uid194_divValPreNorm_uid59_fpDivTest_b <= rightBottomX_uid194_divValPreNorm_uid59_fpDivTest_in(8 downto 0);

    -- sm1_uid224_divValPreNorm_uid59_fpDivTest(MULT,223)@10 + 2
    sm1_uid224_divValPreNorm_uid59_fpDivTest_a0 <= rightBottomX_uid194_divValPreNorm_uid59_fpDivTest_b;
    sm1_uid224_divValPreNorm_uid59_fpDivTest_b0 <= rightBottomY_uid195_divValPreNorm_uid59_fpDivTest_b;
    sm1_uid224_divValPreNorm_uid59_fpDivTest_reset <= areset;
    sm1_uid224_divValPreNorm_uid59_fpDivTest_component : lpm_mult
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
        dataa => sm1_uid224_divValPreNorm_uid59_fpDivTest_a0,
        datab => sm1_uid224_divValPreNorm_uid59_fpDivTest_b0,
        clken => VCC_q(0),
        aclr => sm1_uid224_divValPreNorm_uid59_fpDivTest_reset,
        clock => clk,
        result => sm1_uid224_divValPreNorm_uid59_fpDivTest_s1
    );
    sm1_uid224_divValPreNorm_uid59_fpDivTest_q <= sm1_uid224_divValPreNorm_uid59_fpDivTest_s1;

    -- lowRangeA_uid228_divValPreNorm_uid59_fpDivTest_merged_bit_select(BITSELECT,357)@12
    lowRangeA_uid228_divValPreNorm_uid59_fpDivTest_merged_bit_select_b <= sm1_uid224_divValPreNorm_uid59_fpDivTest_q(0 downto 0);
    lowRangeA_uid228_divValPreNorm_uid59_fpDivTest_merged_bit_select_c <= sm1_uid224_divValPreNorm_uid59_fpDivTest_q(17 downto 1);

    -- lev1_a1high_uid230_divValPreNorm_uid59_fpDivTest(ADD,229)@12 + 1
    lev1_a1high_uid230_divValPreNorm_uid59_fpDivTest_a <= STD_LOGIC_VECTOR("0" & lowRangeA_uid228_divValPreNorm_uid59_fpDivTest_merged_bit_select_c);
    lev1_a1high_uid230_divValPreNorm_uid59_fpDivTest_b <= STD_LOGIC_VECTOR("0000000000" & sm0_uid225_divValPreNorm_uid59_fpDivTest_q);
    lev1_a1high_uid230_divValPreNorm_uid59_fpDivTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            lev1_a1high_uid230_divValPreNorm_uid59_fpDivTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            lev1_a1high_uid230_divValPreNorm_uid59_fpDivTest_o <= STD_LOGIC_VECTOR(UNSIGNED(lev1_a1high_uid230_divValPreNorm_uid59_fpDivTest_a) + UNSIGNED(lev1_a1high_uid230_divValPreNorm_uid59_fpDivTest_b));
        END IF;
    END PROCESS;
    lev1_a1high_uid230_divValPreNorm_uid59_fpDivTest_q <= lev1_a1high_uid230_divValPreNorm_uid59_fpDivTest_o(17 downto 0);

    -- redist0_lowRangeA_uid228_divValPreNorm_uid59_fpDivTest_merged_bit_select_b_1(DELAY,359)
    redist0_lowRangeA_uid228_divValPreNorm_uid59_fpDivTest_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => lowRangeA_uid228_divValPreNorm_uid59_fpDivTest_merged_bit_select_b, xout => redist0_lowRangeA_uid228_divValPreNorm_uid59_fpDivTest_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- lev1_a1_uid231_divValPreNorm_uid59_fpDivTest(BITJOIN,230)@13
    lev1_a1_uid231_divValPreNorm_uid59_fpDivTest_q <= lev1_a1high_uid230_divValPreNorm_uid59_fpDivTest_q & redist0_lowRangeA_uid228_divValPreNorm_uid59_fpDivTest_merged_bit_select_b_1_q;

    -- aboveLeftY_bottomRange_uid191_divValPreNorm_uid59_fpDivTest(BITSELECT,190)@10
    aboveLeftY_bottomRange_uid191_divValPreNorm_uid59_fpDivTest_in <= lOAdded_uid57_fpDivTest_q(5 downto 0);
    aboveLeftY_bottomRange_uid191_divValPreNorm_uid59_fpDivTest_b <= aboveLeftY_bottomRange_uid191_divValPreNorm_uid59_fpDivTest_in(5 downto 0);

    -- aboveLeftY_mergedSignalTM_uid192_divValPreNorm_uid59_fpDivTest(BITJOIN,191)@10
    aboveLeftY_mergedSignalTM_uid192_divValPreNorm_uid59_fpDivTest_q <= aboveLeftY_bottomRange_uid191_divValPreNorm_uid59_fpDivTest_b & aboveLeftY_bottomExtension_uid190_divValPreNorm_uid59_fpDivTest_q;

    -- aboveLeftX_uid189_divValPreNorm_uid59_fpDivTest(BITSELECT,188)@10
    aboveLeftX_uid189_divValPreNorm_uid59_fpDivTest_b <= redist27_invY_uid54_fpDivTest_b_1_q(26 downto 18);

    -- sm0_uid223_divValPreNorm_uid59_fpDivTest(MULT,222)@10 + 2
    sm0_uid223_divValPreNorm_uid59_fpDivTest_a0 <= aboveLeftX_uid189_divValPreNorm_uid59_fpDivTest_b;
    sm0_uid223_divValPreNorm_uid59_fpDivTest_b0 <= aboveLeftY_mergedSignalTM_uid192_divValPreNorm_uid59_fpDivTest_q;
    sm0_uid223_divValPreNorm_uid59_fpDivTest_reset <= areset;
    sm0_uid223_divValPreNorm_uid59_fpDivTest_component : lpm_mult
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
        dataa => sm0_uid223_divValPreNorm_uid59_fpDivTest_a0,
        datab => sm0_uid223_divValPreNorm_uid59_fpDivTest_b0,
        clken => VCC_q(0),
        aclr => sm0_uid223_divValPreNorm_uid59_fpDivTest_reset,
        clock => clk,
        result => sm0_uid223_divValPreNorm_uid59_fpDivTest_s1
    );
    sm0_uid223_divValPreNorm_uid59_fpDivTest_q <= sm0_uid223_divValPreNorm_uid59_fpDivTest_s1;

    -- topRangeY_uid184_divValPreNorm_uid59_fpDivTest(BITSELECT,183)@10
    topRangeY_uid184_divValPreNorm_uid59_fpDivTest_b <= lOAdded_uid57_fpDivTest_q(23 downto 6);

    -- topRangeX_uid183_divValPreNorm_uid59_fpDivTest(BITSELECT,182)@10
    topRangeX_uid183_divValPreNorm_uid59_fpDivTest_b <= redist27_invY_uid54_fpDivTest_b_1_q(26 downto 9);

    -- sm0_uid222_divValPreNorm_uid59_fpDivTest(MULT,221)@10 + 2
    sm0_uid222_divValPreNorm_uid59_fpDivTest_a0 <= topRangeX_uid183_divValPreNorm_uid59_fpDivTest_b;
    sm0_uid222_divValPreNorm_uid59_fpDivTest_b0 <= topRangeY_uid184_divValPreNorm_uid59_fpDivTest_b;
    sm0_uid222_divValPreNorm_uid59_fpDivTest_reset <= areset;
    sm0_uid222_divValPreNorm_uid59_fpDivTest_component : lpm_mult
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
        dataa => sm0_uid222_divValPreNorm_uid59_fpDivTest_a0,
        datab => sm0_uid222_divValPreNorm_uid59_fpDivTest_b0,
        clken => VCC_q(0),
        aclr => sm0_uid222_divValPreNorm_uid59_fpDivTest_reset,
        clock => clk,
        result => sm0_uid222_divValPreNorm_uid59_fpDivTest_s1
    );
    sm0_uid222_divValPreNorm_uid59_fpDivTest_q <= sm0_uid222_divValPreNorm_uid59_fpDivTest_s1;

    -- lev1_a0_uid227_divValPreNorm_uid59_fpDivTest(ADD,226)@12 + 1
    lev1_a0_uid227_divValPreNorm_uid59_fpDivTest_a <= STD_LOGIC_VECTOR("0" & sm0_uid222_divValPreNorm_uid59_fpDivTest_q);
    lev1_a0_uid227_divValPreNorm_uid59_fpDivTest_b <= STD_LOGIC_VECTOR("0000000000000000000" & sm0_uid223_divValPreNorm_uid59_fpDivTest_q);
    lev1_a0_uid227_divValPreNorm_uid59_fpDivTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            lev1_a0_uid227_divValPreNorm_uid59_fpDivTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            lev1_a0_uid227_divValPreNorm_uid59_fpDivTest_o <= STD_LOGIC_VECTOR(UNSIGNED(lev1_a0_uid227_divValPreNorm_uid59_fpDivTest_a) + UNSIGNED(lev1_a0_uid227_divValPreNorm_uid59_fpDivTest_b));
        END IF;
    END PROCESS;
    lev1_a0_uid227_divValPreNorm_uid59_fpDivTest_q <= lev1_a0_uid227_divValPreNorm_uid59_fpDivTest_o(36 downto 0);

    -- lev2_a0_uid232_divValPreNorm_uid59_fpDivTest(ADD,231)@13 + 1
    lev2_a0_uid232_divValPreNorm_uid59_fpDivTest_a <= STD_LOGIC_VECTOR("0" & lev1_a0_uid227_divValPreNorm_uid59_fpDivTest_q);
    lev2_a0_uid232_divValPreNorm_uid59_fpDivTest_b <= STD_LOGIC_VECTOR("0000000000000000000" & lev1_a1_uid231_divValPreNorm_uid59_fpDivTest_q);
    lev2_a0_uid232_divValPreNorm_uid59_fpDivTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            lev2_a0_uid232_divValPreNorm_uid59_fpDivTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            lev2_a0_uid232_divValPreNorm_uid59_fpDivTest_o <= STD_LOGIC_VECTOR(UNSIGNED(lev2_a0_uid232_divValPreNorm_uid59_fpDivTest_a) + UNSIGNED(lev2_a0_uid232_divValPreNorm_uid59_fpDivTest_b));
        END IF;
    END PROCESS;
    lev2_a0_uid232_divValPreNorm_uid59_fpDivTest_q <= lev2_a0_uid232_divValPreNorm_uid59_fpDivTest_o(37 downto 0);

    -- lowRangeA_uid233_divValPreNorm_uid59_fpDivTest_merged_bit_select(BITSELECT,358)@14
    lowRangeA_uid233_divValPreNorm_uid59_fpDivTest_merged_bit_select_b <= lev2_a0_uid232_divValPreNorm_uid59_fpDivTest_q(0 downto 0);
    lowRangeA_uid233_divValPreNorm_uid59_fpDivTest_merged_bit_select_c <= lev2_a0_uid232_divValPreNorm_uid59_fpDivTest_q(37 downto 1);

    -- lev3_a0_uid236_divValPreNorm_uid59_fpDivTest(BITJOIN,235)@14
    lev3_a0_uid236_divValPreNorm_uid59_fpDivTest_q <= lev3_a0high_uid235_divValPreNorm_uid59_fpDivTest_q & lowRangeA_uid233_divValPreNorm_uid59_fpDivTest_merged_bit_select_b;

    -- osig_uid237_divValPreNorm_uid59_fpDivTest(BITSELECT,236)@14
    osig_uid237_divValPreNorm_uid59_fpDivTest_in <= lev3_a0_uid236_divValPreNorm_uid59_fpDivTest_q(35 downto 0);
    osig_uid237_divValPreNorm_uid59_fpDivTest_b <= osig_uid237_divValPreNorm_uid59_fpDivTest_in(35 downto 7);

    -- updatedY_uid16_fpDivTest(BITJOIN,15)@14
    updatedY_uid16_fpDivTest_q <= GND_q & paddingY_uid15_fpDivTest_q;

    -- fracYZero_uid15_fpDivTest(LOGICAL,16)@14
    fracYZero_uid15_fpDivTest_a <= STD_LOGIC_VECTOR("0" & redist33_fracY_uid13_fpDivTest_b_14_outputreg_q);
    fracYZero_uid15_fpDivTest_q <= "1" WHEN fracYZero_uid15_fpDivTest_a = updatedY_uid16_fpDivTest_q ELSE "0";

    -- divValPreNormYPow2Exc_uid63_fpDivTest(MUX,62)@14 + 1
    divValPreNormYPow2Exc_uid63_fpDivTest_s <= fracYZero_uid15_fpDivTest_q;
    divValPreNormYPow2Exc_uid63_fpDivTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            divValPreNormYPow2Exc_uid63_fpDivTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (divValPreNormYPow2Exc_uid63_fpDivTest_s) IS
                WHEN "0" => divValPreNormYPow2Exc_uid63_fpDivTest_q <= osig_uid237_divValPreNorm_uid59_fpDivTest_b;
                WHEN "1" => divValPreNormYPow2Exc_uid63_fpDivTest_q <= oFracXZ4_uid61_fpDivTest_q;
                WHEN OTHERS => divValPreNormYPow2Exc_uid63_fpDivTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- norm_uid64_fpDivTest(BITSELECT,63)@15
    norm_uid64_fpDivTest_b <= STD_LOGIC_VECTOR(divValPreNormYPow2Exc_uid63_fpDivTest_q(28 downto 28));

    -- zeroPaddingInAddition_uid74_fpDivTest(CONSTANT,73)
    zeroPaddingInAddition_uid74_fpDivTest_q <= "000000000000000000000000";

    -- expFracPostRnd_uid75_fpDivTest(BITJOIN,74)@15
    expFracPostRnd_uid75_fpDivTest_q <= norm_uid64_fpDivTest_b & zeroPaddingInAddition_uid74_fpDivTest_q & VCC_q;

    -- cstBiasM1_uid6_fpDivTest(CONSTANT,5)
    cstBiasM1_uid6_fpDivTest_q <= "01111110";

    -- expXmY_uid47_fpDivTest(SUB,46)@14
    expXmY_uid47_fpDivTest_a <= STD_LOGIC_VECTOR("0" & redist43_expX_uid9_fpDivTest_b_14_q);
    expXmY_uid47_fpDivTest_b <= STD_LOGIC_VECTOR("0" & redist36_expY_uid12_fpDivTest_b_14_q);
    expXmY_uid47_fpDivTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expXmY_uid47_fpDivTest_a) - UNSIGNED(expXmY_uid47_fpDivTest_b));
    expXmY_uid47_fpDivTest_q <= expXmY_uid47_fpDivTest_o(8 downto 0);

    -- expR_uid48_fpDivTest(ADD,47)@14 + 1
    expR_uid48_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 9 => expXmY_uid47_fpDivTest_q(8)) & expXmY_uid47_fpDivTest_q));
    expR_uid48_fpDivTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & cstBiasM1_uid6_fpDivTest_q));
    expR_uid48_fpDivTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expR_uid48_fpDivTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expR_uid48_fpDivTest_o <= STD_LOGIC_VECTOR(SIGNED(expR_uid48_fpDivTest_a) + SIGNED(expR_uid48_fpDivTest_b));
        END IF;
    END PROCESS;
    expR_uid48_fpDivTest_q <= expR_uid48_fpDivTest_o(9 downto 0);

    -- divValPreNormHigh_uid65_fpDivTest(BITSELECT,64)@15
    divValPreNormHigh_uid65_fpDivTest_in <= divValPreNormYPow2Exc_uid63_fpDivTest_q(27 downto 0);
    divValPreNormHigh_uid65_fpDivTest_b <= divValPreNormHigh_uid65_fpDivTest_in(27 downto 3);

    -- divValPreNormLow_uid66_fpDivTest(BITSELECT,65)@15
    divValPreNormLow_uid66_fpDivTest_in <= divValPreNormYPow2Exc_uid63_fpDivTest_q(26 downto 0);
    divValPreNormLow_uid66_fpDivTest_b <= divValPreNormLow_uid66_fpDivTest_in(26 downto 2);

    -- normFracRnd_uid67_fpDivTest(MUX,66)@15
    normFracRnd_uid67_fpDivTest_s <= norm_uid64_fpDivTest_b;
    normFracRnd_uid67_fpDivTest_combproc: PROCESS (normFracRnd_uid67_fpDivTest_s, divValPreNormLow_uid66_fpDivTest_b, divValPreNormHigh_uid65_fpDivTest_b)
    BEGIN
        CASE (normFracRnd_uid67_fpDivTest_s) IS
            WHEN "0" => normFracRnd_uid67_fpDivTest_q <= divValPreNormLow_uid66_fpDivTest_b;
            WHEN "1" => normFracRnd_uid67_fpDivTest_q <= divValPreNormHigh_uid65_fpDivTest_b;
            WHEN OTHERS => normFracRnd_uid67_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- expFracRnd_uid68_fpDivTest(BITJOIN,67)@15
    expFracRnd_uid68_fpDivTest_q <= expR_uid48_fpDivTest_q & normFracRnd_uid67_fpDivTest_q;

    -- expFracPostRnd_uid76_fpDivTest(ADD,75)@15 + 1
    expFracPostRnd_uid76_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 35 => expFracRnd_uid68_fpDivTest_q(34)) & expFracRnd_uid68_fpDivTest_q));
    expFracPostRnd_uid76_fpDivTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000" & expFracPostRnd_uid75_fpDivTest_q));
    expFracPostRnd_uid76_fpDivTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracPostRnd_uid76_fpDivTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracPostRnd_uid76_fpDivTest_o <= STD_LOGIC_VECTOR(SIGNED(expFracPostRnd_uid76_fpDivTest_a) + SIGNED(expFracPostRnd_uid76_fpDivTest_b));
        END IF;
    END PROCESS;
    expFracPostRnd_uid76_fpDivTest_q <= expFracPostRnd_uid76_fpDivTest_o(35 downto 0);

    -- fracPostRndF_uid79_fpDivTest(BITSELECT,78)@16
    fracPostRndF_uid79_fpDivTest_in <= expFracPostRnd_uid76_fpDivTest_q(24 downto 0);
    fracPostRndF_uid79_fpDivTest_b <= fracPostRndF_uid79_fpDivTest_in(24 downto 1);

    -- invYO_uid55_fpDivTest(BITSELECT,54)@9
    invYO_uid55_fpDivTest_in <= STD_LOGIC_VECTOR(s2_uid173_invPolyEval_b(32 downto 0));
    invYO_uid55_fpDivTest_b <= STD_LOGIC_VECTOR(invYO_uid55_fpDivTest_in(32 downto 32));

    -- redist25_invYO_uid55_fpDivTest_b_7(DELAY,384)
    redist25_invYO_uid55_fpDivTest_b_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "ASYNC" )
    PORT MAP ( xin => invYO_uid55_fpDivTest_b, xout => redist25_invYO_uid55_fpDivTest_b_7_q, clk => clk, aclr => areset );

    -- fracPostRndF_uid80_fpDivTest(MUX,79)@16
    fracPostRndF_uid80_fpDivTest_s <= redist25_invYO_uid55_fpDivTest_b_7_q;
    fracPostRndF_uid80_fpDivTest_combproc: PROCESS (fracPostRndF_uid80_fpDivTest_s, fracPostRndF_uid79_fpDivTest_b, fracXExt_uid77_fpDivTest_q)
    BEGIN
        CASE (fracPostRndF_uid80_fpDivTest_s) IS
            WHEN "0" => fracPostRndF_uid80_fpDivTest_q <= fracPostRndF_uid79_fpDivTest_b;
            WHEN "1" => fracPostRndF_uid80_fpDivTest_q <= fracXExt_uid77_fpDivTest_q;
            WHEN OTHERS => fracPostRndF_uid80_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist22_fracPostRndF_uid80_fpDivTest_q_5(DELAY,381)
    redist22_fracPostRndF_uid80_fpDivTest_q_5 : dspba_delay
    GENERIC MAP ( width => 24, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracPostRndF_uid80_fpDivTest_q, xout => redist22_fracPostRndF_uid80_fpDivTest_q_5_q, clk => clk, aclr => areset );

    -- betweenFPwF_uid102_fpDivTest(BITSELECT,101)@21
    betweenFPwF_uid102_fpDivTest_in <= STD_LOGIC_VECTOR(redist22_fracPostRndF_uid80_fpDivTest_q_5_q(0 downto 0));
    betweenFPwF_uid102_fpDivTest_b <= STD_LOGIC_VECTOR(betweenFPwF_uid102_fpDivTest_in(0 downto 0));

    -- redist45_expX_uid9_fpDivTest_b_19(DELAY,404)
    redist45_expX_uid9_fpDivTest_b_19 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist44_expX_uid9_fpDivTest_b_16_q, xout => redist45_expX_uid9_fpDivTest_b_19_q, clk => clk, aclr => areset );

    -- redist46_expX_uid9_fpDivTest_b_21(DELAY,405)
    redist46_expX_uid9_fpDivTest_b_21 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist45_expX_uid9_fpDivTest_b_19_q, xout => redist46_expX_uid9_fpDivTest_b_21_q, clk => clk, aclr => areset );

    -- redist42_fracX_uid10_fpDivTest_b_21(DELAY,401)
    redist42_fracX_uid10_fpDivTest_b_21 : dspba_delay
    GENERIC MAP ( width => 23, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist41_fracX_uid10_fpDivTest_b_16_q, xout => redist42_fracX_uid10_fpDivTest_b_21_q, clk => clk, aclr => areset );

    -- qDivProdLTX_opB_uid100_fpDivTest(BITJOIN,99)@21
    qDivProdLTX_opB_uid100_fpDivTest_q <= redist46_expX_uid9_fpDivTest_b_21_q & redist42_fracX_uid10_fpDivTest_b_21_q;

    -- redist35_fracY_uid13_fpDivTest_b_16(DELAY,394)
    redist35_fracY_uid13_fpDivTest_b_16 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist34_fracY_uid13_fpDivTest_b_15_q, xout => redist35_fracY_uid13_fpDivTest_b_16_q, clk => clk, aclr => areset );

    -- lOAdded_uid87_fpDivTest(BITJOIN,86)@16
    lOAdded_uid87_fpDivTest_q <= VCC_q & redist35_fracY_uid13_fpDivTest_b_16_q;

    -- qDivProd_uid89_fpDivTest_bs2_merged_bit_select(BITSELECT,356)@16
    qDivProd_uid89_fpDivTest_bs2_merged_bit_select_b <= lOAdded_uid87_fpDivTest_q(17 downto 0);
    qDivProd_uid89_fpDivTest_bs2_merged_bit_select_c <= lOAdded_uid87_fpDivTest_q(23 downto 18);

    -- lOAdded_uid84_fpDivTest(BITJOIN,83)@16
    lOAdded_uid84_fpDivTest_q <= VCC_q & fracPostRndF_uid80_fpDivTest_q;

    -- qDivProd_uid89_fpDivTest_bs1_merged_bit_select(BITSELECT,355)@16
    qDivProd_uid89_fpDivTest_bs1_merged_bit_select_b <= lOAdded_uid84_fpDivTest_q(17 downto 0);
    qDivProd_uid89_fpDivTest_bs1_merged_bit_select_c <= lOAdded_uid84_fpDivTest_q(24 downto 18);

    -- qDivProd_uid89_fpDivTest_im6(MULT,337)@16 + 2
    qDivProd_uid89_fpDivTest_im6_a0 <= qDivProd_uid89_fpDivTest_bs1_merged_bit_select_b;
    qDivProd_uid89_fpDivTest_im6_b0 <= qDivProd_uid89_fpDivTest_bs2_merged_bit_select_c;
    qDivProd_uid89_fpDivTest_im6_reset <= areset;
    qDivProd_uid89_fpDivTest_im6_component : lpm_mult
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
        dataa => qDivProd_uid89_fpDivTest_im6_a0,
        datab => qDivProd_uid89_fpDivTest_im6_b0,
        clken => VCC_q(0),
        aclr => qDivProd_uid89_fpDivTest_im6_reset,
        clock => clk,
        result => qDivProd_uid89_fpDivTest_im6_s1
    );
    qDivProd_uid89_fpDivTest_im6_q <= qDivProd_uid89_fpDivTest_im6_s1;

    -- redist1_qDivProd_uid89_fpDivTest_im6_q_1(DELAY,360)
    redist1_qDivProd_uid89_fpDivTest_im6_q_1 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => qDivProd_uid89_fpDivTest_im6_q, xout => redist1_qDivProd_uid89_fpDivTest_im6_q_1_q, clk => clk, aclr => areset );

    -- qDivProd_uid89_fpDivTest_align_15(BITSHIFT,346)@19
    qDivProd_uid89_fpDivTest_align_15_qint <= redist1_qDivProd_uid89_fpDivTest_im6_q_1_q & "000000000000000000";
    qDivProd_uid89_fpDivTest_align_15_q <= qDivProd_uid89_fpDivTest_align_15_qint(41 downto 0);

    -- qDivProd_uid89_fpDivTest_im3(MULT,334)@16 + 2
    qDivProd_uid89_fpDivTest_im3_a0 <= qDivProd_uid89_fpDivTest_bs2_merged_bit_select_b;
    qDivProd_uid89_fpDivTest_im3_b0 <= qDivProd_uid89_fpDivTest_bs1_merged_bit_select_c;
    qDivProd_uid89_fpDivTest_im3_reset <= areset;
    qDivProd_uid89_fpDivTest_im3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 7,
        lpm_widthp => 25,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => qDivProd_uid89_fpDivTest_im3_a0,
        datab => qDivProd_uid89_fpDivTest_im3_b0,
        clken => VCC_q(0),
        aclr => qDivProd_uid89_fpDivTest_im3_reset,
        clock => clk,
        result => qDivProd_uid89_fpDivTest_im3_s1
    );
    qDivProd_uid89_fpDivTest_im3_q <= qDivProd_uid89_fpDivTest_im3_s1;

    -- qDivProd_uid89_fpDivTest_align_13(BITSHIFT,344)@18
    qDivProd_uid89_fpDivTest_align_13_qint <= qDivProd_uid89_fpDivTest_im3_q & "000000000000000000";
    qDivProd_uid89_fpDivTest_align_13_q <= qDivProd_uid89_fpDivTest_align_13_qint(42 downto 0);

    -- qDivProd_uid89_fpDivTest_im9(MULT,340)@16 + 2
    qDivProd_uid89_fpDivTest_im9_a0 <= qDivProd_uid89_fpDivTest_bs1_merged_bit_select_c;
    qDivProd_uid89_fpDivTest_im9_b0 <= qDivProd_uid89_fpDivTest_bs2_merged_bit_select_c;
    qDivProd_uid89_fpDivTest_im9_reset <= areset;
    qDivProd_uid89_fpDivTest_im9_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 7,
        lpm_widthb => 6,
        lpm_widthp => 13,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => qDivProd_uid89_fpDivTest_im9_a0,
        datab => qDivProd_uid89_fpDivTest_im9_b0,
        clken => VCC_q(0),
        aclr => qDivProd_uid89_fpDivTest_im9_reset,
        clock => clk,
        result => qDivProd_uid89_fpDivTest_im9_s1
    );
    qDivProd_uid89_fpDivTest_im9_q <= qDivProd_uid89_fpDivTest_im9_s1;

    -- qDivProd_uid89_fpDivTest_im0(MULT,331)@16 + 2
    qDivProd_uid89_fpDivTest_im0_a0 <= qDivProd_uid89_fpDivTest_bs1_merged_bit_select_b;
    qDivProd_uid89_fpDivTest_im0_b0 <= qDivProd_uid89_fpDivTest_bs2_merged_bit_select_b;
    qDivProd_uid89_fpDivTest_im0_reset <= areset;
    qDivProd_uid89_fpDivTest_im0_component : lpm_mult
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
        dataa => qDivProd_uid89_fpDivTest_im0_a0,
        datab => qDivProd_uid89_fpDivTest_im0_b0,
        clken => VCC_q(0),
        aclr => qDivProd_uid89_fpDivTest_im0_reset,
        clock => clk,
        result => qDivProd_uid89_fpDivTest_im0_s1
    );
    qDivProd_uid89_fpDivTest_im0_q <= qDivProd_uid89_fpDivTest_im0_s1;

    -- qDivProd_uid89_fpDivTest_join_12(BITJOIN,343)@18
    qDivProd_uid89_fpDivTest_join_12_q <= qDivProd_uid89_fpDivTest_im9_q & qDivProd_uid89_fpDivTest_im0_q;

    -- qDivProd_uid89_fpDivTest_result_add_0_0(ADD,348)@18 + 1
    qDivProd_uid89_fpDivTest_result_add_0_0_a <= STD_LOGIC_VECTOR("0" & qDivProd_uid89_fpDivTest_join_12_q);
    qDivProd_uid89_fpDivTest_result_add_0_0_b <= STD_LOGIC_VECTOR("0000000" & qDivProd_uid89_fpDivTest_align_13_q);
    qDivProd_uid89_fpDivTest_result_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            qDivProd_uid89_fpDivTest_result_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            qDivProd_uid89_fpDivTest_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(qDivProd_uid89_fpDivTest_result_add_0_0_a) + UNSIGNED(qDivProd_uid89_fpDivTest_result_add_0_0_b));
        END IF;
    END PROCESS;
    qDivProd_uid89_fpDivTest_result_add_0_0_q <= qDivProd_uid89_fpDivTest_result_add_0_0_o(49 downto 0);

    -- qDivProd_uid89_fpDivTest_result_add_1_0(ADD,349)@19
    qDivProd_uid89_fpDivTest_result_add_1_0_a <= STD_LOGIC_VECTOR("0" & qDivProd_uid89_fpDivTest_result_add_0_0_q);
    qDivProd_uid89_fpDivTest_result_add_1_0_b <= STD_LOGIC_VECTOR("000000000" & qDivProd_uid89_fpDivTest_align_15_q);
    qDivProd_uid89_fpDivTest_result_add_1_0_o <= STD_LOGIC_VECTOR(UNSIGNED(qDivProd_uid89_fpDivTest_result_add_1_0_a) + UNSIGNED(qDivProd_uid89_fpDivTest_result_add_1_0_b));
    qDivProd_uid89_fpDivTest_result_add_1_0_q <= qDivProd_uid89_fpDivTest_result_add_1_0_o(50 downto 0);

    -- qDivProdNorm_uid90_fpDivTest(BITSELECT,89)@19
    qDivProdNorm_uid90_fpDivTest_in <= STD_LOGIC_VECTOR(qDivProd_uid89_fpDivTest_result_add_1_0_q(48 downto 0));
    qDivProdNorm_uid90_fpDivTest_b <= STD_LOGIC_VECTOR(qDivProdNorm_uid90_fpDivTest_in(48 downto 48));

    -- redist19_qDivProdNorm_uid90_fpDivTest_b_1(DELAY,378)
    redist19_qDivProdNorm_uid90_fpDivTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => qDivProdNorm_uid90_fpDivTest_b, xout => redist19_qDivProdNorm_uid90_fpDivTest_b_1_q, clk => clk, aclr => areset );

    -- cstBias_uid7_fpDivTest(CONSTANT,6)
    cstBias_uid7_fpDivTest_q <= "01111111";

    -- qDivProdExp_opBs_uid95_fpDivTest(SUB,94)@20
    qDivProdExp_opBs_uid95_fpDivTest_a <= STD_LOGIC_VECTOR("0" & cstBias_uid7_fpDivTest_q);
    qDivProdExp_opBs_uid95_fpDivTest_b <= STD_LOGIC_VECTOR("00000000" & redist19_qDivProdNorm_uid90_fpDivTest_b_1_q);
    qDivProdExp_opBs_uid95_fpDivTest_o <= STD_LOGIC_VECTOR(UNSIGNED(qDivProdExp_opBs_uid95_fpDivTest_a) - UNSIGNED(qDivProdExp_opBs_uid95_fpDivTest_b));
    qDivProdExp_opBs_uid95_fpDivTest_q <= qDivProdExp_opBs_uid95_fpDivTest_o(8 downto 0);

    -- expPostRndFR_uid81_fpDivTest(BITSELECT,80)@16
    expPostRndFR_uid81_fpDivTest_in <= expFracPostRnd_uid76_fpDivTest_q(32 downto 0);
    expPostRndFR_uid81_fpDivTest_b <= expPostRndFR_uid81_fpDivTest_in(32 downto 25);

    -- redist20_expPostRndFR_uid81_fpDivTest_b_3(DELAY,379)
    redist20_expPostRndFR_uid81_fpDivTest_b_3 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => expPostRndFR_uid81_fpDivTest_b, xout => redist20_expPostRndFR_uid81_fpDivTest_b_3_q, clk => clk, aclr => areset );

    -- redist26_invYO_uid55_fpDivTest_b_10(DELAY,385)
    redist26_invYO_uid55_fpDivTest_b_10 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist25_invYO_uid55_fpDivTest_b_7_q, xout => redist26_invYO_uid55_fpDivTest_b_10_q, clk => clk, aclr => areset );

    -- expPostRndF_uid82_fpDivTest(MUX,81)@19
    expPostRndF_uid82_fpDivTest_s <= redist26_invYO_uid55_fpDivTest_b_10_q;
    expPostRndF_uid82_fpDivTest_combproc: PROCESS (expPostRndF_uid82_fpDivTest_s, redist20_expPostRndFR_uid81_fpDivTest_b_3_q, redist45_expX_uid9_fpDivTest_b_19_q)
    BEGIN
        CASE (expPostRndF_uid82_fpDivTest_s) IS
            WHEN "0" => expPostRndF_uid82_fpDivTest_q <= redist20_expPostRndFR_uid81_fpDivTest_b_3_q;
            WHEN "1" => expPostRndF_uid82_fpDivTest_q <= redist45_expX_uid9_fpDivTest_b_19_q;
            WHEN OTHERS => expPostRndF_uid82_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist38_expY_uid12_fpDivTest_b_19(DELAY,397)
    redist38_expY_uid12_fpDivTest_b_19 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist37_expY_uid12_fpDivTest_b_16_q, xout => redist38_expY_uid12_fpDivTest_b_19_q, clk => clk, aclr => areset );

    -- qDivProdExp_opA_uid94_fpDivTest(ADD,93)@19 + 1
    qDivProdExp_opA_uid94_fpDivTest_a <= STD_LOGIC_VECTOR("0" & redist38_expY_uid12_fpDivTest_b_19_q);
    qDivProdExp_opA_uid94_fpDivTest_b <= STD_LOGIC_VECTOR("0" & expPostRndF_uid82_fpDivTest_q);
    qDivProdExp_opA_uid94_fpDivTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            qDivProdExp_opA_uid94_fpDivTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            qDivProdExp_opA_uid94_fpDivTest_o <= STD_LOGIC_VECTOR(UNSIGNED(qDivProdExp_opA_uid94_fpDivTest_a) + UNSIGNED(qDivProdExp_opA_uid94_fpDivTest_b));
        END IF;
    END PROCESS;
    qDivProdExp_opA_uid94_fpDivTest_q <= qDivProdExp_opA_uid94_fpDivTest_o(8 downto 0);

    -- qDivProdExp_uid96_fpDivTest(SUB,95)@20
    qDivProdExp_uid96_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & qDivProdExp_opA_uid94_fpDivTest_q));
    qDivProdExp_uid96_fpDivTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 9 => qDivProdExp_opBs_uid95_fpDivTest_q(8)) & qDivProdExp_opBs_uid95_fpDivTest_q));
    qDivProdExp_uid96_fpDivTest_o <= STD_LOGIC_VECTOR(SIGNED(qDivProdExp_uid96_fpDivTest_a) - SIGNED(qDivProdExp_uid96_fpDivTest_b));
    qDivProdExp_uid96_fpDivTest_q <= qDivProdExp_uid96_fpDivTest_o(10 downto 0);

    -- qDivProdLTX_opA_uid98_fpDivTest(BITSELECT,97)@20
    qDivProdLTX_opA_uid98_fpDivTest_in <= qDivProdExp_uid96_fpDivTest_q(7 downto 0);
    qDivProdLTX_opA_uid98_fpDivTest_b <= qDivProdLTX_opA_uid98_fpDivTest_in(7 downto 0);

    -- redist15_qDivProdLTX_opA_uid98_fpDivTest_b_1(DELAY,374)
    redist15_qDivProdLTX_opA_uid98_fpDivTest_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => qDivProdLTX_opA_uid98_fpDivTest_b, xout => redist15_qDivProdLTX_opA_uid98_fpDivTest_b_1_q, clk => clk, aclr => areset );

    -- qDivProdFracHigh_uid91_fpDivTest(BITSELECT,90)@19
    qDivProdFracHigh_uid91_fpDivTest_in <= qDivProd_uid89_fpDivTest_result_add_1_0_q(47 downto 0);
    qDivProdFracHigh_uid91_fpDivTest_b <= qDivProdFracHigh_uid91_fpDivTest_in(47 downto 24);

    -- redist18_qDivProdFracHigh_uid91_fpDivTest_b_1(DELAY,377)
    redist18_qDivProdFracHigh_uid91_fpDivTest_b_1 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => qDivProdFracHigh_uid91_fpDivTest_b, xout => redist18_qDivProdFracHigh_uid91_fpDivTest_b_1_q, clk => clk, aclr => areset );

    -- qDivProdFracLow_uid92_fpDivTest(BITSELECT,91)@19
    qDivProdFracLow_uid92_fpDivTest_in <= qDivProd_uid89_fpDivTest_result_add_1_0_q(46 downto 0);
    qDivProdFracLow_uid92_fpDivTest_b <= qDivProdFracLow_uid92_fpDivTest_in(46 downto 23);

    -- redist17_qDivProdFracLow_uid92_fpDivTest_b_1(DELAY,376)
    redist17_qDivProdFracLow_uid92_fpDivTest_b_1 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => qDivProdFracLow_uid92_fpDivTest_b, xout => redist17_qDivProdFracLow_uid92_fpDivTest_b_1_q, clk => clk, aclr => areset );

    -- qDivProdFrac_uid93_fpDivTest(MUX,92)@20
    qDivProdFrac_uid93_fpDivTest_s <= redist19_qDivProdNorm_uid90_fpDivTest_b_1_q;
    qDivProdFrac_uid93_fpDivTest_combproc: PROCESS (qDivProdFrac_uid93_fpDivTest_s, redist17_qDivProdFracLow_uid92_fpDivTest_b_1_q, redist18_qDivProdFracHigh_uid91_fpDivTest_b_1_q)
    BEGIN
        CASE (qDivProdFrac_uid93_fpDivTest_s) IS
            WHEN "0" => qDivProdFrac_uid93_fpDivTest_q <= redist17_qDivProdFracLow_uid92_fpDivTest_b_1_q;
            WHEN "1" => qDivProdFrac_uid93_fpDivTest_q <= redist18_qDivProdFracHigh_uid91_fpDivTest_b_1_q;
            WHEN OTHERS => qDivProdFrac_uid93_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- qDivProdFracWF_uid97_fpDivTest(BITSELECT,96)@20
    qDivProdFracWF_uid97_fpDivTest_b <= qDivProdFrac_uid93_fpDivTest_q(23 downto 1);

    -- redist16_qDivProdFracWF_uid97_fpDivTest_b_1(DELAY,375)
    redist16_qDivProdFracWF_uid97_fpDivTest_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => qDivProdFracWF_uid97_fpDivTest_b, xout => redist16_qDivProdFracWF_uid97_fpDivTest_b_1_q, clk => clk, aclr => areset );

    -- qDivProdLTX_opA_uid99_fpDivTest(BITJOIN,98)@21
    qDivProdLTX_opA_uid99_fpDivTest_q <= redist15_qDivProdLTX_opA_uid98_fpDivTest_b_1_q & redist16_qDivProdFracWF_uid97_fpDivTest_b_1_q;

    -- qDividerProdLTX_uid101_fpDivTest(COMPARE,100)@21
    qDividerProdLTX_uid101_fpDivTest_a <= STD_LOGIC_VECTOR("00" & qDivProdLTX_opA_uid99_fpDivTest_q);
    qDividerProdLTX_uid101_fpDivTest_b <= STD_LOGIC_VECTOR("00" & qDivProdLTX_opB_uid100_fpDivTest_q);
    qDividerProdLTX_uid101_fpDivTest_o <= STD_LOGIC_VECTOR(UNSIGNED(qDividerProdLTX_uid101_fpDivTest_a) - UNSIGNED(qDividerProdLTX_uid101_fpDivTest_b));
    qDividerProdLTX_uid101_fpDivTest_c(0) <= qDividerProdLTX_uid101_fpDivTest_o(32);

    -- extraUlp_uid103_fpDivTest(LOGICAL,102)@21 + 1
    extraUlp_uid103_fpDivTest_qi <= qDividerProdLTX_uid101_fpDivTest_c and betweenFPwF_uid102_fpDivTest_b;
    extraUlp_uid103_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => extraUlp_uid103_fpDivTest_qi, xout => extraUlp_uid103_fpDivTest_q, clk => clk, aclr => areset );

    -- fracPostRndFT_uid104_fpDivTest(BITSELECT,103)@21
    fracPostRndFT_uid104_fpDivTest_b <= redist22_fracPostRndF_uid80_fpDivTest_q_5_q(23 downto 1);

    -- redist13_fracPostRndFT_uid104_fpDivTest_b_1(DELAY,372)
    redist13_fracPostRndFT_uid104_fpDivTest_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracPostRndFT_uid104_fpDivTest_b, xout => redist13_fracPostRndFT_uid104_fpDivTest_b_1_q, clk => clk, aclr => areset );

    -- fracRPreExcExt_uid105_fpDivTest(ADD,104)@22
    fracRPreExcExt_uid105_fpDivTest_a <= STD_LOGIC_VECTOR("0" & redist13_fracPostRndFT_uid104_fpDivTest_b_1_q);
    fracRPreExcExt_uid105_fpDivTest_b <= STD_LOGIC_VECTOR("00000000000000000000000" & extraUlp_uid103_fpDivTest_q);
    fracRPreExcExt_uid105_fpDivTest_o <= STD_LOGIC_VECTOR(UNSIGNED(fracRPreExcExt_uid105_fpDivTest_a) + UNSIGNED(fracRPreExcExt_uid105_fpDivTest_b));
    fracRPreExcExt_uid105_fpDivTest_q <= fracRPreExcExt_uid105_fpDivTest_o(23 downto 0);

    -- ovfIncRnd_uid109_fpDivTest(BITSELECT,108)@22
    ovfIncRnd_uid109_fpDivTest_b <= STD_LOGIC_VECTOR(fracRPreExcExt_uid105_fpDivTest_q(23 downto 23));

    -- redist12_ovfIncRnd_uid109_fpDivTest_b_1(DELAY,371)
    redist12_ovfIncRnd_uid109_fpDivTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => ovfIncRnd_uid109_fpDivTest_b, xout => redist12_ovfIncRnd_uid109_fpDivTest_b_1_q, clk => clk, aclr => areset );

    -- expFracPostRndInc_uid110_fpDivTest(ADD,109)@23
    expFracPostRndInc_uid110_fpDivTest_a <= STD_LOGIC_VECTOR("0" & redist21_expPostRndFR_uid81_fpDivTest_b_7_q);
    expFracPostRndInc_uid110_fpDivTest_b <= STD_LOGIC_VECTOR("00000000" & redist12_ovfIncRnd_uid109_fpDivTest_b_1_q);
    expFracPostRndInc_uid110_fpDivTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracPostRndInc_uid110_fpDivTest_a) + UNSIGNED(expFracPostRndInc_uid110_fpDivTest_b));
    expFracPostRndInc_uid110_fpDivTest_q <= expFracPostRndInc_uid110_fpDivTest_o(8 downto 0);

    -- expFracPostRndR_uid111_fpDivTest(BITSELECT,110)@23
    expFracPostRndR_uid111_fpDivTest_in <= expFracPostRndInc_uid110_fpDivTest_q(7 downto 0);
    expFracPostRndR_uid111_fpDivTest_b <= expFracPostRndR_uid111_fpDivTest_in(7 downto 0);

    -- redist21_expPostRndFR_uid81_fpDivTest_b_7(DELAY,380)
    redist21_expPostRndFR_uid81_fpDivTest_b_7 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist20_expPostRndFR_uid81_fpDivTest_b_3_q, xout => redist21_expPostRndFR_uid81_fpDivTest_b_7_q, clk => clk, aclr => areset );

    -- redist14_extraUlp_uid103_fpDivTest_q_2(DELAY,373)
    redist14_extraUlp_uid103_fpDivTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => extraUlp_uid103_fpDivTest_q, xout => redist14_extraUlp_uid103_fpDivTest_q_2_q, clk => clk, aclr => areset );

    -- expRPreExc_uid112_fpDivTest(MUX,111)@23
    expRPreExc_uid112_fpDivTest_s <= redist14_extraUlp_uid103_fpDivTest_q_2_q;
    expRPreExc_uid112_fpDivTest_combproc: PROCESS (expRPreExc_uid112_fpDivTest_s, redist21_expPostRndFR_uid81_fpDivTest_b_7_q, expFracPostRndR_uid111_fpDivTest_b)
    BEGIN
        CASE (expRPreExc_uid112_fpDivTest_s) IS
            WHEN "0" => expRPreExc_uid112_fpDivTest_q <= redist21_expPostRndFR_uid81_fpDivTest_b_7_q;
            WHEN "1" => expRPreExc_uid112_fpDivTest_q <= expFracPostRndR_uid111_fpDivTest_b;
            WHEN OTHERS => expRPreExc_uid112_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- invExpXIsMax_uid43_fpDivTest(LOGICAL,42)@16
    invExpXIsMax_uid43_fpDivTest_q <= not (expXIsMax_uid38_fpDivTest_q);

    -- InvExpXIsZero_uid44_fpDivTest(LOGICAL,43)@16
    InvExpXIsZero_uid44_fpDivTest_q <= not (excZ_y_uid37_fpDivTest_q);

    -- excR_y_uid45_fpDivTest(LOGICAL,44)@16
    excR_y_uid45_fpDivTest_q <= InvExpXIsZero_uid44_fpDivTest_q and invExpXIsMax_uid43_fpDivTest_q;

    -- excXIYR_uid127_fpDivTest(LOGICAL,126)@16
    excXIYR_uid127_fpDivTest_q <= excI_x_uid27_fpDivTest_q and excR_y_uid45_fpDivTest_q;

    -- excXIYZ_uid126_fpDivTest(LOGICAL,125)@16
    excXIYZ_uid126_fpDivTest_q <= excI_x_uid27_fpDivTest_q and excZ_y_uid37_fpDivTest_q;

    -- expRExt_uid114_fpDivTest(BITSELECT,113)@16
    expRExt_uid114_fpDivTest_b <= STD_LOGIC_VECTOR(expFracPostRnd_uid76_fpDivTest_q(35 downto 25));

    -- expOvf_uid118_fpDivTest(COMPARE,117)@16
    expOvf_uid118_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 11 => expRExt_uid114_fpDivTest_b(10)) & expRExt_uid114_fpDivTest_b));
    expOvf_uid118_fpDivTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000" & cstAllOWE_uid18_fpDivTest_q));
    expOvf_uid118_fpDivTest_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid118_fpDivTest_a) - SIGNED(expOvf_uid118_fpDivTest_b));
    expOvf_uid118_fpDivTest_n(0) <= not (expOvf_uid118_fpDivTest_o(12));

    -- invExpXIsMax_uid29_fpDivTest(LOGICAL,28)@16
    invExpXIsMax_uid29_fpDivTest_q <= not (expXIsMax_uid24_fpDivTest_q);

    -- InvExpXIsZero_uid30_fpDivTest(LOGICAL,29)@16
    InvExpXIsZero_uid30_fpDivTest_q <= not (excZ_x_uid23_fpDivTest_q);

    -- excR_x_uid31_fpDivTest(LOGICAL,30)@16
    excR_x_uid31_fpDivTest_q <= InvExpXIsZero_uid30_fpDivTest_q and invExpXIsMax_uid29_fpDivTest_q;

    -- excXRYROvf_uid125_fpDivTest(LOGICAL,124)@16
    excXRYROvf_uid125_fpDivTest_q <= excR_x_uid31_fpDivTest_q and excR_y_uid45_fpDivTest_q and expOvf_uid118_fpDivTest_n;

    -- excXRYZ_uid124_fpDivTest(LOGICAL,123)@16
    excXRYZ_uid124_fpDivTest_q <= excR_x_uid31_fpDivTest_q and excZ_y_uid37_fpDivTest_q;

    -- excRInf_uid128_fpDivTest(LOGICAL,127)@16 + 1
    excRInf_uid128_fpDivTest_qi <= excXRYZ_uid124_fpDivTest_q or excXRYROvf_uid125_fpDivTest_q or excXIYZ_uid126_fpDivTest_q or excXIYR_uid127_fpDivTest_q;
    excRInf_uid128_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRInf_uid128_fpDivTest_qi, xout => excRInf_uid128_fpDivTest_q, clk => clk, aclr => areset );

    -- xRegOrZero_uid121_fpDivTest(LOGICAL,120)@16
    xRegOrZero_uid121_fpDivTest_q <= excR_x_uid31_fpDivTest_q or excZ_x_uid23_fpDivTest_q;

    -- regOrZeroOverInf_uid122_fpDivTest(LOGICAL,121)@16 + 1
    regOrZeroOverInf_uid122_fpDivTest_qi <= xRegOrZero_uid121_fpDivTest_q and excI_y_uid41_fpDivTest_q;
    regOrZeroOverInf_uid122_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => regOrZeroOverInf_uid122_fpDivTest_qi, xout => regOrZeroOverInf_uid122_fpDivTest_q, clk => clk, aclr => areset );

    -- expUdf_uid115_fpDivTest(COMPARE,114)@16
    expUdf_uid115_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000000000" & GND_q));
    expUdf_uid115_fpDivTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 11 => expRExt_uid114_fpDivTest_b(10)) & expRExt_uid114_fpDivTest_b));
    expUdf_uid115_fpDivTest_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid115_fpDivTest_a) - SIGNED(expUdf_uid115_fpDivTest_b));
    expUdf_uid115_fpDivTest_n(0) <= not (expUdf_uid115_fpDivTest_o(12));

    -- regOverRegWithUf_uid120_fpDivTest(LOGICAL,119)@16 + 1
    regOverRegWithUf_uid120_fpDivTest_qi <= expUdf_uid115_fpDivTest_n and excR_x_uid31_fpDivTest_q and excR_y_uid45_fpDivTest_q;
    regOverRegWithUf_uid120_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => regOverRegWithUf_uid120_fpDivTest_qi, xout => regOverRegWithUf_uid120_fpDivTest_q, clk => clk, aclr => areset );

    -- zeroOverReg_uid119_fpDivTest(LOGICAL,118)@16 + 1
    zeroOverReg_uid119_fpDivTest_qi <= excZ_x_uid23_fpDivTest_q and excR_y_uid45_fpDivTest_q;
    zeroOverReg_uid119_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => zeroOverReg_uid119_fpDivTest_qi, xout => zeroOverReg_uid119_fpDivTest_q, clk => clk, aclr => areset );

    -- excRZero_uid123_fpDivTest(LOGICAL,122)@17
    excRZero_uid123_fpDivTest_q <= zeroOverReg_uid119_fpDivTest_q or regOverRegWithUf_uid120_fpDivTest_q or regOrZeroOverInf_uid122_fpDivTest_q;

    -- concExc_uid132_fpDivTest(BITJOIN,131)@17
    concExc_uid132_fpDivTest_q <= excRNaN_uid131_fpDivTest_q & excRInf_uid128_fpDivTest_q & excRZero_uid123_fpDivTest_q;

    -- excREnc_uid133_fpDivTest(LOOKUP,132)@17 + 1
    excREnc_uid133_fpDivTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excREnc_uid133_fpDivTest_q <= "01";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (concExc_uid132_fpDivTest_q) IS
                WHEN "000" => excREnc_uid133_fpDivTest_q <= "01";
                WHEN "001" => excREnc_uid133_fpDivTest_q <= "00";
                WHEN "010" => excREnc_uid133_fpDivTest_q <= "10";
                WHEN "011" => excREnc_uid133_fpDivTest_q <= "00";
                WHEN "100" => excREnc_uid133_fpDivTest_q <= "11";
                WHEN "101" => excREnc_uid133_fpDivTest_q <= "00";
                WHEN "110" => excREnc_uid133_fpDivTest_q <= "00";
                WHEN "111" => excREnc_uid133_fpDivTest_q <= "00";
                WHEN OTHERS => -- unreachable
                               excREnc_uid133_fpDivTest_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- redist11_excREnc_uid133_fpDivTest_q_6(DELAY,370)
    redist11_excREnc_uid133_fpDivTest_q_6 : dspba_delay
    GENERIC MAP ( width => 2, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => excREnc_uid133_fpDivTest_q, xout => redist11_excREnc_uid133_fpDivTest_q_6_q, clk => clk, aclr => areset );

    -- expRPostExc_uid141_fpDivTest(MUX,140)@23
    expRPostExc_uid141_fpDivTest_s <= redist11_excREnc_uid133_fpDivTest_q_6_q;
    expRPostExc_uid141_fpDivTest_combproc: PROCESS (expRPostExc_uid141_fpDivTest_s, cstAllZWE_uid20_fpDivTest_q, expRPreExc_uid112_fpDivTest_q, cstAllOWE_uid18_fpDivTest_q)
    BEGIN
        CASE (expRPostExc_uid141_fpDivTest_s) IS
            WHEN "00" => expRPostExc_uid141_fpDivTest_q <= cstAllZWE_uid20_fpDivTest_q;
            WHEN "01" => expRPostExc_uid141_fpDivTest_q <= expRPreExc_uid112_fpDivTest_q;
            WHEN "10" => expRPostExc_uid141_fpDivTest_q <= cstAllOWE_uid18_fpDivTest_q;
            WHEN "11" => expRPostExc_uid141_fpDivTest_q <= cstAllOWE_uid18_fpDivTest_q;
            WHEN OTHERS => expRPostExc_uid141_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid134_fpDivTest(CONSTANT,133)
    oneFracRPostExc2_uid134_fpDivTest_q <= "00000000000000000000001";

    -- fracPostRndFPostUlp_uid106_fpDivTest(BITSELECT,105)@22
    fracPostRndFPostUlp_uid106_fpDivTest_in <= fracRPreExcExt_uid105_fpDivTest_q(22 downto 0);
    fracPostRndFPostUlp_uid106_fpDivTest_b <= fracPostRndFPostUlp_uid106_fpDivTest_in(22 downto 0);

    -- fracRPreExc_uid107_fpDivTest(MUX,106)@22 + 1
    fracRPreExc_uid107_fpDivTest_s <= extraUlp_uid103_fpDivTest_q;
    fracRPreExc_uid107_fpDivTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPreExc_uid107_fpDivTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRPreExc_uid107_fpDivTest_s) IS
                WHEN "0" => fracRPreExc_uid107_fpDivTest_q <= redist13_fracPostRndFT_uid104_fpDivTest_b_1_q;
                WHEN "1" => fracRPreExc_uid107_fpDivTest_q <= fracPostRndFPostUlp_uid106_fpDivTest_b;
                WHEN OTHERS => fracRPreExc_uid107_fpDivTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- fracRPostExc_uid137_fpDivTest(MUX,136)@23
    fracRPostExc_uid137_fpDivTest_s <= redist11_excREnc_uid133_fpDivTest_q_6_q;
    fracRPostExc_uid137_fpDivTest_combproc: PROCESS (fracRPostExc_uid137_fpDivTest_s, paddingY_uid15_fpDivTest_q, fracRPreExc_uid107_fpDivTest_q, oneFracRPostExc2_uid134_fpDivTest_q)
    BEGIN
        CASE (fracRPostExc_uid137_fpDivTest_s) IS
            WHEN "00" => fracRPostExc_uid137_fpDivTest_q <= paddingY_uid15_fpDivTest_q;
            WHEN "01" => fracRPostExc_uid137_fpDivTest_q <= fracRPreExc_uid107_fpDivTest_q;
            WHEN "10" => fracRPostExc_uid137_fpDivTest_q <= paddingY_uid15_fpDivTest_q;
            WHEN "11" => fracRPostExc_uid137_fpDivTest_q <= oneFracRPostExc2_uid134_fpDivTest_q;
            WHEN OTHERS => fracRPostExc_uid137_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- divR_uid144_fpDivTest(BITJOIN,143)@23
    divR_uid144_fpDivTest_q <= redist10_sRPostExc_uid143_fpDivTest_q_6_q & expRPostExc_uid141_fpDivTest_q & fracRPostExc_uid137_fpDivTest_q;

    -- xOut(GPOUT,4)@23
    q <= divR_uid144_fpDivTest_q;

END normal;
