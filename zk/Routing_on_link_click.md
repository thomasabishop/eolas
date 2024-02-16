---
categories:
  - Programming Languages
tags:
  - javascript
  - react
  - testing
---

# Test: Routing on link click

## Component

```jsx
const CertificateHtmlLink = () => {
  return (
    <div className="certificate-html-link html-version-message">
      <Link className="btn btn-primary ml-2" to="/some-location">
        View HTML version
      </Link>
    </div>
  );
};
```

## Test

```js
import { render, fireEvent } from "@testing-library/react";
import { Router } from "react-router-dom";

describe("<CertificateHtmlLink", () => {
  it("should link to dynamic HTML certificate page URL on click event", () => {
    // Arrange:
    const history = createMemoryHistory({ initialEntries: ["/"] });

    // Act:
    const { getByText } = render(
      <Router history={history}>
        <CertificateHtmlLink to="/certificate/123" />
      </Router>
    );

    // Assert:
    expect(history.location.pathname).toBe("/");
    fireEvent.click(getByText("View HTML version"));
    expect(history.location.pathname).toBe("/certificate/123");
  });
});
```
