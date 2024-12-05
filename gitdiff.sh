#!/bin/sh
set -xe
#git fetch origin branch_name
git difftool --tool=vimdiff HEAD..FETCH_HEAD
