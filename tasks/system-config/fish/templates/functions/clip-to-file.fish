# Defined in - @ line 1
function clip-to-file --wraps='xclip -selection clipboard -t image/png -o > ~/tmp/from_clipboard_now.png' --description 'alias clip-to-file=xclip -selection clipboard -t image/png -o > ~/tmp/from_clipboard_now.png'
  xclip -selection clipboard -t image/png -o > ~/tmp/from_clipboard_now.png $argv;
end
