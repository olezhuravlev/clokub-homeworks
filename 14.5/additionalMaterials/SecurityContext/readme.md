# Kubernetes Security Context

Контекст безопасности определяет привилегии и параметры управления доступом для пода или контейнера. Настройки контекста безопасности включают:
* ACL - chown / chmod
* SELINUX
* Privileged Mode / Unprivileged mode
* SeCOMP
* AppArmor
* AllowPrivilegeEscalation

Ниже приведены различные поля, связанные с контекстами безопасности или политиками безопасности Pod

| Control Aspect | Field Names |
| ------ | ------ |
|Запуск привилегированных контейнеров|	privileged|
|Использование корневых пространств имен|	hostPID, hostIPC|
|Использование хост-сети и портов|	hostNetwork, hostPorts|
|Использование типов томов|	volumes|
|Использование файловой системы хоста|	allowedHostPaths|
|Белый список драйверов FlexVolume|	allowedFlexVolumes|
|Выделение группы FSGroup, которой принадлежат тома пода|	fsGroup|
|Требование использования корневой файловой системы только для чтения	|readOnlyRootFilesystem|
|Идентификаторы пользователя и группы контейнера	|runAsUser, supplementalGroups|
|Ограничение эскалации до привилегий root	|allowPrivilegeEscalation, defaultAllowPrivilegeEscalation|
|Возможности Linux	|defaultAddCapabilities, requiredDropCapabilities, allowedCapabilities|
|Контекст контейнера SELinux	|seLinux|
|Профиль AppArmor, используемый контейнерами|	annotations|
|Профиль seccomp, используемый контейнерами	|annotations|
|Профиль sysctl, используемый контейнерами|	annotations|


> Параметры Kubernetes securityContext определены как в PodSpec, так и в ContainerSpec
>
> Если параметр доступен и настроен в обеих областях, параметр контейнера будет иметь приоритет.


## Demo 1

Под без контекста безопасности

```
apiVersion: v1
kind: Pod
metadata:
  name: simplepod
spec:
  containers:
  - image: busybox
    name: busybox
    args:
    - sleep
    - "3600"

```

Проверьте устройства, подключенные к модулю

```
kubectl exec simplepod -it -- ls /dev
core             null             shm              termination-log
fd               ptmx             stderr           tty
full             pts              stdin            urandom
mqueue           random           stdout           zero
```
---

## Demo 2

Создайте pod с привилегиями podspec

```
apiVersion: v1
kind: Pod
metadata:
  name: privilegedpod
spec:
  containers:
  - image: busybox
    name: busybox
    args:
      - sleep
      - "3600"
    securityContext:
      privileged: true
```

Проверяем список девайсов

```
kubectl exec privilegedpod -it -- ls /dev
```


---

## Demo 3

Создайте манифест с контекстами безопасности, установленными как в поде, так и в контейнере.

```
apiVersion: v1
kind: Pod
metadata:
  name: pod3
spec:
  securityContext:
    runAsNonRoot: true
    runAsUser: 1000
    runAsGroup: 1000
  containers:
  - image: busybox
    name: busybox
    args:
    - sleep
    - "3600"
    securityContext:
      runAsUser: 2000
      readOnlyRootFilesystem: true
```

Убедитесь, что контекст безопасности контейнера переопределял контекст безопасности пода.

```
kubectl exec pod3 -it -- /bin/sh

ps -ef 
PID   USER     TIME  COMMAND
    1 2000      0:00 sleep 3600
   18 2000      0:00 /bin/sh
   23 2000      0:00 ps -ef


```

---

## Demo 4
```
apiVersion: v1
kind: Pod
metadata:
  name: security-context-demo
spec:
  securityContext:
    runAsUser: 1000
    fsGroup: 2000
  volumes:
  - name: sec-ctx-vol
    emptyDir: {}
  containers:
  - name: sec-ctx-demo
    image: gcr.io/google-samples/node-hello:1.0
    volumeMounts:
    - name: sec-ctx-vol
      mountPath: /data/demo
    securityContext:
      allowPrivilegeEscalation: false

```

Проверьте, применяются ли соответствующие контексты безопасности

```
kubectl exec -it security-context-demo bash 
```

Проверьте UID

```
 ps -ef 
UID        PID  PPID  C STIME TTY          TIME CMD
1000         1     0  0 14:09 ?        00:00:00 /bin/sh -c node server.js

```

Проверьте файлы внутри /data/demo — все файлы, созданные в этом каталоге, должны иметь права собственности 1000:2000.


```
cd /data/demo
touch test 
ls -ltra test 
-rw-r--r-- 1 1000 2000    0 Dec 28 14:10 test

```
--- 

## Demo 5 - Удаление Linux Capabilities

```
apiVersion: v1
kind: Pod
metadata:
  name: bbox-cap
spec:
  containers:
  - image: gcr.io/google-samples/node-hello:1.0
    name: bbox-cap
    securityContext:
      capabilities:
        drop:
          - NET_RAW
          - CHOWN

```

```
kubectl exec -it bbox-cap bash
```

Убедитесь, что возможности удалены

```

root@flask-cap:/# ping 8.8.8.8
ping: Lacking privilege for raw socket.
root@flask-cap:/# chown root:root * 
chown: changing ownership of 'sys': Read-only file system

```