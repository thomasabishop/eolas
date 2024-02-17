---
categories:
  - Programming Languages
tags: [python, APIs]
---

# Making network requests in Python

We can use the `requests` package to make API requests to
[RESTful](RESTful_APIs.md) resources and handle the data as
JSON.

```sh
pip install requests
```

Here is a basic architecture for making a `GET` request in Python.

```py
import requests

def get_data(url):
    response = requests.get(url)
    if response.status_code == 200:
        return response.json()
    else:
        raise Exception(
            f"Failed to fetch data from API. Status code: {response.status_code}")

def main():
    url = "https://dummyjson.com/products/1"

    try:
        data = get_data(url)
        print(data)

    except Exception as e:
        prin(e)

if __name__ == "__main__":
    main()
```

## Parsing returned data

Running `main` returns:

```py
{
   "id":1,
   "title":"iPhone 9",
   "description":"An apple mobile which is nothing like apple",
   "price":549,
   "discountPercentage":12.96,
   "rating":4.69,
   "stock":94,
   "brand":"Apple",
   "category":"smartphones",
   "thumbnail":"https://i.dummyjson.com/data/products/1/thumbnail.jpg",
   "images":[
      "https://i.dummyjson.com/data/products/1/1.jpg",
      "https://i.dummyjson.com/data/products/1/2.jpg",
      "https://i.dummyjson.com/data/products/1/3.jpg",
      "https://i.dummyjson.com/data/products/1/4.jpg",
      "https://i.dummyjson.com/data/products/1/thumbnail.jpg"
   ]
}
```

This is JSON but in Python is a
[dictionary](Dictionaries_in_Python.md)

We can use standard dictionary methods to handle the data. For example, we'll
add to the existing `try` block:

```py
example_key = "brand"  # Replace with the key you want to access from the JSON data
    if example_key in data:
        print(f"Value of '{example_key}':", data[example_key])
    else:
        print(f"'{example_key}' not found in the JSON data")
```

Which, if successful, outputs:

```
Value of 'brand': Apple
```
