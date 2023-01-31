## template: jinja
#cloud-config

locale: ru_RU.UTF-8
timezone: Europe/Moscow

{% if v1.distro in ["centos"] %}
packages:
  - httpd
{% endif %}
{% if v1.distro in ["ubuntu", "debian"] %}
packages:
  - apache2
{% endif %}

users:
  - name: ${username}
    groups: sudo
    shell: /bin/bash
    sudo: ALL=(ALL) NOPASSWD:ALL
    ssh-authorized-keys:
      - ${ssh-key}
