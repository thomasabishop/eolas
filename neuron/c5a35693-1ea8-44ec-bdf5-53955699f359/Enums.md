---
tags:
  - typescript
---

# Enums

In essence an `enum` in TypeScript is an incremented store of immutable
variables. The only way I can understand them is just to think of them as a bag
of constants.

Below is an example of an `enum`:

```ts
enum Continents {
  NorthAmerica,
  SouthAmerica,
  Africa,
  Asia,
  Europe,
  Antartica,
  Australia,
}

// usage
var region = Continents.Africa;
```

Here is an example of a string-based enum from the Studio codebase:

```tsx
export enum HelpLinksEnum {
  composerView = "composerView",
  conditionalHelp = "conditionalHelp",
  configView = "configView",
  dashboard = "dashboard",
  dataView = "dataView",
  functionHelp = "functionHelp",
  previewMode = "previewMode",
}
```

### Main properties

- **Auto-incrementation (numeric enums only):**
  - Enums are auto-incrementing.
  - If we wanted to change the automatic sequence we could do something like the
    below and TS would automatically update the index to reflect our change
  ```ts
  enum NewProjectMenuItems {
      Row = 5
      Table // would automatically become `6` in the index
  }
  ```
- **Enums are types**

  - Enums are interpreted as types by TS. Consequently we can an enum as a type
    annotation. This can be particularly useful when typing function parameters.
    For example:

  ```ts
  enum UserResponse {
    No = 0,
    Yes = 1,
  }

  function respond(recipient: string, message: UserResponse): void {
    // ...
  }
  ```

- **Enums accept computed values**
  - As is the case with objects generally, we are not limited to primitive data
    types when setting values on enums, we can also assign functions.
- **Reverse mapping**

  - Reverse mapping is the ability to access a key via its value in addition to
    the more standard practice of accessing a value via its key.
  - Demonstration:

    ```ts
    enum PrintMedia {
      Newspaper = 1,
      Newsletter,
      Magazine,
      Book,
    }

    PrintMedia.Magazine; // returns  3
    PrintMedia["Magazine"]; // returns  3
    PrintMedia[3]; // returns  Magazine
    ```

- **Useful in switch statements**
  - Enums come in handy when you want to reduce the verbosity and repetition of
    a large switch statement.
  - The following is an example from the codebase:
    ```tsx
    public projectMenuItemClickHandler(e: IUserProjectMenuItemClick): void {
        switch (e.menuItem) {
          case UserProjectMenuItems.Rename:
            e.item.rename = true;
            break;
          case UserProjectMenuItems.Export:
            this.exportProject(e.item);
            break;
          case UserProjectMenuItems.Clone:
            this.cloneProject(e.item);
            break;
        }
      }
    ```

### Main benefits

More generally, by using enums we ensure that a given data structure is
preserved unaltered and intact throughout the codebase which is very useful when
multiple developers are working with the same classes and components. This
creates a high-level canonical form of a given data structure that may be used
in multiple contexts. This reduces the likelihood of different developers
'reinventing the wheel' and duplicating common data structures, helping to
promote modularity and minimise technical debt.

### Constraints and best practices

There are some important constraints that should be borne in mind when using
enums:

- **Initialise string enums!**
  - String enums must be initialised with a string or a reference to another
    enum. They cannot be tacitly defined as is the case with numeric enums
- **Don't mix data types!**
  - It is technically possible to construct an enum that contains both numbers
    and strings but this should be avoided as it can lead to unintended
    side-effects in the incrementation process. It also kind of undermines the
    purpose of enums. In this scenario, a custom type would probably be more
    appropriate.
- **Strings only as keys**
  - In contrast to a `Map` or object an enum cannot have a numeric key. It must
    always be a string.
