#!/bin/bash

set -ouex pipefail

### Install packages

dnf install fedora-workstation-repositories
dnf config-manager --set-enabled google-chrome
dnf install -y fastfetch google-chrome-stable
