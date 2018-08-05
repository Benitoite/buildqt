FROM kd6kxr/buildqtweb:buildqtweb

# PREPARE THE ENVIRONMENT

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

# CONFIGURE THE BUILD SYSTEM

ENV QTDIR /opt/local/Qt
ENV PATH $QTDIR/bin:$PATH

# COMPILE AND INSTALL SOFTWARE

RUN cd ~/qt/qtsvg && qmake && make -j2 && make install
RUN cd ~/qt/qtxmlpatterns && qmake && make -j2 && make install
RUN cd ~/qt/qttools && qmake && make -j2 && make install
RUN cd ~/qt/qttranslations && qmake && make -j2 && make install

# SET ENTRYPOINT COMMAND

CMD bash

LABEL maintainer="kd6kxr@gmail.com"
