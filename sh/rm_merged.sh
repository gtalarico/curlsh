#!/bin/bash
# https://stackoverflow.com/a/51806684/4411196
git branch --merged | grep -v "\*" | xargs -n 1 git branch -d
