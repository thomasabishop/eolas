---
tags: [new, json]
---

# jq

## Remove property

Remove property from a JSON array of objects:

```json
{
  "member_inputs": [
    {
      "name": "Thomas",
      "input_type": "select"
    },
    {
      "name": "Martha",
      "input_type": "text"
    }
  ]
}
```

```sh
jq '.member_details |= map(del(.input_type))' memberDetails.json
```

> Add '-i' to modify the source file directly (in-place)

> Multiple properties can be deleted simply by chaining,
> e.g.`(del(.input_type, .another_property))`
