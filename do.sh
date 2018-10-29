#!/bin/bash

run() {
	echoColor 'bash'
	sh bash/doBash.sh
	
	echoColor 'etc-hosts'
	sh etc-hosts/doEtcHosts.sh
	
	echoColor 'flameshot'
	sh flameshot/doFlameshot.sh
	
	echoColor 'git'
	sh git/doGit.sh
	
	echoColor 'gsettings'
	sh gsettings/doGsettings.sh
	
	echoColor 'home-folders'
	sh home-folders/doHomeFolders.sh
	
	echoColor 'hubstaff'
	sh hubstaff/doHubstaff.sh
	
	#echoColor 'jetbrains-intellij'
	#sh jetbrains-intellij/doIntellijIdea.sh
	
	echoColor 'jetbrains-phpstorm'
	sh jetbrains-phpstorm/doPhpStorm.sh
	
	echoColor 'misc'
	sh misc/doMisc.sh
	
	echoColor 'rename-pc'
	sh rename-pc/doRename.sh
	
	echoColor 'spotify'
	sh spotify/doSpotify.sh
	
	echoColor 'ssh'
	sh ssh/doSsh.sh
	
	echoColor 'sublime'
	sh sublime/doSublime.sh
	
	echoColor 'editing swap size'
	sh swap/doSwap.sh
	
	# echoColor 'toggl'
	# sh toggl/doToggl.sh
	
	echoColor 'vpn'
	sh vpn/doVpn.sh
}

echoColour() {
	echo "\e[92m$1 \e[39m"
}

update() {
	echoColour 'updating, upgrading'
	sudo apt --assume-yes update;
	sudo apt --assume-yes upgrade;
}

rebootPc() {
	echoColour 'rebooting'
	read -p "Press enter to reboot"
	sudo reboot
}

echo "$USER ALL=(ALL) NOPASSWD:ALL" | sudo EDITOR='tee -a' visudo -f /etc/sudoers.d/$USER
run
sudo /bin/rm /etc/sudoers.d/$USER
sudo -k
update
rebootPc
