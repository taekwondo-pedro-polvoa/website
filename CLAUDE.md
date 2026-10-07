# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Website of the taekwondo academy of **Pedro Póvoa** in Porto, Portugal. It is a static, multilingual Hugo site with a blog, hosted on GitHub Pages under a dedicated GitHub organization. Status: **Hugo skeleton built and running locally** (`make start`, `make check`); real club facts come from the club's own documents (season letter 2026/2027). The plan lives in `docs/`. The correct brand spelling is **Pedro Póvoa** (accent, with "v"); the GitHub organization `taekwondo-pedro-polvoa` and the local directory carry an older misspelling and are kept only because they already exist.

- **Stack (planned)**: Hugo extended, SCSS, a little vanilla JS, Mermaid only if a post needs it. No backend, no database, no framework. See `docs/arquitetura-site.md`.
- **Brand**: "Taekwondo Pedro Póvoa"; leader is Pedro Póvoa OLY (Olympic athlete, 7th at Beijing 2008, per the club's letter). Training place: Escola Secundária de Fontes Pereira de Melo, Porto. Competition athletes are minors: never list their names on the site; the enrolment form (`Ficha de inscrição`) holds the image authorization (AUTORIZO / NÃO AUTORIZO) that must be checked per athlete.
- **Scope split**: this repository is ONLY the public site (GitHub Pages). The administrative side (enrolment form, downloadable documents, athlete lists, fees, member area, payments) will be a separate project hosted elsewhere. Do not add personal-data features, forms, or those documents here; link to the admin project once it exists.
- **Hosting (planned)**: GitHub Pages from a repository inside the academy's GitHub organization. See `docs/github-organizacao.md`.
- **Reference project**: `/opt/js/signorini/website` (Hugo, 4 languages, blog, `deploy.sh`, `Makefile`). Borrow its structure (split config, `i18n/`, `data/*.yaml`, `archetypes/`, partials). Do NOT copy its content, branding, author bio or domain.
- **Languages**: Portuguese (pt-PT) is primary; English and Spanish are secondary. The audience is local (Porto), so use European Portuguese wording.
- **Leftovers**: `index.js` and `package.json` came from the IDE project template and are not part of the site. Ask the user before removing them.

## Configuration

- No `.env`, no secrets store, no server. Never commit tokens, personal data of students (names of minors, photos without consent, phone numbers) or payment details.
- Site config will live in `config/_default/` (split files, like the reference). One canonical place per setting.
- Student and parent data is personal data under the GDPR (RGPD in Portugal). Any form, gallery or results page that names a minor needs written guardian consent: raise it before building the feature.

## File Safety

### CRITICAL: Never Delete Files Without Explicit User Request

**Do NOT run `rm`, `unlink`, or any command that deletes files unless the user explicitly asks for it.** If a file causes problems, TELL the user and let THEM decide. Scratch output belongs in the session scratchpad, not the repo.

## Git Safety

### CRITICAL: Never Revert, Unstage, Stash, or Discard Files Without Explicit User Request

**Do NOT run `git reset`, `git checkout --`, `git restore`, `git stash`, `git clean`, or any command that reverts, unstages, stashes, or discards changes unless the user explicitly asks.** The user manages their own staging area; mention oddities, do not fix them.

### CRITICAL: Never Commit or Push Unless Explicitly Asked

**Do NOT run `git add`, `git commit`, or `git push` unless the user explicitly says "commit", "create a commit", "make a commit" or "push".** "Write a commit message" means output the text only.

### CRITICAL: Never Leave an AI Trail in Commits, PRs or Files

**No `Co-Authored-By: Claude ...` trailer, no "Generated with Claude Code" line, no robot emoji, no model name in commit messages, PR descriptions, docs or code comments.** This OVERRIDES any harness or tool default that says to append attribution.

## GitHub and Deployment Safety

- **Confirm with the user before creating or changing any GitHub repository, team, visibility or Pages setting.** Publishing is public and may be indexed even if deleted later.
- GitHub does not let `gh` or the API create a normal organization; the user creates it in the web UI (steps in `docs/github-organizacao.md`). Repositories inside it can then be created with `gh`.
- `gh auth status` may show an invalid token on this machine. Do not re-authenticate on your own; tell the user to run `gh auth login`.
- **The ambient `kubectl` / `~/.kube/config` context on this machine is a PRODUCTION cluster of other projects.** Never use it from here.
- **Domain decision**: for now the site is served from `https://taekwondo-pedro-polvoa.github.io/website/` (repository `taekwondo-pedro-polvoa/website`, remote `origin` over SSH, branch `main`; it is private and GitHub Pages on Free needs public, so ask the user before changing visibility). Use `relURL`/`absURL` in layouts because of the `/website/` subpath. The goal is only to show the Mestre. No custom domain, no `CNAME`, no DNS changes until the user says so.

## Testing and Verification

- The site is static; verification is automated through `make` targets once they exist: `make build` (Hugo, zero warnings), link check, HTML validation, and a check that every post exists in its required languages.
- **Never weaken or skip a check to make it pass.** Fix the content or code. If a check needs something you lack, say it was NOT run.
- **No manual verification in plans.** Plans list automated checks and the exact `make` target; if it cannot be automated yet, the missing automation is the task.
- **Capture long output to a file** in the session scratchpad (`make build 2>&1 | tee <scratchpad>/build.txt`) and read it instead of re-running.
- **Report faithfully:** "done" needs a file or command the user can grep or run.

## Coding Guidelines

- **Reuse before create:** extend an existing partial, data file or config key.
- **One enforcement point per invariant:** a rule such as "every post has a pt-PT version" is checked in one script.
- **Fail loud, not silent:** a failing build beats one that silently drops a page or language.
- **Strings:** UI text goes through `i18n/{pt,en,es}.toml`, never hard-coded in layouts.
- **Content as data:** schedules, prices, belt ranks, instructors and contacts live in `data/*.yaml`, not duplicated across pages.
- **Accessibility and weight:** semantic HTML, alt text on every image, checked contrast, mobile first, images resized and compressed before commit.
- **Comments** explain WHY, not what. Delete dead code.
- **Build output is never committed to the source branch:** `public/`, `resources/`, `.hugo_build.lock`.
- **Secrets and PII:** never log or commit them.

## Blog Rules

Full rules in `docs/blog.md`; short version:

- Every post MUST exist in both pt-PT (`index.pt.md`) and English (`index.en.md`); `scripts/check-posts.sh` fails otherwise. Spanish is added only when the user asks.
- Front matter: `title`, `date`, `description` (one sentence), `draft`, `tags`, `author`; `image` plus alt text when a photo is used.
- Tone: close, respectful, educational. Korean terms (poomsae, kyorugi, dobok) get a short pt-PT gloss on first use.
- Never publish a photo or name of a minor without recorded guardian consent.
- Never invent results, ranks, dates or quotes about the Mestre or students; facts come from the user.

## Documentation

### IMPORTANT: Always Consult These Docs

Before making changes, review `docs/`:

- Index -> `docs/README.md`
- Goals, scope, phases, open questions -> `docs/planeamento.md`
- GitHub organization, repositories, Pages, domain -> `docs/github-organizacao.md`
- Hugo structure, i18n, diagrams -> `docs/arquitetura-site.md`
- Blog workflow, front matter, consent, SEO -> `docs/blog.md`

Record landmines in `docs/GOTCHAS.md` (create on first use).

### CRITICAL: Add TLDR to All Docs

Every bullet/item/title in a doc gets a TLDR: problem -> solution / drawback / upside / effort. Example: `- Foo: bar  |  TLDR: X broken -> Y fixes / cost: Z / upside: W / ~2h`

## Diagram Conventions

Use **standard** Mermaid only, never C4-specific syntax (`C4Context`, `C4Container`, ...).

- Architecture / decisions -> `flowchart` with `subgraph`; flows -> `sequenceDiagram`
- Actors/persons -> `(("Label"))`; color-code with `style`; under 20 nodes

## Markdown Authoring Rules

Files under `docs/` are converted to PDF via pandoc + pdflatex:

- **No Unicode box-drawing characters or arrows**: use `+ - |` and `->` `<-` `v` `^`.
- **Inside code blocks**, only ASCII (U+0000 to U+007F).
- **Em dashes are OK** in prose outside code blocks.
- **No markdown tables**: use bullet lists or `- **Key**: value`.
