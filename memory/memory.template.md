# Memory

This is the local global long-term memory file for one user's Codex environment.

Use this file only for durable facts that should still matter across days and across workflows.

For other memory layers, use:

- `rules.md` for short anti-footgun rules
- `memory/daily/YYYY-MM-DD.md` for day-specific troubleshooting and run notes
- `memory/topics/*.md` for domain-specific durable knowledge

Do not store one-off UI states, temporary errors, or short-lived tokens here.

## Suggested Sections

### User Preferences

- The user prefers:

### Stable Machines and Services

- Primary workstation:
- Shared server:
- Preferred entrypoints:

### Shared Workflow Facts

- Known helper scripts:
- Known environment files:
- Stable service URLs:

### Durable Lessons

- Reusable cross-workflow lesson:

## Notes

- Replace placeholders with local real values on the target machine.
- Keep secrets out of markdown when possible; prefer secure credential storage.
