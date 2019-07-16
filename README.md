## MacOS本地环境搭建方法

使用`sdkman`安装`java`：

![](https://raw.githubusercontent.com/liweinan/docker-hibernate-build/master/imgs/5EC14C85-DD4C-4E71-815B-DD526E54B60E.png)

![](https://raw.githubusercontent.com/liweinan/docker-hibernate-build/master/imgs/F952E79C-45AB-4555-8A49-0DB888D57C8F.png)

创建`data`目录：

```bash
$ sudo mkdir /data
$ sudo chown `whoami` /data
```

在`docker`里添加`/data`作为共享目录：

![](https://raw.githubusercontent.com/liweinan/docker-hibernate-build/master/imgs/ABE99609-0343-48E3-9F33-482B2DF0F0DA.png)

启动容器：

```bash
$ docker-compose up
```

![](https://raw.githubusercontent.com/liweinan/docker-hibernate-build/master/imgs/DBB8F4FE-B9A1-47EC-945D-599E97BE5CC7.png)

使用容器：

```bash
$ docker exec -it docker-hibernate-build_default_1 bash
```

![](https://raw.githubusercontent.com/liweinan/docker-hibernate-build/master/imgs/17ADF2D1-BCCB-484D-9373-B6DF8AC4A4EF.png)

∎
