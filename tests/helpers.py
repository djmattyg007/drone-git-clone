from __future__ import annotations

import subprocess
from pathlib import Path
from typing import Sequence


def rev_parse(repo_path: Path, args: Sequence[str]) -> str:
    cmdline = ("git", "rev-parse", *args)
    output = subprocess.check_output(cmdline, cwd=repo_path, text=True)
    return output.strip()


def get_branch(repo_path: Path) -> str:
    return rev_parse(repo_path, ("--abbrev-ref", "HEAD"))


def get_commit(repo_path: Path) -> str:
    return rev_parse(repo_path, ("HEAD",))


__all__ = (
    "get_branch",
    "get_commit",
)
