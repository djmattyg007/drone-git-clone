# drone-git-clone

[![CI](https://github.com/djmattyg007/drone-git-clone/actions/workflows/ci.yaml/badge.svg?branch=main)](https://github.com/djmattyg007/drone-git-clone/actions/workflows/ci.yaml)

Drone plugin to clone git repositories.

## Build

Build the Docker image with the following command:

```
docker build -t ghcr.io/djmattyg007/drone-git-clone .
```

## Usage

This is primarily to act as a replacement for the default image used by the Drone Docker runner
for cloning repositories. To use this, simply set the following in your runner's environment:

```
DRONE_RUNNER_CLONE_IMAGE="ghcr.io/djmattyg007/drone-git-clone:latest"
```

### Manually

You can run the container manually if you desire. This invocation will clone a specific commit:

```
docker run --rm \
  -e DRONE_WORKSPACE=/drone \
  -e DRONE_REPO_BRANCH=master \
  -e DRONE_REMOTE_URL=https://github.com/drone/envsubst.git \
  -e DRONE_BUILD_EVENT=push \
  -e DRONE_COMMIT_SHA=15e3f9b7e16332eee3bbdff9ef31f95d23c5da2c \
  -e DRONE_COMMIT_BRANCH=master \
  ghcr.io/djmattyg007/drone-git-clone
```

## Tests

To run the tests, you'll need a recent version of python installed, as well as pytest. The tests
were written on Python 3.10 with Pytest 7.

All you'll need to do then is just run `pytest` in the root of this repo. The tests require
internet connectivity, to be able to clone a repo from Github.

## Rationale

This is a long-term fork of [drone-git](https://github.com/drone/drone-git). It was created in
May 2022 for two main reasons:

1. New versions are published infrequently. The latest version is almost a year old, using
   ancient versions of Alpine Linux and git.
2. The cloning logic is frustratingly limited. For example, when running a build for regular
   pushes on the non-default branch, there are no refs for the default branch.

There were other smaller reasons, such as feeling that the tests were unnecessarily complicated
and difficult to understand. This fork uses a dedicated test runner (pytest) with all the niceties
that come with it.
