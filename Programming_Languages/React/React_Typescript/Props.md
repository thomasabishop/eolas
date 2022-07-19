---
tags:
  - Programming_Languages
  - typescript
  - react
---

# Props

```tsx
interface IProps {
  people: {
    name: string;
    age: number;
    note?: string;
  }[];
}

const List: React.FC<IProps> = ({people}: IProps) => {
    return()
}

// Note we say that the props into the func component are of type IProps
// And we destructure the people key

```

Then in the parent:

```tsx

const [people, setPeople] = useState<IState['people']>({});

<List props={people}>

```

<p style="color: red;">Should I use type or interface? What is consensus?</p>
