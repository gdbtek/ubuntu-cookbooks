#!/bin/bash -e

export APT_ESSENTIAL_PACKAGES=(
    'curl'
    'git'
    'iptables'
    'libfontconfig'
    'logrotate'
    'lsb-release'
    'lsof'
    'rsync'
    'screen'
    'software-properties-common'
    'sysv-rc-conf'
    'tree'
    'unzip'
    'w3m'
    'wget'
)

export RPM_ESSENTIAL_PACKAGES=(
    'curl'
    'git'
    'iptables'
    'logrotate'
    'lsof'
    'rsync'
    'screen'
    'tree'
    'unzip'
    'wget'
)