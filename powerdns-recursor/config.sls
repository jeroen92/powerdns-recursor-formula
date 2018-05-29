{% from "powerdns-recursor/map.jinja" import powerdns with context %}

include:
  - powerdns-recursor

powerdns-recursor_config:
  file.managed:
    - name: {{ powerdns.lookup.config_file }}
    - source: salt://powerdns-recursor/files/recursor.conf
    - template: jinja
    - user: {{ powerdns.lookup.config_user }}
    - group: {{ powerdns.lookup.config_group }}
    - mode: 600
    - require:
      - pkg: powerdns-recursor
    - watch_in:
      - service: powerdns-recursor
