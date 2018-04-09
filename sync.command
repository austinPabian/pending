#!/bin/bash
cd -- "$(dirname "$BASH_SOURCE")"

git add -A && git commit -m "These aren't the beans you're looking for." && git push github master
