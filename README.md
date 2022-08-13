# naiu.git - Nonomain Arch Install Utils

This is a set of bash utils meant to install more then a basic Arch machine with ease [extends my install script]
[users, desktops, aurs, setups]

**Some of the utils work only with the stuff the my script uses (i.e)**
i.e paru, lightdm, 

<p align="center">
  <img src="https://img.shields.io/github/repo-size/nonomain/naiu?style=for-the-badge">
</p>

## Installation
### Create a live boot with the arch ISO
Download the [arch iso](https://archlinux.org/download/) and load it onto a USB stick (I recommend you use something like [Etcher](https://www.balena.io/etcher/))

### Pre-run steps
1. find the path to the disk you want to install arch on or the paths to the partitions you already have partitioned
> e.g: fdisk -l
2. set the EDITOR environment variable to your favorite terminal editor
> e.g: export EDITOR=vim (vim is default, nano is good for beginners)

### Run the install script
Yes, you can use my script if you want to as the base for the installation:
[nonoArch](./nonoArch) - [here is the seperate git](https://github.com/nonoMain/nonoArch)

### Use the utils
The utils are here to make the things other then the raw arch install easier so if you want to
make your arch install fully usable even before the reboot then this is the best way IMO
#### examples
```bash
# initial setup
git clone https://www.github.com/nonoMain/naiu.git
cd naiu/utils
export PATH="$PWD:$PATH"

# Let the fun begin!

# User examples
naiu-user -c add <username> --admin
naiu-user -c add <remote-user> --admin --no-home
# Services example
naiu-services -c add networkManager
# Install example
naiu-install -c get lsd, btop, bat
# Desktop example
naiu-desktop -c install kde bspwm
```

## Utils

```txt
All the utils implement these commands:
  print-label           print the label for the util
  log <path>            print the logs saved in <path>

All the utils implement these options:
  -h, --help             show the help message for the util
  --log <path>           log all the output to <path>
  --no-confirm           don't ask for confirmation before executing stuff
  --no-color             don't use colors in output
```

<details>
<summary>naiu-installer - configure test and run the nonoArch install script</summary>
</details>

<details>
<summary>naiu-user - add/remove & configure users</summary>
</details>

<details>
<summary>naiu-install - install packages & package units safely</summary>
</details>

<details>
<summary>naiu-desktop - install [and configure] desktop related things</summary>
</details>

<details>
<summary>naiu-aur - install aur helper and install aur units</summary>
</details>

## Troubleshooting
### Internet access

```bash
# You can test if you have internet connection by running
ping google.com
```

You need internet access in order to install a new system so make sure you have either Ethernet
or wifi

If Ethernet isn't an option you can connect to wifi (if your machine has that ability) . Go through these 7 steps:
```bash
# No WIFI?!?!
# You can check if the wifi is blocked by running:
rfkill list
# If it says Soft blocked: yes then run
rfkill unblock wifi
# Enter into the network manager
iwctl
# find your device name
device list
station [device name] scan
# find your network
station [device name] get-networks
station [device name] connect [network name]
# enter your password and exit
exit
```

### Information sources
1. [Arch wiki](https://wiki.archlinux.org/title/Installation_guide)
2. [Nice install guide](https://github.com/rickellis/Arch-Linux-Install-Guide)

### Redo the installation
If the script crashed and the logs don't help you that much so I'd recommend to rerun the installation (not so time consuming)
in order to rerun the script just run:
```bash
# You can see the disk you chose in the 'setup.yml' file
# Delete the entire disk that you installed the os on
# (if you installed it only on some partitions use fdisk to delete them)
sgdisk -Zo <path/to/the/disk>
# reboot the live system (it will lose all the installation files)
reboot
# now just rerun the installation command that specified at the beginning of this README.md
```

## Notes
- This util package was created in order to have somthing 'simpler' than an install script so that you could use almost all
of the stuff it does outside of the inital install e.g if you want to add another desktop or install more of our packed package units

### Credits
- the ASCII art is from [fsymbols](https://fsymbols.com/generators/carty/)

### Nice alternatives
- there are two ways you can look at it, if you want more minimal script that works great then defintley take a look at [easy-arch](https://github.com/classy-giraffe/easy-arch)
- if you were looking to something more comfortable and easy then use [ArchTitus](https://github.com/ChrisTitusTech/ArchTitus)
