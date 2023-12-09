aur_helper(){
    cat <<- EOF
		[*2*] We need an AUR helper. It is essential.
		
		[*] Choose your AUR helper.
		[1] yay
		[2] paru
	
	EOF

    read -p "[?] Select option: "
    if [[ $REPLY == "1" ]]; then
        HELPER="yay"
        if ! command -v $HELPER &> /dev/null
        then
        echo -e "\n[*] It seems that you don't have $HELPER installed, I'll install that for you before continuing."
	    git clone https://aur.archlinux.org/$HELPER.git $HOME/.srcs/$HELPER
	    (cd $HOME/.srcs/$HELPER/ && makepkg -si )
        else
        echo -e "\n[*] It seems that you already have $HELPER installed, skipping."
        fi
    elif [[ $REPLY == "2" ]]; then
        HELPER="paru"
        if ! command -v $HELPER &> /dev/null
        then
        echo -e "\n[*] It seems that you don't have $HELPER installed, I'll install that for you before continuing."
	    git clone https://aur.archlinux.org/$HELPER.git $HOME/.srcs/$HELPER
	    (cd $HOME/.srcs/$HELPER/ && makepkg -si )
        else
        echo -e "\n[*] It seems that you already have $HELPER installed, skipping."
        fi
    else
		echo -e "\n[!] Invalid option, exiting...\n"
		exit 1
	fi
}

aur_helper
