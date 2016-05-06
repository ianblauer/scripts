$nasVolume = "N:\"

Add-WindowsFeature FS-Resource-Manager
New-Item notification.txt -type file
Add-Content notification.txt "Notification=E"
Add-Content notification.txt "`nRunLimitInterval=0"
Add-Content notification.txt "`nMessage=User [Source Io Owner] attempted to save [Source File Path] to [File Screen Path] on the [Server] server in the [Server Domain] domain. This file is in the [Violated File Group] file group."
filescrn Filegroup Add /Filegroup:"Cryptolocker Files" /Members:"help_decrypt.*|decrypt_instructions.*|restore_files.*|*.encrypted|*.cryptolocker|help_your_files.*|*.vvv|*.crypt|_locky_recover_instructions.*|_h_e_l_p_recover_instructions*|de_crypt_readme*"
filescrn Screen Add /Path:"$nasVolume" /Add-Filegroup:"Cryptolocker Files" /Type:"Passive" /Add-Notification:"E,notification.txt"