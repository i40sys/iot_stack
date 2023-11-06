# i40sys.iot_stack.grafana

Install Grafana using a docker container.

## Requirements

Only tested on Ubuntu 18.04, 20.04 and 22.04.

## Example Playbook

At least three files are neeeded to run the playbook:

### collections/requirements.yml
```yaml
---
collections:
  - name: i40sys.iot_stack.grafana
```

Install the collection:
```bash
ansible-galaxy collection install -r collections/requirements.yml
```

### playbook.yml
```yaml
---
- name: Configure system basic setup
  hosts: all
  gather_facts: true
  become: true
  roles:
    - role: i40sys.iot_stack.grafana
      vars:
        root_url: "%(protocol)s://%(domain)s:%(http_port)s/"
        serve_from_sub_path: "false"
        http_port: "3000"
        timezone: "Europe/Madrid"

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
| root_url | "%(protocol)s://%(domain)s:%(http_port)s/" | Grafana root URL |
| serve_from_sub_path | false | Grafana serve from sub path |
| http_port | 3000 | Grafana HTTP port |
