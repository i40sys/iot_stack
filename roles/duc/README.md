Role Name
=========

A brief description of the role goes here.

Requirements
------------

- Create an account at noip.com.
- Create a hostname.
- Configure 'Account > Account Info > Basic Info': email, password and username.

Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Testing Playbook
----------------

```
# 1. checking syntax
ansible-playbook -i tests/inventory tests/test.yml --syntax-check

# 2. deploying
ansible-playbook -i tests/inventory tests/test.yml

# 3. idempotency
ansible-playbook -i tests/inventory tests/test.yml | tee /tmp/output.txt; grep -q 'changed=0.*failed=0' /tmp/output.txt && (echo 'Idempotence test: pass' && exit 0) || (echo 'Idempotence test: fail' && exit 1)
```


Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
