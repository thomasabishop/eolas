---
categories:
  - Programming Languages
tags:
  - javascript
  - react
---

# Lifecycle methods

Lifecycles are familiar from nature: something is born, it grows and reaches maturity and then dies and the process continues as what dies is broken down into constituent parts which form the basis of new life. And so on and so on.

The same metaphor can be applied to React components relative to the document object model:

- Components are 'born' (created and mounted on the DOM)
- They 'grow' by changing and updating their state
- They 'die' by being unmounted from the DOM

## Specific lifecycle phases

The outline above corresponds to specific methods that execute when React code runs:

1. `componentWillMount()` : this method is called just before the `render()` method is called
2. `componentDidMount()` : this method is called after the component is rendered in the DOM

The two methods above only occur once in a lifecycle.

The 'updating' phase is achieved with the following methods. This is when the data of the component, in the form of state and props updates in response to user interaction. We call this process 're-rendering':

3. `shouldComponentUpdate()` : determines whether component should update

4. `componentWillUpdate()` : called before re-rerendering occurs

5. `componentDidUpdate()` : called after re-rendering occurs

The final phase is unmounting: when the component is removed from the DOM:

6. `componentWillUnmount()`

![React component lifecycle](../../../img/react-lifecycle.png)

## Side-effects: why lifecycle phases matter

> React is built based on the principles of functional programming. In this paradigm, a side-effect (something that is generally discouraged) is any process that is not the direct result of a function executing or anything that is not covered by the `return` keyword.

Many of the methods detailed in the previous section will rarely be used in React development since they pertain to the inner engineering of the library, rather than its application in custom contexts. However sometimes you do need access to these methods, depending on the background context of what you are trying to achieving. This context could include external API and database requests or **anything that does not directly pertain to the rendering of the component on the screen**.

React groups these processes under the heading of **side-effects.**

### Examples of side-effects and where in the lifecycle they should run

- `componentWillMount` : It's a good idea to run set-up scripts at this point, such as connecting to and authenticating access to a database. This process runs before the `render` method is called so it is an optimal point to establish these connections
  - You should not however make data requests at this point since data is typically returned asynchronously. You cannot therefore be sure that the data will be returned before mounting occurs.
- `componentDidMount` : This is the time to do things that can't occur without the DOM:
  - retrieve data
  - add event listeners
  - set timers using `setTimeout` or `setInterval`
- Updating methods (`shouldComponentUpdate`, `componentWillUpdate` etc.)
  - As these precede or take place concurrently with the rerendering process, this phase is a good point to retrieve new data or run necessary external processes that are required by the re-rendering.
