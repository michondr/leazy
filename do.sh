#!/bin/bash

run() {
#	echoColour 'system - usability - gsettings'
#    ./tasks/system-usability/gsettings/doGsettings.sh
	echoColour 'system - usability - i3'
    ./tasks/system-usability/i3/doi3.sh
	echoColour 'system - usability - home-folders'
    ./tasks/system-usability/home-folders/homeFolders.sh
	echoColour 'system - usability - netspeed'
    ./tasks/system-usability/netspeed/doNetspeed.sh


	echoColour 'system - config - bashrc'
	./tasks/system-config/bashrc/doBash.sh
	echoColour 'system - config - etc-hosts'
	./tasks/system-config/etc-hosts/doEtcHosts.sh
	echoColour 'system - config - locale'
	./tasks/system-config/locale/doLocale.sh
	echoColour 'system - config - rename-pc'
	./tasks/system-config/rename-pc/doRename.sh
	echoColour 'system - config - ssh'
	./tasks/system-config/ssh/doSsh.sh
	echoColour 'system - config - swap (this might fail. if it does, run manually)'
	./tasks/system-config/swap/doSwap.sh


    echoColour 'programs - packages'
    ./tasks/programs/packages/doPackages.sh
    echoColour 'programs - flameshot'
    ./tasks/programs/flameshot/doFlameshot.sh
    echoColour 'programs - git'
    ./tasks/programs/git/doGit.sh
#    echoColour 'programs - hubstaff'
#    ./tasks/programs/hubstaff/doHubstaff.sh
    echoColour 'programs - jetbrains'
    ./tasks/programs/jetbrains/doJetbrains.sh
    echoColour 'programs - mysql'
    ./tasks/programs/mysql/doMysql.sh
    echoColour 'programs - postman'
    .tasks/programs/postman/doPostman.sh
    echoColour 'programs - spotify'
    ./tasks/programs/spotify/doSpotify.sh
    echoColour 'programs - sublime'
    ./tasks/programs/sublime/doSublime.sh
    echoColour 'programs - toggl'
    ./tasks/programs/toggl/doToggl.sh
#    echoColour 'programs - vpn'
#    ./tasks/programs/vpn/doVpn.sh
    echoColour 'programs - pritunl'
    ./tasks/programs/vpn/doPritunl.sh
}

echoColour() {
	echo "\e[92m$1 \e[39m"
}

update() {
	echoColour 'updating, upgrading'
	sudo apt --assume-yes --fix-broken install
	sudo apt --assume-yes update
	sudo apt --assume-yes upgrade
	sudo apt --assume-yes autoremove
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
