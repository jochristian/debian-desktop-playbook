## Credits
Based on the excellent work by GitHub user [jhx0](https://github.com/jhx0).

# debian-desktop-playbook
A personal **Ansible** **Playbook** to deploy and configure a **Debian** desktop system to my needs. 
**Note**: This playbook assumes a Desktop Environment is already installed.

Adapted for **Debian 13** (**Trixie**)

## Features:
- **Prerequisite**: A **Debian 13** (**Trixie**) system with a Desktop Environment (**KDE**, **Gnome**, **Xfce**, etc.) already installed.
- Many additional packages from the official repos (**Firefox-ESR**, **VLC**, **Synaptic**, etc.)
- Installs and configures **sudo**
- **Flatpaks**: **Discord**, **Signal**, **Raspberry Pi Imager**
- External applications available: **VS Code**, **Brave**, **Vivaldi**
- Gaming: **Steam**, **Wine**, **GZDoom** and retro gaming emulators (**Mupen64Plus**, **Mednafen/Mednaffe**, **Dosbox**)
- Flatpak Games: **Minecraft**, **SuperTuxKart**, **Veloren**, **Xonotic**, **0 A.D.**, **ETLegacy**, **Luanti**
- Targets **Intel**/**AMD** systems (CPU/GPU)
- Installs **Docker**, **Podman**
- Deploys **LXC**
- Also installs **Distrobox**
- Installs **Homebrew**
- Virtualization packages (**libvirt/QEMU/Virt-Manager**)
- Sets up **zram**
- Installs the **XanMod Kernel** (optional)
- Installs and configures **Zsh**
- (**Optional**) Installs and sets up **UFW** (**Deny** incoming, **Allow** outgoing, allow **SSH** access)
- Most software comes from the main repos!

## Note on external applications:
External applications are only installed when the "external" variable is set to true.   
Keep that in mind when using this **Playbook**.   
I made the decision to make these not be installed by default since I personally perefer things from the official repo or installed as a **Flatpak**.

## Note on XanMod Kernel:
The XanMod kernel is an optional high-performance Linux kernel. This playbook installs the `x64v3` version, which requires a CPU with **AVX2** support (roughly Intel Haswell or AMD Excavator/Ryzen and newer).
Ensure you have **Secure Boot disabled** or have a way to sign the kernel modules, as XanMod is not signed by Debian's keys.

## Screenshot:
<img width="1920" height="1080" alt="debian-kde-desktop" src="https://github.com/user-attachments/assets/4f62731d-39e2-4ad9-93fa-20ac868351f4" />

There is nothing big to see here. I like the defaults and don't really change much of anything. YMMV. 😎   
(Stock **KDE** desktop pictured here - if you must have a screenshot)
This setup is now more minimal than before, so you have a cleaner slate to start with.

## Hint
This Playbook mainly servers my own needs - feel free to adapt it to yours!

You can find many more variables under the **vars** directory - Make sure you take a look before running the **Playbook**. (So you can customize your install)

The **dotfiles** tasks installs my own config files. This might not be what you need - be sure to exclude the **role** when not needed. (This can be done via **tags**)

## Before running the Playbook:
- Set the variables you need
- Take a look at the **dotfiles** role, since you most likely want to use your own dots!

## Usage:
This playbook is meant to be run directly on the host.

1. Clone/download this repository
2. Unpack/cd into the directory
3. Run the bootstrap script:
```shell
$ chmod +x bootstrap.sh
$ ./bootstrap.sh
```
Or run the playbook directly:
```shell
$ ansible-playbook main.yml (-Kk)
```
4. The target will reboot when the playbook is finished running
5. Done

## Examples
All tasks can be selected via **Tags**, so you can pick whatever tasks you want to run.   
Following, a couple of use cases:
1. Run all tasks
```bash
$ ansible-playbook main.yml --tags all (-Kk)
```
2. Only run a subset of tasks
```bash
$ ansible-playbook main.yml --tags "apt,vim,sudo,zsh,reboot" (-Kk)
```
3. Run only one task
```bash
$ ansible-playbook main.yml --tags "flatpak" (-Kk)
```
All available **Tags**:
```bash
apt
upgrade
packages
zram
xanmod
vim
sudo
ntp
dotfiles
homebrew
zsh
groups
fontconfig
fonts
kde
gnome
xfce
virt
brave (external)
gaming
vscode (external)
vivaldi (external)
flatpak (Multiple Flatpaks installed)
pipx
docker
podman
lxc
distrobox
firewall
reboot
```

## Note:
Make sure you have set the correct IP/Hostname in the **hosts** file.   

**BEWARE:** do **_NOT_** run this Playbook blindly!

## Ubuntu
Certain tasks will run on **Ubuntu** and **Ubuntu** based systems.
Beware though that this **Playbook** was not tested on any **Ubuntu** system!
Make sure to check the tasks to see what they actually do before running this on any **Ubuntu** based system!