---
tags:
  - javascript
  - react
---

# Components and props with hooks

As of React 16.8 a class component can be expressed using a function-based hook.

A class component:

```jsx
class Welcome extends React.Component {
  render() {
    return <h1>Hello, {this.props.name}</h1>;
  }
}
```

The same component expressed as a hook:

```jsx
function Welcome(props) {
  return <h1>Hello, {props.name}</h1>;
}
```

To output this component we use the same standard JSX syntax and pass the prop
as an attribute of the JSX element:

```jsx
<Welcome name="Thomas" />
```

## How hooks are rendered

1. We call `ReactDOM.render()` with the `<Welcome name="Thomas" />` element.
   (This would typically be nested within a root `App` component; it wouldn't be
   directly passed to the parent render function.)
2. React calls the `Welcome` component with `{name: 'Thomas'}` as the props.
3. Our `Welcome` component returns a `<h1>Hello, Thomas</h1>` element as the
   result.
4. React DOM efficiently updates the DOM to match `<h1>Hello, Thomas</h1>`.

## Function components must be pure functions

> All React components must act like pure functions with respect to their props

This means that functions should not attempt to change the inputs they receive
as parameters. They must always return the same result for the same inputs:

```jsx
function sum(a, b) {
  return a + b;
}
```

```jsx
function withdraw(account, amount) {
  account.total -= amount;
}
```

The reason for this is that **props are read-only** and we pass props to
function components.

We change components by using state, not by mutating props. This is consistent
with React's
[principle of the immutability of elements](Elements-992594b9cd2e483c85cddddffeb16f11).
