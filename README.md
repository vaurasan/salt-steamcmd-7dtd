# salt-steamcmd-7dtd

#### Module for installing SteamCMD and 7 Days to Die server with saltstack

Effortlessly automate the installation of **SteamCMD** and **7 Days to Die** game **server** using **Saltstack**, save time and ensure a consistent installation environment

![7days](.gitignore/7days.png)

### Key benefits:
- Time-saving
- Consistency
- Ease of use
- Manageability
- Repeatability
- I haven't encountered a ready solution quite like this

---

### Clone:
- You need a working Salt master-minion architecture
- Clone this repository to your Salt masters **/srv/salt** directory to make it work
```bash
sudo git clone https://github.com/vaurasan/salt-steamcmd-7dtd.git /srv/salt
```

---

## How to use:

You need to run SteamCMD install state **twice**, at least with Debian, because of a bug in BookWorm: https://stackoverflow.com/questions/76688863/apt-add-repository-doesnt-work-on-debian-12

SteamCMD installation is fairly quick, but 7 Days to Die server takes 8-12 minutes to download and install. If the 7 Days to Die server installation is very quick, run both installation states again

These are not the most idempotent salt-states, but for now, I could not figure a better way

#### - Install SteamCMD (run twice!):
```bash
sudo salt '*' state.apply steam-installed
```
#### - Install 7 Days to Die server, requires SteamCMD:
```bash
sudo salt '*' state.apply 7days-installed
```
#### - Reload daemons and start 7 Days to Die server + enable on startup:
```bash
sudo salt '*' state.apply running
```
#### - Stop 7 Days to Die server:
```bash
sudo salt '*' state.apply stopped
```

---

### Disclaimer

#### - This setup is created for local testing purposes only
#### - For online use, security measures must be implemented

---

Tested with
- Windows 11 Pro 24H2
- Oracle VirtualBox Version 7.1.4 r165100 (Qt6.5.3) - Debian 12 GNU/Linux (bookworm)
- Vagrant 2.4.3
- salt 3007.1 (Chlorine)

---

Made by: **Santeri Vauramo** / <em>vaurasan</em> 2025
