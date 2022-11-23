FROM alpine:3.17@sha256:8914eb54f968791faf6a8638949e480fef81e697984fba772b3976835194c6d4

# No need to pin official Alpine packages.
# hadolint ignore=DL3018
RUN apk add --no-cache bash ca-certificates git git-lfs openssh-client

COPY scripts/* /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/clone"]
