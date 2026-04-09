# DevOps Lab – Ansible + Docker + VMs

## 1. Підготовка

На машині викладача потрібні:

- Docker / Docker Compose
- Ansible

У корені проєкту всі файли: `vm-*.yml`, `docker-*.yml`, `docker-compose*.yml`, `dockerfiles/`, `index.html.j2`, `style.css`, `script.js`.

---

## 2. Запуск Docker‑контейнерів (3 веб‑сервери)

1. Клонувати репозиторій:

```bash
git clone https://github.com/Dimon1k/ansible-project.git
cd ansible-project
```

2. Підняти 3 контейнери з веб‑серверами:

```bash
docker compose -f docker-compose.teacher.yml up -d
```

Контейнери:

- `ubuntu-web-1` → порт `8081`
- `ubuntu-web-2` → порт `8084`
- `centos-web-3` → порт `8083`

---

## 3. Запуск Ansible для контейнерів

Inventory для контейнерів: `docker-inventory.ini`  
Playbook: `docker-playbook.yml`  
Конфігурація Ansible: `ansible.cfg` (вимкнена перевірка host key)

Запустити:

```bash
./run-ansible.sh docker
```

Або напряму:

```bash
ansible-playbook -i docker-inventory.ini docker-playbook.yml
```

Якщо виникає помилка, почистіть старі host keys:

```bash
ssh-keygen -R "[127.0.0.1]:2221"
ssh-keygen -R "[127.0.0.1]:2224"
ssh-keygen -R "[127.0.0.1]:2223"

```

Ansible:

- підключається по SSH до 3 контейнерів,
- ставить/перевіряє Apache (`apache2` / `httpd`),
- копіює `index.html.j2`, `style.css`, `script.js` у `/var/www/html`,
- сайт оновлюється автоматично.

Після виконання playbook сторінки знову доступні за:

- http://localhost:8081
- http://localhost:8084
- http://localhost:8083

---

## 4. Запуск Ansible для віртуальних машин (опційно)

Якщо є підготовлені ВМ (2×Ubuntu + 1×CentOS) з IP, прописаними у `vm-inventory.ini`, можна запустити playbook для ВМ:

```bash
./run-ansible.sh vms
```

або:

```bash
ansible-playbook -i vm-inventory.ini vm-playbook.yml --ask-become-pass
```

Цей playbook виконує ту саму логіку, що і для Docker‑контейнерів, але на віртуальних машинах.
