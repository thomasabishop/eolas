---
categories:
  - Programming Languages
tags:
  - frontend
---

# Basics of Web Components

Web Components are custom HTML elements like those we create with frameworks
like React and Angular but which are native to HTML and the DOM and therefore do
not require any special compilation or libraries.

- Designed to be interoperable with normal HTML
- Designed to be interoperable with component frameworks like React
- Designed to be highly modular and reusable
- Utilise the shadow DOM which is like the virtual DOM but native to the browser
  and invocable through plain JavaScript. A bit like an iFrame within the
  "light" DOM and helps greatly with style-scoping.

## Example of composing a web component:

```js
// MyComponent.js
class MyComponent extends HTMLElement {
  connectedCallback() {
    this.innerHTML = `<h1>Hello world</h1>`;
  }
}

customElements.define("my-component", MyComponent);
``;
```

```html
<!-- index.html -->
<my-component></my-component>
```

## Resources

[A complete introdution to Web Components](https://kinsta.com/blog/web-components/)
