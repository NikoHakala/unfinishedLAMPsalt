libapache2-mod-php:
  pkg.installed

/etc/apache2/mods-available/php7.2.conf:
  file.managed:
    - source: salt://php/default-php7.2.conf

apache2restart:
  service.running:
    - name: apache2
    - watch:
      - file: /etc/apache2/mods-available/php7.2.conf
