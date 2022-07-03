---
tags:
  - Programming_Languages
  - typescript
---

# Functions

## Basic typing within a function: arguments and return values

With functions we can apply types to the return value, the parameters and any values that are included within the function body.

```ts
function search(query: string, tags: string[]): string {}
```

We can also specify optional parameters with use of the `?` symbol:

```ts
function search(query: string, tags?: string[]): string {}
```

### Utilising custom types


Whilst we can use standard JS types with the parameters and return value, the real benefit comes when you use custom types. For instance we can specify that an object passed to a function must match the shape of a custom type or interface. Similarly we can ensure that for functions that return objects, the object that is returned must satisfy the shape of the custom object.

```ts
async function getContributorData(
  contributorName: string
): Promise<IContributor> {}
```

For example, this function has a return signature which indicates that it will return a promise matching a type of shape `IContributor`

## Typing functions themselves

---

As well as typing the values that a function receives and returns, you can type the function itself. **This is most useful when you are using higher-order functions and passing functions as parameters to another function.** In these scenarios you will want to type the function that is being passed as a parameter. There are several ways to do this. We'll use the following basic function as our demonstration:

```ts
function hoFunc(integer: number, addFunction: any): number {
  return addFunction(integer);
}
```

### Use `typeof`

```ts
// Declare an adding function
const addTwo = (int: number) => int + 2;

// Apply it:
hoFunc(3, addTwo);

// We can now define the higher-order function with a specific type:

function hoFunc(integer: number, addFunction: typeof addTwo): number {
  return addFunction(integer);
}
```

This way we just use the native `typeof` keyword to assert that any call of `hoFunc` should pass a function of the type `addTwo`
