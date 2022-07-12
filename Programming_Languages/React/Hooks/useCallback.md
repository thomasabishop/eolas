---
tags:
  - Programming_Languages
  - javascript
  - react
  - react-hooks
---

# `useCallback`

In short, React's useCallback hook is used to wrap functions. It tells React to not re-create a wrapped function when a component re-renders, unless any of the useCallback's dependencies change.

`useCallback` returns a memoized version of the callback function it is passed. This means that the function object returned from useCallback will be the same between re-renders.

Remember that in JavaScript, functions are objects. As a result, every time a component containing a function re-renders, it creates a new instance of the function in memory. If a function doesn't change in response to a UI event throughout the lifecycle of the component, there is no need for it to rerender, hence `useCallback` should be applied.

> Given the same dependency value, the `useCallback` hook returns the same function instance between renderings (aka memoization).

This said, for small functions that are not intensive, it doesn't really matter if they are not memoized.

## Syntax

A standard case of this would be a function that runs on a button click, for instance when sending data from a form to a server. In the example below there is quite a lot going on, and most of it is independent of the actual UI-cycle of the component.

```jsx
const handleSubmit = useCallback(
  async (formValues) => {
    setPendSaveConfig(true);
    const payload = new GenerateConfig({
      workflowId: project_id,
      blockId: blockId,
      config: formValues,
    });
    axios
      .post(`${process.env.REACT_APP_ENDPOINT}/save-block-config`, payload)
      .then((res) => console.log(res))
      .finally(() => setPendSaveConfig(false))
      .catch((err) => console.error(err));
  },
  [blockId, project_id],
);
```

Note that the syntax is similar to [useEffect](./useEffect.md): there is a dependency array. The effect is the same: the function contained within `useCallback` will only re-rendered if one of these dependencies changes. However (see next section) the function will run in its memoized form on every click.

## Reference versus result

`useCallback` only memoizes the function _object_ (the reference) not the value that is _returned_ by the function (the result).

In the example below, the `calculatePi()` function reference will not change between renders but each time the click event fires, the value returned by `calculatePi()` will change. In other words, it will be assigned fresh memory.

```jsx
function ParentComponent() {
  const onHandleClick = useCallback(() => {
    const special = calculatePi();
  });

  return <SubComponent handleClick={onHandleClick} />;
}
```

## Use cases

You should not apply `useCallback` in a blanket fashion, this can reduce performance rather than improve it. The best scenarios are:

1. A functional component wrapped inside React.memo() accepts a function object prop

2. When the function object is a dependency to other hooks, e.g. `useEffect(..., [callback])`

3. When the function has some internal state, e.g. when the function is debounced or throttled.
