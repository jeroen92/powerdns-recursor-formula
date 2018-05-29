{% from "powerdns-recursor/map.jinja" import powerdns with context %}

powerdns-recursor:
  pkg.installed:
    - name: {{ powerdns.lookup.pkg }}
    - refresh_db: True

  service.running:
    - name: {{ powerdns.lookup.service }}
    - enable: True
    - require:
      - pkg: powerdns-recursor
