# Github Actions Playground

This is a playground for some basic GitHub Actions that help to simplify merging strategies in larger teams.
We have the following protected branches:

- dev (default)
- stage
- main

All feature or fix branches should be created from `dev` branch.

## Create Stage MR

Create a new MR from dev to stage if any code was merged into dev

## Create Main Auto-Merge MR

Create a new MR from stage to main if any code was merged into stage and auto-merge if possible
