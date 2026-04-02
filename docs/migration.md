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

## V2 Migration Focus

V2 does not turn this repository into a runtime project.

V2 adds shared Codex operating policy:

- clearer thread-entry and routing contracts
- explicit delegation policy for Codex's native sub-agent capability
- stronger memory placement rules for delegated work
- clearer documentation about what remains shared versus private

When migrating an existing V1 setup to V2:

1. Keep the shared/private split unchanged.
2. Move routing and delegation policy into shared files.
3. Keep real hostnames, helper paths, usernames, tokens, and machine-local facts in local `~/.codex`.
4. Do not add runtime code here just because Codex can delegate.
5. If a team already has private skills, embed the relevant delegation rules into those skills instead of leaving all policy only in the README.

## V2.1 Migration Focus

V2.1 stabilizes the governance boundary:

- the global delegation baseline moves into `AGENTS.md`
- `$master` keeps private routing and private delegation refinement
- installer-preserved local overlay content moves into `skills/master/LOCAL.md`

When migrating from V2 to V2.1:

1. Keep global delegation rules in `AGENTS.md`.
2. Keep private routing and private delegation refinement in `skills/master/SKILL.md`.
3. Move any machine-local route-table details or private delegation exceptions out of the shared `Master` and into `skills/master/LOCAL.md`.
4. Do not move policy refinements into `memory.md`; use memory only for facts.
5. Continue to keep secrets, real paths, and private helper values in local files only.

## Local Overlay Migration Notes

If a team previously edited the shared `skills/master/SKILL.md` with environment-specific route-table details:

- move those environment-specific details into `skills/master/LOCAL.md`
- leave the shared `Master` focused on shared routing and private refinement logic
- keep local overlay rules narrower than the global delegation baseline
- use local skills for deep private workflow specialization when a single overlay file becomes too broad

## Post-Migration Local Layout

After installing this repository:

- shared logic is managed by the repository
- private route-table details and private delegation refinements stay in `skills/master/LOCAL.md`
- private memory stays local in each user's `~/.codex`
- users fill in `memory.md` and `memory/topics/*.md` with their own values
- daily notes and automation logs never flow back into the repository by default
- delegation policy is inherited from the shared layer, while private skills can refine it for local workflows
