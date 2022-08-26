#!/bin/sh
if git stash push ; then
    pop=true
else
    pop=false
fi
pipenv lock
if git status -s | grep Pipfile.lock ; then
    git add Pipfile.lock
    git commit -m "Lock Pipfile"
fi
if [ "$pop" = true ]; then
    git stash pop
fi