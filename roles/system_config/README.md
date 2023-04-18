# i40sys.iot_stack.system_config

This role configures the system. The collection is designed for running on Ubuntu, so the role setup Ubuntu basics.

## Requirements

Just a Ubuntu system. It was tested with Ubuntu 18.04, 20.04 and 22.04.

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

| Variable | Default | Description |
|----------|---------|-------------|
| `timezone` | `Europe/Madrid` | Time zone of the IoT GW |

## Testing Playbook

```bash
cd tests
ansible-playbook -i inventory.yml test.yml
```
