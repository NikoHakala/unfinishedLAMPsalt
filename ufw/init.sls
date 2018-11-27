ufw:
  pkg.installed

/etc/ufw/user.rules:
  file.managed:
    - source: salt://ufw/default-user.rules
    - require:
      - ufw

/etc/ufw/user6.rules:
  file.managed:
    - source: salt://ufw/default-user6.rules
    - require:
      - ufw

ufw-enable:
  cmd.run:
    - name: 'ufw --force enable'
    - require:
      - ufw

ufw.service:
  service.running:
    - watch:
      - file: /etc/ufw/user.rules
      - file: /etc/ufw/user6.rules
