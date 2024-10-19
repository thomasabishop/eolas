---
tags:
  - python
  - time
---

# Dates in Python

Python's built-in `datetime` module provides various classes for manipulating
dates and times.

### Importing `datetime`

```python
import datetime
```

### Getting Current Date and Time

Get the current date and time using `datetime.datetime.now()`.

```python
current_datetime = datetime.datetime.now()
print("Current datetime:", current_datetime)
```

### Creating Date Objects

To create a date object, use `datetime.date`, specifying the year, month, and
day.

```python
some_date = datetime.date(2021, 9, 30)
print("Some date:", some_date)
```

### Creating Time Objects

To create a time object, use `datetime.time`, specifying the hour, minute,
second, and optionally microsecond.

```python
some_time = datetime.time(13, 24, 56)
print("Some time:", some_time)
```

### Creating Datetime Objects

To create a datetime object, use `datetime.datetime`.

```python
some_datetime = datetime.datetime(2021, 9, 30, 13, 24, 56)
print("Some datetime:", some_datetime)
```

### Extracting components

Extract components from a datetime object:

```python
print("Year:", some_datetime.year)
print("Month:", some_datetime.month)
print("Day:", some_datetime.day)
print("Hour:", some_datetime.hour)
print("Minute:", some_datetime.minute)
print("Second:", some_datetime.second)
```

### Formatting `datetime` objects: `strftime`

The `strftime` method (_string format time_) converts a datetime object to a
string according to the specified format.

This would typically be used when we have been working with a computer-friendly
format of a date such as unix seconds which we then want to output in a more
readable format.

Use `strftime` to express the current date as YYYY-MM:

```python
now = datetime.now()
formatted = now.strftime('%Y-%m')
print(formatted)
# 2024-06
```

Express the current date as YYYY-MM-DD H:M:S:

```python
formatted_datetime = some_datetime.strftime('%Y-%m-%d %H:%M:%S')
print("Formatted datetime:", formatted_datetime)
```

Express a [unix timestamp](./Time_and_computers.md) as DD-MM-YYYY:

```py
def convert_timestamp(timestamp):
    date_object = datetime.datetime.fromtimestamp(timestamp)
    formatted_date = date_object.strftime("%d-%m-%Y")
    return formatted_date

converted = convert_timestamp(1689023491)
print(converted)
# 10-07-2023
```

### Parsing `datetime` strings: `strptime`.

The `strptime` (_string_parse_time) method_ parses a string representing a date
and/or a time according to a specified format and returns a `datetime` object.

Typically be used when want to carry out some sort of transformation on time
data that we are sourcing in a particular format.

Receive a date in the format DD-MM-YYYY and convert to datetime object:

```python
date_string = "18-06-2024"
datetime_object = datetime.strptime(date_string, '%d-%m-%Y')
print(date_object) # 2024-06-18 00:00:00
```

Extract the year from a UTC date format:

```python
datetime_obj = datetime.strptime("2024-03-27T10:44:28Z", "%Y%m%dT%H%M%SZ")
print(datetime_obj.strftime('%Y'))
# 2024

```
