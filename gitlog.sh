#!/bin/sh
#set -xe
#git log --pretty=format:'%C(auto)%h%d (%cr) %cn <%ce> %s' --no-merges
#git log --pretty=format:"%C(yellow)%h%Creset%C(cyan)%C(bold)%d%Creset %C(cyan)(%cr)%Creset %C(green)%ce%Creset %s" --no-merges
git log --since="1 month ago" --pretty=format:"%C(yellow)%h%x09%Creset%C(cyan)%C(bold)%ad%Creset  %C(green)%Creset %s | %C(yellow)%C(bold)%an%Creset" --date=short --no-merges
git log --pretty=format: --name-only | sort | uniq -c | sort -rg | head -10
