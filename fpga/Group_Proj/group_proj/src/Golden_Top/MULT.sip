set_global_assignment -entity "MULT" -library "lib_MULT" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "MULT" -library "lib_MULT" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "MULT" -library "lib_MULT" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_MULT" -name SPD_FILE [file join $::quartus(sip_path) "MULT.spd"]

set_global_assignment -library "lib_MULT" -name MISC_FILE [file join $::quartus(sip_path) "MULT_sim/MULT.vo"]
