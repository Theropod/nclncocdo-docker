FROM busybox:latest as downloader
RUN mkdir /ncl
RUN wget https://www.earthsystemgrid.org/dataset/ncl.662.dap/file/ncl_ncarg-6.6.2-Debian9.8_64bit_gnu630.tar.gz && \
    tar -zxvf ncl_ncarg-6.6.2-Debian9.8_64bit_gnu630.tar.gz -C /ncl && \
    wget http://mirrors.kernel.org/ubuntu/pool/universe/g/gcc-6/libgfortran3_6.5.0-2ubuntu1~18.04_amd64.deb && \    
    wget http://mirrors.kernel.org/ubuntu/pool/universe/g/gcc-6/gcc-6-base_6.5.0-2ubuntu1~18.04_amd64.deb && \
    pwd
FROM ubuntu:latest as production
ENV NCARG_ROOT /usr/local/ncl
ENV PATH $NCARG_ROOT/bin:$PATH
COPY --from=0 /ncl /usr/local/ncl 
COPY --from=0 gcc-6-base_6.5.0-2ubuntu1~18.04_amd64.deb .
COPY --from=0 libgfortran3_6.5.0-2ubuntu1~18.04_amd64.deb .
ENV TZ Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update && \
    apt install -y --no-install-recommends csh && \
    apt install -y --no-install-recommends nco && \
    apt install -y --no-install-recommends cdo && \
    dpkg -i gcc-6-base_6.5.0-2ubuntu1~18.04_amd64.deb && \
    dpkg -i libgfortran3_6.5.0-2ubuntu1~18.04_amd64.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf libgfortran3_6.5.0-2ubuntu1~18.04_amd64.deb gcc-6-base_6.5.0-2ubuntu1~18.04_amd64.deb
