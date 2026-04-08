# Implementation Planning Workflow

Use this workflow before implementing features, modifying code, or planning refactors. Each phase builds on the previous; do not skip phases.

## Phase 1: High-Level Context

```bash
npx @getdis/cli research "The user's feature request verbatim"
```

Review the response for:
- Analogous patterns and confidence scores
- Documentation chunks (internal + external)
- Knowledge graph entities (issues, PRs, decisions)

## Phase 2: Targeted Knowledge Discovery

Based on Phase 1 findings, formulate 3-5 targeted queries:

```bash
npx @getdis/cli search "What files define result types in disengine.llm?"
npx @getdis/cli search "What modules call disengine.llm.service.text_completion?"
npx @getdis/cli search "What PRs modified the background task runner?" --ref DAG-78
```

Collect entity FQNs from responses for Phase 3.

## Phase 3: Resolve Entities

```bash
npx @getdis/cli resolve "module.Class" "pkg.func"
```

Resolves FQNs from Phase 2 to exact file locations and line numbers.

## Phase 4: Context Validation

Read the identified files (relevant line ranges only) to confirm context is sufficient.

- **If sufficient**: Proceed to implementation.
- **If insufficient**: Return to Phase 2 with refined queries.

## Full Plan Generation

For a complete implementation plan in one shot:

```bash
npx @getdis/cli plan "Add SSO support for enterprise customers"
npx @getdis/cli plan "Add SSO support" --repair --max-questions 8
```

Options:
- `--repair` -- Run a repair pass on the generated plan
- `--max-questions <n>` -- Maximum open questions to include (default: 6)
