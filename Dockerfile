FROM ubuntu:14.04
LABEL maintainer "Matteo Panella <matteo.panella@cnaf.infn.it>"
LABEL description="NVIDIA driver 352.79"

RUN (export DEBIAN_FRONTEND=noninteractive; \
     apt-get -qq update && \
     apt-get -qqy --no-install-recommends install module-init-tools build-essential wget && \
     cd /usr/local && \
     wget http://us.download.nvidia.com/XFree86/Linux-x86_64/352.79/NVIDIA-Linux-x86_64-352.79.run && \
     chmod +x NVIDIA-Linux-x86_64-352.79.run && \
     ./NVIDIA-Linux-x86_64-352.79.run -a -N -s --disable-nouveau --no-kernel-module && \
     rm -f NVIDIA-Linux-x86_64-352.79.run && \
     apt-get --purge -y remove wget && \
     apt-get clean && \
     apt-get autoclean && \
     apt-get --purge -y autoremove && \
     find /var/lib/apt/lists '(' -type f -and -not -name lock ')' -delete)

CMD /bin/bash
