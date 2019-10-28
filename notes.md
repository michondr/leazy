# some manual setting 
some programs need manual settings  - things I could not find solution to

or regular TODO notes

### ssh
* copy private ssh key to `~/.ssh/id_rsa` and `sudo chmod 600 ~/.ssh/id_rsa`
* copy public ssh key to `~/.ssh/id_rsa.pub` and  `sudo chmod 644 ~/.ssh/id_rsa`

### git
* for every client, in its folder `~/_client` create `.gitconfig` file with 
```
[user]
        email = michondr@gmail.com
```

* include this file in  `~/.gitconfig`
```
[includeIf "gitdir:~/_client/"]
        path = ~/_client/.gitconfig
```
* set `user.email` and `user.name` in `~/.gitconfig`

### chrome
* [chrome://flags/#hardware-media-key-handling](chrome://flags/#hardware-media-key-handling) set to "disable"
  * DEFAULT - play/pause handles youtube videos instead of spotify 
  * FIXED - play/pause handles spotify everywhere
* hiding extensions in chromium menu