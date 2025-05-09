# Vconsole

- loadkeys uk
- setfont 
> changes font to one listed in /usr/share/kbd/consolefonts/, e.g., ter-132b is pretty big.

# System

## Time

- timedatectl
> general information about system time
- timedatectl set-timezone *Region/City*

# Drives

- hdparm
> information about hard disk parameters (doesn't work with every hard disk)
- nvme 
> nvme utilities, including id-ns -H to list information, format -lbaf X to change sector size.
