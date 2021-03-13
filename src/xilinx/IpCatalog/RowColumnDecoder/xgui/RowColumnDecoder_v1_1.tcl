# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "ColumnHeight" -parent ${Page_0}
  ipgui::add_param $IPINST -name "RowWidth" -parent ${Page_0}


}

proc update_PARAM_VALUE.ColumnHeight { PARAM_VALUE.ColumnHeight } {
	# Procedure called to update ColumnHeight when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ColumnHeight { PARAM_VALUE.ColumnHeight } {
	# Procedure called to validate ColumnHeight
	return true
}

proc update_PARAM_VALUE.RowWidth { PARAM_VALUE.RowWidth } {
	# Procedure called to update RowWidth when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RowWidth { PARAM_VALUE.RowWidth } {
	# Procedure called to validate RowWidth
	return true
}


proc update_MODELPARAM_VALUE.ColumnHeight { MODELPARAM_VALUE.ColumnHeight PARAM_VALUE.ColumnHeight } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ColumnHeight}] ${MODELPARAM_VALUE.ColumnHeight}
}

proc update_MODELPARAM_VALUE.RowWidth { MODELPARAM_VALUE.RowWidth PARAM_VALUE.RowWidth } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RowWidth}] ${MODELPARAM_VALUE.RowWidth}
}

