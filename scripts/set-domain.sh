#!/bin/sh
# Usage: scripts/set-domain.sh your-domain.com   (or: user.github.io/repo-name)
# Replaces the placeholder domain everywhere (canonical, og:url, robots.txt, sitemap.xml) and writes CNAME.
# Re-run with the old value as the second argument to change it later: scripts/set-domain.sh new.com old.com
set -eu
NEW="${1:?usage: set-domain.sh NEW_DOMAIN [OLD_DOMAIN]}"
OLD="${2:-YOUR-DOMAIN.example}"
cd "$(dirname "$0")/.."
for f in *.html robots.txt sitemap.xml; do
  sed "s#$OLD#$NEW#g" "$f" > "$f.tmp" && mv "$f.tmp" "$f"
done
case "$NEW" in */*) echo "Path-style host: no CNAME written (project page URL)";; *) printf '%s\n' "$NEW" > CNAME;; esac
echo "Domain set to $NEW"
