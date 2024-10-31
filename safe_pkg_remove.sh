#!/bin/sh
sudo pacman -Rsnu $1
#sudo pacman -Rsnc $1

#-R: remove
#-c: cascade (I always check what will get removed)
#-n: no save (when I remove something I really want it gone)
#-s: remove dependencies ( mostly for cleanup) 
#-u: avoid removing packages if other packages depend on it. 
