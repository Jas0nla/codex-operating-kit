#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_ROOT="${1:-$HOME/.codex}"

mkdir -p "$TARGET_ROOT"
mkdir -p "$TARGET_ROOT/skills/master/agents"
mkdir -p "$TARGET_ROOT/skills/team-orchestrator/agents"
mkdir -p "$TARGET_ROOT/agents"
mkdir -p "$TARGET_ROOT/memory/topics"
mkdir -p "$TARGET_ROOT/memory/daily"

copied=()
created_private=()
needs_attention=()

copy_shared() {
  local src="$1"
  local dest="$2"
  mkdir -p "$(dirname "$dest")"
  cp "$src" "$dest"
  copied+=("${dest#$TARGET_ROOT/}")
}

create_if_missing() {
  local src="$1"
  local dest="$2"
  if [[ -e "$dest" ]]; then
    needs_attention+=("${dest#$TARGET_ROOT/} already existed and was preserved")
  else
    mkdir -p "$(dirname "$dest")"
    cp "$src" "$dest"
    created_private+=("${dest#$TARGET_ROOT/}")
  fi
}

copy_shared "$SCRIPT_DIR/AGENTS.md" "$TARGET_ROOT/AGENTS.md"
copy_shared "$SCRIPT_DIR/skills/master/SKILL.md" "$TARGET_ROOT/skills/master/SKILL.md"
copy_shared "$SCRIPT_DIR/skills/master/agents/openai.yaml" "$TARGET_ROOT/skills/master/agents/openai.yaml"
copy_shared "$SCRIPT_DIR/skills/team-orchestrator/SKILL.md" "$TARGET_ROOT/skills/team-orchestrator/SKILL.md"
copy_shared "$SCRIPT_DIR/skills/team-orchestrator/agents/openai.yaml" "$TARGET_ROOT/skills/team-orchestrator/agents/openai.yaml"
copy_shared "$SCRIPT_DIR/agents/workflow_scout.toml" "$TARGET_ROOT/agents/workflow_scout.toml"
copy_shared "$SCRIPT_DIR/agents/repo_researcher.toml" "$TARGET_ROOT/agents/repo_researcher.toml"
copy_shared "$SCRIPT_DIR/agents/final_verifier.toml" "$TARGET_ROOT/agents/final_verifier.toml"
copy_shared "$SCRIPT_DIR/memory/README.md" "$TARGET_ROOT/memory/README.md"
copy_shared "$SCRIPT_DIR/memory/rules.md" "$TARGET_ROOT/rules.md"

create_if_missing "$SCRIPT_DIR/skills/master/LOCAL.template.md" "$TARGET_ROOT/skills/master/LOCAL.md"
create_if_missing "$SCRIPT_DIR/memory/memory.template.md" "$TARGET_ROOT/memory.md"
create_if_missing "$SCRIPT_DIR/memory/topics/clickup.template.md" "$TARGET_ROOT/memory/topics/clickup.md"
create_if_missing "$SCRIPT_DIR/memory/topics/raspberry.template.md" "$TARGET_ROOT/memory/topics/raspberry.md"
create_if_missing "$SCRIPT_DIR/memory/topics/winremote.template.md" "$TARGET_ROOT/memory/topics/winremote.md"
create_if_missing "$SCRIPT_DIR/memory/topics/xhs.template.md" "$TARGET_ROOT/memory/topics/xhs.md"

cat <<EOF
Installed shared Codex Operating Kit into: $TARGET_ROOT

Shared files copied:
$(printf '  - %s\n' "${copied[@]}")

Private starter files created:
$(if [[ ${#created_private[@]} -gt 0 ]]; then printf '  - %s\n' "${created_private[@]}"; else printf '  - none\n'; fi)

Preserved existing private files:
$(if [[ ${#needs_attention[@]} -gt 0 ]]; then printf '  - %s\n' "${needs_attention[@]}"; else printf '  - none\n'; fi)

You still need to fill in locally:
  - skills/master/LOCAL.md with private route-table details and local route notes
  - memory.md with real durable facts for this machine and user
  - memory/topics/*.md with domain-specific real values
  - any private skills, helper paths, and local confirmation wording that should stay machine-local
  - any automation-local memory under automations/<id>/memory.md
EOF
