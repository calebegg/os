#!/bin/bash

set -ouex pipefail

### Install packages

dnf install fedora-workstation-repositories
dnf install -y fastfetch google-chrome-stable
