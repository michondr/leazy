function ll --wraps=ls --wraps='ls -lhAv --group-directories-first --time-style="+%Y-%m-%d %H:%M:%S"' --description 'alias ll ls -lhAv --group-directories-first --time-style="+%Y-%m-%d %H:%M:%S"'
  ls -lhAv --group-directories-first --time-style="+%Y-%m-%d %H:%M:%S" $argv; 
end
