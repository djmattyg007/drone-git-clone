from __future__ import annotations

import subprocess
from pathlib import Path
from typing import Final

import pytest

from .types import CloneArgs


TESTS_FOLDER: Final = Path(__file__).parent


@pytest.fixture(
    scope="session",
    params=(
        CloneArgs("7daaf2f115a62b4c8a5b3568695434ffe1253f6b", "main", "v1.0.0", "hello.txt", "hi world\n"),
        CloneArgs("f1e26d17860313abb47b1f89036494745ec928ab", "main", "v1.1.0", "hello.txt", "hello world\n"),
        CloneArgs("5eeb26854b922bcc4b5a74bb93a2f63f2e6c085f", "fr", "v2.0.0", "hello.txt", "salut monde\n"),
        CloneArgs("a94a3294d36e44b31f96c228cec97d036cab3017", "fr", "v2.1.0", "hello.txt", "bonjour monde\n"),
    ),
    ids=lambda param: f"{param.branch}-{param.commit}",
)
def clone_args(request) -> CloneArgs:
    return request.param


@pytest.fixture(scope="session")
def scripts_path() -> Path:
    return TESTS_FOLDER.parent / "scripts"


@pytest.fixture(scope="session")
def test_git_repo(tmp_path_factory: pytest.TempPathFactory) -> Path:
    repo_path = tmp_path_factory.mktemp("test-git-repo")
    gen_script_path = TESTS_FOLDER / "gen-git-repo.sh"
    subprocess.check_call(str(gen_script_path), cwd=repo_path)
    return repo_path
