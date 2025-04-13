---
title: "Themes"
weight: 30
---

# Themes
Themes are dictionaries with particular variables that control overall styling of the generated boxes.
The dictionary is saved as a [state](https://typst.app/docs/reference/meta/state/) variable and can be accessed by the `update-theme` and `set-theme` methods.
Most of the time, themes are meant to be set initially without any further alteration.
```typst
theme = (
    "body-box-args": [dictionary],
    "body-box-args-with-title": [dictionary],
    "body-box-function": [function],
    "heading-box-args": [dictionary],
    "heading-box-args-with-body": [dictionary],
    "heading-box-function": [function],
    // Optional
    "title-box-args": [dictionary]
    "title-text-args": [dictionary]
)
```
| Argument | Type | Default Value | Description |
| --- | --- | --- | --- |
| `body-box-args` | [dictionary] | | Arguments given to the body box. |
| `body-box-args-with-title` | [dictionary] | | Arguments given to the body box when a title is present. This dictionary is optional. Leaving  |
| `body-box-function` | [function] | | Arguments given to the body box. |
| `body-text-args` | [dictionary] | | Text-related arguments given to the body box. |
| `heading-box-args` | [dictionary] | | Arguments given to the heading box. |
| `heading-box-args-with-body` | [dictionary] | | Arguments given to the body box. |
| `heading-box-function` | [function] | | Fuctions given to the heading box. |
| `heading-text-args` | [dictionary] | | Text-related arguments given to the heading box. |


### `heading-text-args` & `body-text-args`
Takes arguments to alter heading or body text.
For all possible arguments see: [Text](https://typst.app/docs/reference/text/text/)

```typst
"heading-text-args": (
    fill: rgb("#FFFFFF"),
    font: "Lora",
)
```
This would ensure the heading text color is white (#FFFFFF) and the font family is set to 'Lora'.

```typst
"body-text-args": (
    font: ("Ubuntu", "Source Han Sans"),
)
```
This would set body font family to `Ubuntu` with `Source Han Sans` as fallback.

### Title Boxes

Arguments for title boxes by default use arguments from the `heading-box-...` family.
To alter this behaviour, we can set the `title-box-args`, `title-text-args` and `title-box-function`
arguments in our theme.
If left undefined, the previously mentioned values will be used.
See [title-box](../../examples/title-box/main.pdf).

## Updating a Theme
```typst
update-theme(
    ..args
)
```
All arguments coincide with the values of the ones of `theme` shown above.

### Note: Updating in the middle of the document
The user can also update the theme in the middle of the document.
This will alter all following boxes but should not touch preceding ones.

## Setting a new Theme
To entirely change the theme of a document, one can use this method and set the new theme.
It is not checked that all keys and values are properly populated.
Thus the user is responsible for defining them.
It is often easier to instead take an existing theme and modify its entries.
```typst
set-theme(
    theme: [dictionary]
)
```

## List of Themes
### Default
The default values of the theme. If nothing is specified by the user, these values will be chosen.
```typst
#let default = (
    "body-box-args": (
        inset: 0.6em,
        width: 100%,
    ),
    "body-text-args": (:),
    "heading-box-args": (
        inset: 0.6em,
        width: 100%,
        fill: rgb(50, 50, 50),
        stroke: rgb(25, 25, 25),
    ),
    "heading-text-args": (
        fill: white,
    ),
)
```

### Uni Freiburg
A theme surrounding colors specifically chosen in complience with the corporate design of the University of Freiburg.
```typst
#let uni-fr = (
    "body-box-args": (
        inset: 0.6em,
        width: 100%,
    ),
    "body-text-args": (:),
    "heading-box-args": (
        inset: 0.6em,
        width: 100%,
        fill: rgb("#1d154d"),
        stroke: rgb("#1d154d"),
    ),
    "heading-text-args": (
        fill: white,
    ),
)
```

### Paul Scherrer Institute
A theme for the [Paul Scherrer Institute](https://www.psi.ch/en).
See also [this PR](https://github.com/jonaspleyer/peace-of-posters/pull/3).
```typst
#let psi-ch = (
    "body-box-args": (
        inset: (x: 0.0em, y: 0.6em),
        width: 100%,
        stroke: none,
    ),
    "body-text-args": (:),
    "heading-box-args": (
        inset: 0em,
        width: 100%,
        stroke: none,
    ),
    "heading-text-args": (
        fill: rgb("#dc005a"),
        weight: "bold",
    ),
)
```
