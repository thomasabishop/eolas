---
categories:
  - Databases
  - Programming_Languages
tags: [SQL]
---

# SQL: Demonstration database

For the purposes of demonstration we will work from a made-up database. The examples are created using SQLite but they are transferable to any SQL database.

This database stores information about computers, their manufacturers, properties and sale data:

- The overall database is `computer_sales`
- It contains the following [tables](/Databases/Relational_database_architecture.md#table): `manufacturer`, `model`, `sales`
- Example [fields](/Databases/Relational_database_architecture.md#field) that belong to these tables: `manufacturer_id` , `model_id` , `name`, `year_founded` , `ram` , `sale_date`

Below are the `model` and `manufacturer` tables output from the SQLite terminal client.

The model table:

```
model_id    manufacturer_id  name                    cpu_speed   ram         cores       wifi        release_date
----------  ---------------  ----------------------  ----------  ----------  ----------  ----------  ------------
1           1                Raspberry Pi 1 Model A  0.7         256.0       1           0           2013-02-01
2           1                Raspberry Pi 1 Model B  0.7         256.0       1           0           2012-04-01
3           1                Raspberry Pi 1 Model B  0.7         512.0       1           0           2012-10-01
4           1                Raspberry Pi 1 Model A  0.7         512.0       1           0           2014-11-01
5           1                Raspberry Pi 1 Model B  0.7         512.0       1           0           2014-07-01
6           1                Raspberry Pi 2 Model B  0.9         1024.0      4           0           2015-02-01
7           1                Raspberry Pi 3 Model B  1.2         1024.0      4           1           2016-02-01
8           1                Raspberry Pi 3 Model B  1.4         1024.0      4           1           2018-03-14
9           1                Raspberry Pi 3 Model A  1.4         1024.0      4           1           2018-11-01
10          1                Raspberry Pi 4 Model B  1.5         1024.0      4           1           2019-06-24
11          1                Raspberry Pi 4 Model B  1.5         2048.0      4           1           2019-06-24
12          1                Raspberry Pi 4 Model B  1.5         4096.0      4           1           2019-06-24
13          1                Raspberry Pi Zero       1.0         512.0       1           0           2015-11-01
14          1                Raspberry Pi Zero W     1.0         512.0       1           1           2017-02-28
15          2                Apple Lisa              0.008       1.0         1           0           1983-01-19
16          2                Apple iMac              3.7         8192.0      4           1           2019-03-19
17          2                Apple MacBook Pro       2.6         16384.0     6           1           2019-05-21
18          2                Apple MacBook Air       2.6         8192.0      2           1           2019-07-09
19          3                Commodore VIC-20        0.00102     0.005       1           0           1980-01-01
20          3                Commodore 64            0.001023    0.064       1           0           1982-08-01
21          3                Amiga 500               0.00716     0.5         1           0           1987-04-01
```

The manufacturer table:

```
manufacturer_id  name          url                      year_founded  trading
---------------  ------------  -----------------------  ------------  ----------
1                Raspberry Pi  <https://raspberrypi.org>  2008          1
2                Apple         <https://apple.com>        1976          1
3                Commodore     <https://www.commodore.c>  1954          0
```
