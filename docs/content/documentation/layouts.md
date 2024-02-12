# Layouts
Layouts modify mostly shapes and spacings between boxes.
Similarly to [themes](/documentation/themes), their purpose is cosmetic.
A layout, just like a theme, is a dictionary.
```typst
layout = (
    "spacing": [length] [relative],
    "body_size": [length],
    "heading_size": [length],
    "title_size": [length],
    "subtitle_size": [length],
    "authors_size": [length],
    "keywords_size": [length],
)
```
All default values assume an `a0` layout.
You can easily change this by using the `set_layout` function below.
| Argument | Type | Default Value | Description |
| --- | --- | --- | --- |
| `spacing` | [length] [relative] | `1.2em` | Spacing between boxes when stretching box. |
| `body_size` | [length] |`33pt` | Size of the body. |
| `heading_size` | [length] |`50pt` | Size of the heading. |
| `title_size` | [length] |`75pt` | Size of the title. |
| `subtitle_size` | [length] |`60pt` | Size of the subtitle. |
| `authors_size` | [length] |`50pt` | Size of the authors. |
| `keywords_size` | [length] |`40pt` | Size of the keywords. |


## Updating a Layout
```typst
update_layout(
    ..args
)
```
All arguments coincide with the values of the ones of `layout` shown above.

## Setting a new Layout
```typst
set_layout(
    layout: [dictionary],
)
```

## Example Layouts
### Default
```typst
#let _default_layout = (
    "spacing": 1.2em,
)
```
### A0
```typst
#let layout_a0 = _default_layout + (
    "paper":            "a0",
    "size":             (841mm, 1188mm),
    "body_size":        33pt,
    "heading_size":     50pt,
    "title_size":       75pt,
    "subtitle_size":    60pt,
    "authors_size":     50pt,
    "keywords_size":    40pt,
)
```
### A1
```typst
#let layout_a1 = _default_layout + (
    "paper":            "a1",
    "size":             (594mm, 841mm),
    "body_size":        27pt,
    "heading_size":     41pt,
    "title_size":       61pt,
    "subtitle_size":    49pt,
    "authors_size":     41pt,
    "keywords_size":    33pt,
)
```
### A2
```typst
#let layout_a2 = _default_layout + (
    "paper":            "a2",
    "size":             (420mm, 594mm),
    "body_size":        20pt,
    "heading_size":     31pt,
    "title_size":       47pt,
    "subtitle_size":    38pt,
    "authors_size":     31pt,
    "keywords_size":    25pt,
)
```
### A3
```typst
#let layout_a3 = _default_layout + (
    "paper":            "a3",
    "size":             (297mm, 420mm),
    "body_size":        14pt,
    "heading_size":     22pt,
    "title_size":       32pt,
    "subtitle_size":    26pt,
    "authors_size":     22pt,
    "keywords_size":    18pt,
)
```
### A4
```typst
#let layout_a4 = _default_layout + (
    "paper":            "a4",
    "size":             (210mm, 297mm),
    "body_size":        8pt,
    "heading_size":     12pt,
    "title_size":       18pt,
    "subtitle_size":    15pt,
    "authors_size":     12pt,
    "keywords_size":    10pt,
)
```
