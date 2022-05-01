from __future__ import annotations

from dataclasses import dataclass


@dataclass(frozen=True)
class CloneArgs:
    commit: str
    branch: str
    tag: str
    file: str
    text: str
