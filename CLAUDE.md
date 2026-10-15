# Project Instructions

## Project Overview

DNSControl configuration (`dnsconfig.js`, `creds.json`) for testing and demonstrating the
CentralNic Reseller (`CNR`) provider module against the OT&E system, plus the integration
tests that exercise it.

- **Language / runtime:** DNSControl JavaScript configuration; Go to build `dnscontrol` from
  the nested submodule
- **Default branch:** `master`

## Architecture

- **`rtldev-middleware-dnscontrol/` is a nested git submodule** — the dnscontrol source with
  the provider module; the tests build `dnscontrol` from it, so a provider change is made
  there, not here.
- **The test domain `dnscontroltest2-cnr.com` is named in three places** — `dnsconfig.js`,
  `creds.json` and `tests/repo-cnr.sh`; change them together.
- **`creds.json` is tracked and holds no credentials.** `tests/integration.sh` reads the
  login from `CNR_TEST_USER` / `CNR_TEST_PASSWORD`, and only entity and domain from
  `creds.json`.
- **Outside CI, `.devcontainer/post-create.sh` moves the nested submodule to its `master`
  tip** and builds `dnscontrol` onto `PATH`; in CI it leaves the checked-out commit alone.

## Testing

- **There are no unit tests.** `tests/integration.sh` and `tests/repo-cnr.sh` run the
  dnscontrol `integrationTest` suite with `-provider CNR` against the live OT&E API and
  need `CNR_TEST_USER` / `CNR_TEST_PASSWORD`.
- **`tests/integration_diff2.sh` still reads `.CNR.apilogin` / `.CNR.apipassword` from
  `creds.json`** via jq. The committed `creds.json` has neither key, so it does not work
  with the committed file.
- **`tests/finalize_dev.sh` is not a test** — it is a Go tidy-up (vet, fmt, generate, mod
  tidy) in the nested submodule.

### Running tests

```sh
bash tests/integration.sh         # builds dnscontrol, runs the CNR integration tests — what CI runs
bash tests/integration_diff2.sh   # the same with -diff2; reads the login from creds.json, which has none
bash tests/finalize_dev.sh        # go vet, go fmt, go generate, go mod tidy in the submodule
```

## Build, CI & Policies

- **CI is local to this repository.** `test.yml` (`workflow_call` only) builds the
  devcontainer image as `ghcr.io/<repository>/rtldev_mid_dnscontrol` via `build-container.yml`
  and runs `tests/integration.sh` inside it; it runs on pull requests through
  `auto-merge-dependabot-pr.yml`.
- **Dependabot PRs auto-merge** through the shared `auto-merge-dependabot-pr.yml` in
  [rtldev-middleware-shareable-workflows](https://github.com/centralnicgroup-opensource/rtldev-middleware-shareable-workflows)
  once the tests pass — do not inline a copy of it.
- **The CI image is the devcontainer**, built through `devcontainers/ci` so the Features are
  applied — a plain `docker build` of `.devcontainer/Dockerfile` is a bare base image.
- **Devcontainer:** the frame is in `.devcontainer/`; the shared behaviour comes from the
  `devbase` devcontainer Feature (`devbase:2`) and Go from the `go` Feature. Never fork
  devbase's scripts here — repository-specific setup goes in `.devcontainer/post-create.sh`.

## Git Conventions

- **Commit messages:** Conventional Commits with **mandatory scope** —
  `<type>(<scope>): <summary>`. Never append a `Co-Authored-By:` trailer.
- **Branch creation:** before creating a branch, and again after any PR merges,
  run `git checkout master && git pull --ff-only` first — it brings in the
  merged commits and their release tags. Never branch from a stale local
  `master`, from `origin/master` (it becomes the new branch's upstream) or from
  another feature branch.
- **Branch naming:** prefix with the Jira issue ID — `RSRMID-1234-short-description`.
- **Pull requests:** include the Jira issue link in the description; after opening, add the
  PR URL as a comment on the Jira issue.
- **Merging:** rebase-merge (`gh pr merge --rebase`). Squash merges are disabled at the
  repository level.

## Atlassian / JIRA

Work is tracked in **Jira Cloud**, project `RSRMID` — not GitHub Issues. Load the
`jira-conventions` skill before creating, editing or transitioning an issue: it carries the
required fields, this repository's title prefix and component, and the worklog rule for Done and Cancelled.

Two of its rules apply whether or not the skill is loaded:

- Write every Jira issue key as a link to the issue, never bare:
  `[RSRMID-1234](https://centralnic.atlassian.net/browse/RSRMID-1234)`.
  Branch names and commit messages keep the bare key.
- Once an issue's last pull request has merged and its worklog is in, close it
  without asking if nothing is left — the skill lists what counts.

## Do NOT

- Add dependencies without explicit request
- Add `Co-Authored-By:` trailers to commit messages
- Fork the `devbase` devcontainer Feature's scripts into this repository
- Put `apilogin` / `apipassword` into `creds.json` — it is committed; credentials come from
  the environment
- Commit `.env` or display its contents — it is git-ignored for local environment variables
- Commit a built `dnscontrol` binary — it is git-ignored
