# Leazy - linux-eazy for lazy people
Made to work on ubuntu, but should work on more distros. I made this to have my enviroment quickly installed on each debloat/clean install of my pc. And also because you can do this quite easily on linux. And also I can :D

--And you can as well! [Fork leazy](https://github.com/michondr/leazy/fork) and be lazy!-- 

## How does it work?

theory is that you insert your password only once, so that the script can execute in single run. Then each topic (subdir) is executed by its own sh script.

## Installation
FIRST OF ALL - go through the code so you know what happens there. on some places are absolute paths with my username, you need to rewrite these in your fork.

update `2019-10-27` - this version is optimized for ubuntu 19.10 and kernel 5.3.0-19-generic. after few complete reinstalls I'm finally happy with how everything works

you can run this fresh after install: 
```
sudo apt --assume-yes -qq install git
git clone https://github.com/michondr/leazy.git
cd leazy/
sh do.sh
```
