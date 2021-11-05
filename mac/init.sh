#!/usr/bin/env bash

set -o errexit

# Ensure in same directory as script
cd "$(dirname "$(realpath "$0")")"

brew bundle --no-lock
