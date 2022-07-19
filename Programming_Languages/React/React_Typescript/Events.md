---
tags:
  - Programming_Languages
  - typescript
  - react
---

# Events

Building on the previous examples for React TypeScript we are going to add a simple form that enables the user to add people to the list. This will demonstrate how we type components that use event handlers.

We are going to use the preexisting interface for recording the list items:

```tsx
interface IState {
  people: {
    name: string;
    age: number;
  }[];
}
```

Our form:

```ts
import {IState as Props};
```

```tsx

interface IProps {
    people: Props["people"]
    setPeople: React.Dispatch<React.SetStateAction<Props["people"]>>
}

const AddToList: React.FC<IProps> = () => {
  const [people, setPeople] = useState<IState["people"]>({})
  const [formVals, setFormVals] = useState({});

  const handleChange = (e: React.ChangeEvent<HTMLInputElement>): void => {
    setFormValues({
      ...input,
      [e.target.name]: e.target.value,
    });
  };

  const handleClick = (): void => {
    if (!input.name || !input.age) return

    setPeople({
        ...people,
        {
            name: input.name,
            age: input.age
        }
    })
  }

return (
    <form>
      <input type="text" name="name" value={input.name} onChange={handleChange} />
      <input type="text" name="age" value={input.age} onChange={handleChange} />
    </form>
    <button onClick={handleClick}>Add to list</button>
);
};
```

This follows standard practise for [controlled-components](/Programming_Languages/React/Hooks/Forms.md). The TS specific additions:

- We define the change event as being of the type `React.ChangeEvent` and state that it corresponds to a generic - `HTMLInputElement`. So we are saying that whenever this function is called we must be passing it an input element so that we can extract the event associated with its `target` property.

- We are passing around variations on the `IState` interface in order to type the values that we are adding to the people array.
