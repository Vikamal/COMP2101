function get-cpuinfo {
	(get-ciminstance cim_processor).Manufacturer
	(get-ciminstance cim_processor).Caption
	(get-ciminstance cim_processor).MaxClockSpeed
	(get-ciminstance cim_processor).numberofcore
}
get-cpuinfo