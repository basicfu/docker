FROM maven:alpine
RUN curl -fL -o docker.tgz "https://download.docker.com/linux/static/stable/x86_64/docker-17.03.1-ce.tgz" \
	&& tar -xzvf docker.tgz \
	&& mv docker/* /usr/local/bin/ \
	&& rmdir docker \
	&& rm docker.tgz \
	&& chmod 777 /usr/local/bin/docker
