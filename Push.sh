#!/usr/bin/env bash

if ! git diff-index --quiet HEAD --; then
    echo "You have uncommit change."
    exit 1;
fi

BRANCH_NAME=`git branch | grep \* | cut -d ' ' -f2`
git pull origin $BRANCH_NAME

if ! git diff-index --quiet HEAD --; then
    echo "Please solve merge conflict."
    exit 1;
fi

git push origin $BRANCH_NAME
git push -f kancloud $BRANCH_NAME

rm ../Note/学校课程/操作系统/HOMEWORK/*
find . -type d -and -not -name ".*" -maxdepth 1 \
    -exec cp -r {} ../Note/学校课程/操作系统/HOMEWORK/ \;