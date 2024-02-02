---
categories:
  - Programming Languages
tags:
  - typescript
---

# Generics

Generics are a powerful feature in TypeScript that enables you to write reusable
and flexible code while maintaining strong typing. With generics, you can create
functions, classes, and interfaces that work with various types while preserving
type information.

The main purpose of generics is to allow developers to write code that can
**operate on different data types without knowing the specific type
beforehand**. This helps to keep the code DRY and maintainable.

## Basic usage

### Functions

```ts
function identity<T>(arg: T): T {
  return arg;
}
```

Here, `T` is a generic type variable. The `identity` function is a generic
function that takes an argument of type `T` and returns a value of type `T`.

To use this generic function you can either explicitly provide the type within
the angle brackets, or let TypeScript infer the type based on the value passed:

```ts
// Explicitly specifying the type
let output1 = identity<string>("hello");

// TypeScript infers the type as `number`
let output2 = identity(42);
```

#### Restricting the available types

In the previous example any type could be used with the `identity` function. The
only constraint that we place on usage is that the types must be consistent: if
we pass a string as an argument, then a string must be returned.

However we can add further restrictions on types by using the `extend` keyword,
combined with an interface.

```ts
interface Lengthwise {
  length: number;
}

function logLength<T extends Lengthwise>(arg: T): T {
  console.log(arg.length);
  return arg;
}
```

In this example the `logLength` generic function is limited to types that
implement the `Lengthwise` interface. So: any argument that is passed to
`logLength` and any value that is returned by it must match the shape of
`Lengthwise`, having the `length` property.

## Interfaces and classes

Generics can also be used profitably when working with stricter OOP constructs.

```ts
interface KeyValuePair<K, V> {
  key: K;
  value: V;
}
```

The `KeyValuePair` interface has two generic type parameters: K for the key and
V for the value. The interface defines an object shape that must possess the
properties `key` and `value`, e.g:

```ts
{
  key: 2,
  value: 'something'
}
```

In this form the generic specifies that whatever types are used for the key and
the pair must be used consistently, e.g. this would be wrong:

```ts
{
  key: 'age',
  value: 32
}
```

The following class uses the `KeyValuePair` interface:

```ts
class Storage<K, V> {
  private items: KeyValuePair<K, V>[] = [];

  add(item: KeyValuePair<K, V>): void {
    this.items.push(item);
  }

  getByKey(key: K): V | undefined {
    const foundItem = this.items.find((item) => item.key === key);
    return foundItem ? foundItem.value : undefined;
  }

  getAll(): KeyValuePair<K, V>[] {
    return this.items;
  }
}
```

This class stores objects that match the `KeyValuesPair` interface in an array
and provides and add and list method for accessing/returning them.

The `add` method takes an item of type `KeyValuePair<K, V>` and adds it to the
`items` array. The `getByKey` method takes a key of type `K` and returns the
value of type `V` associated with that key or undefined if the key is not found.
The `getAll` method returns all stored key-value pairs.

Here is an example of instantiating the class:

```ts
const storage = new Storage<number, string>();

storage.add({ key: 1, value: "one" });
storage.add({ key: 2, value: "two" });

const value = storage.getByKey(1);
const allItems = storage.getAll();

console.log(value);
// value: "one"

console.log(allItems);

// allItems: [
//   { key: 1, value: "one" },
//   { key: 2, value: "two" }
// ]
```

## Real examples

### GraphQL client for query and mutation requests over `fetch`

```ts
type GraphQlResult<T> = {
  data: T;
  errors?: Array<{
    message: string;
    locations: Array<{ line: number; column: number }>;
    path: Array<string | number>;
  }>;
};

export class GraphQlClient {
  private endpoint: string;

  constructor(endpoint: string) {
    this.endpoint = endpoint;
  }
  async request<T>(
    query: string,
    variables?: Record<string, unknown>
  ): Promise<T> {
    try {
      const response = await fetch(this.endpoint, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ query, variables }),
      });

      if (!response.ok) {
        throw new Error(
          `Network error: ${response.status} - ${response.statusText}`
        );
      }

      const result: GraphQlResult<T> = await response.json();

      if (result.errors) {
        throw new Error(`GraphQL error: ${JSON.stringify(result.errors)}`);
      }

      return result.data;
    } catch (error) {
      console.error(error);
      throw error;
    }
  }
}
```

### VSCode extension TreeView generator

In VSCode a TreeView is a list of values that may have nested values, like a
directory. The following generic is a helper function that generates a TreeView
based on a given class that is passed in as an argument, along with the class's
constructor values (`args` in the example). It also calls a method `refresh` on
each instance of the class.

```ts
function createTreeView<
  T extends IndexHyperlinksProvider | IndexMetadataProvider,
  U extends LinkTypes | MetadataTypes
>(
  viewType: string,
  ProviderClass: new (...args: any[]) => T,
  type: U,
  activeEditor?: string | undefined,
  ...args: ConstructorParameters<typeof ProviderClass>
): T {
  const view = new ProviderClass(...args, type);
  if (view instanceof IndexHyperlinksProvider) {
    view.refresh(activeEditor, type as LinkTypes);
  } else if (view instanceof IndexMetadataProvider) {
    view.refreshIndex();
  }
  vscode.window.registerTreeDataProvider(viewType, view);
  return view;
}
```
