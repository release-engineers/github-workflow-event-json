# github-workflow-event-json

This repository contains JSON files for the many different event payloads a GitHub workflow can expect, along with other JSONs representing the different context variables. The workflow at [.github/workflows/sink.yml](.github/workflows/sink.yml) records practically anything that happens and commits context variables back into this repository as JSON. The only thing omitted from the JSON files in this repository is the `GITHUB_TOKEN` secret, which will have a value of `***`, every other field is how the workflow received it.

## Context Variables

The context variables are entirely dynamic, all below context variables were captured with the workflow [.github/workflows/sink.yml](.github/workflows/sink.yml).

### `github`

As this context variable contains the event payload, it will be different based on what event a workflow triggered on. This is one of many `event_${event}_subtype_${type}.json` files, or when no type exists, `event_${type}.json`. For example the `github` context variable for event `pull_request_target` of type `closed` can be found in [event_pull_request_target_subtype_closed.json](./event_pull_request_target_subtype_closed.json)

### `inputs`

```json
{
  "sample_input_1": "123",
  "sample_input_2": "456"
}

```

### `jobs`

```json
{
  "status": "success"
}

```

### `matrix`

```json
{
  "sample_matrix_var_1": 1,
  "sample_matrix_var_2": "foo"
}

```


### `needs`

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

### `runner`

```json
{
  "os": "Linux",
  "arch": "X64",
  "name": "Hosted Agent",
  "tool_cache": "/opt/hostedtoolcache",
  "temp": "/home/runner/work/_temp",
  "workspace": "/home/runner/work/github-workflow-event-json"
}

```

### `secrets`

```json
{
  "github_token": "***",
  "SAMPLE_SECRET": "This is an example value"
}

```

### `steps`

```json
{}

```

### `strategy`

```json
{
  "fail-fast": true,
  "job-index": 0,
  "job-total": 1,
  "max-parallel": 1
}

```
