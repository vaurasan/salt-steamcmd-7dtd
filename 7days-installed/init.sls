# Pelipalvelimen asennuskansio oikeuksineen
game_directory:
  file.directory:
    - name: /home/vagrant/7days
    - user: vagrant
    - group: vagrant
    - mode: 750
    - makedirs: True
    - recurse:
      - user
      - group
      - mode

# SteamCMD kansio oikeuksineen
steam_directory:
  file.directory:
    - name: /usr/games/steamcmd
    - user: vagrant
    - group: vagrant
    - mode: 750
    - recurse:
      - user
      - group
      - mode

# Luodaan 7days datakansio
7dtd_data_directory:
  file.directory:
    - name: /home/vagrant/.local/share/7DaysToDie
    - user: vagrant
    - group: vagrant
    - mode: 755
    - makedirs: True
    - recurse:
      - user
      - group
      - mode

# Oikeudet steamcmd tiedostoon
steam_file:
  file.managed:
    - name: /usr/games/steamcmd/steamcmd.sh
    - user: vagrant
    - group: vagrant
    - mode: 750

# Pelipalvelimen asennus väkisin
steamcmd_setup:
  cmd.run:
    - name: HOME=/home/vagrant /usr/games/steamcmd/steamcmd.sh +@sSteamCmdForcePlatformType linux +force_install_dir /home/vagrant/7days +login anonymous +app_update 294420 +quit
    - runas: vagrant
    - unless: test -f /home/vagrant/7days/steamapps/7DaysToDie Dedicated Server

# Kansio service-tiedostolle
servicefile-directory:
  file.directory:
    - name: /etc/systemd/system/
    - user: vagrant
    - group: vagrant
    - mode: 750
    - makedirs: True

# Oikeudet tallennustilaan
/home/vagrant/.local/share/7DaysToDie:
  file.directory:
    - user: vagrant
    - group: vagrant
    - mode: 750
    - recurse:
      - user
      - group
      - mode

# Service tiedoston kopiointi
/etc/systemd/system/7daystodie.service:
  file.managed:
    - source: salt://7daystodie.service
