FROM centos:6

LABEL maintainer="debugsmtp+github@gmail.com"

ENV SALT_REPO_RPM="salt-repo-2017.7-1.el6.noarch.rpm"

RUN yum install -y wget && \
    wget https://repo.saltstack.com/yum/redhat/${SALT_REPO_RPM} && \
    rpm -ivh ${SALT_REPO_RPM} && \
    rpm --import /etc/pki/rpm-gpg/saltstack-signing-key && \
    yum install -y salt-minion && \
    mkdir -p /srv/salt && \
    touch /etc/salt/grains

COPY minion /etc/salt/minion

COPY salt /srv/salt

ENTRYPOINT [ "bash" ]

