---
title: Introduction
type: docs
---

# Overview
`science-posters` allows to create simple but elegant posters.
It does not make any assumptions about layout (eg. 2/3 column), size of the poster (eg. a0, a1) or orientation.
Its main functionality is provided by a handful of functions that create [boxes](documentation/boxes) with optional titles.
There are specific functions for defining title boxes and bottom boxes.
It provides predefined [themes](documentation/themes) which can be adjusted to customize the design of the boxes.

To find out what you can do today with `science-posters`, have a look at the [showcased examples](showcase).

## Example
We begin by importing the `science-posters` package

{{< codeFromFile file="examples/getting_started/main.typ" start="2" end="2" >}}

Next, we specify some general settings formatting settings.

{{% codeFromFile file="examples/getting_started/main.typ" start="5" end="12" %}}

After that we choose a predefined theme.

{{% codeFromFile file="examples/getting_started/main.typ" start="15" end="15" %}}

We can adjust any property of the theme via the `update_theme` method of the [themes](documentation/themes) module.
The poster consists of multiple boxes which can be adjusted by specifying [column layouts](https://typst.app/docs/reference/layout/columns/).
`science-posters` provideds some predefiend methods for creating a title-box, regular column-boxes in between, a bottom box and bibliography to finish it of.

{{% codeFromFile file="examples/getting_started/main.typ" start="21" end="63" %}}

## Final Result
<div class="showcase-single" style="text-align: center; padding: 0em;">
<a href="examples/getting_started/main.pdf"><img src="examples/getting_started/main.png" width=100%></a>
</div>
