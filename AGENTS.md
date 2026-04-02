# Global Agent Entry

This file defines thread-entry behavior for the shared agent environment.

Its job is narrow:

- decide whether a new thread should enter the private workflow system
- send qualifying work into `$master`
- avoid routing clearly generic work through unnecessary private-workflow checks

It should not become a dump for domain facts, run logs, or long route tables.

## Entry Contract

`AGENTS.md` owns the thread-entry contract plus the global delegation baseline.

It must:

- decide whether the thread should enter `$master`
- keep clearly generic work out of unnecessary private-workflow routing
- define the minimum delegation guardrails that every thread must follow
- hand off private workflow routing and private delegation refinement to `skills/master/SKILL.md`

It must not:

- contain long route tables
- define durable facts
- contain private route-table details
- become a substitute for memory or domain skills

## Entry Preflight

Before acting on a user request, do a quick routing preflight.

1. Decide whether the request may touch team-specific workflows, machines, accounts, automations, memory, local scripts, or operating conventions.
2. If yes or uncertain, read and use `$master` first.
3. Let `$master` route to the most specific private skill, memory layer, helper, env file, or known entrypoint.
4. Only skip `$master` when the task is clearly generic and unrelated to the private environment.

When unsure, bias toward reading `$master` before proceeding.

`$master` is the workflow-logic entrypoint for the private operating system. It is not just a reference skill.

## Global Delegation Baseline

The rules below apply to every thread, including clearly generic work that does not enter `$master`.

1. Default to single-agent execution.
   - If there is no clear parallel payoff, keep the work in the main agent.
2. Route before delegate.
   - If the request may match a private workflow, route through `$master` before any delegation.
3. Delegate only bounded subtasks.
   - A delegated task must have a clear goal, clear input, and a concrete expected output.
4. Keep critical-path blockers local.
   - If the very next step depends on the result, prefer doing it in the main agent.
5. One write scope, one owner.
   - Multiple agents must not write the same file, same module, or same decision surface at the same time.
6. Keep high-coupling decisions with the main agent.
   - Architecture choices, cross-module tradeoffs, and final user output stay with the main agent.
7. Treat sub-agent output as transient by default.
   - Delegated findings do not become durable memory automatically.
8. Avoid duplicate delegation.
   - Do not send multiple agents to solve the same unresolved question unless independent verification is explicitly needed.
9. Delegation must be recoverable.
   - Stop waiting on or ignore delegated work once it no longer materially helps the main task.

## File Boundaries

Use the surrounding files by role:

- `AGENTS.md`: thread-entry and global delegation baseline
- `skills/master/SKILL.md`: private workflow routing and private delegation refinement
- `skills/master/LOCAL.md`: installer-preserved local overlay for private route-table details and private delegation refinements
- `rules.md`: short high-reuse rules and anti-footguns
- `memory.md`: cross-day global durable facts
- `memory/daily/YYYY-MM-DD.md`: day-specific run notes
- `memory/topics/*.md`: domain-specific durable facts
- `automations/<id>/memory.md`: automation-local run history
