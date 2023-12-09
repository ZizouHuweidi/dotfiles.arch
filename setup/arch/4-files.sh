copy_flies(){
    DATE=$(date +%s)
    echo -e "[*4*] Coping files."
    

    mv ~/.config ~/.config-bak
    mv ~/.Xauthority ~/.Xauthority-bak
    mv ~/.Xresources ~/.Xresources-bak
    mv ~/.fehbg ~/.fehbg-bak
    mv ~/.p10k.zsh ~/.p10k.zsh-bak
    mv ~/.tmux.conf ~/.tmux.conf-bak
    mv ~/.xprofile ~/.xprofile-bak
    mv ~/.zshrc ~/.zshrc-bak
    touch ~/.cache/zsh/history 
    mv ~/Pictures ~/Pictures-bak
    mv ~/.scripts ~/.scripts-bak
    rm -rf ~/.config
    cp -r ./config ~/.config
    cp ./config/.Xauthority ~/
    cp ./config/.Xresources ~/
    cp ./config/.fehbg ~/
    cp ./config/.p10k.zsh ~/
    cp ./config/.tmux.conf ~/
    cp ./config/.xprofile ~/
    cp ./config/.zshrc ~/
    cp -r ./config/.script ~/
    cp -r ./config/.ascii ~/
    cp -r ./config/.local/bin ~/
    cp -r ./Pictures ~/
    cp -r ./.scripts ~/
    cp -r ./fonts/* /usr/share/fonts/
    mkdir ~/screenshots
}


make_default_directories(){
    echo -e "[*6*] Making default directories."
    mkdir -p $HOME/Media/memes 
    mkdir -p $HOME/Media/videos 
    mkdir -p $HOME/Media/screenshots 
    mkdir -p $HOME/Audio
    mkdir -p $HOME/Projects
    mkdir -p $HOME/Games
    # mkdir -p $HOME/Documents
    # mkdir -p $HOME/Desktop
    # mkdir -p $HOME/Downloads
}

copy_flies
make_default_directories

