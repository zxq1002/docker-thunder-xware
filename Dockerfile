# Dockerizing thunder xware
# xware version: Xware1.0.16 release date: 2014-08-27

FROM armbuild/ubuntu
MAINTAINER zhouxq <zxq1002@gmail.com>

RUN rm /bin/sh && ln -s /bin/bash /bin/sh && \
    mkdir -p /app/bin

ADD thunder /app/
ADD start.sh /app/
VOLUME /app/TDDOWNLOAD

WORKDIR /app
RUN ln -s /lib/arm-linux-gnueabihf/ld-linux.so.3 /lib/ld-linux.so.3 && chmod +x start.sh && chmod +x ./bin/portal
CMD ["./start.sh"]

