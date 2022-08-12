---
tags:
  - Programming_Languages
  - javascript
  - react
---

# React application structure

When you use `create-react-app` it creates a default directory structure that is a sensible one to follow:

```
build/
public/
	index.html
src/
	index.js
	App.js
```

## `public/`

- `public` constains the `index.html` file via which React connects to the traditional DCOM. Within `index.html` you have `<div id="root">...</div>` as the entry point where your application is injected into the standard DOM.

- Everything in this folder is as per standard web development practice.

- You shouldn't include React code here but you can paste necessary links and metadata to the `head` of `index.html`

## `src/`

- It automatically contains `index.js` . This imports `React` and `ReactDOM` and contains the `ReactDOM.render()` method:
  ```js
  ReactDOM.render(
    <App />
  document.getElementById('root')
  );
  ```
- The `App` component is your parent component and the container for your app. It is where you will import your sub-components.
- If you are using React Router `App` becomes the index for the different page components. See [Routing](./Routing.md) for more detail.

## `build`

`build` houses the compiled version of your application, ready to be deployed to a server. All contents are minified, compressed and optimised using Webpack.

Once you have executed `npm run build` you can test the output by using `serve` via the console:

```bash
serve -s build
```

`build` will comprise a minified version of `index.html` and a `static/` directory which holds your compiled CSS and JS that `index.html` links to, as per a standard static website.
