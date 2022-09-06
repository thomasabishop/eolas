---
categories:
  - Programming Languages
tags:
  - javascript
  - react
  - react-classes
  - react-hooks
---

# Comparing class components to hook-based components

We will look at the same component written with hooks and classes. Both use this child component:

```jsx
const CounterBox = (props) => {
  return <div className="output">{props.counterValue}</div>;
};
```

## Class component

```jsx
import CounterBox from './CounterBox';

class CounterClass extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      counterValue: 0,
    };
  }

  addOne() {
    this.setState({
      counterValue: this.state.counterValue + 1,
    });
  }

  render() {
    return (
      <React.Fragment>
        <button onClick={() => this.addOne()}>Add One</button>
        <CounterBox counterValue={this.state.counterValue} />
      </React.Fragment>
    );
  }
}
```

## Hook version

```jsx
import React, {useState} from 'react';
import CounterBox from './CounterBox';

function CounterHook() {
  const [counter, setCounter] = useState(0);
  const handleClick = () => setCounter(counter + 1);
  return (
    <React.Fragment>
      <button onClick={handleClick}>Add One</button>
      <CounterBox counterValue={counter}></CounterBox>
    </React.Fragment>
  );
}
```

## Main differences

- Obviously with hooks we use a function, not a class. We can therefore think of them as **simple components** that are able to handle state as well as props.
- We have written the hook as a declared function but we could just as easily write it as a function expression or arrow function.
- With the class, the state versioning is managed via the following properties on the `React.Component` class: `this.state` (start state) and `this.setState` (the change).
- In both cases the function that actually creates the change is handled via an arrow function. With the hook we use the customary name `handleClick` .

- The same process is managed in the hook via the `useState()` method. We effectively set 'before' and 'after' destructured variables on this method:

  ```jsx
  const [counter, setCounter] = useState(0);

  // Schematically:
  const [val, setVal] = useState(initialVal);
  ```

## Binding with class component state

In the class component example we use an inline arrow function to execute `addOne()` however the official way to do it is to bind the event via the constructor method to avoid the problems created by `this` scope in classes. Using arrows is mostly fine and is less verbose, but it is important to understand the 'official' approach.

The way to write the state change in this way is:

```jsx
class CounterClass extends React.Component{
  constructor(props){
    super(props);
		this.state = { counterValue: 0};
    this.handleClick = this.handleClick.bind(this); // bind the click to the class scope
  }

  handleClick(event){
    this.setState({
            counterValue: this.state.counterValue + 1;
    });
  }

  render(){
    return (
      <button type="button"
      onClick={this.handleClick}> // reference the class scope with `this`
      Click Me
      </button>
			<CounterBox counterValue={this.state.counterValue}></CounterBox>
    );
  }
}
```

## How hooks improve on class components

- State, when managed via hooks can be easily decoupled from a specific component and reused elsewhere. This also means it can be tested separately from any specific component where it is applied. This is much harder to do with classes which are closely entangled with the non-state aspects of a component through `this` and binding:

  > With Hooks, you can extract stateful logic from a component so it can be tested independently and reused. Hooks allow you to reuse stateful logic without changing your component hierarchy. This makes it easy to share Hooks among many components or with the community.

- Hooks simplify lifestyle methods and the use of `componentDidMount` etc through the `useEffect` hook
- Classes and `this` are confusing generally. Functions are easier to grasp and read.

## Relation to function components

You can think of hooks as function components (previously known as stateless components) plus state. Previously function components were 'dumb' components. That is, they didn't allow for state management and generally used for layout. They could receive data as props but not state. This changes with hooks: you can add state to functions and no longer need to use classes exclusively for state. In fact you no longer need to use classes at all, unless you want to.

> The stateful portion of a function component must be placed before the `return()` statement in the function.
