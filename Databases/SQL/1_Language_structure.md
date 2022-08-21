---
categories:
  - Databases
  - Programming Languages
tags: [SQL]
---

# SQL: Language structure

Before we start using the syntax we need to understand the grammar:

![](/img/Pasted_image_20220314155028.png)

Expressions differ from clauses and predicates in that they are not the mechanism for returning data (i.e. declaring a clause and a logical colllllndition) they do something to the data, as part of the retrieval. This is a bit subtle:

- `SELECT name FROM model WHERE cores = "4"`
  - This retrieves the models that have 4 cores
- `SELECT count(*) FROM model WHERE cores = "4" `
  - This counts the number of models that are returned where the counting is a function over and above the retrieval itself.

### Examples from `computer_sales.db`

`sqlite> SELECT * from model WHERE cpu_speed=0.7` : return all models with a CPU speed equal to 0.7:

```
model_id    manufacturer_id  name                    cpu_speed   ram         cores       wifi        release_date
----------  ---------------  ----------------------  ----------  ----------  ----------  ----------  ------------
1           1                Raspberry Pi 1 Model A  0.7         256.0       1           0           2013-02-01
2           1                Raspberry Pi 1 Model B  0.7         256.0       1           0           2012-04-01
3           1                Raspberry Pi 1 Model B  0.7         512.0       1           0           2012-10-01
4           1                Raspberry Pi 1 Model A  0.7         512.0       1           0           2014-11-01
5           1                Raspberry Pi 1 Model B  0.7         512.0       1           0           2014-07-01
```

```
count(*)
----------
5
```

> Any value that is not a number should be in single-quotes, never double quotes

## Main commands

There are obviously many SQL commands but most standard CRUD actions can be executed with a small number of commands:

- `SELECT`
- `UPDATE`
- `CREATE`
- `INSERT`
- `DELETE`
