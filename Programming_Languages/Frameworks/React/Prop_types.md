---
categories:
  - Programming Languages
tags:
  - javascript
  - react
  - data-types
---

# Prop types

**The `prop-types` package allows us to introduce type-checking during the development runtime of a React application. With larger applications or those with complex data flows, this can help reduce errors and bugs during development. This is a bit like using TypeScript but on a more minimal level.**

## Install

```
npm install prop-types
```

## Usage

```jsx
import PropTypes from 'prop-types';
```

## Examples

Say we have a component with the following props:

```jsx
function Page(props) {
  const classes = useStyles();
  return (
    <React.Fragment>
      <Typography className={classes.heading} variant="h1">
        {props.h1}
      </Typography>
      {props.h2 !== '' && <Typography variant="h2">{props.h2}</Typography>}
      {props.paras.map((paragraph, index) => (
        <Typography className={classes.paragraph} key={index} variant="body1" gutterBottom>
          {paragraph}
        </Typography>
      ))}
      {props.children}
      <Button
        className={classes.button}
        variant="contained"
        color="primary"
        disableElevation
        component={Link}
        to={props.buttonLink}
      >
        {props.buttonText}
      </Button>
    </React.Fragment>
  );
}
```

Before the final `export default` statement, we would add a PropTypes object that specifies the data or reference type that is required by each prop cited in the component:

```jsx
Page.propTypes = {
  h1: PropTypes.string.isRequired, // should be string data type, must be present
  h2: PropTypes.string, // as above but optional
  paras: PropTypes.array, // should be array reference type
  buttonLink: PropTypes.string,
  buttonText: PropTypes.string,
  children: PropTypes.node, // can be anything (element, type, JSX) that is rendered to the screen
};
```

If one of these type checks failed you get a very semantic Warning in the console specifying which prop is not consistent with your prop type declaration.

## Additional checks

Above are the most frequent and basic checks, but there are many other conditions you can check for:

```jsx
// The full list of types
[propName]: PropTypes.array,
[propName]: PropTypes.bool,
[propName]: PropTypes.func,
[propName]: PropTypes.number,
[propName]: PropTypes.object,
[propName]: PropTypes.string,
[propName]: PropTypes.symbol,

// Anything that can be rendered: numbers, strings, elements or an arrayor fragment) containing these types.
[propName]: PropTypes.node,

// A function

[propName]: PropTypes.func

// An object that could be one of many types
[objectProp]: PropTypes.oneOfType([
    PropTypes.string,
    PropTypes.number,
  ]),

// An array of a certain type
[arrayProp]: PropTypes.arrayOf(PropTypes.number),

// An object with property values of a certain type
[objectProp]: PropTypes.objectOf(PropTypes.number),
```
