from __future__ import annotations

import subprocess
from pathlib import Path

import pytest

from .helpers import get_commit
from .types import CloneArgs


@pytest.fixture(scope="module")
def script_path(scripts_path: Path) -> Path:
    return scripts_path / "clone-tag"


def test_clone_tag(
    tmp_path: Path,
    script_path: Path,
    test_git_repo: Path,
    clone_args: CloneArgs,
) -> None:
    script_env = {
        "DRONE_REPO_BRANCH": "main",
        "DRONE_TAG": clone_args.tag,
        "DRONE_COMMIT_SHA": clone_args.commit,
        "DRONE_WORKSPACE": str(tmp_path),
        "DRONE_REMOTE_URL": str(test_git_repo),
    }

    subprocess.check_call(str(script_path), cwd=tmp_path, env=script_env)

    assert get_commit(tmp_path) == clone_args.commit

    test_file = tmp_path / clone_args.file
    assert test_file.read_text(encoding="utf-8") == clone_args.text
