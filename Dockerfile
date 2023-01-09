FROM alpine:3.17@sha256:f271e74b17ced29b915d351685fd4644785c6d1559dd1f2d4189a5e851ef753a

# No need to pin official Alpine packages.
# hadolint ignore=DL3018
RUN apk add --no-cache bash ca-certificates git git-lfs openssh-client

COPY scripts/* /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/clone"]
