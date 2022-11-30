# github-workflow-event-json

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

## `jobs`

```json
{
  "status": "success"
}

```

## `matrix`

```json
{
  "sample_matrix_var_1": 1,
  "sample_matrix_var_2": "foo"
}

```

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

## `runner`

```json
{
  "os": "Linux",
  "arch": "X64",
  "name": "GitHub Actions 3",
  "tool_cache": "/opt/hostedtoolcache",
  "temp": "/home/runner/work/_temp",
  "workspace": "/home/runner/work/github-workflow-event-json"
}

```

## `secrets`

```json
{
  "SAMPLE_SECRET": "This is an example value",
  "github_token": "***"
}

```

## `steps`

```json
{}

```

## `strategy`

```json
{
  "fail-fast": true,
  "job-index": 0,
  "job-total": 1,
  "max-parallel": 1
}

```
