---
tags:
  - typescript
  - react
---

# Typing built-in hooks

## `useState`

```tsx
const [amount, setAmount] = useState<number | string>(3);
```

### With a ustom type

```tsx
interface IState {
  people: IPerson[];
}

interface IPerson {
  name: string;
  age: number;
}

const [people, setPeople] = useState<IState>({});

// Alternative declaration

interface IState {
  people: {
    name: string;
    age: number;
  }[];
}

const [people, setPeople] = useState<IState["people"]>({});
```

## `useReducer`

Mostly the same. They key thing to type is the reducer function itself. You
don't need to type the intitial state unless it is a pre-existing type, you can
just use type assertion:

```jsx
interface IAction {
  | { type: "increment"; payload: number }
  | { type: "decrement"; payload: string };
}

const initialState = { count: 0 };

function reducer(state: typeof initialState, action: IAction) {
  switch (action.type) {
    case "increment":
      return { count: state.count + action.payload };
    case "decrement":
      return { count: state.count - Number(action.payload) };
    default:
      throw new Error();
  }
}
```

Then the syntax is as normal, i.e:

```js
const [state, dispatch] = useReducer(reducer, initialState);
```

## `useEffect`

> Limited potential for typing here as this hook does not return a value. See if
> there is useful inferred typing from use and update.

## `useContext`

We can use generics but mostly this is untyped:

```jsx
type Theme = "light" | "dark";
const ThemeContext = createContext < Theme > "dark";

const App = () => (
  <ThemeContext.Provider value="dark">
    <MyComponent />
  </ThemeContext.Provider>
);

const MyComponent = () => {
  const theme = useContext(ThemeContext);
  return <div>The theme is {theme}</div>;
};
```

## `useCallback` / `useMemo`

You must only type the parameters that are passed to the callback, the return
value will be inferred.
