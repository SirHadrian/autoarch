#!/bin/bash

echo "Archlinux install script"

echo "Make sure you have an internet connection"

# Start installation
read -rp "Do you want start the installation? (Y/n)" answer

doInstall=${answer:-Y}

case $doInstall in
  [Yy]) 
    echo "Install started..."
    ;;
  [Nn]) 
    exit 0
    ;;
  *)
    echo "Incorrect option"
    exit 1
    ;;
esac

# Verify boot mode
bootmode="$(cat /sys/firmware/efi/fw_platform_size)"

if [[ $bootmode -eq 64 ]];then
  echo "Booted in UEFI mode"
elif [[ $bootmode -eq 32 ]];then
  echo "Booted in legacy mode"
fi
