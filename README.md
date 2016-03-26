# Dockerizing thunder xware
arm linux版迅雷离线下载 docker 镜像, 只要路由、nas、树莓派等支持docker就可以轻松运行~

最初为QNAP TS-231+制作的镜像，内置远程迅雷版本位Xware1.0.31_armel_v5te_glibc。

## 1、QNAP容器工作站中运行
只需设置共享目录映射和cpu内存上限即可，运行后可以直接看到容器日志获取激活码。

## 2、命令行运行
### 拉取镜像

```
docker pull zxq1002/docker-thunder-xware:latest
```

### 创建一个下载目录. 用于挂载卷

```
mkdir data
```

### 运行

```
docker run -d \
        --name=xware \
        --net=host \
        -v $(pwd)/data:/app/TDDOWNLOAD \
        zxq1002/docker-thunder-xware
```

### 查看运行情况

```
docker ps
```

```
// output:
CONTAINER ID        IMAGE                                 COMMAND             CREATED             STATUS              PORTS               NAMES
c8a3d047af71        zxq1002/docker-thunder-xware:latest   "./start.sh"        4 seconds ago       Up 3 seconds                            xware
```

### 查看日志(激活码)/到迅雷增加设备

```
docker logs xware
```

```
// output:
killall: ETMDaemon: no process killed
killall: EmbedThunderManager: no process killed
killall: vod_httpserver: no process killed
initing...
try stopping xunlei service first...
setting xunlei runtime env...
port: 9000 is usable.

YOUR CONTROL PORT IS: 9000

starting xunlei service...
Connecting to 127.0.0.1:9000 (127.0.0.1:9000)
setting xunlei runtime env...
port: 9000 is usable.

YOUR CONTROL PORT IS: 9000

starting xunlei service...

getting xunlei service info...

THE ACTIVE CODE IS: xxx

go to http://yuancheng.xunlei.com, bind your device with the active code.
finished.
```

绑定成功后就可以开心地使用了.




