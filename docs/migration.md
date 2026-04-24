# Migration Guide

This repository is for migrating reusable operating logic out of a private `~/.codex` without leaking machine-private facts.

## Bring Over

Bring over and generalize:

- thin thread-entry rules
- thin `Master` routing logic
- ask-once orchestration flow
- reusable custom-agent roles
- short operating rules

## Redact or Replace

Do not commit:

- real hostnames, IPs, internal URLs, usernames, or secrets
- machine-specific helper paths unless they are placeholders
- personal route-table details
- daily notes or run history
- private custom-agent names that only make sense in one environment

Replace private values with:

- generic workflow names
- generic route categories
- generic agent roles
- local-overlay placeholders

## Suggested Conversion

1. Keep the structure.
2. Replace private route-table entries with template examples.
3. Replace private agent names with reusable generic roles.
4. Keep local overlays for machine-specific routing after install.
5. Keep the shared layer small enough that it still reads like an operating contract, not a policy wiki.

## Shared Mapping Used Here

- private thread entry -> `AGENTS.md`
- private router -> `skills/master/SKILL.md`
- private ask-and-launch flow -> `skills/team-orchestrator/SKILL.md`
- private route table -> `skills/master/LOCAL.md`
- private agent roster -> shared generic custom agents plus local replacements when needed

## After Install

After installing this repository:

- fill in `skills/master/LOCAL.md`
- add private route-table details locally
- replace the shared confirmation wording locally if needed
- add private domain-specific agents only when the shared roster is not enough
