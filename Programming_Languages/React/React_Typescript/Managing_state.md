---
tags:
  - Programming_Languages
  - typescript
  - react
---

# Managing state

## Basic: `useState`

```tsx
const [amount, setAmount] = useState<number | string>(3);
```

### Custom type

```tsx
interface IState {
  people: IPerson[];
}

interface IPerson {
  name: string;
  age: number;
}

const [people, setPeople] = useState<IState>({});

// Alternative declaration

interface IState {
  people: {
    name: string;
    age: number;
  }[];
}

const [people, setPeople] = useState<IState['people']>({});
```
