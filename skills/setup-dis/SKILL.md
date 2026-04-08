---
name: setup-dis
description: |
  First-time DIS setup: account creation, project creation, .dis.toml configuration, and CLI verification.
  Use when DIS is not yet configured, .dis.toml is missing, or the user is setting up a new project.
---

# setup-dis

Guide the user through first-time DIS setup and generate a `.dis.toml` at the repository root.

## Flow

By default, run through all steps automatically, only pausing for user input where noted. If the user asks for an interactive walkthrough, pause after each step for confirmation.

### 1. Account and Project

Direct the user to:
1. Create an account at https://app.getdis.ai (skip if they already have one)
2. Create a project at https://app.getdis.ai/projects/
3. Copy the **project FQID** (UUID) from the project settings page

Ask the user to paste their project FQID before continuing.

### 2. Authenticate

Run `npx @getdis/cli auth login` to authenticate via OAuth.

### 3. Generate `.dis.toml`

Scan the repository to build the config automatically:

1. **Detect source code folders** -- scan the repo and list every project as `[project_root, code_folder]` pairs:
   - `project_root` is the directory relative to repo root (`""` means the repo root itself)
   - `code_folder` is the subdirectory within that project containing source code
   - Example: `["service", "src"]` means project "service" with code in `service/src/`
   - A project can have multiple entries: `["service", "src"]`, `["service", "tests"]`
   - Every project in the repo must be listed for DIS to ingest it

2. **Detect source code extensions** -- find which code extensions are present:
   - Common: `.py`, `.ts`, `.tsx`, `.js`, `.jsx`, `.go`, `.rs`, `.java`, `.tf`, `.tfvars`
   - Only include extensions that actually exist in the detected source folders

3. **Documentation extensions** -- default to `[".md", ".markdown", ".rst", ".txt"]`, filtered to those present in the repo

4. **Write `.dis.toml`** at the repository root:

```toml
version = 1

project_fqid = "<pasted-uuid>"

[source]
source_code_folders = [
  ["", "src"],
  ["service", "src"],
  ["service", "tests"],
  ["webapp", "src"],
]

source_code_extensions = [".py", ".ts", ".tsx"]

documentation_extensions = [".md"]
```

Present the generated config to the user for review before writing.

### 4. Verify

Run `npx @getdis/cli health` to confirm connectivity, then `npx @getdis/cli search "most recently created issue"` as a smoke test.

## Config Reference

| Field | Type | Description |
|-------|------|-------------|
| `version` | integer | Always `1` |
| `project_fqid` | string (UUID) | Project identifier from https://app.getdis.ai |
| `[source].source_code_folders` | array of `[project_root, code_folder]` pairs | Each pair maps a project to a code directory. List all projects -- DIS only ingests what is listed |
| `[source].source_code_extensions` | array of strings | File extensions to index as code |
| `[source].documentation_extensions` | array of strings | File extensions to index as documentation |

## Notes

- `.dis.toml` should be committed to the repository -- the project FQID is not a secret, it connects the repo to the DIS project.
