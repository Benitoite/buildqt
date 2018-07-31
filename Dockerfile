FROM kd6kxr/buildqtbase

# PREPARE THE ENVIRONMENT

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

# GET A DEPENDENCY

RUN apt-get update && apt-get install libdbus-1-dev && apt-get clean

# CONFIGURE THE BUILD SYSTEM

ENV QTDIR /opt/local/Qt
ENV PATH $QTDIR/bin:$PATH

RUN mkdir ~/qt-build/qtsvg && cd ~/qt-build/qtsvg && qmake ~/qt/qtsvg
RUN mkdir ~/qt-build/qtdeclarative && cd ~/qt-build/qtdeclarative && qmake ~/qt/qtdeclarative
RUN mkdir ~/qt-build/qtquick1 && cd ~/qt-build/qtquick1 && qmake ~/qt/qtquick1
RUN mkdir ~/qt-build/qtwebchannel && cd ~/qt-build/qtwebchannel && qmake ~/qt/qtwebchannel
RUN mkdir ~/qt-build/qtwebengine && cd ~/qt-build/qtwebengine && qmake ~/qt/qtwebengine

# COMPILE AND INSTALL SOFTWARE

RUN cd ~/qt-build/qtsvg && make -j4
RUN cd ~/qt-build/qtquick1 && make -j4
RUN cd ~/qt-build/qtdeclarative && make -j4
RUN cd ~/qt-build/qtwebchannel && make -j4
RUN cd ~/qt-build/qtwebengine && make -j4

# SET ENTRYPOINT COMMAND

CMD bash

LABEL maintainer="kd6kxr@gmail.com"
