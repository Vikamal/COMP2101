$screenshot = get-ciminstance win32_networkadapterconfiguration | where-object ipenabled |Format-Table Description ,Index, IPAddress, IPSubnet, DNSDomain,  DNSServerSearchOrder
$screenshot