---
tags:
  - Programming_Languages
  - javascript
  - react
  - react-hooks
---

# Forms using hooks

With hooks, form processing is exactly the same as [classes](/Programming_Languages/React/Classes/Forms.md) in terms of the overall methodology, but the syntax is slightly different as a result of the `useState` hook.

>

## Basic approach

Instead of using `this.state` and `this.setState` . We just have the `useState` hook. But the controlled component principle is the same. Let's say we have a simple email input:

```jsx
const [email, setEmail] = useState('');
```

As this is a form, the state change is going to be the result of user input. So we need to prep our form to enable this.

```html
<input type="text" value="{email}" onChange="{setEmail}" />
```

Now we just need to make good on the `setEmail` method we declared when we initialised the state:

```jsx
const handleChange = (event) => {
  setEmail(event.target.value);
};
```

### Applied example

Here is an applied example of the above approach for a form that has three input fields. This component outputs the inputs as JSON on submit:

```jsx

function FormHook() {
  const [email, setEmail] = useState("");
  const [phone, setPhone] = useState("");
  const [age, setAge] = useState("");
  const [formOutput, setFormOutput] = useState("Form output");

  const handleSubmit = (event) => {
    event.preventDefault();
    setFormOutput(
      JSON.stringify({ email: email, phone: phone, age: age }, null, 2)
    );
  };
	return (
		<form onSubmit={handleSubmit}>
			<input type="text" value={email} onChange={(event) => setEmail(event.target.value)}>
			<input type="text" value={phone} onChange={(event) => setPhone(event.target.value)}>
			<input type="number" value={age} onChange={(event) => setAge(event.target.value)}>
			<button type="submit">Submit</button>
		</form>
	)
};
```

## More complex forms

The above is fine if you only have one form with a couple of inputs. But if you are managing multiple forms or forms with a complex array of inputs, you would need to create `useState` declaration for every single input with a custom `onChange` event for each one which is repetitious and not very clean.

So instead of this, just like with class-based controlled components, we use the `name` HTML attribute to distinguish each input and create a generic `onChange` function that distinguishes each separate input by destructuring a key, value object using the `name`.

```jsx
<form onSubmit={handleSubmit}>
			<input type="text" name="email" value={formValues.email} onChange={handleChange}>
			<input type="text" name="phone" value={formValues.phone} onChange={handleChange}>
			<input type="number" name="age" value={formValues.age} onChange={handleChange}>
			<button type="submit">Submit</button>
</form>
```

```jsx
const initialState = {
  email: '',
  phone: '',
  age: '',
};

const [formValues, setFormValues] = useState(initialState);

const handleChange = (event) => {
  const {name, value} = event.target;
  setFormValues({...formValues, [name]: value});
};
```

There are three parts:

1. First we create the initial state.
2. Next we store this initial state as the variable in the `useState` initialisation: `formValues` . We also provide a method `setFormValues` which will be used by the change handler to log the user's inputs.
3. Finally we create the function that will log the user changes. First we use object destructuring on the change event to enable us to retrieve the `name` and `value` attributes of the HTML inputs in the component. Then we use spread syntax to say that for each input pair, retrieve its value, using the destructured `name` variable as the key.

### Applied example

Below I have updated the previous context to this time reflect the new, abstracted logic:

```jsx
function FormHookAbstracted() {
  const initialState = {
    email: "",
    phone: "",
    age: "",
  };
	const [formValues, setFormValues] = useState(initialState);
	const handleChange = (event) => {
    const { name, value } = event.target;
    setFormValues({ ...formValues, [name]: value });
  };
  const handleSubmit = (event) => {
    event.preventDefault();
    setFormOutput(
      JSON.stringify({ email: email, phone: phone, age: age }, null, 2)
    );
  };
	return (
		<form onSubmit={handleSubmit}>
			<input type="text" name="email" value={formValues.email} onChange={handleChange}>
			<input type="text" name="phone" value={formValues.phone} onChange={handleChange}>
			<input type="number" name="age" value={formValues.age} onChange={handleChange}>
			<button type="submit">Submit</button>
		</form>
	)
};
export default FormHookAbstracted;
```

Note that instead of individual variables `email` , `phone`, `age` , this approach returns a single object `formValues` . We could therefore access the individual values with e.g `[formValues.email](http://formvalues.email)` .

As it is an object, it makes resetting to the original state very easy, viz:

```jsx
const handleReset = () => {
  Object.values(formValues).map((x) => setFormValues(initialState));
};
```
