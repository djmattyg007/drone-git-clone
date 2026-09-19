FROM alpine:3.24@sha256:294b683cb724975bec92580e1e685676bd4b50bda910ddb8c51d4cabeaec77e6

# No need to pin official Alpine packages.
# hadolint ignore=DL3018
RUN apk add --no-cache bash ca-certificates git git-lfs openssh-client

COPY scripts/* /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/clone"]
