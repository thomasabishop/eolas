---
categories:
  - Programming Languages
tags:
  - javascript
  - react
  - testing
---

# Test: Basic prop passing

```js
import { render, screen } from "@testing-library/react";

describe("<CertificateHtml />", () => {
  it("should render the values passed as props", () => {
    // Arrange:
    const stub = {
      titleOfActivityOrProgramme: "Filming",
      nameOfDepartment: "The film department",
    };

    // Act:
    render(<CertificateHtml {...stub} />);

    // Assert:
    expect(screen.getByText("Filming")).toBeInTheDocument();
    expect(screen.getByText("The film department")).toBeInTheDocument();
  });
});
```

Or, loop:

```js
for (const entry of Object.values(stub)) {
  expect(screen.getByText(entry)).toBeInTheDocument();
}
```
