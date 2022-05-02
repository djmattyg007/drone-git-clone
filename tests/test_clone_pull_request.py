from __future__ import annotations

import subprocess
from pathlib import Path

import pytest

from .helpers import get_branch, get_commit


@pytest.fixture(scope="module")
def script_path(scripts_path: Path) -> Path:
    return scripts_path / "clone-pull-request"


def test_clone_pull_request(tmp_path: Path, script_path: Path) -> None:
    script_env = {
        "DRONE_REPO_BRANCH": "main",
        "DRONE_COMMIT_REF": "refs/pull/14596/head",
        "DRONE_COMMIT_BRANCH": "main",
        "DRONE_COMMIT_SHA": "26923a8f37933ccc23943de0d4ebd53908268582",
        "DRONE_WORKSPACE": str(tmp_path),
        "DRONE_REMOTE_URL": "https://github.com/octocat/Spoon-Knife.git",
    }

    subprocess.check_call(str(script_path), cwd=tmp_path, env=script_env)

    assert get_commit(tmp_path) == "26923a8f37933ccc23943de0d4ebd53908268582"
    assert get_branch(tmp_path) == "main"

    assert (tmp_path / "directory" / "file.txt").exists()
