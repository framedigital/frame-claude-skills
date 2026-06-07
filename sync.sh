#!/usr/bin/env bash
# Sync latest skills from ~/.claude/skills/ into the repo and push to GitHub
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_SRC="${HOME}/.claude/skills"

echo "[sync] Copying skills from ~/.claude/skills/ ..."

for skill_dir in "${SKILLS_SRC}"/*/; do
  name=$(basename "${skill_dir}")
  case "$name" in
    higgsfield-claude-skills|caliber-skill-workspace|ui-ux-pro-max-backup) continue ;;
  esac
  [ -f "${skill_dir}/SKILL.md" ] || continue
  mkdir -p "${REPO}/skills/${name}"
  cp "${skill_dir}/SKILL.md" "${REPO}/skills/${name}/SKILL.md"
done

cd "${REPO}"

if git diff --quiet && git diff --cached --quiet; then
  echo "[sync] No changes to push."
  exit 0
fi

git add skills/
git commit -m "sync: update skills $(date '+%Y-%m-%d')"
git push origin main
echo "[sync] Pushed to GitHub ✓"
