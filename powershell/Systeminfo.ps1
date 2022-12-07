# my lab 4 script#
###system hardware description##
echo "------------hardware info------------


" 
function hardwaresys {
	gwmi win32_computersystem | format-list
}
hardwaresys

echo "------------OS info------------


" 
###operating system name and version number####
function systemos {
	(gwmi win32_operatingsystem).Caption
	(gwmi win32_operatingsystem).Version
}
systemos
echo "processor info


" 
#processor description#
function prossinfo {
gwmi win32_processor | format-list
}
prossinfo
echo "------------RAM info------------


" 
###summary of the RAM installed####
function ramsys {
$totalcapacity = 0
get-wmiobject -class win32_physicalmemory |
foreach {
 new-object -TypeName psobject -Property @{
 Manufacturer = $_.manufacturer
 "Speed(MHz)" = $_.speed
 "Size(MB)" = $_.capacity/1mb
 Bank = $_.banklabel
 Slot = $_.devicelocator
 }
 $totalcapacity += $_.capacity/1mb
} |
ft -auto Manufacturer, "Size(MB)", "Speed(MHz)", Bank, Slot
"Total RAM: ${totalcapacity}MB "

}
ramsys
echo "------------Disk info------------


" 

#summary of the physical disk drives#
function Diskinfo {

gwmi -class win32_logicaldisk | where-object size -gt 0 | format-table -autosize DeviceID, @{n="Size(GB)"; e={$_.size/1gb -as [int]}}, @{n="Free(GB)"; e={$_.freespace/1gb -as [int]}}, @{n="% Free"; e={100*$_.freespace/$_.size -as [int]}}
}

Diskinfo

#network adapter configuration report from lab 3#
echo "------------Network Adapter info------------


" 
function netinfo {
get-ciminstance win32_networkadapterconfiguration | where-object ipenabled |Format-Table Description ,Index, IPAddress, IPSubnet, DNSDomain,  DNSServerSearchOrder
}
netinfo

#video card info#
