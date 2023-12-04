# i40sys.iot_stack.homer

Install Homer using a docker container.

## Requirements

Only tested on Ubuntu 18.04, 20.04 and 22.04.

## Example Playbook

At least three files are neeeded to run the playbook:

### collections/requirements.yml
```yaml
---
collections:
  - name: i40sys.iot_stack.homer
```

Install the collection:
```bash
ansible-galaxy collection install -r collections/requirements.yml
```

### playbook.yml
```yaml
---
- hosts: all
  become: true
  remote_user: root
  roles:
    - role: ../homer
      vars:
        hostname_fqdn: domain.tld
        grafana_fqdn: https://grafana.domain.tld
        influxdb_fqdn: https://influxdb.domain.tld
        nodered_fqdn: https://nodered.domain.tld
        n8n_fqdn: https://n8n.domain.tld
```

### inventory.yml
example:
```yaml
all:
  children:
    iot-gw-hyperv:
      hosts:
        10.2.0.171:
  vars:
    ansible_ssh_common_args: '-o StrictHostKeyChecking=no'
    ansible_user: 'oriol'
    #ansible_ssh_pass: ''
    #ansible_port: 5555
    #ansible_connection: 'ssh'
```

Run the playbook:
```bash
ansible-playbook -i inventory.yml playbook.yml
```

## Testing Playbook

```bash
# assuming that we're in the root of the role:
ansible-playbook -i tests/inventory.yml tests/test.yml
```

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

| Variable | Default | Description |
|----------|---------|-------------|
| `timezone` | `Europe/Madrid` | Timezone |
| `hostname_fqdn` | `domain.tld` | Hostname |
| `grafana_fqdn` | `https://grafana.domain.tld` | Grafana FQDN |
| `influxdb_fqdn` | `https://influxdb.domain.tld` | InfluxDB FQDN |
| `nodered_fqdn` | `https://nodered.domain.tld` | Node-RED FQDN |
| `n8n_fqdn` | `https://n8n.domain.tld` | n8n FQDN |
