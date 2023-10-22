---
categories:
  - Programming Languages
tags: [javascript, testing, jest]
---

# Testing with Jest

## Mocking classes/modules

### Classes

Let' say we have this class:

```js
// database.js
class Database {
  connect() {}
  save(data) {}
}
```

Then to mock:

```js
import Database from "./database";

// This will mock the whole Database class, replacing all methods with jest mock functions.
jest.mock("./database");

test("should use mocked save method", () => {
  const dbInstance = new Database();

  // Mocking the save method with a specific return value
  dbInstance.save.mockReturnValue(true);

  const result = dbInstance.save({ key: "value" });

  expect(result).toBe(true);
  expect(dbInstance.save).toHaveBeenCalledWith({ key: "value" });

  // The connect method is still a mock function (but without a specific behavior).
  dbInstance.connect();
  expect(dbInstance.connect).toHaveBeenCalled();
});
```

### Modules

Say we have the following module file:

```js
// utils.js
export const doSomething = () => {
  // ...
};

export const fetchUserData = async (userId) => {
  const response = await axios.get(`/api/users/${userId}`);
  return response.data;
};
```

Mocked:

```js
jest.mock("./utils", () => {
  return {
    doSomething: jest.fn(() => "mocked doSomething"),
    fetchUserData: jest.fn((userId) =>
      Promise.resolve({ id: userId, name: "Mock User" })
    ),
  };
});

test("should use mocked module functions", () => {
  expect(utils.doSomething()).toBe("mocked doSomething");
  expect(utils.doSomething).toHaveBeenCalled();

  const result = await utils.fetchUserData(123);

  expect(result).toEqual({ id: 123, name: "Mock User" });
  expect(utils.fetchUserData).toHaveBeenCalledWith(123);

});
```

### Inline mocking versus "per test" mocking

There are two different architectures that we can use when mocking modules and classes: **inline** and **per test** mocking.

Here is the inline case:

```js
jest.mock("./some_module.js", () => {
  return {
    someFunction: jest.fn(() => "value"),
    someFunctionWithParam: jest.fn((param) => ({
      property: param,
    })),
    someAsyncFunction: jest.fn(() => Promise.resolve("value")),
  };
});
```

Here is the per test case:

```js
import { someModule } from "./some_module.js";

let someModuleMock;

someModuleMock = {
  someFunction: jest.fn(() => "value"),
  someFunctionWithParam: jest.fn((param) => ({
    property: param,
  })),
  someAsyncFunction: jest.fn(() => Promise.resolve("value")),
};

someModule.mockImplementation(() => someModuleMock);

it("should do something", () => {
  const newValue = "new value";
  someModule.someFunction.mockReturnValue(newValue);
});
```

The benefits of inline:

- Inline is good because everything is set up in one place
- Inline keeps consistency accross tests: every test case in the file will use the same mocked function unless overwritten within a test
- It lends itself to being a _global_ mock that can be used accross test files in a `__mocks__/` directory

The benefits of per-test:

- You can very mock implementations within the file, providing more granular control. You can redefine `someModuleMock` or parts of it (`someModule.someFunction`) throughout your test file to accomodate varied requirements between tests
- It’s beneficial when your tests have divergent requirements, as you can perform more detailed setups and overrides for each individual test case or suite, ensuring mocks are configured exactly as required.

#### Overriding inline mocks

Per test mocking makes it straightforward to change the test parameters of the mocked module or class but you can also override inline mocks.

If we were using the `someModule` inline mock and we wanted to override the `someFunction` function that we have defined inline, we would first import the `someFunction` function and then use `mockImplementation` against it:

```js
import { someFunction } from "./some_module.js";
someFunction.mockImplementation(() => "custom value");
expect(someFunction()).toBe("custom value");

// Optional: Restore the original mock implementation after the test
someFunction.mockRestore();
```

Note: although we are importing `someFunction` we are not actually importing the real function tha belongs to the module. Because Jest mocks all of its properties and methods with the inline syntax, we are actually just importing that which Jest has aready mocked, but the syntax is a bit misleading.

#### Applied to classes

The same approaches (with minor differences) can be used with classes:

Using inline (where the class is not the default export):

```js
jest.mock("./SomeClass", () => {
  return {
    SomeClass: jest.fn().mockImplementation(() => {
      return {
        someFunction: jest.fn(() => "value"),
        someFunctionWithParam: jest.fn((param) => ({ property: param })),
        someAsyncFunction: jest.fn(() => Promise.resolve("value")),
        someOtherFunctionThatResolves: jest.fn().mockResolvedValue("some data"),
      };
    }),
  };
});
```

Using per test:

```js
import SomeClass from "./someClass";

jest.mock("./someClass");

let someClassMock = {
  someFunction: jest.fn(() => "value"),
  someFunctionWithParam: jest.fn((param) => ({ property: param })),
  someAsyncFunction: jest.fn(() => Promise.resolve("value")),
};

// Mock class implementation
SomeClass.mockImplementation(() => someClassMock);

it("should do something", () => {
  const newValue = "new value";
  someClassMock.someFunction.mockReturnValue(newValue);
});
```

## Check that a function has been called within another function

```js
function toBeCalledFunction() {
  console.log("Original function called");
}

function callerFunction() {
  toBeCalledFunction();
}
```

```js
test("spy on toBeCalledFunction", () => {
  const spy = jest.spyOn(global, "toBeCalledFunction"); // Replace `global` with the appropriate object/context if the function is not global
  callerFunction();
  expect(spy).toHaveBeenCalled();
  spy.mockRestore(); // Restore the original function after spying
});
```

## Mock a function that needs to resolve to something within another function

We have two functions, one that gets data and another that processes it. We want to mock the function that gets data and return a value that the processing function can use.

```js
async function getData() {
  // ... Fetch some data from an API or database
  return fetchedData;
}

async function processData() {
  const data = await getData();
  // ... Process the data
  return processedData;
}
```

The mocking part:

```js
const mockData = { key: "value" }; // Mocked data

jest.mock("./path-to-file-where-getData-is", () => ({
  getData: jest.fn().mockResolvedValue(mockData),
}));

test("test processData function", async () => {
  const result = await processData();
  // Now, result contains the processed version of mockData
  expect(result).toEqual(/* expected processed data based on mockData */);
});
```

We could also combine the above with a spy to check that the `getData` function was called:

```js
const getDataSpy = jest
  .spyOn(moduleContainingGetData, "getData")
  .mockResolvedValue(mockData);

const result = await processData();
expect(getDataSpy).toHaveBeenCalled();
expect(result).toEqual(/* expected processed data based on mockData */);
getDataSpy.mockRestore();
```

## Mock a function that takes arguments

```js
function addPrefix(str) {
  return `prefix-${str}`;
}
```

```js
test("dynamic mock for addPrefix function", () => {
  const mockFunction = jest.fn((str) => `mock-${str}`);

  // Example usage of mockFunction
  const result1 = mockFunction("test");
  const result2 = mockFunction("example");

  expect(result1).toBe("mock-test");
  expect(result2).toBe("mock-example");
});
```

## Mocking network requests

### Mocking Axios

```js
jest.mock("axios", () => ({
  get: jest.fn().mockResolvedValue(mockData),
  post: jest.fn().mockResolvedValue(mockData),
}));
```

Or we could implement this way:

```js
jest.mock("axios");
axios.get.mockResolvedValue({ data: "mockedData" });
axios.post.mockResolvedValue({ data: "mockedData" });
```

Then we can use the mocked axios functions in our tests:

```js
const result = await fetchData(); // the function that uses Axios `get``
expect(result).toBe("mockedGetData");

const result = await sendData({ key: "value" }); // the function tha uses Axios `post`
expect(result).toBe("mockedPostData");
```

### `mockImplementation`

For more configurable cases we can use `mockImplementation`:

```js
it("sends data", async () => {
  // Mock axios.post using mockImplementation
  axios.post.mockImplementation((url, data) => {
    if (data.key === "value") {
      return Promise.resolve({ data: "mockedPostData" });
    } else {
      return Promise.reject({ error: "An error occurred" });
    }
  });

  const result = await sendData({ key: "value" });

  expect(result).toBe("mockedPostData");
});
```

If we want to change the `get` and `post` values in different tests, we can do so by using `mockImplementation`:

## Mocking exceptions

Again we use `mockImplementation`:

Say we have the following function:

```js
// fetchData.js
import axios from "axios";

const fetchData = async (url) => {
  try {
    const response = await axios.get(url);
    return response.data;
  } catch (error) {
    throw new Error("Error fetching data");
  }
};

export default fetchData;
```

We would mock the success and the error as follows:

```js
import axios from "axios";
import fetchData from "./fetchData";

jest.mock("axios");

describe("fetchData", () => {
  it("fetches data successfully", async () => {
    axios.get.mockResolvedValue({ data: "mockedData" });

    const result = await fetchData("https://api.example.com/data");

    expect(result).toBe("mockedData");
  });

  it("throws an error when fetching fails", async () => {
    axios.get.mockImplementation(() => {
      throw new Error("API error");
    });

    // We use an asynchronous assertion here because we're expecting a promise to reject
    await expect(fetchData("https://api.example.com/data")).rejects.toThrow(
      "Error fetching data"
    );
  });
});
```
