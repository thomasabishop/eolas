---
categories:
  - Programming Languages
tags:
  - javascript
  - react
---

# Controlled components

Controlled components relate to how you use forms in React.

You can use standard form HTML within a React component but applying React state to the form via controlled components gives you greater power over what you do with the inputs and how you handle the data that is received.

Standard HTML forms have a separate state from the rest of the document object and this is highly mutable. It can send requests to a server and reload the page. This mutability can obviously interfere with the state you maintain in your React components; this is why it is best to manage form state along with React state.

We can combine the two [native HTML form state and React state] by making the React state be the “single source of truth”. Then the React component that renders a form also controls what happens in that form on subsequent user input. An input form element whose value is controlled by React in this way is called a “controlled component”.
