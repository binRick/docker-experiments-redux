#FROM centos:8
FROM dockovpn:latest

LABEL maintainer=""

ENV APP_NAME dockovpn
ENV APP_INSTALL_PATH /opt/${APP_NAME}

WORKDIR ${APP_INSTALL_PATH}

COPY scripts .
COPY config ./config

RUN dnf -y install epel-release && \
    dnf -y install automake gcc which openvpn zsh bash telnet curl wget git rsync make python3 iptables net-tools mlocate && \
    mkdir -p /etc/openvpn/configs && \
    pip3 install flask && \
    cp config/* /etc/openvpn/configs

EXPOSE 1194/udp
EXPOSE 8080/tcp
EXPOSE 5005/tcp

HEALTHCHECK --interval=10s --timeout=5s \
            CMD /opt/dockovpn/healthcheck.sh || exit 1
#             CMD curl -s -4 --fail 'https://api.ipify.org' || exit 1

ENTRYPOINT [ "./start-dev.sh" ]
