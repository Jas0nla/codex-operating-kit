# Rules

- `AGENTS.md` controls thread entry, owns the global delegation baseline, and hands private routing to `Master`.
- `Master` owns private workflow routing and private delegation refinement.
- Use `$master` to route private-environment workflows before reaching for generic tools.
- Start each new thread with a fast routing check; if the request might touch the private environment or repeated workflow logic, read `$master` first.
- If a matching private skill exists, read that skill before inventing a fresh workflow.
- Route before delegate.
- Default to single-agent execution unless parallel payoff is clear.
- One write scope should have one owner.
- Transient sub-agent findings do not belong in long-term memory by default.
- Stop or ignore delegated work once it no longer materially helps the main task.
- Do not store route-table details or delegation overlays in memory files.
- Missing app or connector injection does not prove the underlying local capability is unavailable.
- Prefer local scripts, env files, helpers, stable IDs, and known entrypoints before browser automation.
- Store only durable, reusable facts in long-term memory; keep one-off failures and transient UI states out of it.
- Before creating a new memory or governance markdown file, prefer an existing layer or topic file unless a genuinely new category is needed.
