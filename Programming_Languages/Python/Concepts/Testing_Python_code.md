---
categories:
  - Programming Languages
tags: [python, testing]
---

# Testing Python code

## `pytest`

Pytest is the most popular testing library for Python.
It is not included with the Python standard library so it must be installed with [pip](/Programming_Languages/Python/Concepts/Python_package_management.md). While it does not include a declaration library, it is robust enough to handle most scenarios having a rich and expressive set of constructs and decorators that let you declare what your tests should do, under what conditions they should run, and how they should interact with the rest of your system.

### Using `pytest`

- Pytest will automatically detect test files so long as they are named appropriately. E.g. for a module called `lorem`, it will detzect the unit test files `lorem_test.py` and `test_lorem.py`.
- In order to detect tests it should be run from a directory level above them

### Examples

Here is a basic example of using pytest for a local module callled `palindrome`:

```py
import palindrome

def test_is_palindrome():
    assert palindrome.is_palindrome('soros')
    assert palindrome.is_palindrome('torot')
    assert not palindrome.is_palindrome('chair')
```

## Mocking

`patch()` and `Mock` enable us to mock objects whilst testing (classes, functions, methods and properties belonging). They are used in combination.

The `@patch` decorator temporarily replaces a specified object in your code with a mock object and restores the original object after the test is complete

A Mock object simulates the object it replaces so that the object behaves as expected during testing. For example, if your code calls `some_function.some_method()`, and `some_method` is mocked, calling `some_method` will not execute real logic but will interact with the Mock object instead. Mock objects record details about how they have been used, like what methods have been called, with what arguments, etc., allowing you to make assertions about how they have been used.

> `@patch` and `Mock` work together because a patch is used to replace an object or attribute with a Mock object. `Mock` handles the simulated functionality, and `@patch` designates the real value we are replacing with the mock.

### Example case

I will use the following example from one my projects:

```py
# get_articles.py
def get_articles(article_type: str) -> Optional[Dict[str, Any]]:
    """Retrieve articles from Pocket API"""

    if POCKET_LAMBDA_ENDPOINT is None:
        logging.error("Error: POCKET_LAMBDA_ENDPOINT envinronment variable is not set")
        return None
    else:
        # Interpolate the article_type into the Pocket request URL
        endpoint = POCKET_LAMBDA_ENDPOINT.format(article_type=article_type)

    try:
        response = requests.get(endpoint)
        response.raise_for_status()
        return response.json()

    except RequestException as e:
        print(f"An error occurred: {e}")
        return None
```

This function: sources a URL from an environment variable, interpolates a query string into the URL (which comes in as a parameter), makes a request to the URL, and returns the response as JSON.

It has some safeguards in place:

- It checks that the environment variable is set
- It checks that the request was successful

In the example we could use a Mock object to simulate the response from the Pocket API. This would allow us to test the function without having to make a real request to the API:

```py
def test_successful_request():
    # Replace the requests.get function with a Mock object (mock_get)
    with patch("requests.get") as mock_get:
        # Specify the return value of the mock_get object)
        mock_get.return_value = Mock(ok=true)
        mock_get.return_value.json.return_value = {"value": "test"}

        # Call the function under test
        result = get_articles("gaby")

    # Assert expected outcomes
    mock_get.assert_called_once_with(endpoint)
    assert result == mock_json_response
```

The example above follows the **Arrange, Act, Assert** pattern:

| Stage   | Action                                                                          |
| ------- | ------------------------------------------------------------------------------- |
| Arrange | Replace the `requests.get` function with `patch` and set properties with `Mock` |
| Act     | Call the function under test                                                    |
| Assert  | Assert that the function under test behaved as expected                         |

## Before-each and after-each

When testing functions, we achieve this in Python using `setup_function` and `teardown_function` methods. These methods are called before and after each test method respectively.

To apply a "before each" to _every test_ just put your setup function and/or teardown function at the top level of your test module.

For example, below we set and remove an env var before and after each test:

```py
@pytest.fixture(scope="function") # specify that this fixture should be run before each function test
def setup_function():
    print("Setting up test environment...")
    os.environ["POCKET_LAMBDA_ENDPOINT"] = "https://some_endpoint.com/{article_type}"


def teardown_function():
    print("Tearing down test environment...")
    del os.environ["POCKET_LAMBDA_ENDPOINT"]
```

If the setup/teardown should only be applied to a subset of tests, just pass the name of the fixture as a parameter to the test function:

```py
def some_function(setup_function):
    # setup_function will be run before this test
```

You don't need to use the names `setup_function` and `teardown_function` so long as you are passing the fixture as a parameter.

You can also use `yield` to combine the setup and teardown into a single function:

```py
@pytest.fixture(scope="function")
def setup_function():
    os.environ["POCKET_LAMBDA_ENDPOINT"] = "https://some_endpoint.com/{article_type}"
    yield
    del os.environ["POCKET_LAMBDA_ENDPOINT"]
```

## Parameterized tests

For a sequence of tests that are repetitive, to avoid repeating the same code over and over again, we can use parameterized tests. This is where we pass in a list of parameters to the test function and the test function is run once for each parameter.

For example, in the function below I am handling numerous possible Exceptions that could be raised by the `requests.get` method:

```py
    try:
        response = requests.get(endpoint)
        response.raise_for_status()
        return response.json()

    except HTTPError as http_err:
        logging.error(f"HTTP Error occurred: {http_err}")

    except ConnectionError as conn_err:
        logging.error(f"Connection Error occurred: {conn_err}")

    except Timeout as timeout_err:
        logging.error(f"Timeout Error occurred: {timeout_err}")

    except RequestException as e:
        logging.error(f"Request Exception occurred: {e}")

    return None
```

Instead of writing something like the following for each of the four exceptions:

```py

 def test_exception_generic(caplog):
    with patch("requests.get", side_effect=RequestException("Some error")):
        result = get_articles("some_type")

    assert "Request Exception occurred" in caplog.text
    assert result is None
```

I could parameterize like so:

```py
@pytest.mark.parametrize(
    "exception_type, log_message",
    [
        (RequestException, "Request Exception occurred: "),
        (HTTPError, "HTTP Error occurred: "),
        (Timeout, "Timeout Error occurred: "),
        (ConnectionError, "Connection Error occurred: "),
    ],
)
def test_exceptions(caplog, exception_type, log_message):
    with patch("requests.get", side_effect=exception_type("Some error")):
        result = get_articles("some_type")

    assert log_message in caplog.text
    assert result is None
```

## Caplog and Syslog

`caplog` and `capsys` are built-in pytest fixtures. `caplog` lets you test log messages. `capsys` lets you test stdout and stderr. As such they are very useful when testing that error messages are logged correctly.

### `caplog`

In our example, if the endpoing environment is not set, we log an error message. We can test that this message is logged correctly using `caplog`:

```py
def test_no_endpoint_env_var(caplog):
    os.environ.pop("POCKET_LAMBDA_ENDPOINT", None)  # Remove env variable if it exists

    with caplog.at_level(logging.ERROR):
        result = get_articles("some_type")

    assert (
        "Error: POCKET_LAMBDA_ENDPOINT environment variable is not set" in caplog.text
    )
    assert result is None
```

> Note tha we pass in `caplog` as a parameter to the test function. This is how pytest knows to use it as a fixture.

### `capsys`

In our example, if the request is unsuccessful, we log an error message with `print` rather than `logging`. We can test that this message is printed correctly using `capsys` to check the stdout:

```py
def test_http_error(capsys):
    with patch("requests.get") as mock_get:
        mock_get.return_value = Mock(ok=False, status_code=404)

        # Raise an HTTP error when raise_for_status is called
        mock_get.return_value.raise_for_status.side_effect = RequestException()

        result = get_articles("some_type")

    captured = capsys.readouterr()
    assert "An error occurred" in captured.out
```

## `excinfo`

We can use `excinfo` to test that an exception is raised:

For example, instead of using `logging.error` to log an error message when the environment variable cannot be sourced. We could instead raise an exception with `ValueError`:

```py
if POCKET_LAMBDA_ENDPOINT is None:
    raise ValueError(
        "Error: POCKET_LAMBDA_ENDPOINT environment variable is not set"
    )
```

Then to test this, we would use pytest's `excinfo` fixture along with `raises`:

```py
 with pytest.raises(ValueError) as excinfo:  # Watch for the ValueError
    get_articles("some_type")

    assert "Error: POCKET_LAMBDA_ENDPOINT environment variable is not set" in str(
        excinfo.value
    )
```
