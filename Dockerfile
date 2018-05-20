FROM alpine
MAINTAINER Julien BONACHERA <julien@bonachera.fr>

ENTRYPOINT ["/usr/local/bin/nomad"]
CMD ["agent", "-config=/etc/nomad"]
ENV VERSION=0.8.3
ENV CHECKPOINT_DISABLE=1
RUN apk -U add unzip curl
RUN adduser -S nomad
RUN mkdir /opt && \
    curl -sL "https://releases.hashicorp.com/nomad/${VERSION}/nomad_${VERSION}_linux_amd64.zip" -o /opt/nomad.zip && \
    unzip /opt/nomad.zip -d /opt && \
    rm /opt/nomad.zip && \
    mv /opt/nomad /usr/local/bin && \
    chmod +x /usr/local/bin/nomad && \
    mkdir /etc/nomad /var/lib/nomad /etc/templates && \
    chown nomad: /etc/nomad /var/lib/nomad
VOLUME ["/var/lib/nomad"]
USER nomad
ADD nomad.hcl /etc/nomad/nomad.hcl
