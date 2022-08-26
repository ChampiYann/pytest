#!/bin/sh
# Create a random variable to mark the stash
rand=$(date +%s)
# Stash current state with a know, unique name
git stash push -m "Lock Pipfile $rand"
# Run pipenv lock
pipenv lock
# Check is the file changed
if git status -s | grep "Pipfile.lock" ; then
# If it did add and commit it
    git add Pipfile.lock
    git commit -m "Lock Pipfile"
fi
# Check if there were any files stashed
if git stash list | grep "Lock Pipfile $rand" ; then
# If there were some, pop the stash
    git stash pop
fi