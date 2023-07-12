# release-engineers/github-workflow-event-json

[![Status: Production ready](https://img.shields.io/badge/status-production_ready-green)](https://release-engineers.com/open-source-badges/)

This repository contains JSON files for the many different event payloads and context variables available to a GitHub workflow.
Any activity on this repository is recorded by [.github/workflows/sink.yml](.github/workflows/sink.yml), which commits back all context variables into this repository, as JSON.

## `github`

This GitHub Actions context variable contains the event payload, it will be different based on what kind of event triggered a workflow.
You can find it for a specific event in `${event}__${action}.json` or when the event has no action types, just `${event}.json`.

For example;

- Event `pull_request_target` with type `closed` can be found as [pull_request_target__closed.json](./pull_request_target__closed.json)
- Event `push` can be found as [push.json](./push.json)

## `inputs`

```json
{
  "sample_input_1": "123",
  "sample_input_2": "456"
}

```

<details>
  <summary>Reusable workflow variant</summary>

  In this repository the `workflow_call` section of sink.yml defines inputs with a different name, this is reflected in `inputs`;
  ```json
  {
  "sample_input_call_1": "789",
  "sample_input_call_2": "456"
}

  ```
</details>

## `vars`

```json
{
  "SAMPLE_REPO_VARIABLE": "123"
}

```

<details>
  <summary>Reusable workflow variant</summary>

  ```json
  {
  "SAMPLE_REPO_VARIABLE": "123"
}

  ```
</details>

## `jobs`

```json
{
  "status": "success"
}

```

<details>
  <summary>Reusable workflow variant</summary>

  ```json
  {
  "status": "success"
}

  ```
</details>

## `matrix`

```json
{
  "sample_matrix_var_1": 1,
  "sample_matrix_var_2": "foo"
}

```

<details>
  <summary>Reusable workflow variant</summary>

  ```json
  {
  "sample_matrix_var_1": 1,
  "sample_matrix_var_2": "foo"
}

  ```
</details>

## `needs`

```json
{
  "sample_needs": {
    "result": "success",
    "outputs": {
      "sample_output_1": "123",
      "sample_output_2": "456",
      "sample_output_3": "789",
      "sample_output_4": "0"
    }
  }
}

```

<details>
  <summary>Reusable workflow variant</summary>

  ```json
  {
  "sample_needs": {
    "result": "success",
    "outputs": {
      "sample_output_1": "123",
      "sample_output_2": "456",
      "sample_output_3": "789",
      "sample_output_4": "0"
    }
  }
}

  ```
</details>

## `runner`

```json
{
  "os": "Linux",
  "arch": "X64",
  "name": "GitHub Actions 2",
  "environment": "github-hosted",
  "tool_cache": "/opt/hostedtoolcache",
  "temp": "/home/runner/work/_temp",
  "workspace": "/home/runner/work/github-workflow-event-json"
}

```

<details>
  <summary>Reusable workflow variant</summary>

  ```json
  {
  "os": "Linux",
  "arch": "X64",
  "name": "GitHub Actions 3",
  "environment": "github-hosted",
  "tool_cache": "/opt/hostedtoolcache",
  "temp": "/home/runner/work/_temp",
  "workspace": "/home/runner/work/github-workflow-event-json"
}

  ```
</details>

## `secrets`

```json
{
  "SAMPLE_SECRET": "This is an example value",
  "github_token": "***"
}

```

<details>
  <summary>Reusable workflow variant</summary>

  Reusable workflows by default don't have access to secrets of the calling workflow.
  ```json
  {
  "github_token": "***"
}

  ```
</details>

## `steps`

```json
{}

```

<details>
  <summary>Reusable workflow variant</summary>

  ```json
  {}

  ```
</details>

## `strategy`

```json
{
  "fail-fast": true,
  "job-index": 0,
  "job-total": 1,
  "max-parallel": 1
}

```

<details>
  <summary>Reusable workflow variant</summary>

  ```json
  {
  "fail-fast": true,
  "job-index": 0,
  "job-total": 1,
  "max-parallel": 1
}

  ```
</details>
