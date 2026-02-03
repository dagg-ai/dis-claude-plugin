---
name: Codebase Exploration
description: Answers questions about code, its structure and relationships, and documentation. Use when trying to find a piece of code, figure out how things work, find where they are defined, or to answer any question about the codebase that would traditionally use grep/glob/find.
---
# Codebase Exploration

## Instructions

### 1. Get the Project FQID

Check CLAUDE.md for the project FQID. If not present, ask the user.

### 2. Choose the Right Tool

| Query Type | Examples | Tool |
|------------|----------|------|
| Understanding code | "How does X work?", "Explain Y" | `source_query` |
| Finding code | "Where is X?", "Find Y" | `source_query` |
| History/Knowledge | "What PRs changed X?", "Who worked on Y?" | `information_query` |
| Documentation | "What do the docs say about X?" | `search_documentation` |
| Complex queries | Multiple aspects | Use multiple tools |

### 3. Call the Tool

**For code questions**, use `mcp__plugin_dis_dis__source_query`:
- `project_fqid`: From CLAUDE.md
- `question`: The user's question (preserve full context)
- `include_docs`: true if documentation might help

**For knowledge graph queries**, use `mcp__plugin_dis_dis__information_query`:
- `project_fqid`: From CLAUDE.md
- `query`: The user's question
- `entity_id`: If a specific entity is mentioned

**For documentation**, use `mcp__plugin_dis_dis__search_documentation`:
- `project_fqid`: From CLAUDE.md
- `query`: The documentation search query

### 4. Handle Results

**If results are good**: Present findings with file paths, line numbers, relationships, and any historical context.

**If results are insufficient**: Fall back to Grep/Glob.
