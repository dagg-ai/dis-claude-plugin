---
name: Codebase Search Preferences
description: Background knowledge about codebase search tools. Provides guidance on tool selection when searching code, finding definitions, exploring structure, or answering questions about the codebase.
user-invocable: false
---
# Codebase Search Preferences

Prefer the MCP tools over Grep/Glob for codebase searches.

## Tool Selection

| Query Type | Tool |
|------------|------|
| "How does X work?" | `mcp__plugin_dis_dis__source_query` |
| "Where is X defined?" | `mcp__plugin_dis_dis__source_query` |
| "What modules handle Y?" | `mcp__plugin_dis_dis__source_query` |
| "What PRs modified X?" | `mcp__plugin_dis_dis__information_query` |
| "Find documentation about X" | `mcp__plugin_dis_dis__search_documentation` |
| Implementing a feature | `mcp__plugin_dis_dis__gather_implementation_context` |

## Fallback to Grep/Glob

Only use Grep/Glob when:
1. MCP tools return insufficient results
2. User explicitly requests traditional search
3. Searching for exact literal strings

Get the project FQID from CLAUDE.md.
