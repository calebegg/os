# calebegg/os

Caleb needed an os

## Installation

1. Install Silverblue

   - Or, if https://github.com/fedora-silverblue/issue-tracker/issues/614 isn't fixed, install Workstation, update firmware, install Silverblue

1. Rebase onto calebegg/os

   1. Run

      ```bash
      rpm-ostree rebase ostree-unverified-registry:ghcr.io/calebegg/os:latest
      ```

   1. Reboot

   1. Run

      ```bash
      rpm-ostree rebase ostree-image-signed:docker://ghcr.io/calebegg/os:latest
      ```

## TODO

- https://atuin.sh/ setup
- Lint precommit hook
- https://github.com/calebegg/toolbox-vscode/tree/patch-1
- Monaspace (other fonts?)
- Blur my shell & https://extensions.gnome.org/extension/5112/tailscale-status/
- https://gitlab.com/fabiscafe/game-devices-udev
- https://github.com/m2Giles/m2os/blob/7d48703fffeb96bc10fd8a30e2aa56a02c2cf016/desktop-packages.sh#L16
- https://extensions.gnome.org/extension/5470/weather-oclock/
- Remove background logo

## Counter

GitHub disables workflows for inactive projects, so this is the number of times I've had to make a useless edit so I keep getting OS updates:

2
