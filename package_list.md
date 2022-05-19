# PACKACGE LIST

## Installation

### Install

- loadkeys uk
- iwctl --passphrase jack4jack station wlan0 connect chicken3
- timedatectl set-ntp true
- check if uefi or bios
- formatting disks
- make filesystems (remember fat 32 for boot)
- mount & swapon 
- edit /etc/pacman.d/mirrorlist 
- pacman-keys --refresh-keys (if install is relatively old)
> N.b. this takes fucking ages
- pacstrap /mnt
- genfstab -U /mnt >> /mnt/etc/fstab
- arch-chroot /mnt /bin/bash
- ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
- hwclock --systohc
- vim /etc/locale.gen (en_GB)
- locale-gen
- echo "LANG=en_GB.UTF-8" >> /etc/locale.conf
- echo "KEYMAP=uk" >> /etc/vconsole.conf
- echo "ilium" >> /etc/hostname
- vim /etc/hosts
- passwd (root password)
- grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB 
- grub-mkconfig -o /boot/grub/grub.cfg
- N.b. the fucking around you have to do with fstab &c if you mount /usr separately

### Setup

#### User

- useradd -m -G wheel video telemachus (video for laptop)
- passwd telemachus 
- visudo



## Packages

### Pacstrap

- base
- base-devel (fakeroot etc)
- linux
- linux-firmware (esp. for wifi drivers)
- grub
> os-prober (dual boot)
- efibootmgr (for uefi)
- gvim (config file)
- networkmanager
> systemctl enable NetworkManager
- network-manager-applet
- intel-ucode
- man-db
- man-pages
- dhcpcd (enable as service)
- sudo

### Terminal/Utilities

- xfce4-terminal
- tmux (config file)
- htop
- neofetch

### Graphics

- xorg-server
- xorg-xinit
- xfce4
- lightdm
> systemctl enable lightdm
- lightdm-gtk-greeter
- nvidia (check graphics card via 'lspci -k | grep -A 2 -E "(VGA|3D)"')
- xorg-xrandr

#### i3

- i3-wm (config)
- i3status
- dmenu
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
- yay (clone from aur)

### File editing

- texlive-most
- latex-mk (for emacs? not sure this is necessary)
- ghostscript (for groff?)
- ispell
- libreoffice-fresh
- biber
- imagemagick
- pandoc (for markdown)
- ttf-ms-win10-auto (yay)

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
- okular (alternative to zathura, perhaps preferable due to highlighting ability)

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
- thunderbird
- zoom (yay)

### Misc

- xfce4-screenshooter

