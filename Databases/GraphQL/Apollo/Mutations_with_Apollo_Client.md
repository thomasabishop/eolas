---
title: Mutations with Apollo Client
categories:
  - Databases
tags: [graphql]
---

# Mutations with Apollo Client

Queries are read-only operations. Mutations are write-only operations.

Just like the `Query` type, the `Mutation` type serves as an entrypoint to the schema.

## Naming convention

- Use verb: `add`, `create`, `delete`
- Refer to the datatype

For example `addSpaceCat(){}`

## Demonstration mutation

We are going to create a mutation that increments the `numberOfViews` field on the `Track` type:

## Updating the schema

```js
type Mutation {
    incrementTrackViews(id: ID!): IncrementTrackViewsResponse!
}


// Define a specific response type that specifically matches our needs
type IncrementTrackViewsResponse {
    code: Int! // status code
    success: Boolean! // whether mutation was successful
    message: String! // what to say if mutation successful
    track: Track   // not nullable because might error
}
```

Based on this schema, the mutation will recieve a `Track` id and increment the specified `Track`. It will return an object comprising the newly updated `Track` and a bundle of properties that provide feedback on the status of the operations: a status code, whether it succeeded, and a message.

## Updating the data source

Remember that our sole data source in the demonstration project is a REST API. We handle it within GraphQL using Apollos `RESTDataSource` class. We need to add a method to this class that will increment the track views. We wil use the `PATCH` REST method:

```js
class TrackAPI extends RESTDataSource {
  constructor() {...}
  getTracksForHome() {...}
  getAuthor(authorId) {...}
  getTrack(trackId){...};

  incrementTrackViews(trackId) {
    return this.patch(`track/${trackId}/numberOfViews`);
  }
}
```

The `patch()` method is procided by the `RESTDataSouce` class that `TrackAPI` inherits from

## Adding resolver

Next we need a resolver that corresponds to the mutation we have defined in the schema. We will need to handle successful responses as well as errors.

### Success case

As always we match the shape of the schema:

```js
const resolvers = {
  Query: {
    // ...query resolvers
  },
  Mutation: {
    // increments a track's numberOfViews property
    incrementTrackViews: async (_, { id }, { dataSources }) => {
      const track = await dataSources.trackAPI.incrementTrackViews(id);
      return {
        code: 200,
        success: true,
        message: `Successfully incremented number of views for track ${id}`,
        track,
      };
    },
  },
};
```

There's more going on with this resolver than the previous one. As is standard, we call the API using the `TrackAPI` class. However we don't just immediately return this when it executes. This is because the schema specifies that the retrun type `IncrementTrackViewsResponse` requires more than just the updated `Track`. So we wait this and return it with the cluster of metadata about the mutation response (`code`, `success`, and `message`).

### Error case

We can extend the Mutation resolver to allow for errors. We'll do this by refactoring the resolver into a `try...catch` block and adding the error handling in the `catch`.

We'll harness the details that are provided by Apollos' own `err` object which is returned by the `RESTDataSource` class that our resolver ultimately traces back to:

```js
const resolvers = {

    Query: {
        // ...query resolvers
    }

    Mutation: {
        incrementTrackViews: async (_, {id}, {dataSources}) => {
            try {
                const track = await dataSources.trackAPI.incrementTrackViews(id);
                return {
                    code: 200,
                    success: true,
                    message: `Successfully incremented number of views for track ${id}`,
                    track
                };
            } catch (err) {
                return {
                    code: err.extensions.response.status,
                    success: false,
                    message: err.extensions.response.body,
                    track: null
                };
            }
        },
    }
}
```

## The `useMutation` hook

We invoke the `useMutation` hook to issue mutations from the client-side.

As with queries and [query constants](/Databases/GraphQL/Apollo/Apollo_Client.md#query-constants) we wrap our mutation in a `gql` template string:

```js
const INCREMENT_TRACK_VIEWS = gql`
  mutation IncrementTrackViews($incrementTrackViewsId: ID!) {
    incrementTrackViews(id: $incrementTrackViewsId) {
      code
      success
      message
      track {
        id
        numberOfViews
      }
    }
  }
`;
```

We then pass it to the `useMutation` hook including an options object with our variables. (This time the specific variable is named):

```js
import { gql, useMutation } from "@apollo/client";

useMutation(INCREMENT_TRACK_VIEWS, {
  variables: { incrementTrackViewsId: id },
});
```

`useMutation` returns an array of two elements:

1. The mutation function that actually executes
2. An object comprising (`loading`, `error`, `data`) - this is the same as is the return value of `useQuery`.

So we can destructure like so (we don't always need the second element);

```js
const [incrementTrackViews, dataObject] = useMutation(INCREMENT_TRACK_VIEWS...)
```

Given that we can isolate the mutation function as the first destructured element of the array, we could then attach `incrementTrackViews` to a button or other frontend interaction.
