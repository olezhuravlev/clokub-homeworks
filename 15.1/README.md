# Домашнее задание к занятию "15.1. 
Организация сети"

Домашнее задание будет состоять из обязательной части, которую необходимо выполнить на провайдере Яндекс.Облако и дополнительной части в AWS по желанию. Все домашние задания в 15 блоке связаны друг с другом и в конце представляют пример законченной инфраструктуры.  
Все задания требуется выполнить с помощью Terraform, результатом выполненного домашнего задания будет код в репозитории.

Перед началом работ следует настроить доступ до облачных ресурсов из Terraform используя материалы прошлых лекций и [ДЗ](https://github.com/netology-code/virt-homeworks/tree/master/07-terraform-02-syntax ). А также заранее выбрать регион (в случае AWS) и зону.

---
## Задание 1. Яндекс.Облако (обязательное к выполнению)

1. Создать VPC.
- Создать пустую VPC. Выбрать зону.
2. Публичная подсеть.
- Создать в vpc subnet с названием public, сетью 192.168.10.0/24.
- Создать в этой подсети NAT-инстанс, присвоив ему адрес 192.168.10.254. В качестве image_id использовать fd80mrhj8fl2oe87o4e1
- Создать в этой публичной подсети виртуалку с публичным IP и подключиться к ней, убедиться что есть доступ к интернету.
3. Приватная подсеть.
- Создать в vpc subnet с названием private, сетью 192.168.20.0/24.
- Создать route table. Добавить статический маршрут, направляющий весь исходящий трафик private сети в NAT-инстанс
- Создать в этой приватной подсети виртуалку с внутренним IP, подключиться к ней через виртуалку, созданную ранее и убедиться что есть доступ к интернету

Resource terraform для ЯО
- [VPC subnet](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet)
- [Route table](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_route_table)
- [Compute Instance](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance)
---


## Решение Задания №1

> #### _Кликайте [по ссылкам](./terraform) для перехода к tf-файлам!_

| Действие                                                                              |                                          Результат                                           |
|:--------------------------------------------------------------------------------------|:--------------------------------------------------------------------------------------------:|
| [1. Создание папки](./terraform/01_provider.tf)                                       |                   ![01_folder_created.png](images%2F01_folder_created.png)                   |
| [2. Создание сети](./terraform/02_network.tf)                                         |                  ![02_network_created.png](images%2F02_network_created.png)                  |
| [3. Создание публичной подсети](./terraform/03_public_subnet.tf)                      |            ![03_public_subnet_created.png](images%2F03_public_subnet_created.png)            |
| [4. Создание экземпляра VM "NAT instance"](./terraform/04_nat_instance.tf)            |             ![04_NAT_instance_created.png](images%2F04_NAT_instance_created.png)             |
| [5. Создание экземпляра VM в публичной подсети](./terraform/05_public_ip_instance.tf) |       ![05_public_ip_instance_created.png](images%2F05_public_ip_instance_created.png)       |
| 5.1. Проверка наличия доступа в интернет из публичной подсети                         |  ![051_check_inet_connectivity_public.png](images%2F051_check_inet_connectivity_public.png)  |
| [6. Создание Route Table](./terraform/06_route_table.tf)                              |              ![06_route_table_created.png](images%2F06_route_table_created.png)              |
| [7. Создание приватной подсети](./terraform/07_private_subnet.tf)                     |           ![07_private_subnet_created.png](images%2F07_private_subnet_created.png)           |
| [8. Создание экземпляра VM в приватной сети](./terraform/08_private_ip_instance.tf)   |      ![08_private_ip_instance_created.png](images%2F08_private_ip_instance_created.png)      |
| 8.1. Подключение из VM публичной подсети к VM в приватной подсети                     |  ![081_connect_to_private_ip_instance.png](images%2F081_connect_to_private_ip_instance.png)  |
| 8.2. Проверка наличия доступа в интернет из VM в приватной подсети                    | ![082_check_inet_connectivity_private.png](images%2F082_check_inet_connectivity_private.png) |

Как видим, внешний IP-адрес при подключении из машины с прямым доступом в интернет совпадает с назначенным
ей адресом `51.250.86.239`, а внешний IP-адрес машины, находящейся в приватной подсети, совпадает с адресом,
присвоенным "NAT instance" - `51.250.92.68`:

![yc_vm_3.png](images%2Fyc_vm_3.png)

Таким образом, мы организовали доступ в интернет для машины, находящейся в приватной локальной сети, посредством
прохождения трафика по следующей цепочке:
- VM, находящаяся в приватной сети;
- приватная подсеть;
- таблица маршрутизации;
- NAT instance;
- публичная подсеть;
- интернет.

![diagram.jpg](images%2Fdiagram.jpg)

---

### _По причине блокировки AWS банковских карт задание №2 не выполнялось._

## Задание 2*. AWS (необязательное к выполнению)

1. Создать VPC.
- Создать пустую VPC с подсетью 10.10.0.0/16.
2. Публичная подсеть.
- Создать в vpc subnet с названием public, сетью 10.10.1.0/24
- Разрешить в данной subnet присвоение public IP по-умолчанию.
- Создать Internet gateway
- Добавить в таблицу маршрутизации маршрут, направляющий весь исходящий трафик в Internet gateway.
- Создать security group с разрешающими правилами на SSH и ICMP. Привязать данную security-group на все создаваемые в данном ДЗ виртуалки
- Создать в этой подсети виртуалку и убедиться, что инстанс имеет публичный IP. Подключиться к ней, убедиться что есть доступ к интернету.
- Добавить NAT gateway в public subnet.
3. Приватная подсеть.
- Создать в vpc subnet с названием private, сетью 10.10.2.0/24
- Создать отдельную таблицу маршрутизации и привязать ее к private-подсети
- Добавить Route, направляющий весь исходящий трафик private сети в NAT.
- Создать виртуалку в приватной сети.
- Подключиться к ней по SSH по-приватному IP через виртуалку, созданную ранее в публичной подсети и убедиться, что с виртуалки есть выход в интернет.

Resource terraform
- [VPC](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc)
- [Subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)
- [Internet Gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway)
