---
title: "Layouts"
weight: 20
---

# Layouts
Layouts modify mostly shapes and spacings between boxes.
Similarly to [themes](/documentation/themes), their purpose is cosmetic.
A layout, just like a theme, is a dictionary.
```typst
layout = (
    "spacing": [length] [relative],
    "body-size": [length],
    "heading-size": [length],
    "title-size": [length],
    "subtitle-size": [length],
    "authors-size": [length],
    "keywords-size": [length],
)
```
All default values assume an `a0` layout.
You can easily change this by using the `set-layout` function below.
| Argument | Type | Default Value | Description |
| --- | --- | --- | --- |
| `spacing` | [length] [relative] | `1.2em` | Spacing between boxes when stretching box. |
| `body-size` | [length] |`33pt` | Size of the body. |
| `heading-size` | [length] |`50pt` | Size of the heading. |
| `title-size` | [length] |`75pt` | Size of the title. |
| `subtitle-size` | [length] |`60pt` | Size of the subtitle. |
| `authors-size` | [length] |`50pt` | Size of the authors. |
| `keywords-size` | [length] |`40pt` | Size of the keywords. |


## Updating a Layout
```typst
update-poster-layout(
    ..args
)
```
All arguments coincide with the values of the ones of `layout` shown above.

## Setting a new Layout
```typst
set-poster-layout(
    layout: [dictionary],
)
```

## Example Layouts
### Default
```typst
#let -default-layout = (
    "spacing": 1.2em,
)
```
### A0
```typst
#let layout-a0 = -default-layout + (
    "paper":            "a0",
    "size":             (841mm, 1188mm),
    "body-size":        33pt,
    "heading-size":     50pt,
    "title-size":       75pt,
    "subtitle-size":    60pt,
    "authors-size":     50pt,
    "keywords-size":    40pt,
)
```
### A1
```typst
#let layout-a1 = -default-layout + (
    "paper":            "a1",
    "size":             (594mm, 841mm),
    "body-size":        27pt,
    "heading-size":     41pt,
    "title-size":       61pt,
    "subtitle-size":    49pt,
    "authors-size":     41pt,
    "keywords-size":    33pt,
)
```
### A2
```typst
#let layout-a2 = -default-layout + (
    "paper":            "a2",
    "size":             (420mm, 594mm),
    "body-size":        20pt,
    "heading-size":     31pt,
    "title-size":       47pt,
    "subtitle-size":    38pt,
    "authors-size":     31pt,
    "keywords-size":    25pt,
)
```
### A3
```typst
#let layout-a3 = -default-layout + (
    "paper":            "a3",
    "size":             (297mm, 420mm),
    "body-size":        14pt,
    "heading-size":     22pt,
    "title-size":       32pt,
    "subtitle-size":    26pt,
    "authors-size":     22pt,
    "keywords-size":    18pt,
)
```
### A4
```typst
#let layout-a4 = -default-layout + (
    "paper":            "a4",
    "size":             (210mm, 297mm),
    "body-size":        8pt,
    "heading-size":     12pt,
    "title-size":       18pt,
    "subtitle-size":    15pt,
    "authors-size":     12pt,
    "keywords-size":    10pt,
)
```
