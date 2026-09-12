# homebrew-chopflow

Homebrew tap for **ChopFlow** — a durable distributed task queue built in Rust.

## Install

```sh
brew tap ricardoleal20/chopflow
brew install chopflow
```

This installs the three ChopFlow binaries:

| Binary            | What it is                                                      |
| ----------------- | --------------------------------------------------------------- |
| `chopflow-broker` | The broker — gRPC + HTTP/JSON API and the embedded dashboard.   |
| `chopflow-cli`    | The CLI client — enqueue tasks, check status, manage schedules. |
| `chopflow-mcp`    | The MCP server — exposes the broker as AI-friendly tools.       |

Workers ship separately (they run your handler code):

```sh
cargo install chopflow_worker
```

## How this tap stays up to date

The formula (`Formula/chopflow.rb`) is regenerated automatically by the
`bump-homebrew` job in the [ChopFlow release workflow](https://github.com/ricardoleal20/ChopFlow/blob/main/.github/workflows/release.yml)
on every release. The job downloads the published source tarball from crates.io,
computes its `sha256`, renders the formula, and pushes it here — so this tap
always tracks the latest published version with no manual bumps.

## Quick start

```sh
# 1. Start the broker (gRPC on :8000, HTTP/dashboard on :8080, SQLite by default)
chopflow-broker start

# 2. Enqueue a task
chopflow-cli enqueue -f task.json --name echo

# 3. Point an AI assistant at the broker over MCP
chopflow-mcp --broker http://127.0.0.1:8080
```

License: Apache-2.0.
