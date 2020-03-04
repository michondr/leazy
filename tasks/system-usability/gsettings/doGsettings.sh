#!/usr/bin/env bash
#### KEYBOARD SHORTCUTS
# see all custom set - dconf dump /org/gnome/settings-daemon/plugins/media-keys/
# see all - gsettings list-recursively org.gnome.settings-daemon.plugins.media-keys

gsettings set org.gnome.shell.keybindings toggle-overview "[]" #default <Super>s - reassinings to flameshot
gsettings set org.gnome.desktop.wm.keybindings panel-main-menu "[]" #default <Alt>F1 - reassigning to play
gsettings set org.gnome.desktop.wm.keybindings panel-run-dialog "[]" #default <Alt>F2 - reassign to previous 
gsettings set org.gnome.desktop.wm.keybindings show-desktop "['<Super>d']" #default also <Primary><Alt>d - coliding with "default value" in phpstorm  

gsettings set org.gnome.settings-daemon.plugins.media-keys play "['<Alt>F1']"
gsettings set org.gnome.settings-daemon.plugins.media-keys previous "['<Alt>F2']"
gsettings set org.gnome.settings-daemon.plugins.media-keys next "['<Alt>F3']"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-mute "['F1']"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-down "['F2']"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-up "['F3']"
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal "['<Super>t']"
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>e']"

gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Control><Super>Up']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Control><Super>Down']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "[]"

gsettings set org.gnome.desktop.wm.keybindings switch-group "['<Alt>semicolon']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Super><Shift>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Alt><Shift>Tab']"

# save area - <Shift><Print>
# copy area - <Control><Shift><Print>
# save full - <Print>
# copy full - <Control><Print>


#### CUSTOM KEYBOARD SHORTCUTS
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'flameshot'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'flameshot gui'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super>s'

# enable them, careful this will disable all custom keybindings unless you include them
c0="'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/'"
c1="'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/'"

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "[$c0, $c1]"


#### POWER OPTIONS
gsettings set org.gnome.settings-daemon.plugins.power power-button-action 'suspend'
gsettings set org.gnome.settings-daemon.plugins.power button-power 'suspend'
gsettings set org.gnome.settings-daemon.plugins.power lid-close-suspend-with-external-monitor 'false'
gsettings set org.gnome.settings-daemon.plugins.power lid-close-ac-action 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power idle-dim 'false'
gsettings set org.gnome.desktop.session idle-delay 0 # dissable screen saver


#### DOCK OPTIONS
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed 'false'
gsettings set org.gnome.shell.extensions.dash-to-dock autohide 'false' # keep the dock dissabled, unless you press <Super>
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-dock show-favorites 'false'

#### RANDOM
dconf write /org/gtk/settings/file-chooser/show-hidden true # show hiddent failes in nautilus
gsettings set org.gnome.nautilus.list-view default-zoom-level 'small' #show small icons
gsettings set org.gnome.desktop.interface enable-animations true # enable animations
gsettings set org.gnome.desktop.interface clock-show-seconds true # show seconds in status bar
gsettings set org.gnome.desktop.background show-desktop-icons false # hide icons on desktop
