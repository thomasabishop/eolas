---
tags:
  - Programming_Languages
  - typescript
  - react
---

# Functions

Continuing from the other examples of React Typescript, we could do standard listing function, like:

```tsx
<ul>
  {people.map((person) => {
    return <li>{person.name}</li>;
  })}
</ul>
```

But it's neater to do it with a function defined within the `List` component:

```tsx
const renderList = (): JSX.Element[] => {
  return people.map((person) => {
    return (
      <li>
        <div>{person.name}</div>
        <div>{person.age}</div>
      </li>
    );
  });
};
```

And then change the eariler list to a function invocation:

```tsx
    <ul>{renderList()}<ul>
```
