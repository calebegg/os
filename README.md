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
- Blur my shell
- https://gitlab.com/fabiscafe/game-devices-udev
