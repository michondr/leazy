function fish_greeting --description 'Show system uptime on shell start'
    set -l up (uptime -p 2>/dev/null | string replace 'up ' '')
    test -n "$up"; or set up (uptime | string replace -r '^.*up\s+' '' | string replace -r ',\s+\d+ user.*$' '')
    set_color brblack
    echo "up: $up"
    set_color normal
end
