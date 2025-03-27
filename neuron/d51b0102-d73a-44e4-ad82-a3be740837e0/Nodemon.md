---
tags:
  - node-js
---

# Nodemon

We don't want to have to restart the local server every time we make a change to
our files. We can use `nodemon` instead of `node` when running our `index.js`
file so that file-changes are immediately registered without the need for a
restart.

This is a wrapper around the `node` command so it doesn't require any
configuration. Once installed, update your start script from `node index.js` to
`nodemon index.js`.
