---
tags: [python, data-structures]
---

# Dictionaries in Python

Dictionaries are basically the Python equivalent of objects in JS.

Dictionaries:

- Are ordered (in contrast to JS)
- Are mutable
- Are indexed by a key which references a value
- Can be increased/decreased in length by adding/removing new members.

## Basic usage

Dictionaries are declared with `{...}`:

```python
cities = {
  'Wales': 'Cardiff',
  'England': 'London',
  'Scotland': 'Edinburgh',
  'Northern Ireland': 'Belfast',
  'Ireland': 'Dublin'
}

print(type(citites))
# <class 'dict'>
```

## Accessing entries

```python
print(cities['Wales'])
# Cardiff

print(cities.get('Ireland'))
# Dublin

print(cities.values())
# ['Cardiff', 'London', 'Edinburgh', 'Belfast', 'Dublin']

print(cities.keys())
# ['Wales', 'England', 'Scotland', 'Northern Ireland', 'Ireland']

print(cities.items())
# [('Wales', 'Cardiff'), ('England', 'London'), ('Scotland', 'Edinburgh'), ('Northern Ireland', 'Belfast'), ('Ireland', 'Dublin')]
```

## Predicates

```py
print('Wales' in cities)
# True

print('France' not in cities)
# True
```

## Looping

```py
for country in cities:
    print(country, end=', ')
    print(cities[country])

"""
Wales, Cardiff
England, London
Scotland, Edinburgh
Northern Ireland, Belfast
Ireland, Dublin
"""

for e in country.values():
    print(e)
```

## Updating values

```py
cities['Wales'] = 'Swansea'
print(cities)
```

## Removing values

```py
# Remove last item
cities.popitem()
print(cities)
# {'Wales': 'Cardiff', 'England': 'London', 'Scotland': 'Edinburgh', 'Northern Ireland': 'Belfast'}

# Remove specific entry by key

cities.pop('Northern Ireland')
print(cities)
# {'Wales': 'Cardiff', 'England': 'London', 'Scotland': 'Edinburgh'}

del cities['Scotland']
print(cities)
{'Wales': 'Cardiff', 'England': 'London'}
```

## Containers as values

```py
seasons = {
'Spring': ('Mar', 'Apr', 'May'),
'Summer': ('June', 'July', 'August'),
'Autumn': ('September', 'October', 'November'),
'Winter': ('December', 'January', 'February')}

print(seasons['Spring'])
print(seasons['Spring'][1])

"""
('Mar', 'Apr', 'May')
Apr
"""
```

## Merging two Dictionaries

Two separate dictionaries can be merged into a single dictionary with shared
properties with this shorthand:

```python
merged_dictionary = dictionary_one | dictionary_two

```
