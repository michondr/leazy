function cs
  	gnome-terminal -- /bin/sh -c 'make --directory=/home/michondr/_mailstep/mailship-20-monorepo/gateway run; exec fish'
  	gnome-terminal -- /bin/sh -c 'make --directory=/home/michondr/_mailstep/mailship-20-monorepo/gateway-service-be4fe run; exec fish'
  	gnome-terminal -- /bin/sh -c 'make --directory=/home/michondr/_mailstep/mailship-20-monorepo/service-complaint run; exec fish'
  	gnome-terminal -- /bin/sh -c 'make --directory=/home/michondr/_mailstep/mailship-20-monorepo/service-notification run; exec fish'
  	gnome-terminal -- /bin/sh -c 'make --directory=/home/michondr/_mailstep/mailship-20-monorepo/service-pim run; exec fish'
  	gnome-terminal -- /bin/sh -c 'make --directory=/home/michondr/_mailstep/mailship-20-monorepo/service-user run; exec fish'
  	exit
end
