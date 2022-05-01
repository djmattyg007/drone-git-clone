FROM alpine:3.15

RUN apk add --no-cache bash ca-certificates git git-lfs openssh

ADD scripts/* /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/clone"]
