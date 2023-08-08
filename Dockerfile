FROM pytorch/pytorch:latest
#FROM philippgille/dotnet-libglib:latest
# 更新apt并安装基本依赖（如果需要的话）
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai
ENV LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH
# RUN apt-get update && apt-get install -y libglib2.0-0 libgl1-mesa-glx git
RUN apt-get update && apt-get install -y libglib2.0-0 libgl1-mesa-glx git vim
# 设置工作目录
WORKDIR /app
# MobileSAM原地址：https://github.com/ChaoningZhang/MobileSAM.git
RUN git clone https://github.com/Albertwindows/MobileSAM-docker.git && pip install -r /app/MobileSAM-docker/app/requirements.txt && pip install gradio opencv-python

# 暴露容器内部的80端口
EXPOSE 7860
WORKDIR /app/MobileSAM-docker/app
CMD ["python", "app.py"]

# 运行命令
# docker run -d -p 80:7860 Mobile-SAM

