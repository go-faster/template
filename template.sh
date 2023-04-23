#!/bin/bash

set -e
set -x

template="github.com/go-faster/template"
project="github.com/go-faster/${PWD##*/}"
head="$(git rev-list --max-parents=0 HEAD)"
commit="a65086111716ab748f562ce12cef7d8c01f91c92"

grep -rl "${template}" . | xargs sed -i "s|${template}|${project}|g"
grep -rl "${commit}" . | xargs sed -i "s|${commit}|${head}|g"
