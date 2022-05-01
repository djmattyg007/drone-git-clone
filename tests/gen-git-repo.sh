#!/bin/bash

# This script creates a git repository and seeds with
# commit history. Used by unit tests.

set -euo pipefail
if [[ -n "${VERBOSE:-}" ]]; then
    set -x
fi

export GIT_AUTHOR_NAME="drone-git-clone"
export GIT_AUTHOR_EMAIL="drone-git-clone@localhost"
export GIT_AUTHOR_DATE="1651407469 +0000"
export GIT_COMMITTER_NAME="${GIT_AUTHOR_NAME}"
export GIT_COMMITTER_EMAIL="${GIT_AUTHOR_EMAIL}"
export GIT_COMMITTER_DATE="${GIT_AUTHOR_DATE}"

git init --initial-branch=main

echo "hi world" > hello.txt
git add hello.txt
git commit --no-gpg-sign -m "say hi"
git tag --no-sign v1.0.0

export GIT_AUTHOR_DATE="1651407569 +0000"
export GIT_COMMITTER_DATE="${GIT_AUTHOR_DATE}"

echo "hello world" > hello.txt
git add hello.txt
git commit --no-gpg-sign -m "say hello"
git tag --no-sign v1.1.0

git checkout -b fr

export GIT_AUTHOR_DATE="1651407654 +0000"
export GIT_COMMITTER_DATE="${GIT_AUTHOR_DATE}"

echo "salut monde" > hello.txt
git add hello.txt
git commit --no-gpg-sign -m "say hello in french"
git tag --no-sign v2.0.0

export GIT_AUTHOR_DATE="1651407754 +0000"
export GIT_COMMITTER_DATE="${GIT_AUTHOR_DATE}"

echo "bonjour monde" > hello.txt
git add hello.txt
git commit --no-gpg-sign -m "say hello en francais"
git tag --no-sign v2.1.0

git checkout main
