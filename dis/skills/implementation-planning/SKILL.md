---
name: Implementation Planning
description: Gather comprehensive context when implementing a task, before doing significant code changes, or when understanding code before modifying it. Triggers for feature implementation, code modifications, and any development task requiring comprehensive context.
context: fork
---
# Implementation Planning

Execute this 4-phase workflow to gather context before implementing.

## Phase 1: High-Level Context

Call `mcp__plugin_dis_dis__gather_evidence` with:
- `project_fqid`: From CLAUDE.md
- `request`: The user's feature request (verbatim)

Review the response for:
- Analogous patterns and confidence scores
- Documentation chunks (internal + external)
- Knowledge graph entities (issues, PRs, decisions)

## Phase 2: Targeted Knowledge Discovery

Based on Phase 1 findings, formulate 3-5 targeted queries. Examples:
- "What files define result types in disengine.llm?"
- "What modules call disengine.llm.service.text_completion?"
- "What PRs modified the background task runner?"

For each query, call `mcp__plugin_dis_dis__information_query` with:
- `project_fqid`: From CLAUDE.md
- `query`: Your focused question
- `entity_id`: If a specific entity is mentioned (e.g., "DAG-78")

Collect FQNs and episode_identifiers from responses for Phase 3.

## Phase 3: Implementation Context Assembly

Call `mcp__plugin_dis_dis__gather_implementation_context` with:
- `project_fqid`: From CLAUDE.md
- `entity_fqns`: FQNs from Phase 2 (e.g., `["disengine.llm.models.StateMachineResult"]`)
- `episode_identifiers`: File paths from Phase 2 (e.g., `["dagg-ai/repo-file-path/file.py"]`)
- `documentation_queries`: Doc searches if needed (e.g., `["PydanticAI token usage"]`)
- `include_dependencies`: true

Review the manifest for files, line numbers, and dependencies.

## Phase 4: Context Validation

Use the Read tool on files from Phase 3, reading only relevant line ranges.

Assess context sufficiency:
- What's present: Models, functions, patterns found
- What's missing: Knowledge gaps needing more queries

**If sufficient**: Proceed to implementation.
**If insufficient**: Return to Phase 2 with refined queries.

## Constraints

- Execute phases sequentially - each builds on the previous
- Format list parameters as JSON arrays
- If a phase fails or returns no results, fall back to Grep/Glob
