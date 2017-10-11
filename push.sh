#!/bin/sh

setup_git() {
    git config --global user.email "travis@travis-ci.org"
    git config --global user.name "Travis CI"
}

commit_files() {
    git checkout -b gh-pages
    git add .ekstazi/*
    git commit -m "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
    git remote add origin-pages https://${GH_TOKEN}@github.com/irfanhasan/travisCIcache.git 
    git push --quiet --set-upstream origin-pages gh-pages
}

setup_git
commit_files
upload_files
