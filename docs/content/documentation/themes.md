# Themes
Themes are dictionaries with particular variables that control overall styling of the generated boxes.
The dictionary is saved as a [state](https://typst.app/docs/reference/meta/state/) variable and can be accessed by the `update_theme` and `set_theme` methods.
Most of the time, themes are meant to be set initially without any further alteration.
```typst
theme = (
    "body_color": [color],
    "body_background": [color],
    "heading_color": [color],
    "heading_background": [color],
)
```

## Updating a Theme
```typst
update_theme(
    body_color: [color],
    body_background: [color],
    heading_color: [color],
    heading_background: [color],
)
```

### Note: Updating in the middle of the document
The user can also update the theme in the middle of the document.
This will alter all following boxes but should not touch preceding ones.

## Setting a new Theme
To entirely change the theme of a document, one can use this method and set the new theme.
It is not checked that all keys and values are properly populated.
Thus the user is responsible for defining them.
It is often easier to instead take an existing theme and modify its entries.
```typst
set_theme(
    theme: [dictionary]
)
```

## Example Themes
### Default
The default values of the theme. If nothing is specified by the user, these values will be chosen.
```typst
default = (
    "body_color": black,
    "body_background": white,
    "heading_color": white,
    "heading_background": rgb(25, 61, 112),
)
```

### Uni Freiburg
A theme surrounding colors specifically chosen in complience with the corporate design of the University of Freiburg.
```typst
uni_fr = (
    "body_color": black,
    "body_background": white,
    "heading_color": white,
    "heading_background": rgb("#1d154d"),
)
```
