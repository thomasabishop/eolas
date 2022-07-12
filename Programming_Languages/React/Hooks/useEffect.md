---
tags:
  - Programming_Languages
  - javascript
  - react
  - react-hooks
---

# `useEffect`

`useEffect` should be used for any background process that does not arise as a result of a user interaction or standard state change. The canonical example would be dispatching a request to an API to retrieve data to display in a component's initial render.

`useEffect` enshrines but also simplifies the [lifecyle methods](./../Classes/Lifecycle_methods.md) that are used with class-based React components.

## Demonstration

```jsx
const [workflowTitle, setWorkflowTitle] = useState('');
const [loading, setLoading] = useState(false);

useEffect(() => {
  const fetchWorkflowTitle = () => {
    axios
      .post(`${process.env.REACT_APP_ENDPOINT}/load-workflows`, {
        workflow_id: project_id,
        user_id: isAuth?.userId,
      })
      .then((res) => {
        setWorkflowTitle(res?.data?.meta.name);
      })
      .finally(() => setLoading(false))
      .catch((err) => {
        console.error(err);
      });
  };
  setLoading(true);
  fetchWorkflowTitle();
}, [project_id, isAuth]);
```

In this example we fetch some data from a REST API and store the response value as state, which can then be accessed within our JSX template.

## Function placement

In the example, the function is declared inside of the `useEffect` hook and then called. We do this to avoid adding the function to the dependency array, which we couldn't do if we defined it outside of the hook, somewhere in the component. If we did this, the function would run on every render by default and would be recalled again because of its placement in the dependency array, which leads to the 'too many rerenders' error.

An alternative would be to define it outside of the component itself but this is difficult since it requires state from the component to run.

## Dependency array

Note the array that is the second argument to `useEffect`. This is the **dependency array** and is how we manage the lifecycle of the side-effect.

- After the initial call on render, the function within the `useEffect` block will run any time one of the dependencies update. The dependency array typically refers to variables that are defined within the hook but can also contain references to variables outside of it.

- If you do not include the array, the effect runs on every render

- If you pass an empty array, the effect will only run once on the initial render

## Cleanup functions

The syntax of the `useEffect` hook also allows you to handle cleanup: something you want to do when the component unmounts (another example of how this hook recasts the traditional [lifecycle methods](./../Classes/Lifecycle_methods.md)) . In addition to running on unmount, the cleanup function will run before the effect runs again (i.e. when it runs in response to a change in one of the elements of the dependency araray). This is chiefly used to prevent [memory leaks](../../../Software_Engineering/Memory_leaks.md) and the ['update on unmounted component error'](../Errors.md#state-update-on-unmounted-component).

You do this by having a `return` clause after the main effect. Schematically:

```js
useEffect(() => {
  //  Run your effect;
  return () => {
    //   Put your cleanup function here
  };
}, [input]);
```

Here is an example of using a cleanup to cancel a subscription

```js
useEffect(() => {
  let isApiSubscribed = true;
  axios.get(API).then((response) => {
    if (isApiSubscribed) {
      // handle success
    }
  });
  return () => {
    isApiSubscribed = false;
  };
}, []);
```

## Resources

[Understanding the React useEffect cleanup function](https://blog.logrocket.com/understanding-react-useeffect-cleanup-function/)
