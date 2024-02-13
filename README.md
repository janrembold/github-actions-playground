# Github Actions Playground

This is a playground for some basic GitHub Actions that help to simplify merging strategies in larger teams.
We have the following protected branches:

- dev (default)
- stage
- main

All other feature or fix branches should be created from `dev` branch.

## Create MRs for protected branches

Create a new MR to the next level if any code was merged into [](./.github/workflows/merge-requests.yml)
