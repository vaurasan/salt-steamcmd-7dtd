# salt-steamcmd-7dtd

#### Module for installing SteamCMD and 7 Days to Die server with saltstack

Effortlessly automate the installation of SteamCMD and a 7 Days to Die game server using Saltstack, save time and ensure a consistent installation environment

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
- You will need to clone this repository to your **/srv/salt** directory to make it work
```bash
git clone https://github.com/vaurasan/salt-steamcmd-7dtd.git /srv/salt
```

---

## How to use with Salt states: 
You may need to run these install states **twice**, at least with Debian, because of a bug in BookWorm: https://stackoverflow.com/questions/76688863/apt-add-repository-doesnt-work-on-debian-12 (This has given me nightmares)

SteamCMD installation is fairly quick, but 7 Days to Die server takes 8-12 minutes to download and install. If the 7 Days to Die server installation is very quick, run both installation states again

#### - Install SteamCMD:
```bash
sudo salt '*' state.apply steam-installed
```
#### - Install 7 Days to Die server, requires SteamCMD:
```bash
sudo salt '*' state.apply 7days-installed
```
#### - Reload daemons and start 7 Days to Die server:
```bash
sudo salt '*' state.apply running
```

---

Tested with
- Windows 11 Pro 24H2
- Oracle VirtualBox Version 7.1.4 r165100 (Qt6.5.3) - Debian 12 GNU/Linux (bookworm)
- Vagrant 2.4.3
- salt 3007.1 (Chlorine)

---

Made by: **Santeri Vauramo** / <em>vaurasan</em> 2025
