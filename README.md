# N.A.I.U - Nonomain Arch Installation Utilities

This is a set of bash snippets with a 'master' script to manage them all seamlessly

NAIU can:
- [ ] Check for initial state (network connection, storage, etc)
- [ ] Setup partitions (partitioning + fstab + encryption setting)
- [x] Write basic files (hosts, mkinitcpio, etc)
- [ ] Setup pacman (settings and mirrors) and add [paru](https://github.com/Morganamilo/paru)
- [x] Pacstrap (install) wanted packages
- [x] Detect hypervisors and installing guest-tools
- [x] Configure network and bluetooth
- [ ] Create and manage users


Todo:
- [ ] Add logging options
- [ ] Add generating shell snippets from commands
> example: `naiu --generate-sh-script run write-hostname` will generate:
```
#!/usr/bin/env -S bash -e
hostname=$1; shift
echo -e "[ \033[0;36mMSG\033[0m ] Writing hosts file (hostname: $hostname)"
cat > $ROOT_MNT/etc/hosts <<EOF
127.0.0.1   localhost
::1         localhost
127.0.1.1   $hostname.localdomain   $hostname
EOF
```

Just for now, the help message is:
```
NAIU - Nonomain arch install utilities
Usage: naiu [options] [command] [arguments] [options]
Located at: $PR_DIR

general options:
** Note: you cannot combine options as one command line argument e.g: -la **
    -h, --help            show this help message

default commands:
     help                        show this help message

     commands                    list commands stored in the project's commands directory

     actions                     list actions stored in the project's actions directory

     run                         run an action from the actions list

     pacstrap <package/file>     pacstraps a package or a list of packages (in a file)
                                  * in case of a package:
                                  * single package as an argument instead of a couple is forced for better handling a case of failure
                                  * in case of a file:
                                  * lines can be either a package name or a title for the next couple packages
                                  * look inside '$PR_DIR/pac/' for examples

     enable/disable              enable/disable a service on the new machine using systemctl

     prompt                      show project's terminal logo

     var <option>                get/set/unset variables that define naiu behavior
     |--------subcommands-------->  get <varname>, set <name> '<value>', unset <name>

     tmpvar <option>             get/set/unset variables stored in the \"naiu environment\"
     |--------subcommands-------->  get <varname>, set <name> '<value>', unset <name>

     reset                       resets all the temporary and permanent variables and files

default actions:
     pacstrap-microcode          detect and pacstrap the correct (Intel or AMD) microcode

     write-mkinitcpio            writes a default (my default..? taken from the official archinstall) mkinitcpio.conf

     write-hostname <name>       write the hostname in the proper format to /etc/hosts

     setup-networkmanager        pacstrapping and enabling the NetworkManager

     setup-bluetooth             pacstrapping and enabling the Bluez service

     setup-guest-tools           if exeuted inside a VM will pacstrap and enable the guest-tools for that VM
                                  * currently supports: KVM, VMware, Oracle (Virtual box)

** For more info about the project take a look on our github page: https://www.github.com/nonoMain/naiu **
```
