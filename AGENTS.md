# Global Agent Entry

`AGENTS.md` only owns team-local thread entry plus a small global delegation baseline.

## Entry

For each new request:

1. Decide whether it may touch team-specific workflows, machines, accounts, automations, memory, local scripts, or operating conventions.
2. If yes or uncertain, enter `$Master`.
3. If clearly generic, skip `$Master`.

## Global Guardrails

1. Route before delegate.
2. The main agent is `manager-only-by-default`.
3. Route strong multi-lane team-local tasks into `$team-orchestrator`.
4. One write scope, one owner.
5. `Worker` writes require disjoint ownership.
6. Risky delegated writes need a plan before execution.
7. Architecture, integration, acceptance, and final output stay with the main agent.
8. No nested teams.
