set_global_assignment -entity "CORDIC" -library "lib_CORDIC" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "CORDIC" -library "lib_CORDIC" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "CORDIC" -library "lib_CORDIC" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_CORDIC" -name SPD_FILE [file join $::quartus(sip_path) "CORDIC.spd"]

set_global_assignment -library "lib_CORDIC" -name MISC_FILE [file join $::quartus(sip_path) "CORDIC_sim/CORDIC_memoryC0_uid353_atan2Tables_lutmem.hex"]
set_global_assignment -library "lib_CORDIC" -name MISC_FILE [file join $::quartus(sip_path) "CORDIC_sim/CORDIC_memoryC0_uid380_invTables_lutmem.hex"]
set_global_assignment -library "lib_CORDIC" -name MISC_FILE [file join $::quartus(sip_path) "CORDIC_sim/CORDIC_memoryC0_uid381_invTables_lutmem.hex"]
set_global_assignment -library "lib_CORDIC" -name MISC_FILE [file join $::quartus(sip_path) "CORDIC_sim/CORDIC_memoryC0_uid492_inverseTables_lutmem.hex"]
set_global_assignment -library "lib_CORDIC" -name MISC_FILE [file join $::quartus(sip_path) "CORDIC_sim/CORDIC_memoryC1_uid356_atan2Tables_lutmem.hex"]
set_global_assignment -library "lib_CORDIC" -name MISC_FILE [file join $::quartus(sip_path) "CORDIC_sim/CORDIC_memoryC1_uid384_invTables_lutmem.hex"]
set_global_assignment -library "lib_CORDIC" -name MISC_FILE [file join $::quartus(sip_path) "CORDIC_sim/CORDIC_memoryC1_uid385_invTables_lutmem.hex"]
set_global_assignment -library "lib_CORDIC" -name MISC_FILE [file join $::quartus(sip_path) "CORDIC_sim/CORDIC_memoryC1_uid495_inverseTables_lutmem.hex"]
set_global_assignment -library "lib_CORDIC" -name MISC_FILE [file join $::quartus(sip_path) "CORDIC_sim/CORDIC_memoryC2_uid359_atan2Tables_lutmem.hex"]
set_global_assignment -library "lib_CORDIC" -name MISC_FILE [file join $::quartus(sip_path) "CORDIC_sim/CORDIC_memoryC2_uid388_invTables_lutmem.hex"]
set_global_assignment -library "lib_CORDIC" -name MISC_FILE [file join $::quartus(sip_path) "CORDIC_sim/CORDIC_memoryC2_uid498_inverseTables_lutmem.hex"]
set_global_assignment -library "lib_CORDIC" -name MISC_FILE [file join $::quartus(sip_path) "CORDIC_sim/CORDIC.vo"]
