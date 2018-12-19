### Usage

```
cp ansible_hosts.example ansible_hosts
cp ansible_var_prepare.yml.example ansible_var_prepare.yml
```

```
bash ansible_playbook_prepare.sh -e "@ansible_var_prepare.yml" -i ansible_hosts
```

```
cd /data/x_jumpserver/compose_project
bash docker-compose.sh up
```

```
xdg-open http://localhost:8080/

Username: admin
Password: admin
```

```
ssh -p 2222 admin@localhost

Password: admin
```

### Note

* The Asset should have `/usr/bin/python`

e.g.

```
apt install python3
ln -sf /usr/bin/python3 /usr/bin/python
```
