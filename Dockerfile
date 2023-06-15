FROM alpine:3.18@sha256:ac03b2a7eecaa3b1871d4c3971bf93dbd37ab9d69a4031b25eae3c8a9783f58a

# No need to pin official Alpine packages.
# hadolint ignore=DL3018
RUN apk add --no-cache bash ca-certificates git git-lfs openssh-client

COPY scripts/* /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/clone"]
