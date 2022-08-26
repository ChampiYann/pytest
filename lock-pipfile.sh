#!/bin/sh
pipenv lock
git add Pipfile.lock
git commit -m "Lock Pipfile"