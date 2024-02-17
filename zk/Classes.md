---

tags: [typescript, OOP]
---

# Classes

## Type declarations for classes

TypeScript offers full type annotations for classes. It also introduces several
TypeScript-specific options (control access modifiers, interfaces etc) that do
not exist in JavaScript but which seek to bring it into closer alignment with
more strict object-oriented languages like Java and C#.

A class in JavaScript:

```js
class Age {
  constructor(name, birthYear) {
    this.name = name;
    this.birthYear = birthYear;
  }
  currentYear() {
    return new Date().getFullYear();
  }
  get age() {
    return this.currentYear() - this.birthYear;
  }
  get dataOutput() {
    return `${this.personName} is ${this.age} years old`;
  }
}
```

The same class in TypeScript:

```ts
class Age {
  personName: string;
  birthYear: number;
  constructor(personName: string, birthYear: number) {
    this.personName = personName;
    this.birthYear = birthYear;
  }
  currentYear(): number {
    return new Date().getFullYear();
  }
  get age(): number {
    return this.currentYear() - this.birthYear;
  }
  get dataOutput(): string {
    return `${this.personName} is ${this.age} years old`;
  }
}
```

The main points to note are:

- methods must specify their return type, as with [functions](Functions.md)
- the constructor function must specify its parameters' types
- we must declare the types of any properties we intend to use at the start of
  the class.

### Instantiating a class

In order to create an object instance of `Age`, we can use the standard
constructor function, viz:

```js
const mum = new Age("Mary Jo", 1959);
console.log(mum);

/* Age { personName: 'Mary Jo', birthYear: 1959 } */
```

But given that classes define objects, we can also now use `Age` as a new custom
type and define an object that way

```jsx
const thomas: Age = new Age("Thomas", 1988);
```

### Without constructor

If your class does not use a constructor, you still need to define your class
property types at the top:

```tsx
class Dummy {
  aNum: number = 4;
  get getSquare(): number {
    return this.aNum * this.aNum;
  }
}
```

## Interfaces

In most cases the difference between using the `type` and `interface` keywords
when defining a custom type is marginal however interfaces are specifically
designed for classes and OOP style programming in TypeScript. This is obviously
most apparent in a framework like Angular where interfaces are used heavily.

When we use an interface with a class we are asserting that the class must have
certain properties and methods in order to qualify as that type. This is most
helpful when you are working with several developers and want to ensure
consistency.

Let's say we have the following interface:

```ts
interface Person {
  firstName: string;
  secondName: string;
  age: number;
  employed: () => boolean;
}
```

Now we want to create a class that must share this shape. We go ahead and create
the class and say that it **implements** `Person` :

```ts
class Programmer implements Person {
// If the below are not included, TS will generate an error
	firstName: string,
	secondName: string,
	age: number,
	employed: () => boolean
}
```

## Inheritance

We can extend classes in TypeScript by using sub-classes or abstract classes.

### Sub-classes

In the case of sub-classes, we use the phrase
`[child_class] extends [parent_class]` in the class declaration to designate the
inheritance relationship between the base class and the new class that is
derived from it.

> A derived class has all the properies and methods of its base class but can
> also define additional members.

When you instantiate a child class from a parent class, if the parent class has
constructor values, you must initialise these in the child. You do this by
calling the parent constructor via the `super()` syntax. For example:

```ts
class Employee extends Person {
  constructor(firstName: string, lastName: string, private jobTitle: string) {
    // call the constructor of the Person class:
    super(firstName, lastName);
  }
}
```

To override or alter a method that exists on the parent in the child, you can
use the syntax `super.[methodName]()`.

### Abstract classes

Classes marked `abstract` are similar to parent in the case of sub-classes. The
difference is that they are like templates. Several of their methods and
properties may be directly inherited by classes that derive from them (just like
sub-classes) but they can include 'blank' methods and properties that are
placeholders for methods and properties that are defined in the derivation
class.

I have found this useful for cases where you want to inherit methods from a
parent class but implement a specific method differently in each derivation.

```ts
export abstract class IndexHyperlinksProvider
   implements vscode.TreeDataProvider<TreeItem>
{
   public activeFile: string | undefined
   private outlinks
   private fileSystemUtils: FileSystemUtils

   constructor(
      activeFile: string | undefined,
      workspaceRoot: string | undefined
   ) {
      this.setActiveFile(activeFile)
      this.outlinks = this.generateLinks()
      this.fileSystemUtils = new FileSystemUtils(workspaceRoot)
   }

   abstract generateLinks(): Promise<TreeItem[] | undefined>

   public setActiveFile(activeFile: string | undefined) {
      this.activeFile = activeFile
   }
  ...
```

Above we have a base class with a single abstract method `generateLinks()`. The
class below extends this base. Note that it passes the parent constructor values
to `super` and defines an actual method for the designated `generateLinks()`
template:

```ts
export class IndexOutlinksProvider extends IndexHyperlinksProvider {
  public workspaceFiles: string[];
  public context: vscode.ExtensionContext;
  constructor(
    activeFile: string | undefined,
    workspaceRoot: string | undefined,
    workspaceFiles: string[],
    context: vscode.ExtensionContext
  ) {
    super(activeFile, workspaceRoot);
    this.workspaceFiles = workspaceFiles;
    this.context = context;
  }

  public async generateLinks(): Promise<TreeItem[] | undefined> {
    const indexer = new IndexHyperlinks(this.context, this.workspaceFiles);
    if (typeof this.activeFile === "string") {
      const outlinks = await indexer.indexOutlinks(this.activeFile);
      if (outlinks !== undefined) {
        return this.transformLinksToTreeItem(outlinks);
      }
    }
    return;
  }
}
```

> Importantly, you cannot instantiate abstract classes. You can only `extend`
> them and then instantiate their derivation. This is another important
> difference from sub-classes.

As with sub-classes, you must initialise the properties of the parent
constructor with `super`.

### `implements` vs `extends`

You shouldn't confuse `implements` with `extends`. `implements` just checks the
class as an interface in accordance with the principles of
[duck typing](Custom_types.md#duck-typing):
i.e the implementing class should have the same properties and methods. It
doesn't affect anything internal to the methods or properties. So e.g, if you
typed a method parameter as `string` in the base class, this would still default
to `any` in the derived class.
