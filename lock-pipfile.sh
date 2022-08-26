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
if ["$my_bool" = true]; then
    git stash pop
fi