# drone-git

Drone plugin to clone git repositories.

## Build

Build the Docker image with the following commands:

```
docker build -t ghcr.io/djmattyg007/drone-git-clone .
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
  ghcr.io/djmattyg007/drone-git-clone
```

## Rationale

This is a long-term fork of [drone-git](https://github.com/drone/drone-git). It was created in
May 2022 for two main reasons:

1. New versions are published infrequently. The latest version is almost a year old, using
   ancient versions of Alpine Linux and git.
2. The cloning logic is frustratingly limited. For example, when running a build for regular
   pushes on the non-default branch, there are no refs for the default branch.

There were other smaller reasons, such as feeling that the tests were unnecessarily complicated
and difficult to understand. This fork a dedicated test runner (pytest) with all the niceties of
a powerful test suite.

## TODO

- Actually update the cloning logic to ensure there is always a ref for the default branch
- Set up renovatebot automerge to keep the Alpine base image up to date
- Document how to run the tests
- Document how to use it with the Drone Docker runner (see env to customise clone image)
- Add shellcheck to the CI pipeline
