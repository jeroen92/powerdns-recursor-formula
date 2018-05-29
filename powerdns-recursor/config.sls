{% from "powerdns-recursor/map.jinja" import powerdns-recursor with context %}

include:
  - powerdns-recursor

powerdns-recursor_config:
  file.managed:
    - name: {{ powerdns-recursor.lookup.config_file }}
    - source: salt://powerdns-recursor/files/recursor.conf
    - template: jinja
    - user: {{ powerdns-recursor.lookup.config_user }}
    - group: {{ powerdns-recursor.lookup.config_group }}
    - mode: 600
    - require:
      - pkg: powerdns-recursor
    - watch_in:
      - service: powerdns-recursor
