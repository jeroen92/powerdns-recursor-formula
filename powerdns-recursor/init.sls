{% from "powerdns-recursor/map.jinja" import powerdns-recursor with context %}

powerdns-recursor:
  pkg.installed:
    - name: {{ powerdns-recursor.lookup.pkg }}
    - refresh_db: True

  service.running:
    - name: {{ powerdns-recursor.lookup.service }}
    - enable: True
    - require:
      - pkg: powerdns-recursor
