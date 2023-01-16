1# PACKACGE LIST

## Installation

### Install

- pacman -Sy archlinux-keyring (may eliminate need to refresh keys later)
- loadkeys uk
- iwctl --passphrase jack4jack station wlan0 connect chicken3
- timedatectl status (earlier guide suggested set-ntp true)
- check if uefi or bios
- formatting disks
- make filesystems (remember fat 32 for boot)
- mount & swapon (mkdir for additional mount points)
- edit /etc/pacman.d/mirrorlist 
- pacman-keys --refresh-keys (if install is relatively old)
> N.b. this takes fucking ages
- pacstrap -K /mnt
- mount any unmodified disks
- genfstab -U /mnt >> /mnt/etc/fstab
- arch-chroot /mnt /bin/bash
- ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
- hwclock --systohc
- vim /etc/locale.gen (en_GB)
- locale-gen
- echo "LANG=en_GB.UTF-8" >> /etc/locale.conf
- echo "KEYMAP=uk" >> /etc/vconsole.conf
- echo "ilium" >> /etc/hostname
- vim /etc/hosts (new version omits this step)
- passwd (root password)
- grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB 
- grub-mkconfig -o /boot/grub/grub.cfg
- N.b. the fucking around you have to do with fstab &c if you mount /usr separately

### Setup

#### User

- useradd -m -G wheel,video telemachus (video for laptop)
- passwd telemachus 
- visudo



## Packages

### Pacstrap

- base
- base-devel (fakeroot etc - doesn't seem essential)
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
- texinfo
- dhcpcd (enable as service)
- sudo

### Terminal/Utilities

- xfce4-terminal
- st (yay) / alacritty
- tmux (config file)
- htop
- neofetch
- upower (battery info)

### Graphics

- xorg-server
- xorg-xinit
- xfce4
- xorg-xsetroot (for basic customisation)
- xorg-xkill (to kill the xserver)
- lightdm
> systemctl enable lightdm
- lightdm-gtk-greeter
- nvidia (check graphics card via 'lspci -k | grep -A 2 -E "(VGA|3D)"')
- xorg-xrandr
- arandr
- libnotify (to send notifications)
- twmn (yay) (notification daemon for tiling window managers, necessary for emacs noifications)

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
- pulseaudio-bluetooth

### Pictures

- feh
- gimp
- maim (screenshot programme --- seems to have replaced scrot)
- xclip (has many other uses, but I particularly use for the screenshot
  programme)

### File syncing

- nextcloud-client (don't use)
- git
  git config --global credential.helper store
- yay (clone from aur)
- rsync (dependency of syncthing)
- syncthing
  systemctl enable --user --now syncthing

### File editing

- texlive-most
- latex-mk (for emacs? not sure this is necessary)
- ghostscript (for groff and doc-view in emacs)
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
- unzip
- zathura
- zathura-pdf-mupdf
- zathura-djvu
- okular (alternative to zathura, perhaps preferable due to highlighting ability)
- mupdf (still doesn't allow for highlighting, but otherwise works extremely well)

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

