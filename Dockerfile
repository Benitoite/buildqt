FROM kd6kxr/buildqtbase

# PREPARE THE ENVIRONMENT

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

# GET A DEPENDENCY

RUN apt-get update && apt-get install libdbus-1-dev && apt-get clean

# CONFIGURE THE BUILD SYSTEM

ENV QTDIR /opt/local/Qt
ENV PATH $QTDIR/bin:$PATH
RUN mkdir ~/qt-build/qtwebengine && cd ~/qt-build/qtwebengine && qmake ~/qt/qtwebengine && ~/qt/qtwebengine/configure -release -nomake tests -nomake examples -confirm-license -prefix /opt/local/Qt -opensource
RUN mkdir ~/qt-build/qtsvg && cd ~/qt-build/qtsvg && qmake ~/qt/qtsvg && ~/qt/qtsvg/configure -release -nomake tests -nomake examples -confirm-license -prefix /opt/local/Qt -opensource

# COMPILE AND INSTALL SOFTWARE

RUN cd ~/qt-build/qtwebengine && make -j4 && make install
RUN cd ~/qt-build/qtsvg && make -j4 && make install


# SET ENTRYPOINT COMMAND

CMD bash

LABEL maintainer="kd6kxr@gmail.com"
