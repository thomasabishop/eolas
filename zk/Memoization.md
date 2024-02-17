---
tags:
  - javascript
  - react
  - react-hooks
---

# Memoization with useCallback and useMemo

## Rationale

In the lifecycle of a component, React re-renders the component when an update
is made. When React checks for any changes in a component, it may detect an
unintended or unexpected change due to how JavaScript handles equality and
shallow comparisons. This change in the React application will cause it to
re-render unnecessarily.

Additionally, if that re-rendering is an expensive operation, like a long for
loop, it can hurt performance. Expensive operations can be costly in either
time, memory, or processing. In addition to potential technical issues, this may
lead to poor user experience.

If one part re-renders, it re-renders the entire component tree. `useCallback`
and `useMemo` can be used reduce this performance impact.

## useCallback

The `useCallback` hook is used to wrap functions. It tells React to not
re-create a wrapped function when a component re-renders, unless any of the
useCallback's dependencies change.

`useCallback` returns a memoized version of the callback function it is passed.
This means that the function object returned from useCallback will be the same
between re-renders.

Remember that in JavaScript, functions are objects and components are functions.
As a result, every time a component containing a function re-renders, it create
a new instance of the function in memory.

> Given the same dependency value, the `useCallback` hook returns the same
> function instance between renderings (aka memoization).

This said, for small functions that are not intensive, it doesn't really matter
if they are not memoized.

### Syntax

A standard case of this would be a function that runs on a button click, for
instance when sending data from a form to a server. In the example below there
is quite a lot going on, and most of it is independent of the actual UI-cycle of
the component.

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
  [blockId, project_id]
);
```

Note that the syntax is similar to [useEffect](useEffect.md): there is a
dependency array. The effect is the same: the function contained within
`useCallback` will only re-rendered if one of these dependencies changes.
However (see next section) the function will run in its memoized form on every
click.

### Reference versus result

`useCallback` only memoizes the function _object_ (the reference) not the value
that is _returned_ by the function (the result).

In the example below, the `calculatePi()` function reference will not change
between renders but each time the click event fires, the value returned by
`calculatePi()` will change. In other words, it will be assigned fresh memory.

```jsx
function ParentComponent() {
  const onHandleClick = useCallback(() => {
    const special = calculatePi();
  });

  return <SubComponent handleClick={onHandleClick} />;
}
```

### Use cases

You should not apply `useCallback` in a blanket fashion, this can reduce
performance rather than improve it. The best scenarios are:

1. A functional component wrapped inside React.memo() accepts a function object
   prop

2. When the function object is a dependency to other hooks, e.g.
   `useEffect(..., [callback])`

3. When the function has some internal state, e.g. when the function is
   debounced or throttled.

## useMemo

We can think of `useMemo` as a complement to `useCallback`. The main difference
is that whilst `useCallback` memoizes the function reference, `useMemo` memoizes
the function result; the value that is returned.

> In memoization, the result is “remembered” when the same parameters are
> passed-in subsequently. If we have a function compute 1 + 1, it will return 2.
> But if it uses memoization, the next time we run 1’s through the function, it
> won’t add them up; it will just remember the answer is 2 without executing the
> adding function.

Like `useCallback`, `useMemo` takes a function and an array of dependencies for
the same reason: if one of the dependencies changes then the function will
recalculate (and re-memoize) the result but they don't the same memoized value
will be returned.

As with `useCallback`, `useMemo` is best applied to complex functions that are
computationally expensive, it shouldn't be used indiscriminately.

It should not be used with asynchronous functions, in these instances,
`useEffect` would be a better choice.

### Syntax

```jsx
const List = React.useMemo(
  () =>
    listOfItems.map((item) => ({
      ...item,
      itemProp1: expensiveFunction(props.first),
      itemProp2: anotherPriceyFunction(props.second),
    })),
  [listOfItems]
);
```
