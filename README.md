# DevOps Lab – Ansible + Docker + VMs (Production Structure)

## 1. Requirements

You need:

- Docker + Docker Compose
- Ansible
- SSH (for VM access)

Project uses:

- Role-based Ansible structure
- YAML inventories
- Environment separation (docker / vm)

---

## 2. Project Structure (Mental Model)

```
ansible-project/
├── inventories/     # WHERE (targets)
├── playbooks/       # WHAT (orchestration)
├── roles/           # HOW (logic)
├── docker/          # Docker environment
├── scripts/         # Run helpers
```

---

## 3. Clone Project

```bash
git clone https://github.com/Dimon1k/ansible-project.git
cd ansible-project
````

---

# 🐳 DOCKER ENVIRONMENT

## 4. Start Docker Containers

Go to docker folder:

```bash
cd docker
```

Run containers:

```bash
docker compose -f docker-compose.teacher.yml up -d
```

Containers:

* ubuntu-web-1 → [http://localhost:8081](http://localhost:8081)
* ubuntu-web-2 → [http://localhost:8084](http://localhost:8084)
* centos-web-3 → [http://localhost:8083](http://localhost:8083)

---

## 5. Run Ansible for Docker

Go back to root:

```bash
cd ..
```

Run:

```bash
./scripts/run.sh docker
```

---

## ⚠️ If SSH error appears (important)

If you see:

```
REMOTE HOST IDENTIFICATION HAS CHANGED
```

Run:

```bash
ssh-keygen -R "[127.0.0.1]:2221"
ssh-keygen -R "[127.0.0.1]:2224"
ssh-keygen -R "[127.0.0.1]:2223"
```

---

# 🖥️ VM ENVIRONMENT

## 6. VM Requirements

You must have:

* 2× Ubuntu + 1× CentOS/Rocky VM
* SSH configured via `~/.ssh/config`

Example:

```ssh
Host ubuntu-vm1
  HostName 192.168.56.5
  User admin
  IdentityFile ~/.ssh/id_rsa_ansible
```

---

## 7. Run Ansible for VMs

From project root:

```bash
./scripts/run.sh vm
```
