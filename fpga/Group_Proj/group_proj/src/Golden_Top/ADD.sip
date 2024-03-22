set_global_assignment -entity "ADD" -library "lib_ADD" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "ADD" -library "lib_ADD" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "ADD" -library "lib_ADD" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_ADD" -name SPD_FILE [file join $::quartus(sip_path) "ADD.spd"]

set_global_assignment -library "lib_ADD" -name MISC_FILE [file join $::quartus(sip_path) "ADD_sim/ADD.vo"]
