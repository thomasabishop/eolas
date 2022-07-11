---
tags:
  - Programming_Languages
  - backend
  - node-js
---
# Environments 

With a full-scale Node application you will typically run three environments:
* Development
* Testing
* Production

### Accessing current Node environment
 We can control which processes run in a particular environment via the Node envrionment variables: `process.env` (see for instance [ports](./Ports.md)).

To determine the current environment we can use the variable `process.env.NODE_ENV`. This works globally regardless of the kind of Node app we are building. In Express, there is a built in method for retrieving the current envrionment: `app.get('env')`. 

If you haven't manually set up your environments Node will return `undefined` but express defaults to `development`. 

```js

console.log(process.env.NODE_ENV); // undefined
console.log(app.get("env")); // development

```

Here is an example of setting middleware to run only in the specified environment:

```js
if (app.get("env") === 'development') {
  app.use(morgan("common"));
  console.log('Morgan enabled')
}
```
### Setting the current environment
We could test that the previous code block works by switching the environment to production. We would do this by setting the environment variable in the terminal:

```
export NODE_ENV=production
```