---
name: Implementation Planning
description: Gather comprehensive context when implementing a task, or before doing significant code changes.
context: fork
---
# Implementation Planning

Guides systematic context gathering for implementation tasks using the DIS 4-phase workflow. Triggers when user requests feature implementation or significant code changes.

## Description

This skill guides you through a structured 4-phase workflow to gather rich, targeted context from the DIS knowledge graph before implementing features or making code changes. It leverages organizational knowledge, historical decisions, and existing patterns to provide better implementation context than traditional grep/glob searches.

## Usage

This skill should activate when the user requests feature implementation or asks you to make significant code changes.

Examples that should trigger this skill:
- "Implement feature X"
- "Add functionality to do Y"
- "Make changes to support Z"
- "Plan the implementation of..."

Do NOT activate if:
- User is asking simple questions
- User wants to read/explore code without implementing
- Task is trivial (typo fixes, single-line changes)

## Instructions

When activated, execute this 4-phase workflow:

### Phase 1: High-Level Context

**Tool**: `mcp__plugin_dis_dis__gather_evidence`

**Purpose**: Gather broad context including:
- Web documentation (third-party APIs, libraries)
- Internal documentation chunks
- Knowledge graph chunks (issues, PRs, decisions)
- Source-of-truth module hints
- Analogous patterns with confidence scores

**Action**:
1. Call `mcp__plugin_dis_dis__gather_evidence` with:
   - `project_fqid`: From CLAUDE.md
   - `request`: The user's feature request (verbatim)

2. Review the evidence plan and context pack
3. Note the analogs and SOM capability hints

**Expected Output**: Broad understanding of scope, external dependencies, existing patterns

---

### Phase 2: Targeted Knowledge Discovery

**Tool**: `mcp__plugin_dis_dis__information_query` (multiple calls)

**Purpose**: Query knowledge graph for specific implementation details with sharp, focused queries.

**Action**:
1. Examine the broad context in the Phase 1 findings, and formulate 3-5 targeted queries to expand on important subjects, for example:
   - Entity locations: "What files define result types in disengine.llm?"
   - Dependencies: "What modules call disengine.llm.service.text_completion?"
   - Relevant patterns: "How are usage metrics exposed in other services?"
   - History: "What PRs modified the background task runner?"

2. For each query, call `mcp__plugin_dis_dis__information_query` with:
   - `project_fqid`: From CLAUDE.md
   - `query`: Your focused question
   - `entity_id`: If a specific entity is mentioned (e.g., "DAG-78")


3. Collect FQNs (fully qualified names) and episode_identifiers from responses

**Expected Output**: Concrete entity references (FQNs, file paths, episode IDs) for Phase 3

---

### Phase 3: Implementation Context Assembly

**Tool**: `mcp__plugin_dis_dis__gather_implementation_context`

**Purpose**: Get structured manifest of what to read (WITHOUT full source code content).

**Action**:
1. Call `mcp__plugin_dis_dis__gather_implementation_context` with:
   - `project_fqid`: From CLAUDE.md
   - `entity_fqns`: array of FQNs from Phase 2 (e.g., `["disengine.llm.models.StateMachineResult"]`)
   - `episode_identifiers`: array of file paths from Phase 2 (e.g., `["dagg-ai/repo-file-path/file.py"]`)
   - `documentation_queries`: array of doc searches (e.g., `["PydanticAI token usage"]`)
   - `include_dependencies`: true (to get dependency analysis)

2. Review the manifest:
   - Files with entity line numbers
   - Entity metadata (kind, start_line, end_line)
   - Dependency counts
   - Documentation matches

**Expected Output**: Manifest of files/entities to read with metadata (line numbers, dependencies)

---

### Phase 4: Context Validation & Report

**Tool**: `Read` (Claude's built-in)

**Purpose**: Validate context sufficiency before implementation

**Actions**:
1. **Perform targeted reads**: Use Read tool on files from Phase 3, reading only relevant line ranges
2. **Analyze context**: Review gathered code, docs, and dependencies
3. **Report on suitability**: Assess and report on what's been included, and what relevant information might be missing in the context.
   - ✅ What's present: Models, functions, patterns found
   - ❌ What's missing: Knowledge gaps that need additional information queries
   - 📊 Suitability: Is this enough to implement the task?

4. **Decision point**: Decide if the gathered context seems sufficient to proceed with implementation, or if, for example, relevant classes, modules, or guidelines are missing.
   - ✅ Context sufficient → Report readiness and proceed to implementation
   - ❌ Context insufficient → Iterate back to Phase 2 with refined queries

**Expected Output**: Clear report on context suitability and readiness to implement

---

## Why This Workflow?

**Compared to traditional grep/glob approach:**

| Metric | Traditional | DIS 4-Phase | Improvement |
|--------|-------------|-------------|-------------|
| Speed | 15-20 min | 5 min | 3-4x faster |
| Lines read | 3000-4000 | 300-500 | 10x less |
| Tokens used | 55,000+ | 22,500 | 60% less |
| Context quality | Good | Excellent | Much better |
| SNR (signal/noise) | Medium | High | Much higher |

**Key Benefits:**
- Pre-filtered, compressed context via knowledge graph
- Historical context (PRs, decisions, patterns) unavailable via grep
- External knowledge (web docs, analogs) automatically retrieved
- Relationship understanding (dependencies, callers) without manual tracing

## Output Format

Report progress through each phase:

```
## Phase 1: High-Level Context
[Calling gather_evidence...]
✓ Found 3 analogs with 85-95% confidence
✓ Identified 5 relevant documentation chunks
✓ Located 12 knowledge graph entities

## Phase 2: Targeted Knowledge Discovery
[Calling information_query 4 times...]
✓ Query 1: Found StateMachineResult at line 266-273
✓ Query 2: Found 3 service functions that return result types
✓ Query 3: Found PydanticAI usage pattern in 2 files
✓ Query 4: Found 8 callers of the service functions

Collected FQNs: disengine.llm.models.StateMachineResult, ...
Collected files: service/src/disengine/llm/models.py, ...

## Phase 3: Implementation Context Assembly
[Calling gather_implementation_context...]
✓ Manifest received: 3 files, 15 entities
✓ Line numbers: 248-273, 420-454, 556-674
✓ Dependencies: 10 depends_on, 8 depended_by

## Phase 4: Context Validation
[Reading 3 files at targeted line ranges...]
✓ Read 315 lines (vs 3000+ with traditional approach)

**Context Assessment:**
✅ Present: Result types, service functions, PydanticAI usage
✅ Present: Token usage patterns from analogs
❌ Missing: None - sufficient to proceed

**Recommendation**: Context is sufficient. Ready to implement.
```

## Constraints

- Always retrieve the project FQID from CLAUDE.md first
- Execute phases sequentially - each phase builds on the previous
- Format list parameters as JSON arrays for gather_implementation_context
- Report token/efficiency savings to demonstrate value
- If Phase 4 reveals gaps, iterate back to Phase 2 with refined queries
- Be verbose about what you're doing - this workflow is educational

## Error Handling

- If MCP tools not available: "DIS MCP server not configured. This workflow requires MCP connection."
- If project FQID missing: Request it from user and offer to add to CLAUDE.md
- If a phase fails: Report the issue and suggest manual fallback (grep/glob/read)
- If queries return no results: Refine queries and try again, or fall back to traditional search

## Notes

This skill demonstrates the power of knowledge graph-driven development. Use it as a template for complex implementation tasks where context quality matters more than speed.
