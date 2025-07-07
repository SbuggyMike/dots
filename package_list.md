# PACKAGE LIST

## Installation

### Install

- pacman -Sy archlinux-keyring (may eliminate need to refresh keys later)
- loadkeys uk
- iwctl --passphrase jack4jack station wlan0 connect chicken3
- timedatectl status (earlier guide suggested set-ntp true)
- check if uefi or bios
- formatting disks
- make filesystems (remember fat 32 for boot with efi, none for bios) (btrfs needs subvolumes, not partitions)
- mount & swapon (mkdir for additional mount points) (mount boot partition at /mnt/boot/efi for efi)
- edit /etc/pacman.d/mirrorlist (doesn’t seem to be necessary now)
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
- grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB 
> grub-install --target=i386-pc /dev/sdX for BIOS machines
- grub-mkconfig -o /boot/grub/grub.cfg
- N.b. the fucking around you have to do with fstab &c if you mount /usr separately
- ntp (time sync?)
> systemctl enable ntpd

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
> linux-zen better for desktop?
- linux-firmware (esp. for wifi drivers)
> linux-zen-headers
- grub
> os-prober (dual boot)
- efibootmgr (for uefi)
- pacman-contrib (checkupdates is very useful)
- nvim (config file)
> if using nvim, ln -sf /bin/nvim /bin/vim
- networkmanager
> systemctl enable NetworkManager
- network-manager-applet
- intel-ucode
- man-db
- man-pages
- texinfo
- dhcpcd (enable as service)
- sudo
- cpupower
> cpupower.service
- cronie
> systemctl enable crond.service
> put links to scripts in /etc/cron.weekly/ or simmilar to allow anacron to use them
- zram-generator (better swap)

### Terminal/Utilities

- xfce4-terminal
- st (yay) / alacritty
- tmux (config file)
- htop
- nvtop (nvidia monitor)
- neofetch
- upower (battery info)
- dash (faster shell)
> sudo ln -sf dash /bin/sh

### Graphics

- xorg-server
- xorg-xinit
- xfce4
- xorg-xsetroot (for basic customisation)
- xorg-xkill (to kill the xserver)
- lightdm
> systemctl enable lightdm
- lightdm-gtk-greeter
- ly (lighter than lightdm)
- nvidia (check graphics card via 'lspci -k | grep -A 2 -E "(VGA|3D)"')
> set kernel param nvidia_drm.fbdev=0
- nvidia-dkms (if using linux zen)
> add modules to /etc/mkinitcpio.conf nvidia nvidia_modeset nvidia_uvm nvidia_drm
- xorg-xrandr
> if screens don't work, try xrandr --output SCREEN --auto
- picom - compositor
- arandr
- ttf-font-awesome-5
- libnotify (to send notifications)
- twmn (yay) (notification daemon for tiling window managers, necessary for emacs noifications)

#### i3

- i3-wm (config)
- polybar
- i3status (not as good)
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
> systemctl enable --user --now syncthing
- openssh
> systemctl enable --now sshd
> in /etc/ssh/sshd_config: set PermitRootLogin to ’yes’

### File editing

- texlive-most (now just called texlive)
- latex-mk (for emacs? not sure this is necessary)
  This is now in latex-binextra
- ghostscript (for groff and doc-view in emacs)
- ispell (for emacs)
- hunspell and hunspell-en_gb (for libreoffice?)
- libreoffice-fresh
- biber
- imagemagick
- pandoc (for markdown)
- ttf-ms-win10-auto (yay)

### emacs

- emacs-common-non-dfsg
- clang (for company backend)

#### vanilla

- smudge
- pdf-tools
- slime
- evil-mode
- gnuplot (for drawing graphs - install gnuplot mode)

### Files

- p7zip
- unrar
- unzip
- zathura
- zathura-pdf-mupdf
- zathura-djvu
- okular (alternative to zathura, perhaps preferable due to highlighting ability)
- mupdf (still doesn't allow for highlighting, but otherwise works extremely well)
- pdftk (for manipulating pdfs)
- zip (for making ODT files from org documents)

### Games

- pcsx2
- zenity
- brutal-doom (yay)
- wine
- dwarfs

### Printing

- cups (enable service)
- avahi
- mss-mdns
- hplip (hp printer drivers)

### Multimedia

- mpv
- feh
- yt-dt
- python3-pip
- spotify
- navidrome (through a docker)
- shntools (to split flac image files into single tracks)
- cuetools (for adding information to single tracks from a cue file once split)
- flac (for converting too flac; necessary for shnsplit)

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

## Virtualbox

- virtualbox
- virtualbox-host-modules-arch
- vritualbox-guest-iso

### Programming

- sdl2
> for graphical windows; compile with -lSDL2 option
- sdl2_ttf
> for text on graphical windows; compile with -lSDL2_ttf option

### Misc

- xfce4-screenshooter
- docker (systemctl --enable --now docker) docker-compose

# Kali

pimpmykali (github)

# AI

- pipx
- pipx install langchain
- pipx install openapi --include-deps

## Google

- nodejs
- npm
- npm install -g @google/gemini-cli 
