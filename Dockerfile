FROM alpine:3.24@sha256:71e9b7bae160ba167fa17414401b94cbcdaf3c32feeab9298bd794a2a0614c35

# No need to pin official Alpine packages.
# hadolint ignore=DL3018
RUN apk add --no-cache bash ca-certificates git git-lfs openssh-client

COPY scripts/* /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/clone"]
