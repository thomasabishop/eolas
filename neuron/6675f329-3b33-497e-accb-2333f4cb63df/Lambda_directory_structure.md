---
tags:
  - AWS
  - aws-lambda
---

# Lambda directory structure

I am using the following structure for my lambdas:

```
lambda-name/
    events/
    function-name/
        src/
            index.js
        tests/
        local-env.json
        production-env.json
        package.json
    template.yaml
    README.md
```
