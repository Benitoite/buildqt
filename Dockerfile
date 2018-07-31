FROM kd6kxr/buildqtbase:base1

# PREPARE THE ENVIRONMENT

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

# CONFIGURE THE BUILD SYSTEM

ENV QTDIR /opt/local/Qt
ENV PATH $QTDIR/bin:$PATH

# COMPILE AND INSTALL SOFTWARE

RUN cd ~/qt-build && make -j4 module-qtwebengine && make install

# SET ENTRYPOINT COMMAND

CMD bash

LABEL maintainer="kd6kxr@gmail.com"
