#!/bin/bash

set -ouex pipefail

dnf install -y fastfetch

rpm-ostree kargs --delete=rhgb
rpm-ostree kargs --delete=quiet

ostree container commit
bootc container lint