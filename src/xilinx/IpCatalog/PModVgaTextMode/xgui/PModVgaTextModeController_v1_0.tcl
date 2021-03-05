# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "CharacterColumns" -parent ${Page_0}
  ipgui::add_param $IPINST -name "CharacterLines" -parent ${Page_0}
  ipgui::add_param $IPINST -name "CharacterPixelHeight" -parent ${Page_0}
  ipgui::add_param $IPINST -name "CharacterPixelWidth" -parent ${Page_0}
  ipgui::add_param $IPINST -name "FrameHeight" -parent ${Page_0}
  ipgui::add_param $IPINST -name "FrameWidth" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HMaxPixels" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HPolarization" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HfpPixels" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HpwPixels" -parent ${Page_0}
  ipgui::add_param $IPINST -name "VMaxLines" -parent ${Page_0}
  ipgui::add_param $IPINST -name "VPolarization" -parent ${Page_0}
  ipgui::add_param $IPINST -name "VfpLines" -parent ${Page_0}
  ipgui::add_param $IPINST -name "VpwLines" -parent ${Page_0}


}

proc update_PARAM_VALUE.CharacterColumns { PARAM_VALUE.CharacterColumns } {
	# Procedure called to update CharacterColumns when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CharacterColumns { PARAM_VALUE.CharacterColumns } {
	# Procedure called to validate CharacterColumns
	return true
}

proc update_PARAM_VALUE.CharacterLines { PARAM_VALUE.CharacterLines } {
	# Procedure called to update CharacterLines when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CharacterLines { PARAM_VALUE.CharacterLines } {
	# Procedure called to validate CharacterLines
	return true
}

proc update_PARAM_VALUE.CharacterPixelHeight { PARAM_VALUE.CharacterPixelHeight } {
	# Procedure called to update CharacterPixelHeight when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CharacterPixelHeight { PARAM_VALUE.CharacterPixelHeight } {
	# Procedure called to validate CharacterPixelHeight
	return true
}

proc update_PARAM_VALUE.CharacterPixelWidth { PARAM_VALUE.CharacterPixelWidth } {
	# Procedure called to update CharacterPixelWidth when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CharacterPixelWidth { PARAM_VALUE.CharacterPixelWidth } {
	# Procedure called to validate CharacterPixelWidth
	return true
}

proc update_PARAM_VALUE.FrameHeight { PARAM_VALUE.FrameHeight } {
	# Procedure called to update FrameHeight when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FrameHeight { PARAM_VALUE.FrameHeight } {
	# Procedure called to validate FrameHeight
	return true
}

proc update_PARAM_VALUE.FrameWidth { PARAM_VALUE.FrameWidth } {
	# Procedure called to update FrameWidth when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FrameWidth { PARAM_VALUE.FrameWidth } {
	# Procedure called to validate FrameWidth
	return true
}

proc update_PARAM_VALUE.HCounterWidth { PARAM_VALUE.HCounterWidth } {
	# Procedure called to update HCounterWidth when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HCounterWidth { PARAM_VALUE.HCounterWidth } {
	# Procedure called to validate HCounterWidth
	return true
}

proc update_PARAM_VALUE.HMaxPixels { PARAM_VALUE.HMaxPixels } {
	# Procedure called to update HMaxPixels when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HMaxPixels { PARAM_VALUE.HMaxPixels } {
	# Procedure called to validate HMaxPixels
	return true
}

proc update_PARAM_VALUE.HPolarization { PARAM_VALUE.HPolarization } {
	# Procedure called to update HPolarization when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HPolarization { PARAM_VALUE.HPolarization } {
	# Procedure called to validate HPolarization
	return true
}

proc update_PARAM_VALUE.HfpPixels { PARAM_VALUE.HfpPixels } {
	# Procedure called to update HfpPixels when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HfpPixels { PARAM_VALUE.HfpPixels } {
	# Procedure called to validate HfpPixels
	return true
}

proc update_PARAM_VALUE.HpwPixels { PARAM_VALUE.HpwPixels } {
	# Procedure called to update HpwPixels when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HpwPixels { PARAM_VALUE.HpwPixels } {
	# Procedure called to validate HpwPixels
	return true
}

proc update_PARAM_VALUE.VCounterWidth { PARAM_VALUE.VCounterWidth } {
	# Procedure called to update VCounterWidth when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VCounterWidth { PARAM_VALUE.VCounterWidth } {
	# Procedure called to validate VCounterWidth
	return true
}

proc update_PARAM_VALUE.VMaxLines { PARAM_VALUE.VMaxLines } {
	# Procedure called to update VMaxLines when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VMaxLines { PARAM_VALUE.VMaxLines } {
	# Procedure called to validate VMaxLines
	return true
}

proc update_PARAM_VALUE.VPolarization { PARAM_VALUE.VPolarization } {
	# Procedure called to update VPolarization when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VPolarization { PARAM_VALUE.VPolarization } {
	# Procedure called to validate VPolarization
	return true
}

proc update_PARAM_VALUE.VfpLines { PARAM_VALUE.VfpLines } {
	# Procedure called to update VfpLines when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VfpLines { PARAM_VALUE.VfpLines } {
	# Procedure called to validate VfpLines
	return true
}

proc update_PARAM_VALUE.VpwLines { PARAM_VALUE.VpwLines } {
	# Procedure called to update VpwLines when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VpwLines { PARAM_VALUE.VpwLines } {
	# Procedure called to validate VpwLines
	return true
}

proc update_PARAM_VALUE.XPixelSubDivision { PARAM_VALUE.XPixelSubDivision } {
	# Procedure called to update XPixelSubDivision when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.XPixelSubDivision { PARAM_VALUE.XPixelSubDivision } {
	# Procedure called to validate XPixelSubDivision
	return true
}

proc update_PARAM_VALUE.YPixelSubDivision { PARAM_VALUE.YPixelSubDivision } {
	# Procedure called to update YPixelSubDivision when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.YPixelSubDivision { PARAM_VALUE.YPixelSubDivision } {
	# Procedure called to validate YPixelSubDivision
	return true
}


proc update_MODELPARAM_VALUE.FrameWidth { MODELPARAM_VALUE.FrameWidth PARAM_VALUE.FrameWidth } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FrameWidth}] ${MODELPARAM_VALUE.FrameWidth}
}

proc update_MODELPARAM_VALUE.FrameHeight { MODELPARAM_VALUE.FrameHeight PARAM_VALUE.FrameHeight } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FrameHeight}] ${MODELPARAM_VALUE.FrameHeight}
}

proc update_MODELPARAM_VALUE.HfpPixels { MODELPARAM_VALUE.HfpPixels PARAM_VALUE.HfpPixels } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HfpPixels}] ${MODELPARAM_VALUE.HfpPixels}
}

proc update_MODELPARAM_VALUE.HpwPixels { MODELPARAM_VALUE.HpwPixels PARAM_VALUE.HpwPixels } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HpwPixels}] ${MODELPARAM_VALUE.HpwPixels}
}

proc update_MODELPARAM_VALUE.HMaxPixels { MODELPARAM_VALUE.HMaxPixels PARAM_VALUE.HMaxPixels } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HMaxPixels}] ${MODELPARAM_VALUE.HMaxPixels}
}

proc update_MODELPARAM_VALUE.HPolarization { MODELPARAM_VALUE.HPolarization PARAM_VALUE.HPolarization } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HPolarization}] ${MODELPARAM_VALUE.HPolarization}
}

proc update_MODELPARAM_VALUE.VfpLines { MODELPARAM_VALUE.VfpLines PARAM_VALUE.VfpLines } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VfpLines}] ${MODELPARAM_VALUE.VfpLines}
}

proc update_MODELPARAM_VALUE.VpwLines { MODELPARAM_VALUE.VpwLines PARAM_VALUE.VpwLines } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VpwLines}] ${MODELPARAM_VALUE.VpwLines}
}

proc update_MODELPARAM_VALUE.VMaxLines { MODELPARAM_VALUE.VMaxLines PARAM_VALUE.VMaxLines } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VMaxLines}] ${MODELPARAM_VALUE.VMaxLines}
}

proc update_MODELPARAM_VALUE.VPolarization { MODELPARAM_VALUE.VPolarization PARAM_VALUE.VPolarization } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VPolarization}] ${MODELPARAM_VALUE.VPolarization}
}

proc update_MODELPARAM_VALUE.CharacterColumns { MODELPARAM_VALUE.CharacterColumns PARAM_VALUE.CharacterColumns } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CharacterColumns}] ${MODELPARAM_VALUE.CharacterColumns}
}

proc update_MODELPARAM_VALUE.CharacterLines { MODELPARAM_VALUE.CharacterLines PARAM_VALUE.CharacterLines } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CharacterLines}] ${MODELPARAM_VALUE.CharacterLines}
}

proc update_MODELPARAM_VALUE.CharacterPixelWidth { MODELPARAM_VALUE.CharacterPixelWidth PARAM_VALUE.CharacterPixelWidth } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CharacterPixelWidth}] ${MODELPARAM_VALUE.CharacterPixelWidth}
}

proc update_MODELPARAM_VALUE.CharacterPixelHeight { MODELPARAM_VALUE.CharacterPixelHeight PARAM_VALUE.CharacterPixelHeight } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CharacterPixelHeight}] ${MODELPARAM_VALUE.CharacterPixelHeight}
}

proc update_MODELPARAM_VALUE.XPixelSubDivision { MODELPARAM_VALUE.XPixelSubDivision PARAM_VALUE.XPixelSubDivision } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.XPixelSubDivision}] ${MODELPARAM_VALUE.XPixelSubDivision}
}

proc update_MODELPARAM_VALUE.YPixelSubDivision { MODELPARAM_VALUE.YPixelSubDivision PARAM_VALUE.YPixelSubDivision } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.YPixelSubDivision}] ${MODELPARAM_VALUE.YPixelSubDivision}
}

proc update_MODELPARAM_VALUE.HCounterWidth { MODELPARAM_VALUE.HCounterWidth PARAM_VALUE.HCounterWidth } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HCounterWidth}] ${MODELPARAM_VALUE.HCounterWidth}
}

proc update_MODELPARAM_VALUE.VCounterWidth { MODELPARAM_VALUE.VCounterWidth PARAM_VALUE.VCounterWidth } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VCounterWidth}] ${MODELPARAM_VALUE.VCounterWidth}
}

