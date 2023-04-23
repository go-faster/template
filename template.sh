#!/bin/bash

set -e
set -x

template="github.com/go-faster/template"
name="${PWD##*/}"
project="github.com/go-faster/${name}"
head="$(git rev-list --max-parents=0 HEAD)"
commit="a65086111716ab748f562ce12cef7d8c01f91c92"

grep -rl "${template}" . | xargs sed -i "s|${template}|${project}|g"
grep -rl "${commit}" . | xargs sed -i "s|${commit}|${head}|g"

rm pkg.go
printf "// Package %s is a new package.\npackage %s\n" name name > "${name}.go"

rm README.md
echo "# ${name}" > README.md

rm template.sh
