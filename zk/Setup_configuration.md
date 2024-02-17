---
tags:
  - typescript
---

# Setup and configuration

## Installation and configuration

TypeScript offers custom installations for most modern JS-based frameworks
including Webpack, React.js and Vue.js. The instructions below cover minimal TS
set-up outside of a specific framework. TypeScript adds an additional step to
any build process since your code must compile to JS before any bundling and
transpilation can occur.

## Installation

```
mkdir typescript-project
cd typescript-project
npm i typescript --save-dev
```

## Initialise project

```
npx tsc --init
```

## Basic configuration

```json
"compilerOptions": {
	"target" : "es2020", //es2015 for prod
	"module" : "es2020",
  	"allowJs": true,
  	"checkJs": true,
  	"strict": true,
  	"esModuleInterop": true
}
```

### Specify output paths (for production code)

```json
"compilerOptions": {
	...
	"outDir": "dist",
	"sourceMap": true,
}
```

### Compile-time commands

```
tsc --noEmit
```

```
tsc --noEmit --watch
```

## Global requirements

```
npm install -g typescript
npm install -g ts-node
```

`ts-node` allows you to run TS files the way you would with standard JS, i.e.
`node [filename]`, you just use `ts-node filename` .

This is a convenience that saves you compiling from TS → JS and then running
Node against the compiled JS. Which is useful for debugging and checking values
as you work.

## Imports and exports

You may wish to define your custom types outside of their application, for
instance in a `/types/` directory. The custom type or types can then be imported
using standard ES6 imports:

```tsx
export type Article = {
		price: number,
}

export type AnotherType = {
...
}
```

```tsx
import { Article, AnotherType } from "./types/allTypes.js";
import Article from "./types/allTypes.js";
```

TypeScript also provides a specific import keyword `type` so that you can
distinguish type imports from other module imports. This is handy when you have
multiple components in the one file:

```tsx
import type { Article } from "./types/allTypes.js";
```
