FROM golang:1.10-alpine as builder

ENV VERSION=v0.8.3

RUN apk -U add git gcc musl-dev linux-headers && \
    rm -rf /var/cache/apk/*
RUN go get github.com/hashicorp/nomad && \
    cd $GOPATH/src/github.com/hashicorp/nomad && \
    git checkout $VERSION && \
    CGO_ENABLED=0 go build -o /bin/nomad

FROM alpine
MAINTAINER Julien BONACHERA <julien@bonachera.fr>

ENTRYPOINT ["/usr/local/bin/nomad"]
CMD ["agent", "-config=/etc/nomad"]
ENV CHECKPOINT_DISABLE=1
RUN adduser -S nomad && \
    mkdir -p /var/lib/nomad && \
    touch /var/lib/nomad/.dockerkeep && \
    chown nomad: -R /var/lib/nomad/
COPY --from=builder /bin/nomad /usr/local/bin/nomad
VOLUME ["/var/lib/nomad"]
USER nomad
ADD nomad.hcl /etc/nomad/nomad.hcl
