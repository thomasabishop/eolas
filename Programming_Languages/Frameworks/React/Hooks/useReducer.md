---
categories:
  - Programming Languages
tags:
  - javascript
  - react
  - react-hooks
---

# `useReducer`

The `useReducer` hook is best used in scenarios where you are manipulating state in a way that is too complex for the trivial [useState](useState.md) use case. `useState` is best employed when you are updating a single value or toggling a boolean. If you are updating the state of an object or more complex data structure, it is often more efficient to employ `useReducer`.

This makes the code more manageable and also helps with separating state management from rendering.

## Syntax

```jsx
const [state, dispatch] = useReducer(reducer, initialState);
```

- `initialState`
  - The starting state, typically an object
- `reducer`
  - A pure function that accepts two parameters:
    - The current state
    - An action object
  - The reducer function must update the current state (immutably) and return the new state
  - We can think of the reducer as working in the same manner as `state`/`setState` in the `useState` hook. The functional role is the same, it is just that the reducer offers more than one type of update.

### Example reducer

```js
function reducer(state, action) {
  let newState;
  switch (action.type) {
    case 'increase':
      newState = {counter: state.counter + 1};
      break;
    case 'descrease':
      newState = {counter: state.counter - 1};
      break;
    default:
      throw new Error();
  }
  return newState;
}
```

In this example we are updating an object with the following shape:

```js
{
    counter: 0,
}
```

This would be the `initialState` that we pass to the `useReducer` hook along with a reference to `reducer` above.

To update the state we would invoke the `dispatch` function which applies one of the actions defined in the reducer. For example the following dispatch increments the counter by one:

```js
dispatch({type: 'increase'});
```

To view the updated value:

```js
console.log(state.counter);
```

### Refining the syntax

Because React doesn't mutate state, the reducer doesn't directly modify the current state in the `state` variable, it creates a new instance of the state object on each update.

In the reducer example above this is achieved by declaring a variable `newState` that is updated by each `action` type and then returned. There is a more elegant way of doing this using spread syntax:

```js
function reducer(state, action) {
  switch (action.type) {
    case 'increase':
      return {...state, counter: state.counter + 1};
      break;
    case 'decrease':
      return {...state, counter: state.counter - 1};
      break;
    default:
      throw new Error();
  }
}
```

### Including payloads

In the examples so far, we have updated the the state directly via the action type however it is also possible to pass data along with the `action.type` as `action.payload`.

For example:

```js
dispatch(
  {
    type: 'increase_by_payload'
    payload: 3,
  });
```

Then we would update our reducer to handle this case:

```js
function reducer(state, action) {
  switch (action.type) {
    ...
    case 'increase_by_payload':
    return {...state, counter: state.counter + action.payload}
    default:
      throw new Error();
  }
}
```
