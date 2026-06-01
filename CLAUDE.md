# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Start development server
bin/dev

# Setup project (first time or reset)
bin/setup
bin/setup --reset   # wipe and re-seed database

# Run all tests
bin/rails test
bin/rails test:system   # Capybara/Selenium system tests

# Run a single test file
bin/rails test test/models/post_test.rb

# Run a single test by line number
bin/rails test test/models/post_test.rb:15

# Lint
bin/rubocop

# Security scans
bin/brakeman
bin/bundler-audit

# Database
bin/rails db:migrate
bin/rails db:prepare   # creates + migrates (safe for first run)
bin/rails console
```

## Architecture

This is a **Rails 8.1** blog app using Ruby 3.2.3 with an all-SQLite stack (no Redis, no Sidekiq).

### Frontend stack
- **Hotwire** (Turbo + Stimulus) — default approach for interactivity; avoid adding React/Vue unless explicitly needed
- **Importmap** — no Node/webpack; JavaScript dependencies are pinned via `config/importmap.rb`
- **Propshaft** — replaces Sprockets as the asset pipeline

### Background & real-time (all database-backed)
| Component | Gem | Purpose |
|-----------|-----|---------|
| Jobs | `solid_queue` | Background job processing (runs inside Puma via `config/puma.rb`) |
| Cache | `solid_cache` | Rails.cache backend |
| WebSockets | `solid_cable` | ActionCable adapter |

No separate worker process is needed in development — everything runs through `bin/dev`.

### Deployment
- **Docker** multi-stage image (`Dockerfile`) — production build compiles assets at build time
- **Kamal** (`config/deploy.yml`) — orchestrates Docker deployment; configure target server IP before deploying
- **Thruster** — wraps Puma in production for HTTP caching/compression

### Code style
RuboCop is configured with the [Omakase](https://github.com/rails/rubocop-rails-omakase) ruleset (`.rubocop.yml`). The CI pipeline enforces lint, Brakeman, and bundler-audit on every push.

### CI (GitHub Actions — `.github/workflows/ci.yml`)
Runs in order: `scan_ruby` → `scan_js` → `lint` → `test` → system tests. Failed system tests upload screenshots as artifacts.
