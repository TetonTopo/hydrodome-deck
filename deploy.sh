#!/usr/bin/env bash
# Deploy the HydroDome deck to GitHub Pages.
# Usage:  ./deploy.sh "optional commit message"
# Does:   git add -A  ->  commit  ->  push origin main   (Pages redeploys automatically)
set -e
cd "$(dirname "$0")"

# keep index.html == the investor deck (carmanah-style.html) so the site root serves it.
# field.html (the client / field deck) is its own file and is never touched here.
if [ -f carmanah-style.html ]; then cp -f carmanah-style.html index.html; fi

msg="${1:-Update deck}"
git add -A
if git diff --cached --quiet; then
  echo "Nothing to commit — working tree clean."
else
  git commit -m "$msg"
fi
git push origin main
echo ""
echo "Deployed. Live in ~30-60s (hard-refresh):"
echo "  investor deck: https://tetontopo.github.io/hydrodome-deck/"
echo "  field deck:    https://tetontopo.github.io/hydrodome-deck/field.html"
