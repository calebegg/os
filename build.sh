#!/bin/bash

set -ouex pipefail

dnf install -y fastfetch

ostree container commit
bootc container lint