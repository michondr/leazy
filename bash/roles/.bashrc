##########################################
# VARS         

collabim_dir=~/collabim

rds=''
rds_read=''
rds_tracker=''
rds_tracker_read=''
rds_serpdata=''
rds_serpdata_read=''
rds_cgest=''

s3cp_key=''
s3cp_secret=''
s3cp_region=''

##########################################
# BASH TWEAKS         

export PS1="\[\033[32m\]\u@\h \[\033[00m\]\w\[\033[33m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')\[\033[00m\] $ "      # show git branch name

#export AWS_FUZZ_KEY_PATH="~/.ssh/id_rsa"
#export AWS_FUZZ_PRIVATE_IP='true' # Delete this one if you want to use public IP's
export AWS_FUZZ_SSH_COMMAND_TEMPLATE=""
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
export AWS_DEFAULT_REGION=""

export ANSIBLE_HOSTS=$collabim_dir/collabim-orchestration/inventories/production/ec2.py
export EC2_INI_PATH=$collabim_dir/collabim-orchestration/inventories/production/ec2.ini

. /usr/share/bash-completion/bash_completion #include all the completion tweaks 

##########################################
# ALIAS         

alias ll='ls -lhpA --color --time-style=long-iso'       # long list
alias grep='grep --color'
alias df='df -h'
alias du='du -sh *'
alias vi='vim'
alias sshq='ssh hq'
shopt -s cdspell                			# When changing directory small typos can be ignored by bash
alias pstorm='phpstorm'  				#start phpstorm
alias idea='intellij-idea-ultimate' 			#start intellij-idea
alias sctl='sudo supervisorctl'
alias awf='aws-fuzzy'
alias cda='cdc app'
alias cdt='cdc tracker'
alias apt='sudo apt --assume-yes'
alias dsu='bin/console d:s:u --dump-sql'
alias bcs='bin/console'
alias ws='bin/console worker:start $1 -v'
alias cs='sudo bin/phing phpcs'				# "run codesniffer"
alias bw='bridge write'             			# run "bridge write"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias free='watch -n 1 free -mh'
alias resnet='service network-manager restart'		#restart network driver 
alias resaud='pulseaudio -k && sudo alsa force-reload'	#restart audio driver
##########################################
# FUNCTION

cacl(){
	# "cache clear"
	sudo bin/console cache:clear
	sudo chmod 777 -R var/cache
	sudo chmod 777 -R var/logs
}

gulp(){
	# start gulp from everywhere
    cd $collabim_dir/collabim-app
	# git clean -e "$d/languages/app*" -e "app/config/*" -e "var/SymfonyRequirements.php" -e "var/bootstrap.php.cache" -e "web/css/*" -e "web/fonts/*" -xf
    node_modules/.bin/gulp
}

cdc(){ 
	# "cd to collabim folder"  
	# cdc mail, cdc app, cdc tracker, cdc orchestration,......
	if [[ $1 ==  "" ]]; then
    	cd $collabim_dir
	elif [[ $1 ==  "mail" ]]; then
    	cd $collabim_dir/mail-queue
	else
		cd $collabim_dir/collabim-${1}
	fi
}

setupenv(){
	# setup_collabim_enviroment
    git clone git@gitlab.inizio.cz:collabim/setup-script.git
    cd setup-script
    sh do.sh
}

vpn(){
	# vpn up, vpn down
	nmcli con $1 id "collabim - firma"
	exit
}

bridge(){
	# setup ssh bridge to production db
	
	#kill currently started ssh sessions
	ps aux | grep ssh | grep rds.amazonaws.com | awk '{print $2}' | xargs kill -9 2> /dev/null
	
	# 3307 - app
	# 3317 - app_read

	# 3308 - tracker
	# 3318 - tracker

	# 3309 - serpdata
	# 3319 - serpdata_read

	# 3301 - cgest
	
	if [[ "$1" = "write" ]]; then
		echo 'bridge write'
		ssh -N -L 3307:$rds
		ssh -N -L 3317:$rds_read

		ssh -N -L 3308:$rds_tracker
		ssh -N -L 3318:$rds_tracker_read

		ssh -N -L 3309:$rds_serpdata
		ssh -N -L 3319:$rds_serpdata_read

	else
		echo 'bridge read'
		ssh -N -L 3307:$rds_read
		ssh -N -L 3317:$rds_read

		ssh -N -L 3308:$rds_tracker_read
		ssh -N -L 3318:$rds_tracker_read

		ssh -N -L 3309:$rds_serpdata_read
		ssh -N -L 3319:$rds_serpdata_read

	fi

	ssh -N -L 3301:$rds_cgest
}

s3cp(){
	AWS_ACCESS_KEY_ID=$s3cp_key AWS_SECRET_ACCESS_KEY=$s3cp_secret AWS_DEFAULT_REGION=$s3cp_region aws configure set default.s3.signature_version s3v4
	AWS_ACCESS_KEY_ID=$s3cp_key AWS_SECRET_ACCESS_KEY=$s3cp_secret AWS_DEFAULT_REGION=$s3cp_region aws s3 cp $1 s3://michondr/tmp/ #--acl public-read
	AWS_ACCESS_KEY_ID=$s3cp_key AWS_SECRET_ACCESS_KEY=$s3cp_secret AWS_DEFAULT_REGION=$s3cp_region aws s3 presign s3://michondr/tmp/$(basename $1) | curl -s http://tinyurl.com/create.php?url=$(</dev/stdin) | grep -Po "(?<=<b>)[^<]+(?=</b><div id=\"success\">)" | xclip -selection clipboard
}
