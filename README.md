# 🚀 Yandex Cloud Infrastructure as Code

Terraform-конфигурация для развертывания production-ready инфраструктуры в Yandex Cloud.

## 📦 Что входит в инфраструктуру

| Компонент | Описание |
|-----------|----------|
| **Network** | VPC, подсети, security groups |
| **Kubernetes** | Managed Service for Kubernetes (1.32) |
| **Container Registry** | Yandex Container Registry |
| **PostgreSQL** | Managed PostgreSQL для приложений |
| **Lockbox** | Безопасное хранение секретов |
| **GitLab** | Managed GitLab с CI/CD |
| **GitLab Runner** | Отдельная ВМ для CI/CD |


## 🔧 Требования

- [Terraform](https://www.terraform.io/downloads) >= 1.3
- [Yandex Cloud CLI](https://cloud.yandex.ru/docs/cli/quickstart)
- [Helm](https://helm.sh/) (опционально, для локальных проверок)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) (для настройки GitLab Runner)

## 🚀 Быстрый старт

### Клонирование

```bash
git clone https://github.com/nocturnalbladeee/yandex_cloud_iac.git
cd yandex_cloud_iac/tf/environments/production
export YC_TOKEN=$(yc iam create-token)
export YC_CLOUD_ID=$(yc config get cloud-id)
export YC_FOLDER_ID=$(yc config get folder-id)
```
### Запуск
```bash
terraform init
terraform plan
terraform apply
```
