set_global_assignment -entity "SUB" -library "lib_SUB" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "SUB" -library "lib_SUB" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "SUB" -library "lib_SUB" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_SUB" -name SPD_FILE [file join $::quartus(sip_path) "SUB.spd"]

set_global_assignment -library "lib_SUB" -name MISC_FILE [file join $::quartus(sip_path) "SUB_sim/SUB.vo"]
