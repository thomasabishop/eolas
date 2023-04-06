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

## Main varieties of mapped types

### Read only

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

### Partial

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

### Pick

This is useful when you want to create a new type based on a subset of properties from an existing type.

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

### Record

Creates a type with keys of the given type and values of the specified type. It is a way of shoehorning keys from an existing type with new values.

Basic syntax:

```ts
Record<Keys, ValueType>;
```

Example:

```ts
type UserRole = "admin" | "user" | "guest";

// Create a Record type to store user role descriptions
type UserRoleDescriptions = Record<UserRole, string>;

// Create an object that implements the UserRoleDescriptions type
const roleDescriptions: UserRoleDescriptions = {
  admin: "Has full access to the system",
  user: "Can access limited resources",
  guest: "Can view public resources only",
};
```

### Exclude

Creates a type by excluding specific properties from the given type.

```ts
type Exclude<T, U> = T extends U ? never : T;

type KeysWithoutAge = Exclude<keyof Person, "age">;
```

This is equivalent to:

```ts
type KeysWithoutAge = "name" | "city" | "country";
```

### Extract

Creates a type by extracting specific properties from the given type. Basically the opposite operation to Exclude.

```ts
type Extract<T, U> = T extends U ? T : never;

type NameKey = Extract<keyof Person, "name">;
```

This is equivalent to:

```ts
type NameKey = "name";
```

### Non-nullable

Creates a type by removing null and undefined from the given type.

```ts
type NonNullable<T> = T extends null | undefined ? never : T;

type NullablePerson = {
  name: string | null;
  age: number | null;
  city: string | null;
  country: string | null;
};

type NonNullablePerson = NonNullable<NullablePerson>;
```

Equivalent to:

```ts
type NonNullablePerson = {
  name: string;
  age: number;
  city: string;
  country: string;
};
```
