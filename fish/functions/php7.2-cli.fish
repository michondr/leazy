function php7.2-cli --wraps='docker run --rm -v (pwd):/app -w /app php7.2-cli php ' --wraps='docker run --rm -v (pwd):/app -w /app php:7.2-cli-alpine php ' --description 'alias php7.2-cli docker run --rm -v (pwd):/app -w /app php:7.2-cli-alpine php '
  docker run --rm -v (pwd):/app -w /app php:7.2-cli-alpine php  $argv; 
end
