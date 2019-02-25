#!/usr/bin/env sh

set -e

# cp CNAME public/
touch public/.nojekyll
git add public/
git config user.name "$GITHUB_ACTOR"
git config user.email "$GITHUB_ACTOR@users.noreply.github.com"
git commit -m "Deploy changes from $GITHUB_SHA"
git subtree split --prefix public -b gh-pages
git push --force origin gh-pages:gh-pages
