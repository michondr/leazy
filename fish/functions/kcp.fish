function kcp
  kubectl cp $argv[1]:/var/www/$argv[2] ~/tmp/$argv[2]
end
