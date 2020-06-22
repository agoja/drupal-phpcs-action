#!/bin/sh

cp /action/problem-matcher.json /github/workflow/problem-matcher.json

echo "::add-matcher::${RUNNER_TEMP}/_github_workflow/problem-matcher.json"

echo "Review Drupal Standards"
git log -1
#changed_files=$(git diff HEAD^ HEAD --name-only --diff-filter=d --pretty="format:" -- . ":(exclude,glob)html");
changed_files=$(git diff --cached --name-only --diff-filter=ACMR HEAD | grep "\/modules/unity\/" | grep "\\.install\|\\.module\|\\.inc\|\\.php\|\\.yml");
echo -e "These are committed files for phpcs review:\n$changed_files";
files_formatted="$(echo $changed_files | sed 's/ / .\//g')";
phpcs --config-show
phpcs --report=checkstyle --ignore=.md,*.png,*.svg,*/dist/*,*.min.js,*.min.css,*/libraries/*,settings*,*/theme/* --standard=Drupal,DrupalPractice,DrupalSecure --encoding=utf-8 -p --extensions=module/php,php,install/php,js "./"$files_formatted

status=$?

echo "::remove-matcher owner=phpcs::"

exit $status
