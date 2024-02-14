# Turbo 8 Frame Navigation Test

This repository is a reproduction of Turbo 8 frame navigation regression.

Prior to Turbo 8, frame navigations that have been promoted to visits interact
with browser history, so back and forward work as expected.  With Turbo 8,
browser back navigations have no affect on the page content, and subsequent
forward navigation is not a restoration.

There's a system test that shows this behaviour:

```
bin/setup
bin/rails test:system
```
