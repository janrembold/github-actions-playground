# Github Actions Playground

This is a playground for some basic GitHub Actions that help to simplify merging strategies in larger teams.
We have the following protected branches:

- develop (default)
- staging
- release

All feature or fix branches should be created from `develop` branch.

## Create Stage MR

Create a new MR from develop to staging if any code was merged into dev

## Create Main Auto-Merge MR

Create a new MR from staging to release and auto-merge if possible

## Release Workflow

A release workflow using wokflow_dispatch that has the following options:

- Selectbox with environment to deploy (develop, staging, release)
- Selectbox with services to deploy (All, service1, service2, ...)
- Dry run option

The workflow has following jobs:

- Collects docker image tags from all microservices and saves them in Github Env for this job
- If NOT dry mode, execute the creation of the k8s config files and run deployment
