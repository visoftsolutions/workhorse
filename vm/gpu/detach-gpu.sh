#!/usr/bin/env bash

sudo grubby --args="iommu=pt" --update-kernel DEFAULT
sudo reboot

lspci -Dnn | grep VGA
0000:4b:00.0 VGA compatible controller [0300]: NVIDIA Corporation GA106 [GeForce RTX 3060 Lite Hash Rate] [10de:2504] (rev a1)
sudo grubby --args="pci-stub.ids=10de:2504" --update-kernel DEFAULT
sudo reboot

sudo dnf install driverctl
sudo driverctl set-override 0000:4b:00.1 vfio-pci
sudo reboot

sudo vagrant up
sudo virsh attach-device workhorse_workhorse --file gpu-assign.xml --persistent
