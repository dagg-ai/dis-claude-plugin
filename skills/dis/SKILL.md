---
name: dis
description: |
  Code search, project search, implementation planning, and research via the DIS CLI.
  Provides richer context than Grep/Glob for understanding code, finding definitions, and tracing how modules connect.
  Ticket lookups (ABC-123 pattern), codebase questions, entity resolution, dependency graphs,
  and unified search across issues, docs, and meetings.
---

# DIS

DIS (Dagg Intelligence Services) provides a knowledge graph built from your development tools -- GitHub, Linear, Slack, and more. This skill uses the `dis` CLI to query that knowledge graph.

## CLI

Run the CLI via `npx @getdis/cli`. Project configuration (including the project FQID) is read automatically from `.dis.toml` at the repository root.

**Important:** DIS queries can take a while. Set the command timeout to at least 900 seconds (15 minutes) when running CLI commands.

## Commands

| Command | Use When | Reference |
|---------|----------|-----------|
| `npx @getdis/cli ask "question"` | Understanding or finding code | `references/ask.md` |
| `npx @getdis/cli search "query"` | Issues, PRs, docs, meetings, history | `references/search.md` |
| `npx @getdis/cli search "query" --in docs` | Documentation search | `references/search.md` |
| `npx @getdis/cli search "query" --in meetings` | Meeting notes and transcripts | `references/search.md` |
| `npx @getdis/cli research "request"` | High-level context before implementation | `references/research.md` |
| `npx @getdis/cli resolve "entity.Fqn"` | Resolve entity to file location + lines | `references/resolve.md` |
| `npx @getdis/cli deps "entity"` | Dependency graph for code entities | `references/deps.md` |
| `npx @getdis/cli plan "request"` | Full implementation plan | `references/research.md` (Plan Generation) |
| `npx @getdis/cli status` | Project health, ingestion, integrations | `references/status.md` |
| `npx @getdis/cli health` | Verify connectivity | |
| `npx @getdis/cli auth {status,login,logout}` | Handle authentication via browser (OAuth) | |

## Ticket References

When a ticket pattern is detected:

1. Extract all ticket references from the user's message
2. Run: `npx @getdis/cli search "user's full message" --ref TICKET-ID`
   - Normalize ticket IDs to uppercase (e.g., `dag-455` -> `DAG-455`)
   - For repo-scoped PR FQIDs: `--ref "dagg-ai/repo-name-PR-894"`
3. Present results clearly, organized by ticket ID

## Implementation Planning Workflow

For feature implementation or code changes, execute these phases sequentially:

1. **Research** -- `npx @getdis/cli research "the feature request"` to get high-level context
2. **Search** -- 3-5 targeted `npx @getdis/cli search` queries based on research findings
3. **Resolve** -- `npx @getdis/cli resolve "mod.Class" "pkg.func"` to resolve FQNs from search to exact file locations and line numbers
4. **Validate** -- Read the identified files to confirm context is sufficient

See `references/research.md` for the full workflow.

## Error Handling

- If `.dis.toml` is missing: use the `setup-dis` skill
- If a command returns no results: broaden query terms or try alternative phrasing
- If a command fails: fall back to Grep/Glob for the session

## Constraints

- Execute implementation planning phases sequentially -- each builds on the previous
