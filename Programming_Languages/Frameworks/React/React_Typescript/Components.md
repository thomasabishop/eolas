---
tags:
  - Programming_Languages
  - typescript
  - react
---

# Components

We write functional components in the manner of a normal [function](/Programming_Languages/React/React_Typescript/Functions.md) that take a props argument and return a JSX element.

```jsx
interface IProps = {
  message: string;
};
const App = ({message}: IProps): JSX.Element => <div>{message}</div>;
```

## `React.FunctionComponent` / `React.FC`

It used to be the case that you would type a function component like so:

```jsx
const App: React.FunctionComponent<{message: string}> = ({message}) => <div>{message}</div>;
```

This is now discouraged as it means the component can always accept children, even when you do not want this to be the case. There are several other minor drawerbacks but it's generally best to leave out the declaration.
