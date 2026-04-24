---
name: Master
description: Route team-local work to the right skill first.
metadata:
  short-description: Team-local router
---

# Master

Use `Master` when a request may touch a private environment, a known team workflow, or an existing local operating surface.

## Thread entry

1. If the task may be team-local, read `Master`.
2. Read `rules.md`.
3. Read `skills/master/LOCAL.md` when needed.
4. Route to the most specific local skill, helper, env file, or entrypoint.

## Route rule

- If a matching local skill exists, use it first.
- Prefer known local helpers, scripts, env files, IDs, connectors, and memory before generic exploration.
- Use generic tools only after the local path is exhausted.

## Strong-candidate gate

If the routed team-local task has `2+` separable lanes and the main agent would still have meaningful integration or acceptance work after delegation, send it to [`team-orchestrator`](../team-orchestrator/SKILL.md).

Do not keep broad multi-lane work inside `Master`.

## Fallback order

1. Matching local private skill
2. Existing local helpers, scripts, env files, or connectors
3. Mature external solution
4. Generic execution tools
5. New workflow only as the last resort

## Final review

Use `$final-review` only for high-trust shareable outputs when the extra pass materially reduces risk.

## When not to use Master

Skip `Master` only for clearly generic tasks that do not touch team-local workflows or environments.
