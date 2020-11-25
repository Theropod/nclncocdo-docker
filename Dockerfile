FROM busybox:latest as downloader
RUN mkdir /ncl
RUN wget https://www.earthsystemgrid.org/dataset/ncl.662.dap/file/ncl_ncarg-6.6.2-Debian9.8_64bit_gnu630.tar.gz && \
    tar -zxvf ncl_ncarg-6.6.2-Debian9.8_64bit_gnu630.tar.gz -C /ncl && \
    pwd
FROM ubuntu:18.04 as production
ENV NCARG_ROOT /usr/local/ncl
ENV PATH $NCARG_ROOT/bin:$PATH
COPY --from=0 /ncl /usr/local/ncl 
RUN apt update && \
    apt install -y --no-install-recommends csh libgfortran3 && \
    apt install -y --no-install-recommends nco && \
    apt install -y --no-install-recommends cdo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
