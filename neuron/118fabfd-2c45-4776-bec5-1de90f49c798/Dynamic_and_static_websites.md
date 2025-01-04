---
tags: [world-wide-web]
created: Friday, December 20, 2024
---

# Dynamic and static websites

When we talk about dynamic and static websites we are talking about the role of
the server, not anything to do with how the website behaves for the user.

A static site's content comes unchanged from the files on the server whereas a
dynamic site's content is generated on the server.

With a static website, the content of the site has been build before a request
for it is made. It's HTML, CSS and JS are stored on the server and are simply
returned to the client in this form when they are requested.

When content is requested on a dynamic website the HTML is generated on-the-fly
on the server-side and returned to the client. Typically a request will be made
for an item of content, the data will be fetched on the backend from a DB and
then formatted as HTML and sent back to the client.

Static websites can be more performant because of the lack of BE processing
however it means that any runtime processing or special rendering must be
handled by the frontend JavaScript, without relying on server languages.

Take the sourcing of remote data. With a dynamic site this can be handled in a
single request because the backend can fetch the data and return to the client
with the rendering applied. On the frontend, JS would have to make a request to
an endpoint that calls a backend service that returns the data. Having received
the raw data it would then need to render it.

Nowadays there is generally a mixed approach. This distinction was more
important in the early days of the web.
