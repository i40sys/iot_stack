# i40sys.iot_stack.influxdb2

Install InfluxDB using a docker container.

## Requirements

Only tested on Ubuntu 18.04, 20.04 and 22.04.

## Example Playbook

At least three files are neeeded to run the playbook:

### collections/requirements.yml
```yaml
---
collections:
  - name: i40sys.iot_stack.influxdb2
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
    - role: i40sys.iot_stack.influxdb2
      vars:
        timezone: 'Europe/Madrid'
        data_path: /data/influx2
        docker_influxdb_init_username: admin
        docker_influxdb_init_password: The2password.
        docker_influxdb_init_org: my_org
        docker_influxdb_init_bucket: my_bucket
        docker_influxdb_retention: 1w
        docker_influxdb_init_admin_token: q_XYZDwJ8zlMWEKeJ7kfdDR6AyuxsZexG5NyT3Iy4bJ3cwhZLO-6Y9OiDRJyNWjNK1ErW_qHp6DUwbPWR5tleg==

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
| data_path | /data/influx2 | database data path |
| docker_influxdb_init_username | admin | InfluxDB admin username |
| docker_influxdb_init_password | The2password. | InfluxDB admin password |
| docker_influxdb_init_org | my_org | InfluxDB organization |
| docker_influxdb_init_bucket | my_bucket | InfluxDB bucket |
| docker_influxdb_retention | 1w | InfluxDB retention |
| docker_influxdb_init_admin_token | q_XYZDwJ8zlMWEKeJ7kfdDR6AyuxsZexG5NyT3Iy4bJ3cwhZLO-6Y9OiDRJyNWjNK1ErW_qHp6DUwbPWR5tleg== | InfluxDB admin token |
