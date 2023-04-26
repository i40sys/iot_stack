# i40sys.iot_stack.duc

Install and configure Dynamic Update Client (DUC) to update a DNS record with the current IP address.

## Requirements

Only tested on Ubuntu 18.04, 20.04 and 22.04.

## Example Playbook

At least three files are neeeded to run the playbook:

### collections/requirements.yml
```yaml
---
collections:
  - name: i40sys.iot_stack.duc
```

Install the collection:
```bash
ansible-galaxy collection install -r collections/requirements.yml
```

### playbook.yml
```yaml
---
- name: Install and configure DUC
  hosts: all
  gather_facts: true
  become: true
  roles:
    - ../duc:
      vars:
        interval: 1
        # username: the_username
        # password: the_password
        # domains: your_domain.ddns.net
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
| `interval` | `5` | Check the public IP every 5' |
| `username` | `the_username` | No-IP username |
| `password` | `the_password` | No-IP password |
| `domains` | `your_domain.ddns.net` | Dynamic DNS domain |
