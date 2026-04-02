# Migration Guide

This repository is intended to receive the reusable part of an existing local Codex environment without copying private machine facts into source control.

## Source Material

Typical migration inputs come from a local `~/.codex` such as:

- `AGENTS.md`
- `skills/master/SKILL.md`
- `skills/master/agents/openai.yaml`
- `rules.md`
- `memory/README.md`

## What To Bring Over

Bring over and refine:

- entry-routing logic
- `Master` routing principles
- memory-layer governance
- concise reusable rules
- template examples for domain memory

## What Must Be Redacted

Do not commit:

- real IPs, hostnames, or internal URLs
- real usernames, emails, secrets, or tokens
- machine-specific absolute paths unless clearly placeholders
- daily run notes
- automation run history
- personal topic files with live values

## How To Convert Existing Content

1. Extract workflow logic from local files.
2. Remove personal identifiers and environment-specific values.
3. Turn machine facts into placeholders or documented examples.
4. Move durable shared logic into repository-owned files.
5. Keep user-specific facts in local `~/.codex` after installation.

## Post-Migration Local Layout

After installing this repository:

- shared logic is managed by the repository
- private memory stays local in each user's `~/.codex`
- users fill in `memory.md` and `memory/topics/*.md` with their own values
- daily notes and automation logs never flow back into the repository by default
