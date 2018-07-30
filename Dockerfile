FROM kd6kxr:buildqtbase

# PREPARE THE ENVIRONMENT

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

# CONFIGURE THE BUILD SYSTEM

ENV QTDIR /opt/local/Qt
ENV PATH $QTDIR/bin:$PATH
RUN cd ~/qt-build && ~/qt/configure -release -nomake tests -nomake examples -confirm-license -prefix /opt/local/Qt -opensource

# COMPILE AND INSTALL SOFTWARE

RUN cd ~/qt-build && make -j2 && make install

# SET ENTRYPOINT COMMAND

CMD bash

LABEL maintainer="kd6kxr@gmail.com"
