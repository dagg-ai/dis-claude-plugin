# dis resolve

Resolve entity FQNs to their file locations and line numbers.

## Usage

```bash
npx @getdis/cli resolve "auth.service.login"
npx @getdis/cli resolve "auth.service.login" "models.User"
```

## When to Use

- After `dis search` to find exactly where entities live
- "Where is this function defined?"
- Getting line numbers before reading specific code sections

## Output

Returns a map of FQN to location (or null if not found):

```json
{
  "auth.service.login": {"kind": "function", "file_path": "src/auth.py", "start_line": 42, "end_line": 68},
  "models.User": null
}
```
