---
tags: [python, databases, SQL, SQLite]
created: Thursday, November 07, 2024
---

# Using SQLite with Python

SQLite is part of the core library, you do not require a separate package

```py
import sqlite3
```

## Connect to database

Connect to an existing SQLite `.db` file or create a new database with the same
command:

```py
connection = sqlite3.connect("my_database.db")
```

## Disconnect from database

```python
connection.close()
```

## Querying

`connect` exposes a `cursor` entity. This is used for executing changes against
the database file.

### Example: creating a table

```python
CREATE_TAGS_TABLE = """
CREATE TABLE IF NOT EXISTS tags (
    name TEXT PRIMARY KEY
)
"""

cursor = connection.cursor()
cursor.execute(CREATE_TAGS_TABLE)
cursor.commit()

# Confirm changes

cursor.execute("SELECT name from sqlite_master WHERE type='table'")
print(cursor.fetchall())
# (tags)
```

Note that it is necessary to `commit` the changes. The cursor object just stores
the operation in memory and does not execute until you specifically commit them.

## Prepared statements and parameterised queries

### Parameterised queries

```py
username = "thomas"
password = "123"
cursor.execute("SELECT * FROM users WHERE username = ? AND password = ?",
            (username, password))
```

Alternatively, pass the [tuple](Tuples_in_Python.md) directly:

```python
login_data = ("thomas", "123")
cursor.execute("SELECT * FROM users WHERE username = ? AND password = ?",
login_data)
```

### Prepared statements

> With prepared statements you have to pass in the parameters as a dictionary

```python
user_data = {
    "username": "thomas",
    "email": "thomas@email.com"
}

cursor.execute("INSERT INTO users (username, email) VALUES (:username, :email)",
               user_data)
```

In the example above it so happens that we already have a dictionary we are
working with. If you want to use a prepared statement and you don't have a
dictionary already, you will need to construct one as part of the query, e.g:

```python
cursor.execute("INSERT INTO table_name (value_one, value_two) VALUES (:value_one, :value_two)", { value_one: 'foo', value_two: 'bar'})
```
