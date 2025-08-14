#!/bin/sh
set -xe
prospector -8 --strictness medium --no-autodetect -t dodgy -t mccabe -t profile-validator -t pyflakes --output-format emacs
