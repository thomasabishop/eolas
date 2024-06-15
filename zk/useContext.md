---
tags:
  - javascript
  - react
  - react-hooks
---

# `useContext`

We use React's Context API to enable us to easily share stateful data between
all levels of an application without having to use repetitious 'prop-drilling'
at a component level.

This works best with data that is global by definition, such as theme parameters
or access authorisation. Context should not be used when standard and proximate
compositional methods and prop-passing are sufficient.

## Providers and consumers

The Context API preceded the introduction of hooks in React 16.8 and it still
underpins context management in hooks, although the syntax is simplified.

The process is as follows:

- Initiate a context
- Create a parent `Provider` component that owns the data that will be passed
  down
- Create child `Consumer` components that receive the data of the parent.

We will demonstrate using a set of styles as the context that we want to pass
around our app.

```jsx
const style = {
  border: "2px solid dodgerblue",
  background: "lightblue",
  color: "dodgerblue",
};
```

Le's initiate a context:

```jsx
const StyleContext = React.createContext();
```

Now that we have our data and have initialized a context, we can apply it to our
app components:

```jsx
<StyleContext.Provider value={style}>...</StyleContext.Provider>
```

This is the parent element of the context environment. This stores the
contextual data as a prop. Next we need to make a component that acts as the
consumer of this data. Let's create this component and call it `Child` for
simplicity:

```jsx
const Child = () => {
  return (
    <StyleContext.Consumer>
      {(value) => (
        <div style={value}>
          <p>
            I'm a <b>child</b>. I <b>consume</b> of the data my parent provides.
          </p>
        </div>
      )}
    </StyleContext.Consumer>
  );
};
```

The contents of this component are wrapped in tags that reference the specific
context (`StyleContext`) and the role that the component plays: `Consumer`.

We are taking the `value` prop owned by `StyleContext.Provider` and passing it
to the wrapping component of `Child` as a `style` tag. This means that `Child`
will display these styles.

The final step is just to insert our `<Child />` components beneath the parent
component, e.g.:

```jsx
<StyleContext.Provider value={style}>
  <Child />
  <Child />
</StyleContext.Provider>
```

## `useContext` hook

The hook removes the need to explicitly declare `Provider` and `Consumer`
components; their role becomes more implicit.

To demonstrate let's use a different example. We are going to have a single
integer as the data context, `42`.

First invoke and intialize the Context API, just as before:

```jsx
const NumberContext = React.createContext(42);
```

Next, we just need to create our provider component. We don't have to worry
about a consumer since this is handled implicitly by the invocation of the hook

```jsx
const Context = () => {
  const data = useContext(NumberContext);
  return <Typography>{data}</Typography>;
};
```

Then, in our code we just insert the `Context` component:

```jsx
<Context>...</Context>
```

## Updating context state

In the examples above we have only been consuming state that is owned by the
provider however in most scenarios you will also want to update the state from a
consumer. This is best achieved by combining `useContext` with a reducer and is
detailed in [Application state management](Application_state_management_with_React_hooks.md).
