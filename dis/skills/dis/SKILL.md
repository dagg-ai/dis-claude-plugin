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

## CLI Location

The CLI binary is at `scripts/dis` relative to this skill directory. Project configuration (including the project FQID) is read automatically from `.dis.toml` at the repository root.

**Important:** DIS queries can take a while. Set the command timeout to at least 180 seconds (3 minutes) when running `scripts/dis` commands.

## Commands

| Command | Use When | Reference |
|---------|----------|-----------|
| `scripts/dis ask "question"` | Understanding or finding code | `references/ask.md` |
| `scripts/dis search "query"` | Issues, PRs, docs, meetings, history | `references/search.md` |
| `scripts/dis search "query" --in docs` | Documentation search | `references/search.md` |
| `scripts/dis search "query" --in meetings` | Meeting notes and transcripts | `references/search.md` |
| `scripts/dis research "request"` | High-level context before implementation | `references/research.md` |
| `scripts/dis resolve "entity.Fqn"` | Resolve entity to file location + lines | `references/resolve.md` |
| `scripts/dis deps "entity"` | Dependency graph for code entities | `references/deps.md` |
| `scripts/dis plan "request"` | Full implementation plan | `references/research.md` (Plan Generation) |
| `scripts/dis status` | Project health, ingestion, integrations | `references/status.md` |
| `scripts/dis health` | Verify connectivity | |
| `scripts/dis auth {status,login,logout}` | Handle authentication via browser (OAuth) | |

## Ticket References

When a ticket pattern is detected:

1. Extract all ticket references from the user's message
2. Run: `scripts/dis search "user's full message" --ref TICKET-ID`
   - Normalize ticket IDs to uppercase (e.g., `dag-455` -> `DAG-455`)
   - For repo-scoped PR FQIDs: `--ref "dagg-ai/repo-name-PR-894"`
3. Present results clearly, organized by ticket ID

## Implementation Planning Workflow

For feature implementation or code changes, execute these phases sequentially:

1. **Research** -- `scripts/dis research "the feature request"` to get high-level context
2. **Search** -- 3-5 targeted `scripts/dis search` queries based on research findings
3. **Resolve** -- `scripts/dis resolve "mod.Class" "pkg.func"` to resolve FQNs from search to exact file locations and line numbers
4. **Validate** -- Read the identified files to confirm context is sufficient

See `references/research.md` for the full workflow.

## Error Handling

- If `.dis.toml` is missing: use the `setup-dis` skill
- If a command returns no results: broaden query terms or try alternative phrasing
- If a command fails: fall back to Grep/Glob for the session

## Constraints

- Execute implementation planning phases sequentially -- each builds on the previous
