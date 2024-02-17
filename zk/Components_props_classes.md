---
tags:
  - javascript
  - react
  - react-classes
---

# Components and props with class-based components

A **component** is a class or a function that manages the content that is output
on the page (the rendering of **elements**) and the data (**props**) and state
that is applied to the elements that are output.

**Components can be created using ES6 classes or using the newer hook
methodology.**

A class-based component is a mixture of standard Javascript, JSX Javascript and
HTML wrapped within an extension of the `React.Component` **class** that you
import into your custom JS when installing the React library:

```js
class Welcome extends React.Component {
  render() {
    return <h1>Hello, {this.props.name}</h1>;
  }
}
```

The JSX content of the component lives within the `render()` method that belongs
to the `React.Component` class.

Once we have defined a class component that contains a JSX element we can then
use JSX tags to place the resulting React element in our page. This is a
placeholder for the HTML that is rendered by the class component. For example:

```html
<body>
  <Welcome name="Thomas" />
</body>
```

> A class component must include `render()`, and the return can only return one
> parent element. Also there _must be_ a parent component. Where this isn't
> possible, the convention is to use empty opening and closing tags, viz:
> `<>...</>` . These are called **React Fragments** and this is actually a short
> hand for `<React.Fragment>...</React.Fragment>`

## Class components with state

Most class components will also possess state. State is managed through the
constructor method on the class component, for example:

```jsx
class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = { date: new Date() };
  }
  render() {
    return (
      <div>
        <h1>Hello, world!</h1>
        <h2>It is {this.state.date.toLocaleTimeString()}.</h2>
      </div>
    );
  }
}
```

We use the `super()` method to inherit the parent constructor (because custom
components extend the React Component parent class) and we pass state as a
special kind of prop.

## Class components and simple components

Within the class-based paradigm of React a distinction is made between simple
and class components.

A class component is obviously a component that is created as a class and thus
which can inherit fields and methods via `super` from the `React.Component`
class. This is necessary for handling props and configuring state.

A simple component, in contrast, is a function, not a class. These are used for
what we can call static or 'dumb' components, i.e they just output content and
data, they don't have reactive state. This is why they are also sometimes called
**functional stateless components**.

Simple components can however take props. In fact props are just like arguments
that you pass to a function. When you write a simple component, your parameters
are props.

Here's an example of a simple component that doesn't take any props

```jsx
function PageHeader() {
  return (
    <header>
      <h1>Site Title</h1>
    </header>
  );
}
```

We can safely use arrow functions with simple components. So the same component
could be written:

```jsx
const PageHeader = () => {
  return (
    <header>
      <h1>Site Title</h1>
    </header>
  );
};
```

Now adding a prop:

```jsx
const PageHeader = (props) => {
  return (
    <header>
      <h1>{props.sitename}</h1>
    </header>
  );
};
```

Then, in JSX we would apply the component with:

```jsx
<PageHeader sitename="The name of the site" />
```

> When we are using simple (functional) components we don't need to use
> `this.props` . `this` is only required with classes. As a simple component is
> a function we just say `props` .

It's worth noting in passing that you don't **have** to use functions for simple
components. You can achieve the same outcome with a class and it won't generate
an error. But it requires more code and complexity than is actually needed for
the job:

```jsx
class PageHeader extends React.Component {
  render() {
    return (
      <header>
        <h1> {this.props.siteName} </h1>
      </header>
    );
  }
}

export default PageHeader;
```
