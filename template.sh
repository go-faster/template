#!/bin/bash

set -e
set -x

template="github.com/go-faster/template"
commit="$(git rev-list --max-parents=0 HEAD)"

grep -rl "${template}" . | xargs sed -i "s|${template}|newtext|g"
grep -rl "bca36d71977c623525a48c631309fcedb26605a9" . | xargs sed -i "s|bca36d71977c623525a48c631309fcedb26605a9|${commit}|g"
