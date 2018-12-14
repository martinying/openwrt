FROM debian
RUN apt-get update && apt-get install -y \
  build-essential \
  libncurses5-dev \
  gawk \
  git \
  subversion \
  libssl-dev \
  gettext \
  unzip \
  zlib1g-dev \
  file \
  python \
  wget \
  apt-utils \
  time &&\
  useradd -m openwrt &&\
  usermod -aG sudo openwrt

USER openwrt
WORKDIR /home/openwrt

RUN git clone git://git.openwrt.org/openwrt/openwrt.git &&\
    openwrt/scripts/feeds update -a &&\
    openwrt/scripts/feeds install -a
