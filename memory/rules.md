# Rules

- `AGENTS.md` controls thread entry, `Master` controls private workflow routing, and memory files store facts rather than entry behavior.
- Use `$master` to route private-environment workflows before reaching for generic tools.
- Start each new thread with a fast routing check; if the request might touch the private environment or repeated workflow logic, read `$master` first.
- If a matching private skill exists, read that skill before inventing a fresh workflow.
- Missing app or connector injection does not prove the underlying local capability is unavailable.
- Prefer local scripts, env files, helpers, stable IDs, and known entrypoints before browser automation.
- Store only durable, reusable facts in long-term memory; keep one-off failures and transient UI states out of it.
- Before creating a new memory or governance markdown file, prefer an existing layer or topic file unless a genuinely new category is needed.
