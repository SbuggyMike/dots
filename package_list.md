# PACKACGE LIST

## Installation

- loadkeys uk
- iwctl --passphrase jack4jack station wlan0 connect chicken3
- timedatectl set-ntp true
- formatting disks
  check if uefi or bios
  make filesystems
- mount & swapon
- edit /etc/pacman.d/mirrorlist 
- pacstrap
- genfstab -U /mnt >> /mnt/etc/fstab
- arch-chroot /mnt /bin/bash
- ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
- hwclock --systohc
- vim /etc/locale.gen (en_GB)
- locale-gen
- echo "LANG=en_GB.UTF-8" >> /etc/locale.conf
- echo "uk" >> /etc/vconsole.conf
- echo "ilium" >> /etc/hostname
- vim /etc/hosts
- N.b. the fucking around you have to do with fstab &c if you mount /usr separately

## Packages

### Pacstrap

- base
- base-devel (probably not actually)
- linux
- linux-firmware (esp. for wifi drivers)
- grub
> os-prober (dual boot)
- efibootmgr ?
- gvim (config file)
- networkmanager
> systemctl enable NetworkManager
- network-manager-applet
- intel-ucode
- man-db
- dhcpcd (enable as service)

### Terminal

- xfce4-terminal
- tmux (config file)

### Graphics

- xorg-server
- xorg-xinit
- xfce4
- lightdm
> systemctl enable lightdm
- lightdm-gtk-greeter
- nvidia (check graphics card via 'lspci -k | grep -A 2 -E "(VGA|3D)"')

#### i3

- i3-wm (config)
- i3status
- dmenu
- xorg-xrandr
- light (to adjust brightness via keys - add user to 'video' group)

### Sound

- pulseaudio
> pulseaudio -D
- pavucontrol
- xfce4-pulseaudio-plugin
- alsa-utils (if necessary to diagnose problems)

#### Bluetooth

- bluez
- bluez-utils
- enable bluetooth.service

### Pictures

- feh
- gimp

### File syncing

- nextcloud-client
- git

### File editing

- texlive-most
- latex-mk
- ghostscript
- ispell
- libreoffice-fresh
- biber
- imagemagick
- pandoc (for markdown)

### emacs

- emacs-common-non-dfsg

#### vanilla

- smudge
- pdf-tools
- slime
- evil-mode

### Files

- p7zip
- unrar
- zathura
- zathura-pdf-mupdf
- zathura-djvu

### Games

- pcsx2
- zenity
- brutal-doom (yay)

### Printing

    - cups (enable service)
    - hplip (hp printer drivers)

### Multimedia

- mpv
- feh
- yt-dt
- python3-pip
- gtkpod
- spotify

#### Dvds

- libdvdread
- mplayer
- libdvdcss
- libdvdnav

### Internet

- chromium
> addons: ublock, surfingkeys, bypass-paywalls
> https everywhere 
> change search engines
> extra security\
- torbrowser-launcher
- firefox
- w3m
- qbittorrent

### Misc

- xfce4-screenshooter

