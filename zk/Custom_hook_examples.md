---
tags:
  - javascript
  - react
  - react-hooks
---

# Custom hook examples

## Determine viewport width

### Hook

```js
// useViewportWidth.js
import { useEffect, useState } from "react";

export default function (viewportWidth) {
  const [matchesViewportWidth, setMatchesViewportWidth] = useState(false);

  useEffect(() => {
    const handleResize = () =>
      window.innerWidth < viewportWidth
        ? setMatchesViewportWidth(true)
        : setMatchesViewportWidth(false);

    window.addEventListener("resize", handleResize);

    // Call on initialization to determine initial width
    handleResize();

    // Clean-up listener to prevent memory leaks
    return () => window.removeEventListener("resize", handleResize);
  }, [viewportWidth]);

  return matchesViewportWidth;
}
```

### Unit test

```js
import useViewportWidth from "./useViewportWidth";
import { fireEvent } from "@testing-library/react";
import { act } from "react-dom/test-utils";
import { renderHook } from "@testing-library/react-hooks";

describe("useViewportWidth", () => {
  it("returns `true` when window resized to mobile viewport width", () => {
    // Arrange
    const { result } = renderHook(() => useViewportWidth(768));

    // Act
    act(() => {
      window.innerWidth = 500;
      fireEvent(window, new Event("resize"));
    });

    // Assert
    expect(result.current).toBe(true);
  });

  it("returns `false` when window resized to width greater than mobile viewport", () => {
    // Arrange
    const { result } = renderHook(() => useViewportWidth(768));

    // Act
    act(() => {
      window.innerWidth = 1058;
      fireEvent(window, new Event("resize"));
    });

    // Assert
    expect(result.current).toBe(false);
  });
})``;
```
