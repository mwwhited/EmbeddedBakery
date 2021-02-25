# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "counterLength" -parent ${Page_0}
  ipgui::add_param $IPINST -name "counterTarget" -parent ${Page_0}


}

proc update_PARAM_VALUE.counterLength { PARAM_VALUE.counterLength } {
	# Procedure called to update counterLength when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.counterLength { PARAM_VALUE.counterLength } {
	# Procedure called to validate counterLength
	return true
}

proc update_PARAM_VALUE.counterTarget { PARAM_VALUE.counterTarget } {
	# Procedure called to update counterTarget when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.counterTarget { PARAM_VALUE.counterTarget } {
	# Procedure called to validate counterTarget
	return true
}


proc update_MODELPARAM_VALUE.counterLength { MODELPARAM_VALUE.counterLength PARAM_VALUE.counterLength } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.counterLength}] ${MODELPARAM_VALUE.counterLength}
}

proc update_MODELPARAM_VALUE.counterTarget { MODELPARAM_VALUE.counterTarget PARAM_VALUE.counterTarget } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.counterTarget}] ${MODELPARAM_VALUE.counterTarget}
}

