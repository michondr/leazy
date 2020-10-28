function cs
        gnome-terminal -- /bin/fish -C 'composer --working-dir=/home/michondr/_driveto/driveto.cz phpstan && exit'
        gnome-terminal -- /bin/fish -C 'composer --working-dir=/home/michondr/_driveto/driveto.cz phpcbf && exit'
        gnome-terminal -- /bin/fish -C 'sleep 2 && composer --working-dir=/home/michondr/_driveto/driveto.cz phpcs && exit'
        exit

end
