# Activate Windows 10 with MAC Key
$computer = gc env:computername
$key = "MGBQD-N84GC-Y6XRD-H2PXG-PDKTY"
$service = get-wmiObject -query "select * from SoftwareLicensingService" -computername $computer
$service.InstallProductKey($key)
$service.RefreshLicenseStatus()

# Activate Office 2013 with Key
Set-Location “C:\Program Files (x86)\Microsoft Office\Office15”
CScript OSPP.vbs /InpKey:2KCHN-RQ3W6-P6GJ4-RM6MM-YWPDH
CScript OSPP.vbs /act

# Activate Office 2013 with Key
Set-Location “C:\Program Files\Microsoft Office\Office15”
CScript OSPP.vbs /InpKey:2KCHN-RQ3W6-P6GJ4-RM6MM-YWPDH
CScript OSPP.vbs /act