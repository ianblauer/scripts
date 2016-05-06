$nasVolume = "N:\"
$includePattern = "help_your_files.*","help_decrypt.*","decrypt_instructions.*","restore_files.*","*.encrypted","*.cryptolocker","*.vvv","*.crypt","_locky_recover_instructions.*","_h_e_l_p_recover_instructions*","de_crypt_readme*"

Add-WindowsFeature FS-Resource-Manager -IncludeManagementTools

$Notification = New-FsrmAction Event -EventType Information -Body 'User [Source Io Owner] attempted to save [Source File Path] to [File Screen Path] on the [Server] server in the [Server Domain] domain. This file is in the [Violated File Group] file group.' -RunLimitInterval 0

Set-FsrmSetting -EventNotificationLimit 0
New-FsrmFileGroup -Description "Cryptolocker Files" -Name "Cryptolocker Files" -IncludePattern $includePattern
New-FsrmFileScreen -Description "Cryptolocker Screen" -Path $nasVolume –IncludeGroup "Cryptolocker Files" -Notification $Notification