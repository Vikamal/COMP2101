function get-mydisks {	
	(Get-Disk).Manufacturer
	(Get-Disk).model
	(Get-Disk).SerialNumber
	(Get-Disk).FirmwareRevision
	(Get-Disk).Size
}


get-mydisks | format-table

	
	
	
	