---
tags:
  - python
  - time
---

# Dates in Python

Python's built-in `datetime` module provides various classes for manipulating
dates and times. Below are some common use-cases with examples.

### Importing `datetime`

First, you'll need to import the `datetime` module.

```python
import datetime
```

### Getting Current Date and Time

You can get the current date and time using `datetime.datetime.now()`.

```python
current_datetime = datetime.datetime.now()
print("Current datetime:", current_datetime)
```

### Creating Date Objects

To create a date object, you can use `datetime.date`, specifying the year,
month, and day.

```python
some_date = datetime.date(2021, 9, 30)
print("Some date:", some_date)
```

### Creating Time Objects

To create a time object, you can use `datetime.time`, specifying the hour,
minute, second, and optionally microsecond.

```python
some_time = datetime.time(13, 24, 56)
print("Some time:", some_time)
```

### Creating Datetime Objects

To create a datetime object, you can use `datetime.datetime`.

```python
some_datetime = datetime.datetime(2021, 9, 30, 13, 24, 56)
print("Some datetime:", some_datetime)
```

### Extracting Components

You can extract various components from a datetime object like so:

```python
print("Year:", some_datetime.year)
print("Month:", some_datetime.month)
print("Day:", some_datetime.day)
print("Hour:", some_datetime.hour)
print("Minute:", some_datetime.minute)
print("Second:", some_datetime.second)
```

### Formatting Datetime Objects: `strftime`

The `strftime` method (_string format time_) converts a datetime object to a
string according to the specified format.

In the example below we use `strftime` to express the current date as YYYY-MM:

```python
now = datetime.now()
formatted = now.strftime('%Y-%m')
print(formatted)
# 2024-06
```

Another example, for YYYY-MM-DD H:M:S:

```python
formatted_datetime = some_datetime.strftime('%Y-%m-%d %H:%M:%S')
print("Formatted datetime:", formatted_datetime)
```

## Examples

### Convert a unix timestamp to readable date

```py
def convert_timestamp(timestamp):
    date_object = datetime.datetime.fromtimestamp(timestamp)
    formatted_date = date_object.strftime("%d-%m-%Y")
    return formatted_date

converted = convert_timestamp(1689023491)
print(converted)
# 10-07-2023
```
