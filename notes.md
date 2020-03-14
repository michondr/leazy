# some manual setting 
some programs need manual settings  - things I could not find solution to

or regular TODO notes

### ssh
* copy private ssh key to `~/.ssh/id_rsa` and `sudo chmod 600 ~/.ssh/id_rsa`
* copy public ssh key to `~/.ssh/id_rsa.pub` and  `sudo chmod 644 ~/.ssh/id_rsa`
* copy aws credentials to `~/.aws/credentials`

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
* play/pause handles youtube videos instead of spotify
    * [chrome://flags/#hardware-media-key-handling](chrome://flags/#hardware-media-key-handling) set to "disable"

* manual job
    * hiding extensions in chromium menu
    * set as default browser

* enabling full url in omnibar (not shortening URL by https:// and subdomains)
    * everything is in [Issue 1019020: flag to disabling omnibox shortening of URLs](https://bugs.chromium.org/p/chromium/issues/detail?id=1019020)
    * go to [chrome://flags/#temporary-unexpire-flags-m76](chrome://flags/#temporary-unexpire-flags-m76) and set it to `enabled`
    * go to [chrome://flags/#omnibox-ui-hide-steady-state-url-scheme](chrome://flags/#omnibox-ui-hide-steady-state-url-scheme) and set to `disabled`
    * go to [chrome://flags/#omnibox-ui-hide-steady-state-url-trivial-subdomains](chrome://flags/#omnibox-ui-hide-steady-state-url-trivial-subdomains) and set to `disabled`