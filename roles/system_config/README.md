# i40sys.iot_stack.system_config

This role configures the system. The collection is designed for running on Ubuntu, so the role setup Ubuntu basics.

## Requirements

Just a Ubuntu system. It was tested with Ubuntu 18.04, 20.04 and 22.04.

## Example Playbook

At least three files are neeeded to run the playbook:

### collections/requirements.yml
```yaml
---
collections:
  - name: i40sys.iot_stack.system_config
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
    - role: i40sys.iot_stack.system_config
      # vars:
      #   timezone: "Europe/Madrid"
      #   ntp_server: true
      #   ntp_servers:
      #     - 0.es.pool.ntp.org
      #     - 1.es.pool.ntp.org
      #     - 2.es.pool.ntp.org
      #     - 3.es.pool.ntp.org
      #   ntp_server_white_list:
      #     - 10.0.0.0/8
      #     - 192.168.0.0/16
      #     - 172.16.0.0/12
      #   mailhub: smtp.eu.sparkpostmail.com:587
      #   authuser: SMTP_Injection
      #   authpass: "a524XXXXXXX"
      #   notify_email: "user@example.com"
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

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

| Variable | Default | Description |
|----------|---------|-------------|
| `timezone` | `Europe/Madrid` | Time zone of the IoT GW |
| `ntp_server` | `true` | Enable NTP service |
| `ntp_servers` | `["0.ubuntu.pool.ntp.org", "1.ubuntu.pool.ntp.org", "2.ubuntu.pool.ntp.org", "3.ubuntu.pool.ntp.org"]` | List of NTP servers |
| `ntp_server_white_list` | `["10.0.0.0/8", "192.168.0.0/16", "172.16.0.0/12"]` | Allowd IPs for querying the NTP server |
| `mailhub` | `smtp.eu.sparkpostmail.com:587` | SMTP relay server |
| `authuser` | `SMTP_Injection` | SMTP relay user, not required for Sparkpost service |
| `authpass` | `"a524XXXXXXX"` | SMTP relay password |
| `notify_email` | `"user@example.com"` | Email address to send notifications |

## Testing Playbook

```bash
# assuming that we're in the root of the role:
ansible-playbook -i tests/inventory.yml tests/test.yml
```
