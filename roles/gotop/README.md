Ansible Module: Install gotop
=============================

Install gotop, just downloading the binary and moving it to /usr/local/bin

If you don't know gotop, there is more information at https://github.com/xxxserxxx/gotop
Short definition, it's a top like command in asteroids.


Requirements
------------

- Internet for downloading the binary
- SSH access to the target host
- x86_64 architecture

Role Variables
--------------

There are only two variables, the binary filename and the repository URL where it can be downloaded.

Dependencies
------------

None

Example Playbook
----------------

For instance, run_install_gotop.yml:

```
- become: yes
  user: root
  hosts: all
  name: Installing gotop
  roles:
    - { role: gotop }
```

Custom ansible.cfg for not installing the role. Just locate this file in the same place that you habe the 'run_install_gotop.yml' file.

ansible.cfg contents:

```
[defaults]
role_path = ./roles:/etc/ansible/roles
```

And it can be run with:

```
# replace localhost host with the IP address of your target host.
# IMPORTANT! keep the comma at the end of the string, or IP address that you use.
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i 'localhost,' run_install_gotop.yml
```

License
-------

BSD

Author Information
------------------

Oriol Rius <oriol@joor.net>