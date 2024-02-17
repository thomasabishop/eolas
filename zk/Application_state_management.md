---
tags:
  - javascript
  - react
  - react-hooks
---

# Application state management

Although [useReducer](useReducer.md) and [useContext](useContext.md) have
many sound use cases by themselves, when they are combined they offer a way to
acheive a system of global state management, without utilising third-party
libraries like Redux.

## Requirements

The Context API combined with a reducer addresses the following needs:

- be able to consume global state from anywhere in the component hierarchy
  without prop-drilling
- update global state from within child components from anywhere in the
  component hierarchy
- access, maintain and update complex structured data (arrays/objects) not just
  single values, as global state

## Implementation

In essence the approach is as follows:

- Create a context provider that houses the global state object
- Attach this state to a reducer function that operates on the state object
  through dispatch methods

First off, our initial state and overall state object:

```js
const initialState = {
  count: 0,
};
```

Next, we create our context. This is what we will invoke when we want to consume
our state.

```js
export const CounterContext = React.createContext({});
```

Now we need a reducer that will handle the state updates. We will just use the
same setup as we used in the example of
[useReducer](useReducer.md#refining-the-syntax):

```js
function reducer(state, action) {
  switch (action.type) {
    case "increase":
      return { ...state, counter: state.counter + 1 };
      break;
    case "decrease":
      return { ...state, counter: state.counter - 1 };
      break;
    case "increase_by_payload":
      return { ...state, counter: state.counter + action.payload };
    default:
      throw new Error();
  }
  return newState;
}
```

Finally, we need to make a provider as a top-level component that receives the
reducer's `state` and `dispatch` methods as props:

```js
export const CounterProvider = ({children}) => {
    // We pass our reducer function and initial state to useReducer as params
    const [state, dispatch] = React.useReducer(reducer, initialState)

    // We create our provider and pass the reducer state and update method as props. This is the provider to the CounterContext consumer
    <CounterContext.Provider value={{state, dispatch}}>
        {children}
    </CounterContext.Provider>
}
```

Now whenever we want to consume or update our global state, we can invoke the
context within a lower-level component, for example:

```js
const {state, dispatch} = useContext(CounterContext);

dispatch({
    type 'increase_by_payload',
    payload: 4
})

console.log(state.counter) // 4

```
