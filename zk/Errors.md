---
categories:
  - Programming Languages
tags:
  - javascript
  - react
  - react-hooks
---

# Errors

## State update on unmounted component

> Can't perform a React state update on an unmounted component. This is a no-op,
> but it indicates a memory leak in your application. To fix, cancel all
> subscriptions and asynchronous tasks in a useEffect cleanup function.

This typically happens when you have an API request running in the background.
Once the data is returned, React tries to update the state but the component is
unmounted.

As the warning suggests, this can be resolved using the cleanup parameter within
[useEffect](../../Programming_Languages/React/Hooks/useEffect.md#cleanup-functions).
