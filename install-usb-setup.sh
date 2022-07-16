#!/bin/sh

# Enable DWC2 OTG gadget module
sudo bash -c 'echo dtoverlay=dwc2 >> /boot/config.txt'
sudo sed -i 's/$/ modules-load=dwc2/' /boot/cmdline.txt
sudo bash -c 'echo libcomposite >> /etc/modules'

# Block DHCP on USB0 interface
sudo bash -c 'echo denyinterfaces usb0 >> /etc/dhcpcd.conf'

# Install dnsmasq service
sudo apt update && sudo apt install -y dnsmasq

# Copy scripts from source folder and make executable
# sudo cp -R ./sources/* /
# sudo chmod +x /usr/local/sbin/usbgadget.sh
# sudo systemctl enable usbgadget.service

