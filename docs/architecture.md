# Architecture

This repository separates file/version structure, task sessions, and agent workflow logic.

## Layer Diagram

```text
Agent Operating Layer
├─ File and Version Layer
│  ├─ Project / Folder
│  │  └─ The working directory that holds files and code
│  ├─ Repo
│  │  └─ The git repository for that project
│  └─ Branch
│     └─ A development line inside the repo
│
├─ Session Execution Layer
│  └─ Thread
│     └─ One task-focused conversation and execution context
│
└─ Agent Workflow Layer
   ├─ AGENTS.md
   │  └─ Decides whether a new thread should enter the private workflow system
   │
   └─ Master
      └─ Routes work and decides which memory layer should receive durable knowledge
         ├─ Global Long-Term Memory
         │  ├─ memory.md
         │  └─ rules.md
         │
         ├─ Daily Operational Memory
         │  └─ memory/daily/YYYY-MM-DD.md
         │
         ├─ Topic Memory
         │  └─ memory/topics/
         │     ├─ clickup.md
         │     ├─ raspberry.md
         │     ├─ winremote.md
         │     └─ xhs.md
         │
         └─ Automation Memory
            └─ automations/<automation-id>/
               ├─ automation.toml
               └─ memory.md
```

## Roles

- `Project / Repo / Branch`: where the files live and how versions move
- `Thread`: what task is being worked on right now
- `AGENTS.md`: entry gate for new tasks
- `Master`: routing logic for private workflows
- `memory`: long-term, daily, domain, and automation-specific memory

## Design Rules

- Keep entry behavior in `AGENTS.md`
- Keep routing logic in `skills/master/SKILL.md`
- Keep concise reusable rules in `rules.md`
- Keep durable facts in `memory.md` or `memory/topics/*.md`
- Keep run-specific observations in daily or automation memory
