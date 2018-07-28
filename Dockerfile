FROM ubuntu:18.04

# PREPARE THE ENVIRONMENT

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

# DOWNLOAD THE CODE AND DEPENDENCIES

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y apt-utils curl xz-utils && apt-get clean

RUN mkdir ~/qt-inst && cd ~/qt-inst && curl 'https://mirrors.ocf.berkeley.edu/qt/archive/qt/5.11/5.11.1/single/qt-everywhere-src-5.11.1.tar.xz' -o 'qt-everywhere-src-5.11.1.tar.xz' && md5sum qt-everywhere-src-5.11.1.tar.xz && mkdir ~/qt-source && cd ~/qt-source && tar xf ~/qt-inst/qt-everywhere-src-5.11.1.tar.xz && mv ~/qt-source/qt-everywhere-src-5.11.1 ~/qt && rm ~/qt-inst/qt-everywhere-src-5.11.1.tar.xz

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y bison build-essential flex gperf gstreamer1.0-qt5 gstreamer1.0-plugins-base libgstreamer-plugins-base1.0-dev libgstreamer-plugins-base1.0-0 libasound2-dev libatkmm-1.6-dev libbz2-dev libcap-dev libcups2-dev libdrm-dev libegl1-mesa-dev libfontconfig1-dev libfreetype6-dev libgcrypt11-dev libglu1-mesa-dev libgstreamer1.0-dev libicu-dev libnss3-dev libpci-dev libpulse-dev libssl-dev libudev-dev libx11-dev libx11-xcb-dev libxcb-composite0 libxcb-composite0-dev libxcb-cursor-dev libxcb-cursor0 libxcb-damage0 libxcb-damage0-dev libxcb-dpms0 libxcb-dpms0-dev libxcb-dri2-0 libxcb-dri2-0-dev libxcb-dri3-0 libxcb-dri3-dev libxcb-ewmh-dev libxcb-ewmh2 libxcb-glx0 libxcb-glx0-dev libxcb-icccm4 libxcb-icccm4-dev libxcb-image0 libxcb-image0-dev libxcb-keysyms1 libxcb-keysyms1-dev libxcb-present-dev libxcb-present0 libxcb-randr0 libxcb-randr0-dev libxcb-record0 libxcb-record0-dev libxcb-render-util0 libxcb-render-util0-dev libxcb-render0 libxcb-render0-dev libxcb-res0 libxcb-res0-dev libxcb-screensaver0 libxcb-screensaver0-dev libxcb-shape0 libxcb-shape0-dev libxcb-shm0 libxcb-shm0-dev libxcb-sync-dev libxcb-sync0-dev libxcb-sync1 libxcb-util-dev libxcb-util0-dev libxcb-util1 libxcb-xf86dri0 libxcb-xf86dri0-dev libxcb-xfixes0 libxcb-xfixes0-dev libxcb-xinerama0 libxcb-xinerama0-dev libxcb-xkb-dev libxcb-xkb1 libxcb-xtest0 libxcb-xtest0-dev libxcb-xv0 libxcb-xv0-dev libxcb-xvmc0 libxcb-xvmc0-dev libxcb1 libxcb1-dev libxcomposite-dev libxcursor-dev libxdamage-dev libxext-dev libxfixes-dev libxi-dev libxrandr-dev libxrender-dev libxslt-dev libxss-dev libxtst-dev perl python ruby && apt-get clean

# CONFIGURE THE BUILD SYSTEM

# RUN mkdir ~/qt-build && cd ~/qt-build && ~/qt/configure -release -nomake tests -nomake examples -confirm-license -prefix /opt/local/Qt -opensource

# COMPILE AND INSTALL SOFTWARE

#RUN make -j2 && make install

# SET ENTRYPOINT COMMAND

CMD bash

LABEL maintainer="kd6kxr@gmail.com"
