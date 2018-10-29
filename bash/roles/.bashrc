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

##########################################
# ALIAS         

alias ll='ls -lhpA --color --time-style=long-iso'       	# long list
alias grep='grep --color'
alias df='df -h'
alias du='du -sh *'
alias vi='vim'
alias sshq='ssh hq'
shopt -s cdspell                	# When changing directory small typos can be ignored by bash
alias pstorm='phpstorm'  			#start phpstorm
alias idea='intellij-idea-ultimate' #start intellij-idea
alias sctl='sudo supervisorctl'
alias awf='aws-fuzzy'
alias cda='cdc app'
alias cdt='cdc tracker'
alias apt='sudo apt --assume-yes'
alias dsu='bin/console d:s:u --dump-sql'
alias bcs='bin/console'
alias ws='bin/console worker:start $1 -v'
alias cs='sudo bin/phing phpcs'		# "run codesniffer"
alias msctl="multi-command \"supervisorctl$1$2\""
alias multi-command='echo'
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

resnet(){
	# "reset internet"
	service network-manager restart

	if [[ $1 ==  "full" ]]; then
    	sleep 15
		nmcli con up id "collabim - firma"
	fi

	exit
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
		echo $1
		ssh -N -L 3307:$rds
		ssh -N -L 3317:$rds_read

		ssh -N -L 3308:$rds_tracker
		ssh -N -L 3318:$rds_tracker_read

		ssh -N -L 3309:$rds_serpdata
		ssh -N -L 3319:$rds_serpdata_read

	else
		echo 'read'
		ssh -N -L 3307:$rds_read
		ssh -N -L 3317:$rds_read

		ssh -N -L 3308:$rds_tracker_read
		ssh -N -L 3318:$rds_tracker_read

		ssh -N -L 3309:$rds_serpdata_read
		ssh -N -L 3319:$rds_serpdata_read

	fi

	ssh -N -L 3301:$rds_cgest
}
