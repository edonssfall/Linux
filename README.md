# Razer Blade 15 (2020-Base Model) 
# Ubuntu_22.04

- [Progs Installation](#installation)
  - [All progs Bash File](#all-progs-bash-file)
  - [Programing Bash File](#programing-bash-file)
- [Fixes](#fixes)
  - [Suspend Fix](#suspend-fix)
- [Progs for Coding](#progs-for-coding)
  - [Bash File](#bash-file)



# Progs Installation
## All progs Bash File
```ssh
sh progs-installation.sh
```

# Progs for Coding
## Bash File
```ssh
sh programming.sh
```

# Fixes
## Suspend Fix
```ssh
sh grub/fix-grub.sh
```
Commands
```ssh
sudo nano /etc/default/grub
```
Change to:
```ssh
GRUB_CMDLINE_LINUX_DEFAULT="button.lid_init_state=open"
GRUB_CMDLINE_LINUX="nouveau.modeset=0"
```
Apply Changes
```ssh
sudo update-grub
sudo reboot
```

