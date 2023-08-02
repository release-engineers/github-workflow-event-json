# release-engineers/github-workflow-event-json

[![Status: Production ready](https://img.shields.io/badge/status-production_ready-green)](https://release-engineers.com/open-source-badges/)

This repository contains captures of the many different event payloads and context variables available to a GitHub workflow.

## May I see them?

You can find them in the specific event folders in the [on](./on) directory.
For example, all information captured for the event of a pull request being merged can be found in "[on/pull_request/closed](./on/pull_request/closed)".

Note that we don't have _all_ events but we certainly have most of them.

## How does it work?

We have set up [a repository](https://github.com/re-organization-sandbox/sandbox-repo/) in a separate GitHub organization that captures the JSON representation
of most GitHub Actions variables, along with some extra data. Whenever an event occurs, it uploads this data as a GitHub Actions artifact.

Every sunday, this repository then downloads any artifacts generated. We may have missed some more exotic events, but this repository certainly contains most of them.

## I'm getting different results!

The content of all context variables is dependent on many factors, here's how we capture it:

- We captured events from the past; GitHub infrastructure, runners and even event structure may have changed since then.
- We captured events that did or didn't happen during a GitHub outage. (This is known as "degraded performance" on GitHub's status page).
- We use the `bash` shell on an `ubuntu-latest` runner.
- We don't make use of the container, reusable workflows, or composite actions feature of GitHub Actions.

These all may lead to different results than you're seeing in your own workflows.
