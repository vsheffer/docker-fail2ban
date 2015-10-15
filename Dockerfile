FROM ubuntu
MAINTAINER ian@blenke.com

RUN export DEBIAN_FRONTEND=noninteractive && \
    set -x && \
    apt-get update && \
    apt-get install -y software-properties-common language-pack-en && \
    add-apt-repository ppa:pitti/systemd && \
    apt-get update && \
    apt-get install -y iptables \
                       git \
                       python-pip \
                       libsystemd-daemon0=204-5ubuntu20.14 \
                       libsystemd-id128-0=204-5ubuntu20.14 \
                       libsystemd-journal0=204-5ubuntu20.14 \
                       libsystemd-login0=204-5ubuntu20.14 \
                       python-systemd=204-5ubuntu20.14 && \
    git clone https://github.com/fail2ban/fail2ban /fail2ban && \
    pip install /fail2ban && \
    cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local && \
    mkdir -p /etc/fail2ban/jail.d /var/run/fail2ban && \
    echo "[DEFAULT]\nbackend=systemd" > /etc/fail2ban/jail.d/systemd.conf

RUN pip install awscli
ADD etc/fail2ban /etc/fail2ban
ADD aws /root/.aws
CMD /usr/local/bin/fail2ban-server -f
