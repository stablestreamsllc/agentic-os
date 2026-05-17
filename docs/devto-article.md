---
title: I Built an Open-Source Agent OS
published: true
description: "A locally-hosted multi-agent OS that orchestrates opencode, Hermes Agent, and Gemini CLI into one dashboard with 16 skills, scheduler, cost analytics, and memory. Full architecture breakdown."
tags: [agents, devops, opensource, python, fastapi]
cover_image: https://raw.githubusercontent.com/modimihir07/agentic-os/main/docs/og-image.png
canonical_url: https://dev.to/mihir_nmodi_14a06a4019e1/i-built-an-open-source-agent-os-2h30
---

I built an operating system for AI agents.

Not a terminal. Not a chat app. A full dashboard that coordinates three agents — **opencode** (code/DevOps), **Hermes Agent** (memory/scheduling), and **Gemini CLI** (research) — into one unified control plane.

GitHub: [github.com/modimihir07/agentic-os](https://github.com/modimihir07/agentic-os)

---

## The Problem

I was jumping between three tools:
- opencode for coding tasks
- Hermes for scheduling and memory
- Gemini CLI for web research

No shared context. No central dashboard. Every session started from zero.

## The Solution: 7-Layer Architecture

```
Layer 7  Identity / Constitution
Layer 6  Self-Evolution
Layer 5  Scheduler + Health
Layer 4  Memory Graph
Layer 3  Skills Hub + Eval
Layer 2  Business Brain
Layer 1  Agent Router
```

**Layer 1** routes tasks automatically: code → opencode, memory → Hermes, research → Gemini.

**Layer 3** gives each skill a standardized structure (SKILL.md + learnings + eval + score history) so they improve over time.

**Layer 4** provides persistent memory via a shared `brain/` folder and SQLite FTS5 — agents remember context across sessions.

## 12 Features

| Feature | What it does |
|---------|-------------|
| 3-Agent Engine | opencode + Hermes + Gemini CLI with auto-routing |
| 16 Skills | Executable packs with eval scoring |
| Cron Scheduler | APScheduler jobs (heartbeat, standup, audit) |
| Cost Analytics | Track spending across providers |
| One-Click Backup | Full tar.gz snapshots |
| Audit Trail | Every action logged |
| Prompt Library | 10 reusable templates |
| Dark/Light Theme | GitHub-style dark mode |
| Standards System | Auto-discover project conventions |
| Plugin Registry | Extend via custom skills |
| Client Timeout | 200s AbortController for long queries |
| Memory | SQLite FTS5 + shared brain/ files |

## vs Claude Agent OS

Honest comparison with Julian Goldie's video project:

| Feature | Claude Agent OS | Agentic OS (Mine) |
|---------|----------------|-------------------|
| Agents | Claude + OpenClaw + Hermes | opencode + Hermes + Gemini |
| Cost | $20/mo | **$0 (all free tiers)** |
| Memory | Obsidian (external) | **Built-in** |
| Cost Tracking | None | **Built-in** |
| Backup | None | **One-click** |
| License | Tutorial only | **MIT** |

## Tech Stack

Backend: FastAPI (Python) · Frontend: vanilla JS SPA · Scheduler: APScheduler · Memory: SQLite FTS5 · Cost: $0 (Gemini Flash, OpenRouter free models)

## Quick Start

```bash
git clone https://github.com/modimihir07/agentic-os.git
cd agentic-os && ./install.sh && ./start.sh
# Open http://127.0.0.1:8080
```

---

Agentic OS is MIT licensed. Star it on GitHub if you find it useful.

👉 **[github.com/modimihir07/agentic-os](https://github.com/modimihir07/agentic-os)**
