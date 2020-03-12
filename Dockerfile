# 第一行必须指定基础容器，本例使用python基础容器
FROM python
# 维护者信息(可选)
MAINTAINER  yangyi@tib.cas.cn
# 将requirements.txt拷贝到根目录下
COPY requirements.txt ./requirements.txt
# 安装requirements.txt中的包
RUN pip install -r requirements.txt
# 在home文件夹下创建gsmn文件夹
RUN mkdir /home/gsmn
# 指定工作目录为/home/gsmn/
WORKDIR /home/gsmn/
# 将qualitycontrol-workflow文件夹拷贝到/home/gsmn/中
COPY qualitycontrol-workflow /home/gsmn
# 容器启动时执行指令，运行jupyter-notebook
CMD jupyter-notebook --ip=0.0.0.0 --no-browser --allow-root