# Global Agent Entry

This file defines thread-entry behavior for the shared agent environment.

Its job is narrow:

- decide whether a new thread should enter the private workflow system
- send qualifying work into `$master`
- avoid routing clearly generic work through unnecessary private-workflow checks

It should not become a dump for domain facts, run logs, or long route tables.

## Entry Preflight

Before acting on a user request, do a quick routing preflight.

1. Decide whether the request may touch team-specific workflows, machines, accounts, automations, memory, local scripts, or operating conventions.
2. If yes or uncertain, read and use `$master` first.
3. Let `$master` route to the most specific private skill, memory layer, helper, env file, or known entrypoint.
4. Only skip `$master` when the task is clearly generic and unrelated to the private environment.

When unsure, bias toward reading `$master` before proceeding.

`$master` is the workflow-logic entrypoint for the private operating system. It is not just a reference skill.

## File Boundaries

Use the surrounding files by role:

- `AGENTS.md`: thread-entry and top-level routing behavior
- `skills/master/SKILL.md`: private workflow routing logic
- `rules.md`: short high-reuse rules and anti-footguns
- `memory.md`: cross-day global durable facts
- `memory/daily/YYYY-MM-DD.md`: day-specific run notes
- `memory/topics/*.md`: domain-specific durable facts
- `automations/<id>/memory.md`: automation-local run history
