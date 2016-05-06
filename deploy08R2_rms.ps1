#Determines if the File Services role is installed and File Server Resource Manager is not installed
$fileServerRole = @(Import-Module ServerManager ; Get-WindowsFeature | where {$_.name -eq "FS-FileServer" -and $_.installed -eq "True"}).Count
$fileServerRmRole = @(Import-Module ServerManager ; Get-WindowsFeature | where {$_.name -eq "FS-Resource-Manager" -and $_.installed -eq "True"}).Count

#Installs File Server Resource Manager with file screens if File Server role is installed and the File Server Resource Manager role is not already installed
If ($fileServerRole -eq 1 -AND $fileServerRmRole -eq 0){
	$volumes = gwmi win32_logicaldisk -filter DriveType=3 | Select -ExpandProperty DeviceID
	$members = "help_decrypt.*|decrypt_instructions.*|restore_files.*|*.encrypted|*.cryptolocker|help_your_files.*|*.vvv|*.crypt|_locky_recover_instructions.*|_h_e_l_p_recover_instructions*|de_crypt_readme*"

	Add-WindowsFeature FS-Resource-Manager

	New-Item notification.txt -type file
	Add-Content notification.txt "Notification=E"
	Add-Content notification.txt "`nRunLimitInterval=0"
	Add-Content notification.txt "`nMessage=User [Source Io Owner] attempted to save [Source File Path] to [File Screen Path] on the [Server] server in the [Server Domain] domain. This file is in the [Violated File Group] file group."

	filescrn Filegroup Add /Filegroup:"Cryptolocker Files" /Members:$members

	foreach ($volume in $volumes) {
		$volumeString = $volume+"\"
		filescrn Screen Add /Path:$volumeString /Add-Filegroup:"Cryptolocker Files" /Type:"Passive" /Add-Notification:"E,notification.txt"
	}
	
	Remove-Item notification.txt
	
}

Else{
}