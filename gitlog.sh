#!/bin/sh
#set -xe
#git log --pretty=format:'%C(auto)%h%d (%cr) %cn <%ce> %s' --no-merges
#git log --pretty=format:"%C(yellow)%h%Creset%C(cyan)%C(bold)%d%Creset %C(cyan)(%cr)%Creset %C(green)%ce%Creset %s" --no-merges
git log --pretty=format:"%C(yellow)%h%x09%Creset%C(cyan)%C(bold)%ad%Creset  %C(green)%Creset %s" --date=short --no-merges