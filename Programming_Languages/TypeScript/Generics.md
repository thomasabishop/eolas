---
categories:
  - Programming Languages
tags:
  - typescript
---

# Generics

**Generics allow you to write code that is type-safe yet flexible enough to accommodate specifics that you are not able to ascertain in advance.**

Generics can help promote:

- type consistency when specific types cannot be known in advance
- reduced repetition when writing functions and methods
- extensibility and future-proofing

## First example: simplest use case

In the code below we have a simple JavaScript function that receives a value and an an array as parameters. It returns a new array comprising the original array plus the additional value:

```js
function generateArray(existingArray, newValue) {
  return [...existingArray, newValue];
}
```

Imagine that we want to ensure that each of the parameters share the same data type. In other words: if the function is passed a string array, the second parameter must also be a string. For example, it should not be the case that you can append a string to an array of numbers.

Now imagine that we don't know in advance what type the value or array will be, we just know that the data types of the parameters must match.

In converting the function to TypeScript, one way of overcoming our lack of foreknowledge would be to deploy `any`. This way it doesn't matter which types are passed to the function:

```ts
function generateArray(existingArray: any[], newValue: any): any[] {
  return [...existingArray, newValue];
}
```

But this is no solution at all. The problem — as always with `any` — is that it strips our function of any type checks whatsoever and would therefore invite calls of form: `generateArray([1,2,3], 'lorem')`.

Enter generics:

```ts
function generateArray<T>(existingArr: T[], newValue: T): T[] {
  return [...existingArr, newValue];
}
```

Now, whilst we haven't asserted ahead of time which types will be used, whichever types we do pass in, must match. The function header is saying:

- both arguments must be of the same type (represented by `T`)
- the function will return an array of this same `T` type.

If I then tried to run the function with unmatched types (for example `generateArray([1,2,3,4], true)` ) TypeScript would raise the following error:

```
Argument of type 'boolean' is not assignable to parameter of type 'number'
```

Note that even though the function in question does not express any preference for number types, given that our first parameter is a number, TypeScript knows that the second parameter must also be a number.

> In the generic function we have used `T` as our placeholder for a generic type as this is the convention. However there is no compunction to do so. We could have used any letter or string, providing that the string is not a reserved term.

## Another example

This example demonstrates how we can use generics to reduce repetition when writing functions and is also a more realistic use case.

Let's say we have two types or interfaces:

```tsx
type VideoFormatUrls = {
  format720p: URL;
  format1080p: URL;
};
```

```tsx
type SubtitleFormatUrls = {
  english: URL;
  german: URL;
};
```

An example of an object matching these type definitions:

```tsx
const videoFormats: VideoFormatUrls = {
	format720p: https://www.format720p.co.uk,
	format1080p: https://www.format1080p.co.uk
}
```

Imagine we wanted to be able to check whether a given film is available in a certain video format. We could write a function like this:

```tsx
function isFormatAvailable(obj: VideoFormatUrls, format: string): format is keyof VideoFormatUrls {
  return format in obj;
}
```

Now imagine that we need to do the same thing with subtitles, but given that `isFormatAvailable()` is typed to the `VideoFormatUrls` type we would get an error if we used this function for subtitles. But we also don't want to write a near identical function typed to `SubtitleFormatUrls` to subtitles just to ensure adequate type safety.

Alternatively we could use a union type, for example:

```tsx
function isFormatAvailable(
  obj: VideoFormatUrls | SubtitleFormatUrls,
  format: string,
): format is keyof VideoFormatUrls {
  return format in obj;
}
```

But this quickly becomes unwieldy if we, for the sake of argument have a great many URL types that we want the function to utilise.

This is where generics become super helpful. Here is how we would rewrite the function as a generic:

```tsx
function isAvailable<Formats>(obj: Formats, key: string): key is keyof Formats {
  return key in obj;
}
```

We could then explicitly type our calls of this function, viz:

```tsx
isFormatAvailable<SubtitleFormatUrls>(subtitles, 'english');
```
