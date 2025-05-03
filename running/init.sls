# Daemon uudelleenlataus väkisin
systemd_reload:
  cmd.run:
    - name: systemctl daemon-reload

# Palvelimen käynnistys
7daystodie:
  service.running:
    - enable: True
    - reload: True
    - require:
      - cmd: systemd_reload
