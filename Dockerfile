FROM alpine:3.17@sha256:36a03c95c2f0c83775d500101869054b927143a8320728f0e135dc151cb8ae61

# No need to pin official Alpine packages.
# hadolint ignore=DL3018
RUN apk add --no-cache bash ca-certificates git git-lfs openssh-client

COPY scripts/* /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/clone"]
