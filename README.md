## MacOS本地环境搭建方法

使用`sdkman`安装`java`：

![](https://raw.githubusercontent.com/liweinan/docker-hibernate-build/master/imgs/5EC14C85-DD4C-4E71-815B-DD526E54B60E.png)

![](https://raw.githubusercontent.com/liweinan/docker-hibernate-build/master/imgs/F952E79C-45AB-4555-8A49-0DB888D57C8F.png)

启动容器（注意容器会启动`postgresql`服务，要停掉`host`的`postgresql`服务）：

```bash
$ docker-compose up
```

![](https://raw.githubusercontent.com/liweinan/docker-hibernate-build/master/imgs/DBB8F4FE-B9A1-47EC-945D-599E97BE5CC7.png)

登录容器：

```bash
$ docker exec -it docker-hibernate-build_default_1 bash
```

![](https://raw.githubusercontent.com/liweinan/docker-hibernate-build/master/imgs/17ADF2D1-BCCB-484D-9373-B6DF8AC4A4EF.png)

∎
