# dis search

Search the knowledge graph for tickets, PRs, commits, project history, documentation, and meeting notes.

## Usage

```bash
npx @getdis/cli search "What PRs modified the auth module?"
npx @getdis/cli search "open bugs in the ingestion pipeline"
npx @getdis/cli search "What is DAG-78 about?" --ref DAG-78
npx @getdis/cli search "deployment guide" --in docs
npx @getdis/cli search "What was discussed in yesterday's standup?" --in meetings
```

## Options

- `--in <scope>` -- Search scope: `all` (default), `issues`, `docs`, `meetings`
- `--ref <id>` -- Reference ID to anchor the search (e.g., `DAG-78`, `dagg-ai/repo-PR-894`)
- `--expand` -- Broaden retrieval for relationship/context questions
- `--after <date>` -- Start of time range (ISO-8601)
- `--before <date>` -- End of time range (ISO-8601)
- `--count <n>` -- Maximum number of results (default: 30)

## When to Use

- Ticket/issue lookups (auto-activated on patterns like ABC-123)
- "What PRs changed X?"
- "Who worked on Y?"
- "What happened with Z last week?" (use `--after`/`--before`)
- History and decision context

### Documentation (`--in docs`)

- "What do the docs say about X?"
- "Find documentation about Y"
- Looking for guides, READMEs, or other ingested documentation

### Meeting Notes (`--in meetings`)

- "What was decided about X in the meeting?"
- "Search meeting notes about Y"
- Time-bounded questions about discussions and decisions (use `--after`/`--before`)

## Reference ID Formats

- **Ticket-style**: 2-10 letter prefix + `-` + 1-6 digits. Normalize to uppercase.
- **Repo-scoped PR FQIDs**: `org/repo-PR-digits` (e.g., `dagg-ai/dagg_intelligence_service-PR-894`)
- **Raw UUIDs**: Some KG entities surface as UUID strings
