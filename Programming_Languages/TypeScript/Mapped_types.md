---
categories:
  - Programming Languages
tags:
  - typescript
---

# Mapped types in TypeScript

A mapped type is a way to create new types based on existing ones by transforming their properties

As it works on a single type and typically narrows or limits the properties it works in a way that is opposite to a [union]() or [intersection]() type.

> Mapped types are an example of when `type` is preferable to `interface`, since you cannot generate mapped types as interfaces, although you may generate a mapped type from an interface.

For the demonstrations we will use the following type as the example that we will map from:

```ts
type Person = {
  name: string;
  age: number;
  city: string;
  country: string;
};
```

### Read only mapped type

Creates a type with all properties of the given type set to `readonly`:

```ts
type Readonly<T> = {
  readonly [P in keyof T]: T[P];
};

type ReadonlyPerson = Readonly<Person>;
```

This is equivalent to:

```ts
type ReadonlyPerson = {
  readonly name: string;
  readonly age: number;
  readonly city: string;
  readonly country: string;
};
```

### Partial mapped type

Creates a type with all properties of the given type set to optional.

```ts
type Partial<T> = {
  [P in keyof T]?: T[P];
};

type PartialPerson = Partial<Person>;
```

This is equivalent to:

```ts
type PartialPerson = {
  name?: string;
  age?: number;
  city?: string;
  country?: string;
};
```

### Pick mapped type

```ts
type Pick<T, K extends keyof T> = {
  [P in K]: T[P];
};

type PersonNameAndAge = Pick<Person, "name" | "age">;
```

This is equivalent to:

```ts
type PersonNameAndAge = {
  name: string;
  age: number;
};
```

### Record mapped type

Creates a type with keys of the given type and values of the specified type.

> How does this related to `Record` more generally in TS?

> How is this different from `Pick` ?

```ts
type Record<K extends keyof any, T> = {
  [P in K]: T;
};

type PersonRecord = Record<"id", Person>;
```

This is equivalent to:

```ts
type PersonRecord = {
  id: Person;
};
```

### Exclude mapped type

Creates a type by excluding specific properties from the given type.

```ts
type Exclude<T, U> = T extends U ? never : T;

type KeysWithoutAge = Exclude<keyof Person, "age">;
```

This is equivalent to:

```ts
type KeysWithoutAge = "name" | "city" | "country";
```
