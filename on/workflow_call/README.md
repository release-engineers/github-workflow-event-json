## Context Variables

Although "on.workflow_call" exists, it does not have it's own event structure. "workflow_call" is a mechanism to defer execution to a reusable workflow.
Context objects (except for inputs and secrets) will be those of the calling workflow and reflect the calling workflow's event.
Go up one directory and navigate to the event of the calling workflow.
