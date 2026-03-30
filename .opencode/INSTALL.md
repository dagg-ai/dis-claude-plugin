# Installing DIS for OpenCode

## Installation

Add DIS to the `plugin` array in your `opencode.json`:

```json
{
  "plugin": ["dis@git+https://github.com/dagg-ai/dis-plugin.git"]
}
```

Restart OpenCode. Skills are auto-discovered.

## Setup

After installation, ask OpenCode to run the `setup-dis` skill. It will guide you through account creation, project setup, and authentication.

## Updating

Restart OpenCode to pull the latest version.
