function cs
  docker exec -it (docker ps --filter NAME=autodevelo-php --format '{{.ID}}') sh -c 'git config --global --add safe.directory /var/www' $argv;
  docker exec -it (docker ps --filter NAME=autodevelo-php --format '{{.ID}}') sh -c 'composer phpcbf:changed ; composer phpcs:changed ; composer phpstan' $argv;
end
