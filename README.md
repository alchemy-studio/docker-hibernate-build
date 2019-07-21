# 本容器在MacOS环境下的使用方法

## 安装java

使用`sdkman`安装`java`：

```bash
$ sdk install java 11.0.3.hs-adpt
```

```bash
$ sdk use java 11.0.3.hs-adpt

Using java version 11.0.3.hs-adpt in this shell.
```

```bash
$ java -version
openjdk version "11.0.3" 2019-04-16
OpenJDK Runtime Environment AdoptOpenJDK (build 11.0.3+7)
OpenJDK 64-Bit Server VM AdoptOpenJDK (build 11.0.3+7, mixed mode)
```

## 启动容器

启动容器，注意容器会启动`postgresql`服务，要停掉`host`的本地`postgresql`服务：

```bash
$ pg_ctl -D /usr/local/var/postgres stop
```

停掉本地服务以后，运行下面的命令：

```bash
$ docker-compose -f docker-compose-production.yml up  
```

在`host`连接容器的数据库试试看：

```txt
$ psql -U foo_usr -h localhost foo_db
Password for user foo_usr: foo
psql (10.4, server 9.6.13)
Type "help" for help.

foo_db=>
```

如上所示，可以在`host`这边通过端口访问容器的数据库。

## 挂装容器内部的hibernate工程目录至host

查看容器映射出来的`ssh`服务的接口：

```bash
$ docker ps
CONTAINER ID        IMAGE                                COMMAND                  CREATED             STATUS              PORTS                                           NAMES
f940b1aff81b        weli/docker-hibernate-build:latest   "/var/run/postinstal…"   4 hours ago         Up 4 hours          0.0.0.0:5432->5432/tcp, 0.0.0.0:32771->22/tcp   docker-hibernate-build_default_1
```

如上所示，映射出来的端口是`32771`。使用`ssh`登录试试看：

```bash
$ ssh root@localhost -p 32771
```

```bash
$ ssh root@localhost -p 32771
Warning: Permanently added '[localhost]:32771' (ECDSA) to the list of known hosts.
root@localhost's password: foo
Linux f940b1aff81b 4.9.125-linuxkit #1 SMP Fri Sep 7 08:20:28 UTC 2018 x86_64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Sun Jul 21 10:05:56 2019 from 172.21.0.1
root@f940b1aff81b:~#
```

如上所示，成功登录，注意`root`的登录密码是`foo`。

通过`ssh`挂装容器里的目录至`host`，需要安装`sshfs`：

```bash
$ brew install sshfs
```

安装好以后，挂装容器目录：

```bash
$ ssh -p 32771 root@localhost:/ /work
```

第一次挂装的时候，MacOS会弹出安全设置的提示，允许`sshfs`的权限操作就可以了。如果挂装成功，可以看到`host`的`/work`目录里面已经是容器的根目录了：

```bash
$ ls /work
bin   dev   home  lib64 mnt   proc  run   srv   tmp   var
boot  etc   lib   media opt   root  sbin  sys   usr   work
$
```

接下来可以看看容器内部的`work`目录内容：

```bash
$ ls /work/work
hibernate-orm
```

可以看到容器里面的`hibernate-orm`这个已经编译好的工程目录：

```bash
$ ls /work/work/hibernate-orm
CONTRIBUTING.md                        hibernate-infinispan
README.md                              hibernate-integrationtest-java-modules
build.gradle                           hibernate-java8
buildSrc                               hibernate-jcache
changelog.txt                          hibernate-jipijapa
databases                              hibernate-orm-modules
dco.txt                                hibernate-osgi
documentation                          hibernate-proxool
etc                                    hibernate-spatial
gradle                                 hibernate-testing
gradlew                                hibernate-vibur
gradlew.bat                            hibernate_logo.gif
hibernate-agroal                       lgpl.txt
hibernate-c3p0                         migration-guide.adoc
hibernate-core                         release
hibernate-ehcache                      settings.gradle
hibernate-entitymanager                shared
hibernate-envers                       tooling
hibernate-hikaricp                     utilities.gradle
$
```

这样，在`host`这边就可以直接访问容器里面的`hibernate-orm`目录了。

## 开发模式

```bash
$ docker-compose -f docker-compose-development.yml up  
```

## 登录容器

```bash
$ docker exec -it docker-hibernate-build_default_1 bash
```

∎
