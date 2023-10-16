# Boxes

## Common Box
This box is mostly meant as a shared template for other functions to be calling.
While it can be used individually, users should strongly consider relying on other functions.

The `_common_box` method creates two rectangles, one for the heading and one for the body of the box.
Both are optional and can be left out.
This box also automatically considers the currently defined [theme](themes) and styles the box accordingly.
```typst
_common_box(
    body: [none] [content],
	heading: [none] [content],
	body_color: [none] [color],
	body_background: [none] [color],
	heading_color: [none] [color],
	heading_background: [none] [color],
	stretch_to_bottom: [bool],
	bottom_box: [bool],
) --> [content]
```

| Argument | Type | Default Value | Description |
| --- | --- | --- | --- |
| `heading` | [none] [content] | [none] | The upper rectangle which defines the heading of the box.
| `body` | [none] [content] | [none] | The lower rectangle containing the body of the box. |
| `body_color` | [none] [color] | [none] | Text color of the body. |
| `body_background` | [none] [color] | [none] | Background color of the body. |
| `heading_color` | [none] [color] | [none] | Text color of the heading. |
| `heading_background` | [none] [color] | [none] | Background color of the heading. |
| `stretch_to_bottom` | [bool] | [false] | The vertical size of the box is stretched such that it fills out the remainder of the vertical space. |
| `bottom_box` | [bool] | [false] | The box should be aligned towards the bottom of the page. |

### Example
```typst
#_common_box(
    heading: "typst-posters - Create scientific posters",
)
```

## Column Box
```typst
column_box(
	body: [content],
	..args
) --> [content]
```
All arguments align with `_common_box` but the `column_box` requires at least a body.

## Bottom Box
A box that will be placed at the bottom of the page.
It is also possible to specify a logo and text-width of the remaining content.
```typst
bottom_box(
    body: [content],
    text_relative_width: [relative],
    logo: [none] [content],
    ..args
) --> [content]
```
| Argument | Type | Default Value | Description |
| --- | --- | --- | --- |
| `body` | [content] | | Body of the bottom box. |
| `text_relative_width` | [relative] | `70%` | Space left of the logo where text can be displayed. |
| `logo` | [none] [content] | [none] | The content which should be used as logo. Usually specified by an [image](https://typst.app/docs/reference/visualize/image/). It will be aligned towards the right side of the box. |

## Bibliography Box
```typst
bibliography_box(
    bib_file: [str],
    text_size: [length],
    title: [none] [content],
    style: [str],
    stretch_to_bottom: [bool]
) --> [content]
```

| Argument | Type | Default Value | Description |
| --- | --- | --- | --- |
| `bib_file` | [str] | | Path to the bibliography file. |
| `text_size` | [length] | `24pt` | Font size of the bibliography. |
| `title` | [none] [content] | [none] | Title of the Bibliography Box. |
| `style` | [str] | `"ieee"` | Citation style. |
| `stretch_to_bottom` | [bool] | [false] | The vertical size of the box is stretched such that it fills out the remainder of the vertical space. |
