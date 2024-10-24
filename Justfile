VERSION := `yq -r .version galaxy.yml`

version:
  echo {{ VERSION }}

tag:
  git add .
  git commit -am "release version"
  git push -u gitea master
  git tag v{{ VERSION }} || true
  git push --tags -u gitea
  git push --tags -u github

build:
  ansible-galaxy collection build .

galaxy-push:
  ansible-galaxy collection publish i40sys-iot_stack-{{VERSION}}.tar.gz --api-key fdba2f615d2fd9599a17c9afc0ef0c2f61555a61
