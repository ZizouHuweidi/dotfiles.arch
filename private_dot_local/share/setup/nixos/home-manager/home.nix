

qt.enable = true;

# platform theme "gtk" or "gnome"
qt.platformTheme = "gtk";

# name of the qt theme
qt.style.name = "adwaita-dark";

# detected automatically:
# adwaita, adwaita-dark, adwaita-highcontrast,
# adwaita-highcontrastinverse, breeze,
# bb10bright, bb10dark, cde, cleanlooks,
# gtk2, motif, plastique

# package to use
qt.style.package = pkgs.adwaita-qt;

gtk.enable = true;

gtk.cursorTheme.package = pkgs.bibata-cursors;
gtk.cursorTheme.name = "Bibata-Modern-Ice";

gtk.theme.package = pkgs.adw-gtk3;
gtk.theme.name = "adw-gtk3";

gtk.iconTheme.package = gruvboxPlus;
gtk.iconTheme.name = "GruvboxPlus";

gtk.cursorTheme.package = pkgs.bibata-cursors;

# basically, same as above
home.file = {
  ".icons/bibata".source = "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Classic";
};

# both cases still need you to select theme name declaratively,
# or imperatively like on other distros
gtk.cursorTheme.name = "Bibata-Modern-Ice";

let
  gruvboxplus = import ./gruvbox-plus.nix { inherit pkgs; };
in
{
  gtk.enable = true;
  
  gtk.cursorTheme.package = pkgs.bibata-cursors;
  gtk.cursorTheme.name = "Bibata-Modern-Ice";
  
  gtk.theme.package = pkgs.adw-gtk3;
  gtk.theme.name = "adw-gtk3";
  
  gtk.iconTheme.package = gruvboxPlus;
  gtk.iconTheme.name = "GruvboxPlus";
}
