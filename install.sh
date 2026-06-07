#!/usr/bin/env bash
# ─────────────────────────────────────────────
#  Frame Claude Skills — Installer
#  github.com/framedigital/frame-claude-skills
# ─────────────────────────────────────────────
# Usage:
#   bash <(curl -fsSL https://raw.githubusercontent.com/framedigital/frame-claude-skills/main/install.sh)
#
# Or after cloning:
#   git clone https://github.com/framedigital/frame-claude-skills
#   cd frame-claude-skills && bash install.sh

set -euo pipefail

SKILLS_DIR="${HOME}/.claude/skills"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_SRC="${REPO_DIR}/skills"

# ── Colors ──────────────────────────────────
if [[ -t 1 ]]; then
  GREEN=$'\033[0;32m'; CYAN=$'\033[0;36m'; YELLOW=$'\033[1;33m'
  BOLD=$'\033[1m'; RESET=$'\033[0m'
else
  GREEN=''; CYAN=''; YELLOW=''; BOLD=''; RESET=''
fi

echo ""
echo "${BOLD}Frame Claude Skills — Installer${RESET}"
echo "${CYAN}Installing ${BOLD}$(ls "${SKILLS_SRC}" | wc -l | tr -d ' ')${RESET}${CYAN} skills to ${HOME}/.claude/skills/${RESET}"
echo ""

mkdir -p "${SKILLS_DIR}"

installed=0
updated=0
skipped=0

for skill_dir in "${SKILLS_SRC}"/*/; do
  name=$(basename "${skill_dir}")
  dest="${SKILLS_DIR}/${name}"

  if [ -d "${dest}" ]; then
    # Update existing
    cp "${skill_dir}/SKILL.md" "${dest}/SKILL.md"
    echo "  ${YELLOW}↻${RESET}  ${name}"
    ((updated++))
  else
    # Install new
    mkdir -p "${dest}"
    cp "${skill_dir}/SKILL.md" "${dest}/SKILL.md"
    echo "  ${GREEN}✓${RESET}  ${name}"
    ((installed++))
  fi
done

echo ""
echo "${BOLD}Done!${RESET}  ${GREEN}${installed} new${RESET} · ${YELLOW}${updated} updated${RESET} · ${skipped} skipped"
echo ""
echo "Skills are active immediately. Type ${CYAN}/find-skills${RESET} in Claude Code to browse them."
echo ""
