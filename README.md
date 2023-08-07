# Razer Blade 15 (2020-Base Model) 
# Ubuntu_22.04

- [Progs Installation](#progs-installation)
  - [All progs Bash File](#all-progs-bash-file)
- [Progs for Coding](#progs-for-coding)
  - [Bash File](#bash-file)
  - [Drivers for DataScience](#drivers-for-datascience)
    - [Nvidia Drivers](#install-cuda-and-nvidia-drivers)
- [Fixes](#fixes)
  - [Suspend Fix](#suspend-fix)



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

## Drivers for DataScience
### Install CUDA and Nvidia Drivers
CUDA 12.1 for Ubuntu 22.04
```ssh
sh DataScience/CUDA_12.1_Ubuntu_22.04.sh
```
CUDA 12.1 for Ubuntu 20.04
```ssh
sh DataScience/CUDA_12.1_Ubuntu_22.04.sh
```
CUDA 11.8 for Ubuntu 22.04
```ssh
sh DataScience/CUDA_12.1_Ubuntu_22.04.sh
```
CUDA 11.8 for Ubuntu 20.04
```ssh
sh DataScience/CUDA_12.1_Ubuntu_22.04.sh
```
TensorRT latest
```ssh
sh DataScience/TensorRT:latest.sh
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
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash button.lid_init_state=open"
GRUB_CMDLINE_LINUX="nouveau.modeset=0"
```
Apply Changes
```ssh
sudo update-grub
sudo reboot
```

