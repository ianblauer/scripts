$includePattern = "help_your_files.*","help_decrypt.*","decrypt_instructions.*","restore_files.*","*.encrypted","*.cryptolocker","*.vvv","*.crypt","_locky_recover_instructions.*","_h_e_l_p_recover_instructions*","de_crypt_readme*"

Set-FsrmFileGroup "Cryptolocker Files" -IncludePattern $includePattern