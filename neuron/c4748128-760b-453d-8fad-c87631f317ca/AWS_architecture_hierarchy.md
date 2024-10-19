---
id: oyubuqx2
tags: [AWS]
created: Monday, February 19, 2024 | 19:17
since: just now
last_modified: Monday, February 19, 2024 | 19:17
---

# AWS architecture hierarchy

From bottom up:

```mermaid
flowchart TD
    Data centres --> Availability Zones--> Regions
```

| Entity             | Description                     |
| ------------------ | ------------------------------- |
| Data center        | Warehouse full of servers       |
| Availability Zones | A cluster of data centers       |
| Region             | A cluster of Availability Zones |
