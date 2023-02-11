FROM alpine:3.17@sha256:69665d02cb32192e52e07644d76bc6f25abeb5410edc1c7a81a10ba3f0efb90a

# No need to pin official Alpine packages.
# hadolint ignore=DL3018
RUN apk add --no-cache bash ca-certificates git git-lfs openssh-client

COPY scripts/* /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/clone"]
