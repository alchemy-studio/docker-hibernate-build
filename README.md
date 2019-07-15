创建`data`目录：

```bash
$ sudo mkdir /data
$ sudo chown `whoami` /data
```

在`docker`里添加`/data`作为共享目录。

启动容器：

```bash
$ docker-compose up
```

使用容器：

```bash
$ docker exec -it docker-hibernate-build_default_1 bash
```

拷贝编译好的项目至host

```bash
$ cd /work && cp -r hibernate-orm /data  
```

∎
