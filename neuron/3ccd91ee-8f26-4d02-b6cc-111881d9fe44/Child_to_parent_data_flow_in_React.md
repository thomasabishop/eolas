---
tags:
  - javascript
  - react
---

# Child to parent data flow

Despite React having a uni-directional, downwards data-flow, it is sometimes
necessary to pass events and data from a child back up to the parent. This need
can arise when you want to modularize functionality within a child component
rather than have everything happening in the parent, and you don't want to use a
common shared higher context.

For the example we will use the standard click incrementer.

We have a counter on the parent that is updated in response to a click event in
the child component.

Our parent component is `App` and the child component is `Child`

```jsx
export default function App() {
  const [count, setCount] = useState(0);
  return (
    <>
      <p>{count}</p>
      <Child count={count} setCount={setCount} />
    </>
  );
}

const Child = ({ count, setCount }) => {
  return <button onClick={() => setCount(count + 1)}>Increment</button>;
};
```

So the overall state and updater function exists on the parent. The child is
able to access this state by virtue of receiving `{count, setCount}` as props.
It can therefore manipulate this state and have it be reflected in the parent.

It is not necessary to pass the state variable every time. You could just pass
the updater. We have passed the `count` variable here because the child needs
access to the current value, in order to be able to increment it.
