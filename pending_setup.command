#1/bin/bash

cd -- "$(dirname "$BASH_SOURCE")"

rm -rf .git

touch .static

echo "#!/bin/bash\ncd -- \"\$(dirname \"\$BASH_SOURCE\")\"\n\ngit add -A && git commit -m \"These aren't the beans you're looking for.\" && git push github master" > sync.command
echo "#!/bin/bash\ncd -- \"\$(dirname \"\$BASH_SOURCE\")\"\n\ngit push -f live master" > deploy_live.command
echo "#!/bin/bash\ncd -- \"\$(dirname \"\$BASH_SOURCE\")\"\n\ngit push -f beta master" > deploy_beta.command

chmod +x sync.command deploy_live.command deploy_beta.command

git init
git add -A
git commit -m ":tada: Initial commit"

git remote add github git@github.com:austinPabian/pending
git remote add live dokku@helios.caseywebb.xyz:pending.coffee
git remote add beta dokku@helios.caseywebb.xyz:beta.pending.coffee

git push -f github master

open deploy_live.command
open deploy_beta.command