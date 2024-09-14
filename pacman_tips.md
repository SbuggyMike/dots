# Downloading Packages

pacman -Syu sync and update (and install packages)

# Searching Repos

pacman -Ss (searchy search)

# Searching Downloaded Packages

pacman -Q (list all packages)
pacman -Qe (list all pacakages which you have downloaded yourself)
> this doesn't seem to be exactly correct
pacman -Qdt (list redundant dependencies)

# Remove Cache

pacman -Sc (remove cache) (Stop Crap)
> cache can take up a lot of space

# Note

All these commands appear to be the same for yay.
