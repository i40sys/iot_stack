# i40sys.iot_stack.system_config

This role configures the system. The collection is designed for running on Ubuntu, so the role setup Ubuntu basics.

## Requirements

Just a Ubuntu system. It was tested with Ubuntu 18.04, 20.04 and 22.04.

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
cd tests
ansible-playbook -i inventory.yml test.yml
```
