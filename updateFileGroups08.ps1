$members = "help_decrypt.*|decrypt_instructions.*|restore_files.*|*.encrypted|*.cryptolocker|help_your_files.*|*.vvv|*.crypt|_locky_recover_instructions.*|_h_e_l_p_recover_instructions*|de_crypt_readme*"

filescrn filegroup modify /filegroup:"Cryptolocker Files" /members:$members