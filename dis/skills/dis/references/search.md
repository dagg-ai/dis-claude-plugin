# dis search

Search the knowledge graph for tickets, PRs, commits, project history, documentation, and meeting notes.

## Usage

```bash
scripts/dis search "What PRs modified the auth module?"
scripts/dis search "open bugs in the ingestion pipeline"
scripts/dis search "What is DAG-78 about?" --ref DAG-78
scripts/dis search "deployment guide" --in docs
scripts/dis search "What was discussed in yesterday's standup?" --in meetings
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
