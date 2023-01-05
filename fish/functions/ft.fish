function ft --wraps='docker exec -it --user non-root (docker ps --filter NAME=app --format "{{.ID}}") bash' --description 'alias ft docker exec -it --user non-root (docker ps --filter NAME=app --format "{{.ID}}") bash'
  docker exec -it --user non-root (docker ps --filter NAME=app --format "{{.ID}}") bash $argv; 
end
