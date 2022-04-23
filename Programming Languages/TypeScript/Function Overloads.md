---
tags:
  - Programming_Languages
  - typescript
  - functions
---

## Function overloads

Function overloading is not a feature of JavaScript but something close to it can be achieved with TypeScript. It proceeds by defining multiple function types (defined above the function) that may serve as the actual function's parameters. Then with the actual function, you leave the changeable parameters open as optional unions and/or `unknown` :

````ts
// First oveload type:
function logSearch(term: string, options?: string): void;

// Second overload type:
function logSearch(term: string, options?: number): void;

// Implementation:
function logSearch(term: string, p2?: unknown) {
  let query = `https://searchdatabase/${term}`;
  if (typeof p2 === "string") {
    query = `${query}/tag=${p2}`;
    console.log(query);
  } else {
    query = `${query}/page=${p2}`;
    console.log(query);
  }
}

logSearch("apples", "braeburn");
logSearch("bananas", 3);
````

````ts
// First overload type:
function logSearchUnion(term: string, options?: string): void;

// Second overload type:
function logSearchUnion(term: string, options?: number): void;

// Implementation:
function logSearchUnion(term: string, p2?: string | number) {
  let query = `https://searchdatabase/${term}`;
  if (typeof p2 === "string") {
    query = `${query}/tag=${p2}`;
    console.log(query);
  } else {
    query = `${query}/page=${p2}`;
    console.log(query);
  }
}

logSearchUnion("melon", "honey-dew");
logSearchUnion("oranges", 4);
````
