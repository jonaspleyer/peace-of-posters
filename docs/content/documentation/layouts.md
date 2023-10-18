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
You can easily change this by using the `set_new_layout` function below.
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
set_new_layout(
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
    "body_size": 33pt,
    "heading_size": 50pt,
    "title_size": 75pt,
    "subtitle_size": 60pt,
    "authors_size": 50pt,
    "keywords_size": 40pt,
)
```
### A1
```typst
#let layout_a1 = _default_layout + (
    "body_size": 30pt,
    "heading_size": 45pt,
    "title_size": 70pt,
    "subtitle_size": 60pt,
    "authors_size": 45pt,
    "keywords_size": 36pt,
)
```
### A2
```typst

```
### A3
### A4
```typst
#let layout_a4 = _default_layout + (
    "body_size": 8pt,
    "heading_size": 12pt,
    "title_size": 18pt,
    "subtitle_size": 15pt,
    "authors_size": 12pt,
    "keywords_size": 10pt,
)
```
### A5
