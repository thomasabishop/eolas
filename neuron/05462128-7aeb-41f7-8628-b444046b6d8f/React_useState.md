---
tags:
  - javascript
  - react
---

# `useState`

`useState` is the primary way in which React updates the application state based
on user interaction.

- `useState` **receives**: the initial state as an argument
- `useState` **returns**: the current state and a function that updates it

The two items that are returned are returned as an array. We could refer to them
with array syntax (i.e with `[0]` and `[1]` ) but it is more concise to use the
destructuring syntax. But all that's happening is that a method belonging to the
`React` library (i.e. `useState` ) is taking an argument (the initial state) and
returning two values as an array of two elements. The first of these values is a
variable, the second is a function.

```jsx
(1) const [count, setCount] = useState(0);
(2) const handleClick = () => { setCount(count + 1) };

(3) <span>{count}</span>
(4) <button onClick={handleClick)>Add one</button>
```

- At line 1 we initialise the `useState` hook.
  - We use destructuring syntax to declare two variables
  - The first variable stores our initial state. The value of the initial state
    is an argument passed to `useState` , i.e. `0`. Do not confuse the variable
    with the value it refers to.
  - The second variable is a method that mutates the state referred to by the
    first variable into some new value, i.e. from `0` to a different integer
- At line 3, which in reality, will be within your JSX and part of the
  `render()` block of the function, we render the initial state in the React
  DOM. This will change and be re-rendered in accordance with the state logic
- At line 4 we have a user interface that executes the function on line 2. This
  function applies the state change represented by the second variable in the
  destructuring assignment at line 1 (`setCount` ): it mutates the initial state
  (`0`) by the value of `1'.

> You can utilise as many `useState` declarations as your component requires.

## Passing variables as initial state

We don't always have to declare the data types within the destructuring
assignment. We can store them in variables and pass the variables to the
destructuring assignment on `useState` . Below we do this for a function that
mutates a string value:

```jsx
const hi = "hello";
const bye = "goodbye";

const [initText, changeText] = useState(hi);

<p>{initText}</p>
<button onClick={()=>changeText(bye)}>ChangeText</button>
```

## Lazily setting initial state

Although you will typically use a literal value or variable as your initial
state, React provides a way for you to set this value through a function. This
will only run once at the first render so as not to interfere with the second
update parameter of `useState`. This is called **lazy initialisation**

```jsx
const getInitialState = () => Number(window.localStorage.getItem("count"));
const [count, setCount] = React.useState(getInitialState);
```

## Accessing previous state

It is also possible to access the previous state via the `useState` hook. We can
access this as a callback on the updater function.

Let's say we have a simple counter set up like so:

```js
const [count, setCount] = useState(0);
```

We can access the prior value of `count` with:

```js
const getPrevValue = () => setCount((prev) => console.log(prev));
```

### Naming best practise

When destructuring the two variables from `useState`, React follows uses the
following semantics: `[something, setSomething]` . This isn't required but it
helps to keep everything clear, particularly the fact that the first thing
destructured is a variable and the second is a function.

> https://stackoverflow.com/questions/54807454/what-is-prevstate-in-reactjs
