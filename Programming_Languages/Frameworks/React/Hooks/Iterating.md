---
categories:
  - Programming Languages
tags:
  - javascript
  - react
  - react-hooks
---

# Iterating through data

As React follows the **functional programming paradigm** and state versioning,
looping is not the recommended way of engineering repeated processes since it
presupposes pre-existing state. Instead React relies on the functional methods
of modern JavaScript such as `map` , `filter` , `reduce` to output the values of
iterative data structures.

Instead of mutating the state of a reference type, these methods are
'non-destructive': they create a new array that meets the requirements set in
the particular method. These newly created arrays and objects therefore form the
basis of the state versioning, because each new array that is engendered, is a
new state configuration.

## The `key` attribute

The `key` attribute is a special React attribute that should be added to the
elements of any listed content (i.e numbered lists, unordered lists, `select`
options etc; basically anything rendered that comes about through mapping arrays
and objects).

This enables React to monitor the state of the list: which items have changed,
been added, or removed.

The best way to pick a key is to use a string that uniquely identifies a list
item among its siblings.

For instance, using our earlier `numbers` array, assuming each number is unique,
we could use the number itself as the key:

```jsx
const numbers = [1, 2, 3, 4, 5];
const listItems = numbers.map((number) => (
  <li key={number.toString()}> {number}</li>
));
```

> Keys have to be unique to the individual element and not shared by any other
> sibling. But they do not need to be globally unique. You could use the same
> `key` name in another array list.

> Keys should be string types, not other data types. You can use the
> `.toString()` method to ensure this is the case.

If you can't find a unique basis for naming a series of keys, you can use the
`index` value of the `Array.map` function. This should only be used if the order
of the items doesn't change. An example:

```jsx
class List extends React.Component {
  render() {
    const demoArr = ["cat", "dog", "mouse"];
    return (
        <ul>
          {demoArr.map((x, index) => (
            <li key={index}>{x}</li>
          ))}
        </ul>
      </div>
    );
  }
}
```

## Demonstration

### Source data

```jsx
const blogData = [
  {
    id: 1,
    date: "2020-11-15",
    title: "Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum.",
    shortByline:
      "Quisque cursus, metus vitae pharetra auctor, sem massa mattis sem, at interdum magna augue eget diam. ",
    longByline:
      "Quisque cursus, metus vitae pharetra auctor, sem massa mattis sem, at interdum magna augue eget diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi lacinia molestie dui. Praesent blandit dolor.",
    image: blogImage,
  },
  {
    id: 2,
    date: "2020-08-11",
    title: "Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum.",
    shortByline:
      "Quisque cursus, metus vitae pharetra auctor, sem massa mattis sem, at interdum magna augue eget diam. ",
    longByline:
      "Quisque cursus, metus vitae pharetra auctor, sem massa mattis sem, at interdum magna augue eget diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi lacinia molestie dui. Praesent blandit dolor.",
    image: blogImage,
  },
];
```

### Child component

```jsx
export default function BlogPreviewCard(props) {
  return (
    <Card>
      <CardMedia image={props.image} />
      <CardContent>
        <Typography>{props.date}</Typography>
        <Typography>{props.title}</Typography>
        <Typography>{props.shortByline}</Typography>
      </CardContent>
      <CardActions>
        <Button>Read</Button>
      </CardActions>
    </Card>
  );
}
```

### Iteration

```jsx
// This uses the Material-UI grid component

import BlogPreviewCard from "../components/BlogPreviewCard"
import blogData from "../data/blogData

export default function BlogPreviewSet() {
  return (
    <Grid>
      {blogDummyData.map((data, index) => (
        <Grid key={index}>
          <BlogPreviewCard key={index} {...data} />
        </Grid>
      ))}
    </Grid>
  )
}
```
