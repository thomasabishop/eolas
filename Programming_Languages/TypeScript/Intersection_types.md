---
categories:
  - Programming Languages
tags:
  - typescript
---

# Intersection types

Like union types, intersection types allow us to combine the properties of existing primitive and custom types to make composites.

### Creating an intersection

Say you have the following three types:

```ts
type IConcert = {
  date: number;
  location: string;
  band: string;
};

type IConference = {
  date: number;
  location: string;
  keynoteSpeaker: string;
};

type IMeeting = {
  date: number;
  location: string;
  agenda: string[];
};
```

Each type corresponds to a different event and has two properties in common with the other events: `date` and `location`.

Rather than repeat these properties for each individual type, we could create a general `IEvent` type and apply this as an intersection to each of the individual event types:

```ts
// The common event type
type IEvent = {
  date: number;
  location: string;
};
```

```ts
// The intersection

type IConcert = IEvent & {
  band: string;
};

type IConference = IEvent & {
  keynoteSpeaker: string;
};
```

> In the case of interfaces, instead of using `&` we would write `interface IConcert extends IEvent`

### Alternative method

There is another equivalent way of intersecting the types. We could first define `IConcert` and `IConference` as their own types (without `extends` or `&`) and then intersect with, e.g., type IConcert = SelfStandingConcertType & IEvent.

### Benefits of intersections

- It is more concise and we do not repeat ourselves needlessly
- Common properties can be modelled **in one place** which makes updates and changes much easier: we do not have to change multiple type declarations, just change the 'master' type that is intersected with the variants.
- It is more readable: we can see which properties are unique to the type without having to parse repeated properties.

## Set theory: understanding errors

With intersections we literally use the & operator which discloses that the logic is equivalent to logical AND: a member of the intersection must have the properties of both types. In the case of primitive values this is impossible or, more accurately, it results in an empty set because, for example, `string` and `boolean` do not share any common values. This means you will get an error if you assign an intersection type to a value that does not have all the features of each custom type in the intersection.
