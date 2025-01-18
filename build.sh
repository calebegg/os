#!/bin/bash

set -ouex pipefail

rsync -rvK /tmp/system_files/* /

dnf config-manager addrepo --from-repofile=/etc/yum.repos.d/*.repo
dnf install -y fastfetch distrobox vim google-chrome-stable tailscale

# Update gnome (dconf) settings from files copied into /etc/dconf/db/distro.d
dconf update

curl --retry 3 -Lo /tmp/starship.tar.gz "https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-gnu.tar.gz"
tar -xzf /tmp/starship.tar.gz -C /tmp
install -c -m 0755 /tmp/starship /usr/bin
# shellcheck disable=SC2016
echo 'eval "$(starship init bash)"' >> /etc/bashrc

sed -i "s|^NAME=.*|NAME=\"calebegg-os\"|" /usr/lib/os-release
sed -i "s|^ID=fedora|ID=calebegg-os\nID_LIKE=\"fedora\"|" /usr/lib/os-release
sed -i "s|^HOME_URL=.*|HOME_URL=\"https://github.com/calebegg/os\"|" /usr/lib/os-release
sed -i "s|^DEFAULT_HOSTNAME=.*|DEFAULT_HOSTNAME=\"cogsworth\"|" /usr/lib/os-release
sed -i "s|^PRETTY_NAME=.*|PRETTY_NAME=\"calebegg's OS (from Fedora Silverblue)\"|" /usr/lib/os-release
sed -i "s|^ANSI_COLOR=.*|ANSI_COLOR=\"0;38;2;247;114;69\"|" /usr/lib/os-release

sed -i "/^REDHAT/d;" /usr/lib/os-release
sed -i "/^CPE_NAME=/d;" /usr/lib/os-release
sed -i "/^VARIANT=/d;" /usr/lib/os-release
sed -i "/^VARIANT_ID=/d;" /usr/lib/os-release
sed -i "/^DOCUMENTATION_URL=/d;" /usr/lib/os-release
sed -i "/^SUPPORT_END=/d;" /usr/lib/os-release

ostree container commit
bootc container lint