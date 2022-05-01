# drone-git

Drone plugin to clone `git` repositories.

## Build

Build the Docker image with the following commands:

```
docker build --rm -f docker/Dockerfile.linux.amd64 -t drone/git .
```

## Usage

Clone a commit:

```
docker run --rm \
  -e DRONE_WORKSPACE=/drone \
  -e DRONE_REMOTE_URL=https://github.com/drone/envsubst.git \
  -e DRONE_BUILD_EVENT=push \
  -e DRONE_COMMIT_SHA=15e3f9b7e16332eee3bbdff9ef31f95d23c5da2c \
  -e DRONE_COMMIT_BRANCH=master \
  drone/git
```

## Rationale

This is a long-term fork of [drone-git](https://github.com/drone/drone-git). It was created in
May 2022 for two main reasons:

1. New versions are published infrequently. The latest version is almost a year old, using
   ancient versions of Alpine Linux and git.
2. The cloning logic is frustratingly limited. For example, when running a build for regular
   pushes on the non-default branch, there are no refs for the default branch.
