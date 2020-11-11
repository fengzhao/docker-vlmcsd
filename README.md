# 微软KMS激活



## 简介

以 Alpine OS 做为 base image , 从  [vlmcsd](https://github.com/Wind4/vlmcsd) 中 clone 代码，构建 docker image 



## 服务器部署KMS

设置 webhook ，代码更新或发布release ，阿里云上自动构建



```shell
# 从dockerhub拉取镜像并运行容器
$ sudo docker run -d -p 1688:1688 --restart=always --name  kms-server  chinafengzhao/vlmcsd

# 从阿里云镜像仓库拉取镜像并运行容器
$ sudo docker run -d -p  1688:1688 --restart=always --name kms-server \
		registry.cn-shenzhen.aliyuncs.com/fengzhao/kms-server:latest 

```



## To view docker log:
Now (thanks to embii74) vlmcsd process send logs to docker.

查看容器日志

> $ docker logs vlmcsd (change 'vlmcsd' with the docker's name)





## 客户端激活

### Windows
>slmgr.vbs -upk  
>slmgr.vbs -ipk XXXXX-XXXXX-XXXXX-XXXXX-XXXXX  
>slmgr.vbs -skms DOCKER_IP  
>slmgr.vbs -ato  
>slmgr.vbs -dlv  

### Office x86
>cd \Program Files (x86)\Microsoft Office\Office16  
>cscript ospp.vbs /sethst:DOCKER_IP  
>cscript ospp.vbs /inpkey:xxxxx-xxxxx-xxxxx-xxxxx-xxxxx  
>cscript ospp.vbs /act  
>cscript ospp.vbs /dstatusall  

### Office x86_64
>cd \Program Files\Microsoft Office\Office16  
>cscript ospp.vbs /sethst:DOCKER_IP  
>cscript ospp.vbs /inpkey:xxxxx-xxxxx-xxxxx-xxxxx-xxxxx  
>cscript ospp.vbs /act  
>cscript ospp.vbs /dstatusall  

## Sources
> https://forums.mydigitallife.info/threads/50234-Emulated-KMS-Servers-on-non-Windows-platforms  
https://github.com/Wind4/vlmcsd

## GVLK keys
> Windows: https://docs.microsoft.com/en-us/windows-server/get-started/kmsclientkeys  
> Office 2013: https://technet.microsoft.com/en-us/library/dn385360.aspx  
> Office 2016 & 2019: https://technet.microsoft.com/en-us/library/dn385360(v=office.16).aspx

## Docker Link
> https://hub.docker.com/r/mikolatero/vlmcsd/
