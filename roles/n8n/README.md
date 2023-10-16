# i40sys.iot_stack.n8n

Install n8n using a docker container.

## Requirements

Only tested on Ubuntu 18.04, 20.04 and 22.04.

## Example Playbook

At least three files are neeeded to run the playbook:

### collections/requirements.yml
```yaml
---
collections:
  - name: i40sys.iot_stack.n8n
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
    - role: i40sys.iot_stack.n8n
        timezone: Europe/Madrid
        n8n_basic_auth_active: true
        n8n_basic_auth_user: admin
        n8n_basic_auth_password: The2password.
        n8n_webhook: https://n8n.group00.joor.net/
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
| `n8n_basic_auth_active` | `true` | Enable basic auth |
| `n8n_basic_auth_user` | `the_username` | Basic auth user |
| `n8n_basic_auth_password` | `the_password` | Basic auth password |
| `n8n_webhook` | `https://hookurl.tld/` | Webhook URL, it has to be https link for reaching the service from Internet |
