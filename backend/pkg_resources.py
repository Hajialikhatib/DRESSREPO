"""
Minimal compatibility shim for environments where setuptools/pkg_resources
is unavailable (e.g. some Python 3.14 builds).
"""

from importlib import metadata


class DistributionNotFound(Exception):
    pass


class _Distribution:
    def __init__(self, version: str):
        self.version = version


def get_distribution(name: str):
    try:
        return _Distribution(metadata.version(name))
    except metadata.PackageNotFoundError as exc:
        raise DistributionNotFound(str(exc)) from exc
