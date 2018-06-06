FROM openjdk:8-jdk
ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000
ARG JENKINS_AGENT_HOME=/root
ENV JENKINS_SLAVE_SSH_PUBKEY ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDzbjnaTyae4f15N9UfdQOe072mY9U9eej6AIR50k0EFh+gABsWYZBv0voNjJP6YvvmUz+Z2dLZv37/UX6k6sKqlmGXR9On7C0BwBqZ6hP9Q5lpis4JXf0KaqhdtAQmytlmrfHw9dlmlwQaBJ9u+5APEvLsCSc5I8+Ala4xRfypXTyIfdVVWQKJfaZNZqLWXR5xU1kGhGg6C0hS0LVHPIbZUpRb0eUtWrRfw+oaROfgDkMe1jiRBuoItfodMBDShl4C5KIj80mKtePUX3n4PwtnLfIbiYNzh/9VdHT5Ep4njNiA6tVaA+j0Hqhaj4H/XxwcnXYAOlEYhcio3LE9Drj root@cd843d1a3766

ENV JENKINS_AGENT_HOME ${JENKINS_AGENT_HOME}

#RUN groupadd -g ${gid} ${group} \
#    && useradd -d "${JENKINS_AGENT_HOME}" -u "${uid}" -g "${gid}" -m -s /bin/bash "${user}"

# setup SSH server
RUN apt-get update \
    && apt-get install --no-install-recommends -y openssh-server \
    && rm -rf /var/lib/apt/lists/*
RUN sed -i /etc/ssh/sshd_config \
        -e 's/#PermitRootLogin.*/PermitRootLogin yes/' \
        -e 's/#RSAAuthentication.*/RSAAuthentication yes/'  \
        -e 's/#PasswordAuthentication.*/PasswordAuthentication no/' \
        -e 's/#SyslogFacility.*/SyslogFacility AUTH/' \
        -e 's/#LogLevel.*/LogLevel INFO/' && \
    mkdir /var/run/sshd
RUN curl -fL -o docker.tgz "https://download.docker.com/linux/static/stable/x86_64/docker-17.03.1-ce.tgz" \
	&& tar -xzvf docker.tgz \
	&& mv docker/* /usr/local/bin/ \
	&& rmdir docker \
	&& rm docker.tgz \
	&& chmod +x /usr/local/bin/docker

VOLUME "${JENKINS_AGENT_HOME}" "/tmp" "/run" "/var/run"
WORKDIR "${JENKINS_AGENT_HOME}"
USER root
COPY setup-sshd /usr/local/bin/setup-sshd

EXPOSE 22

ENTRYPOINT ["setup-sshd"]
