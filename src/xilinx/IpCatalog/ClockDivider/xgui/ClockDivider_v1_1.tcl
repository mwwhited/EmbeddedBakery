# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  set DividerCount [ipgui::add_param $IPINST -name "DividerCount" -parent ${Page_0}]
  set_property tooltip {This count will be used to divide down input clocks} ${DividerCount}


}

proc update_PARAM_VALUE.DividerCount { PARAM_VALUE.DividerCount } {
	# Procedure called to update DividerCount when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DividerCount { PARAM_VALUE.DividerCount } {
	# Procedure called to validate DividerCount
	return true
}


proc update_MODELPARAM_VALUE.DividerCount { MODELPARAM_VALUE.DividerCount PARAM_VALUE.DividerCount } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DividerCount}] ${MODELPARAM_VALUE.DividerCount}
}

