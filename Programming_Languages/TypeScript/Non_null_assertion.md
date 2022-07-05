---
tags:
  - Programming_Languages
  - typescript
---

# Non-null assertion

Oftentimes you will encounter errors of the form:

`Property [property_name] does not exist on type [type_name].ts(2339)`

This means the interpreter is not able to determine whether the property which you are seeking to change exists. It can't be sure that you are not trying to update a property that is either `null` or `undefined`. This is good type checking but it means that in cases when _you know_ the property either exists or _will_ exist at runtime, you are going to face a code-breaking error.

To get around this you can use non-null assertion. Like the name suggests, here you are saying to TypeScript: thanks but I am sure this property exists. When you do this you get the value you are trying to change with `null` and `undefined` excluded from it.

This typically occurs when you are assigning a property to a value and TS doesn't know whether the value will exist or be accessible at this point in the runtime. A good scenario would be dynamic data passed into a function:

```ts
function doSomethingWith(typeAlias: ITypeAlias) {
  let x = typeAlias!.somePropertyEvidentAtRuntime;
}
```

However it should be used carefully and sparingly because you are obviously turning off core type-checking and overuse nullifies the purpose of TypeScript.

One way to get around it is to use better [type-guarding](./Type_guarding_and_narrowing.md) and conditionality and to cover cases where the value may be undefined.
