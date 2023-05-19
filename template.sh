#!/bin/bash

set -e

template="go-faster/template"
name="${PWD##*/}"
repo="go-faster/${name}"
pkg="github.com/${repo}"
head="$(git rev-list --max-parents=0 HEAD)"

set -e

# update all references to the template repo
grep -rl "${template}" . | xargs sed -i "s|${template}|${repo}|g"

# update latest commit
commit="a65086111716ab748f562ce12cef7d8c01f91c92"
grep -rl "${commit}" . | xargs sed -i "s|${commit}|${head}|g"

# generate new README.md
rm README.md
readme="# ${name} [![Go Reference](https://img.shields.io/badge/go-pkg-00ADD8)](https://pkg.go.dev/${pkg}#section-documentation) [![codecov](https://img.shields.io/codecov/c/github/${repo}?label=cover)](https://codecov.io/gh/${repo}) [![experimental](https://img.shields.io/badge/-experimental-blueviolet)](https://go-faster.org/docs/projects/status#experimental)

Work in progress."
echo "${readme}" > README.md

# cleanup
rm template.sh
