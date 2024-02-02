---
categories:
  - Programming Languages
tags:
  - javascript
  - react
  - react-classes
---

# Managing forms with class components

We are going to create a simple form that takes two integers from input fields
and returns their sum. Here is the raw component:

```jsx
class Form extends React.Component {
  render() {
    return (
      <form>
        <input type="number" placeholder="Please enter an integer" required />
        <input type="number" placeholder="Please enter an integer" required />
        <button>Calculate sum</button>
        <output></output>
      </form>
    );
  }
}
```

## Adding handlers

```jsx
class Form extends React.Component {
  handleSubmit = (event) => {
    event.preventDefault();
    // Specific state change on submit
  };
  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <input type="number" placeholder="Please enter an integer" required />
        <input type="number" placeholder="Please enter an integer" required />
        <button>Calculate sum</button>
        <output></output>
      </form>
    );
  }
}
```

- The overall handling of the form is going to execute on the submission of the
  form. So we create an `onSubmit` event within the form body and tie this to a
  handling function (`handleSubmit`) on the class.

- We follow the custom of generic naming of event methods with `handle[event]` ,
  just like we use `handleClick` with `onClick` events
- The `event` object is a React wrapper for the standard DOM event. We operate
  on this object when managing the state of forms using React.
- `preventDefault` is just the React method of the traditional prevent default
  method that we can apply to forms. It stops the page updating when the submit
  button is clicked.

## Capturing input values through state change

In order to retrieve the values that the user enters we need to introduce state
to the form component. This is managed using the `onChange` event. Even though
the overall form action should be managed through `onSubmit` we need to
initialize state on the inputs we intend to use when the form is submitted. This
enshrines the React principle of **lifting state up**. As the `input` elements
are constituents of the overall `form` component, their state should be handled
by this common parent.

### Initializing `input` state with `onChange` events

To begin with let's just look at how we would do this in the abstract with a
single `input` before applying it to the two inputs in our example:

```html
<input
	type="number"
	placeholder="Please enter an integer"
	value="this.state.integerFirst"
	onChange="this.handleChange"
	required
></input>
```

We tie the state parameters in the `input` element to a `handleChange` function
on the parent component but we first need to add the starting state (using
`this.state` on the `Form` components' constructor:

```jsx
class Form extends React.Component {
	constuctor(props) {
		super(props);
		this.state = {
			integerFirst: " "
		};
}
handleChange = (event) => {
	this.setState(
		{
			integerFirst: event.target.value
		}
}
```

Now the `Form` component is kept in the loop. Whenever the user alters the
`input` field, this change will be logged as a state change within React. This
will allow us to retrieve the values that the inputs have when the submit event
fires.

## Handling multiple inputs

It would be inefficient to have a change handler for every input in a form with
many inputs. In this scenario it is better to use destructuring to capture all
the values:

```jsx
class Form extends React.Component {
	constuctor(props) {
		super(props);
		this.state = {
			integerFirst: "",
			integerSecond: ""
		};
}

returnSum = (x,y) => x + y;

handleSubmit = (event) => {
		event.preventDefault()
		this.setState({
			outputSum: this.returnSum(
				Number(this.state.integerFirst), Number(this.state.integerSecond)
			)
});

handleChange = (event) => {
	this.setState(
		{
			[event.targe.name]: value
		}
)}
render() {
		return(
			<form onSubmit={this.handleSubmit}>
					<input type="number" name="integerFirst" placeholder="Please enter an integer" onChange="this.handleChange" required />
					<input type="number" name="integerSecond" placeholder="Please enter an integer" onChange="this.handleChange" required />
					<button>Calculate sum</button>
					<output></output>
			</form>
	  )
}};

```
