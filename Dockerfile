FROM kd6kxr/buildqtweb8:buildqtweb8

# PREPARE THE ENVIRONMENT

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

# CONFIGURE THE BUILD SYSTEM

ENV QTDIR /opt/local/Qt
ENV PATH $QTDIR/bin:$PATH

# CONTINUE COMPILATION

RUN cd ~/qt/qtwebengine && timeout 100m make -j2 ; exit 0

# SET ENTRYPOINT COMMAND

CMD bash

LABEL maintainer="kd6kxr@gmail.com"
