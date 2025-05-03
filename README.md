# salt-steamcmd-7dtd

#### Module for installing SteamCMD and 7 Days to Die server with saltstack

![7days](.gitignore/7days.png)







You will need to clone this repository to your /srv/salt directory to make it work

#### Salt states
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
