#!/usr/bin/env bash
# BIOS SVM Mode [Disabled] -> [Enabled]

sudo dnf install qemu-kvm-core libvirt virt-install cockpit-machines guestfs-tools
sudo systemctl enable libvirtd  --now

sudo dnf -y install vagrant

sudo vagrant plugin install vagrant-libvirt

sudo dnf install ansible
