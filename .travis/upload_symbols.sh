#!/bin/sh
set -e

commit_message=$(git log -1 --pretty=%B)

mkdir symbols
pushd symbols

git clone -b symbols https://github.com/pret/pokecrystal
cp ../*.sym .
git add *.sym
git -c user.name='travis' -c user.email='travis@travis-ci.org' commit -m "$commit_message"
git push -f -q https://Rangi42:$GITHUB_API_KEY@github.com/pret/pokecrystal symbols &>/dev/null

popd
