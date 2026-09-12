# agentic-workbench

A metarepo for defining and sharing Claude (or any LLM provider) workflows
across repositories. Individual project repos are linked in as git
submodules so that shared Claude skills — e.g. "add a new REST endpoint",
"definition of done", "QA expectations" — can be defined once here and
applied consistently across all of them.

## Structure

- `apis/` — API service repos
  - [python-rest-api-template](https://github.com/bprieto12/python-rest-api-template)
  - [apollo-federation-playground](https://github.com/bprieto12/apollo-federation-playground)
- `docs/` — documentation repos
  - [software-engineering-blog](https://github.com/bprieto12/software-engineering-blog)
- `infrastructure/` — infra repos (none linked yet)
- `qa-tools/` — QA tooling repos (none linked yet)

Shared Claude skills will live alongside this structure and are not yet
defined.

## Getting started

Clone with submodules in one step:

```sh
git clone --recurse-submodules git@github.com:bprieto12/agentic-workbench.git
```

If you already have the repo cloned, initialize the submodules with:

```sh
make init
```

This clones any missing submodules and checks each one out onto its
`main` (or `master`) branch, rather than leaving it in detached HEAD.

## Keeping repos up to date

```sh
make sync
```

This fast-forwards every submodule to the latest commit on its remote
branch. Run `make init` first if a submodule hasn't been cloned yet.

## Adding a new repo

Add it as a submodule under the appropriate directory, using the SSH URL:

```sh
git submodule add git@github.com:bprieto12/<repo>.git <apis|docs|infrastructure|qa-tools>/<repo>
```

Then commit the change to `.gitmodules` and the new submodule reference.
