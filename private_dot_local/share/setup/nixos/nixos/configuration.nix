{ config, pkgs, lib, ... }:

let
  dbus-sway-environment = pkgs.writeTextFile {
    name = "dbus-sway-environment";
    destination = "/bin/dbus-sway-environment";
    executable = true;

    text = ''
      dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway
      systemctl --user stop pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
      systemctl --user start pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
    '';
  };

  configure-gtk = pkgs.writeTextFile {
    name = "configure-gtk";
    destination = "/bin/configure-gtk";
    executable = true;
    text = let
      schema = pkgs.gsettings-desktop-schemas;
      datadir = "${schema}/share/gsettings-schemas/${schema.name}";
    in ''
      export XDG_DATA_DIRS=${datadir}:$XDG_DATA_DIRS
      gnome_schema=org.gnome.desktop.interface
      gsettings set $gnome_schema gtk-theme 'Gruvbox-Material-Dark'
    '';
  };

in
{
  environment.systemPackages = with pkgs; [
    kitty
	  python-pillow
    dbus
    dbus-sway-environment
    configure-gtk
    wayland
    xdg-utils
    glib
    # dracula-theme # gtk theme
    gnome3.adwaita-icon-theme  # default gnome cursors
    swaylock
    swayidle
    grim # screenshot functionality
    slurp # screenshot functionality
    vivaldi
    bat
    zsh
    bash-completion
    fzf
    fzf-tab-bin-git
    zsh-autosuggestions
    zsh-syntax-highlighting
    ripgrep
    fd
    starship
    tldr
    zoxide
    swaybg
    waybar
    swayhide
    light 
    wofi 
    swappy 
    xorg-xwayland
    polkit-gnome
    tesseract-data-eng 
    wl-mirror 
    xwaylandvideobridge 
    swaync 
    cliphist
    nwg-look 
    wlogout 
    emote
    wdisplays 
    wl-clipboard
    wf-recorder
    wob
  ];

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
}
