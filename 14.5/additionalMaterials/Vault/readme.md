# Работа с секретами в k8s с использованием Hashicorp Vault

## Общая Информация

Структура каталогов:

* demo - папка с примерами применения
  * app - дем приложение на GO с авторизацией AppRole
  * nginx - пример генерации и релоада конфига nginx
* manifests - манифесты для разворачивания Vault

В данном примере хранилище Vault располагается на файловой системе, которая монтируется в контейнер через PersistentVolumeClaim.
В качестве провайдера типа носителя указан nfs-provisioner. Вы можете его либо установить самостоятельно и подключить к NFS серверу или же сменить на другой тип.

Демонстрационное Go приложение доступно в этом [репозитории.](https://gitlab.com/k11s-os/vault-approle-auth)
В репозитории с приложением содержиться файл с документацией как работает приложение.

## Установка демонстрационного GO приложения

Воспользуйтесь [этой](https://gitlab.com/k11s-os/vault-approle-auth/-/blob/main/README.md) документацией.

## Конфигурирование и обновление конфига Nginx

#### 1. Добавить секретные данные используя cli если необходимо, или же добавьте нужные данные через GUI

```shell
$ vault kv put secrets/k11s/demo/app/nginx responseText="Hello from Vault"
```
#### 2. Создать политику для роли

```shell
$ vault policy write -tls-skip-verify nginx_conf_demo -<<EOF
# Read-only permission on secrets stored at 'secrets/k11s/demo/app/nginx'
path "secrets/data/k11s/demo/app/nginx" {
  capabilities = [ "read" ]
}
EOF

```

#### 3. Создать роль

```shell
$ vault write -tls-skip-verify auth/approle/role/nginx-demo \
  token_policies="nginx_conf_demo" \
  token_ttl=1h \
  token_max_ttl=4h \
  secret_id_bound_cidrs="0.0.0.0/0","127.0.0.1/32" \
  token_bound_cidrs="0.0.0.0/0","127.0.0.1/32" \
  secret_id_ttl=60m policies="nginx_conf_demo" \
  bind_secret_id=false
```

#### 4. Проверить созданную роль

```shell
$ vault read -tls-skip-verify auth/approle/role/nginx-demo
```

#### 5. Получить RoleID

```shell
$ vault read -tls-skip-verify auth/approle/role/nginx-demo/role-id
```