# Deploy the HydroDome deck to GitHub Pages.
# Usage:  ./deploy.ps1 "optional commit message"
# Does:   git add -A  ->  commit  ->  push origin main   (Pages redeploys automatically)
param([string]$Message = "Update deck")
Set-Location $PSScriptRoot

# keep index.html == the investor deck (carmanah-style.html) so the site root serves it.
# field.html (the client / field deck) is its own file and is never touched here.
if (Test-Path carmanah-style.html) { Copy-Item -Force carmanah-style.html index.html }

git add -A
git diff --cached --quiet
if ($LASTEXITCODE -eq 0) {
  Write-Host "Nothing to commit - working tree clean."
} else {
  git commit -m $Message
}
git push origin main
Write-Host ""
Write-Host "Deployed. Live in ~30-60s (hard-refresh):"
Write-Host "  investor deck: https://tetontopo.github.io/hydrodome-deck/"
Write-Host "  field deck:    https://tetontopo.github.io/hydrodome-deck/field.html"
