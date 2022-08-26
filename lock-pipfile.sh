#!/bin/sh
git stash push
pipenv lock
if git status -s | grep Pipfile.lock ; then
    git add Pipfile.lock
    git commit -m "Lock Pipfile"
fi
git stash pop