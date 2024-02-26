# Ansible Collection - i40sys.iot_stack

The purpose of this Ansible collection is to provide a set of roles to deploy an IoT Gateway.

There are several roles available:
- [system_config](roles/system_config/README.md): Configure the system.
- [docker](roles/docker/README.md): Install Docker and Docker Compose.
- [duc](roles/duc/README.md): Install DUC for mapping the dynamic public IP address to a DNS entry.
- [nodered](roles/nodered/README.md): Install Node-RED for managing IoT data flows and creating automations.
- [influxdb](roles/influxdb/README.md): Install InfluxDB for time series data.
- [grafana](roles/grafana/README.md): Install Grafana for create and manage dashboards.
- [n8n](roles/n8n/README.md): Install n8n for creating workflows.
- [homer](roles/homer/README.md): Install Homer for managing the IoT Gateway, create an HTML website with the list of services available in the IoT Gateway.

There are two MQTT brokers available:
- [mosquitto](roles/mosquitto/README.md): defacto standard lightweight MQTT broker.
- [nanomq](roles/nanomq/README.md): lightweight MQTT broker, but much more powerful than mosquitto.

# Resources

- [Ansible Galaxy](https://galaxy.ansible.com/i40sys/iot_stack)
- [Changelog](CHANGELOG.md)
- [LICENSE](LICENSE) - MIT

# Authors

- Industry 4.0 Systems - https://industry40.systems
