#!/usr/bin/env bash

set -o errexit

# Ensure in same directory as script
cd "$(dirname "$(realpath "$0")")"

brew bundle --no-lock

# Hide the time on the default notification center
defaults write com.apple.menuextra.clock IsAnalog -bool true
