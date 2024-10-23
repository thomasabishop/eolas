---
tags:
  - typescript
  - react
---

# Props

## Types or interfaces?

They are mostly interchangeable but there are some specific differences

### Interfaces

- Classes and other interfaces can extend an interface but not a type

  ```ts
  interface Animal {
    name: string;
  }

  interface Bear extends Animal {
    honey: boolean;
  }
  ```

- You can add properties to an interface without generating a double declaration
  error:

  ```ts
  interface Window {
      }

  interface Window {
    ts: TypeScriptAPI;
  }
  ```

### Types

You can create unions with types but not interfaces.

> The consensus seems to be that interfaces should be used over types unless
> there are ocassions when you do not want a type to be extendable /
> redeclarable. Or when you want to use unions.

## How we type props

The custom is to type props as an interface. This way we can easily type
function prop types.

```tsx
interface IProps {
  people: {
    name: string;
    age: number;
    note?: string;
  }[];
}

const List: React.FC<IProps> = ({people}: IProps) => {
    return()
}

// Note we say that the props into the func component are of type IProps
// And we destructure the people key

```

Then in the parent:

```tsx

const [people, setPeople] = useState<IState['people']>({});

<List props={people}>

```

## Common types for props

### Object with any number of properties

```tsx
interface IProps {
  obj: {};
}
```

### Array of objects

```tsx
interface IProps {
  val1: string;
  val2: boolean;
}
[];
```

### Functions

```tsx

// Function that doesn't receive or return anything
interface IProps {
    onClick: () => void;
}[]

// Function with named parameter
interface IProps {
    onClick: (id: number) => void;
}[]

// Function that takes an event
onChange: (event: React.ChangeEvent<HTMLInputElement>) => void;
```

### Other React components

```js
interface IProps {
  children: React.ReactNode;
}

interface IProps {
  children: JSX.Element;
}
```

`React.ReactNode` covers everything that React can render. This should be
definitely used when the prop is a child component, otherwise `JSX.element` is
ok.

<p style="color: red;">Should I use type or interface? What is consensus?</p>
