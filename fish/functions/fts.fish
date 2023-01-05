function fts --wraps='docker exec -it --user root (docker ps --filter NAME=app --format "{{.ID}}") bash' --description 'alias fts docker exec -it --user root (docker ps --filter NAME=app --format "{{.ID}}") bash'
  docker exec -it --user root (docker ps --filter NAME=app --format "{{.ID}}") bash $argv; 
end
