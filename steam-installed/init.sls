# Päivitetään pakettilista
package_cache_refresh:
  module.run:
    - name: pkg.refresh_db

# Mukaillaan manuaalista asetusta ja asennetaan tarvittavat arkkitehtuurit
software_properties_common:
  pkg.installed:
    - name: python3-software-properties
    - require:
      - module: package_cache_refresh

# Non-free repositorylle vaihtoehtoinen tapa
debian_sources:
  file.replace:
    - name: /etc/apt/sources.list
    - pattern: '^deb http://deb.debian.org/debian bookworm main$'
    - repl: "deb http://deb.debian.org/debian bookworm main contrib non-free non-free-firmware"
    - append_if_not_found: True

i386_architecture_added:
  cmd.run:
    - name: sudo dpkg --add-architecture i386
    - unless: grep -q "^i386" /proc/cpuinfo

# Uusi päivitys
final_package_cache_refresh:
  module.run:
    - name: pkg.refresh_db

steamcmd_dependencies:
  pkg.installed:
    - pkgs:
      - lib32stdc++6

steamcmd_installed:
  cmd.run:
    - name: |
        cd /usr/games/steamcmd
        curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
    - require:
      - pkg: steamcmd_dependencies

# SteamCMD kansio oikeuksineen
steam_directory:
  file.directory:
    - name: /usr/games/steamcmd
    - user: vagrant
    - group: vagrant
    - mode: 750
