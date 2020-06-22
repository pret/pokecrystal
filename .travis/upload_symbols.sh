#!/bin/sh
set -e

commit_message=$(git log -1 --pretty=%B)

git clone -b symbols https://github.com/pret/pokecrystal symbols
cd symbols

cp ../*.sym .
git add *.sym
git -c user.name='travis' -c user.email='travis@travis-ci.org' commit -m "$commit_message"
git push -f -q https://pokepret:$GITHUB_API_KEY@github.com/pret/pokecrystal symbols &>/dev/null
