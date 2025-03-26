---
tags: [python]
created: Sunday, March 16, 2025
---

# Using a context manager in Python

For certain process that have a start and an end state such as opening and
closing a file or connecting and disconnecting from a database, instead of
having dedicated open/close, connect/disconnect handling, you can use a Context
Manager as a form of "syntactic sugar".

By using a Context Manager you can use a more Pythonic construction of e.g:

```py
with open('/file-path') as file:
    ... # handle file operation
```

```py
with open DatabaseService() as connection:
    ... # do database stuff
```

When you use this approach it is an abstraction over `try...finally`. Meaning
the clean-up `finally` operation will run automatically without you having to
explicitly handle it.

Some common processes such as file handling have the Context Manager built-in
and you don't have to explicitly provision it.

Other processes may lend themselves to `with` syntax but you have to do the
configuration yourself.

One such example is creating a database accessor. Below I have done this by
using `__enter__` and `__exit__` methods on a database class:

```py
class DatabaseService:
    def __init__(self, db_name, db_path):
        self.db_name = db_name
        self.db_path = db_path
        self.connection: Optional[sqlite3.Connection] = None

    def connect(self) -> Optional[sqlite3.Connection]:
        if self.connection is not None:
            return self.connection

        try:
            if not os.path.exists(self.db_path):
                os.makedirs(self.db_path)
                print("INFO Created database directory")
            self.connection = sqlite3.connect(f"{self.db_path}/{self.db_name}.db")
            self.connection.execute("PRAGMA foreign_keys = ON")
            return self.connection

        except Exception as e:
            raise Exception(f"ERROR Problem connecting to database: {e}")

    def disconnect(self) -> None:
        try:
            if self.connection is not None:
                self.connection.close()
                self.connection = None
        except Exception as e:
            raise Exception(f"ERROR Problem disconnecting from database: {e}")

    def __enter__(self) -> sqlite3.Connection:
        connection = self.connect()
        if connection is None:
            raise RuntimeError("Failed to establish database connection")
        return connection

    def __exit__(self) -> None:
        self.disconnect()
```

Then I can use it like so:

```py
with DatabaseService() as connection:
    cursor = connection.cursor()
    cursor.execute(...)
```
