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
)
```
| Argument | Type | Default Value | Description |
| --- | --- | --- | --- |
| `body-box-args` | [dictionary] | | Arguemtns given to the body box. |
| `body-box-args-with-title` | [dictionary] | | Arguemtns given to the body box when a title is present. This dictionary is optional. Leaving  |
| `body-box-function` | [function] | | Arguemtns given to the body box. |
| `heading-box-args` | [dictionary] | | Arguemtns given to the body box. |
| `heading-box-args-with-body` | [dictionary] | | Arguemtns given to the body box. |
| `heading-box-function` | [function] | | Arguemtns given to the body box. |


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

## Example Themes
### Default
The default values of the theme. If nothing is specified by the user, these values will be chosen.
```typst
default = (
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
    )
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
