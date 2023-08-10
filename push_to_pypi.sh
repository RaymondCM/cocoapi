#!/usr/bin/env bash
cd "$(cd -P -- "$(dirname -- "$0")" && pwd -P)"
set -e
python3 -m pip install --upgrade setuptools wheel twine
rm -r dist || true
python3 setup.py sdist
python3 -m twine upload dist/* || true
rm -r dist
