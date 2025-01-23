#!/bin/bash

set -ouex pipefail

# Function to install required packages
install_packages() {
    dnf install -y \
        fastfetch \
        distrobox \
        vim \
        tailscale

    systemctl enable tailscaled
}

# Function to install and configure starship prompt
setup_starship() {
    local STARSHIP_URL="https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-gnu.tar.gz"
    curl --retry 3 -Lo /tmp/starship.tar.gz "$STARSHIP_URL"
    tar -xzf /tmp/starship.tar.gz -C /tmp
    install -c -m 0755 /tmp/starship /usr/bin
    # shellcheck disable=SC2016
    echo 'eval "$(starship init bash)"' >> /etc/bashrc
}

# Function to customize OS release information
customize_os_release() {
    local OS_RELEASE="/usr/lib/os-release"
    local FEDORA_VERSION=$(rpm -E %fedora)

    # Update OS information
    sed -i -e "\
        s|^NAME=.*|NAME=\"calebegg-os\"|;\
        s|^ID=fedora|ID=calebegg-os\nID_LIKE=\"fedora\"|;\
        s|^HOME_URL=.*|HOME_URL=\"https://github.com/calebegg/os\"|;\
        s|^DEFAULT_HOSTNAME=.*|DEFAULT_HOSTNAME=\"cogsworth\"|;\
        s|^PRETTY_NAME=.*|PRETTY_NAME=\"calebegg's OS (from Fedora Silverblue ${FEDORA_VERSION})\"|;\
        s|^ANSI_COLOR=.*|ANSI_COLOR=\"0;38;2;247;114;69\"|" \
        "$OS_RELEASE"

    # Remove unnecessary fields
    sed -i -e "/^\(REDHAT\|CPE_NAME\|VARIANT\|VARIANT_ID\|DOCUMENTATION_URL\|SUPPORT_END\)=/d" "$OS_RELEASE"
}

# Main execution
main() {
    # Copy system files
    rsync -rvK /tmp/system_files/* /

    # Install and configure packages
    install_packages

    # Update GNOME settings
    dconf update

    # Setup starship prompt
    setup_starship

    # Customize OS release information
    customize_os_release

    # Finalize container
    ostree container commit
    bootc container lint
}

main
