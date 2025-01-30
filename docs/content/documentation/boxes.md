---
title: "Boxes"
weight: 10
---

# Boxes
Please note that most values which have default values [none] are probably specified either by a [theme](../themes) or [layout](../layouts).
## Common Box
This box is mostly meant as a shared template for other functions to be calling.
While it can be used individually, users should strongly consider relying on other functions.

The `common-box` method creates two rectangles, one for the heading and one for the body of the box.
Both are optional and can be left out.
This box also automatically considers the currently defined [theme](themes) and styles the box accordingly.
```typst
#common-box(
    body: [none] [content],
    heading: [none] [content],
    heading-size: [none] [length],
    heading-box-args: [none] [dictionary],
    heading-text-args: [none] [dictionary],
    body-size: [none] [length],
    body-box-args: [none] [dictionary],
    body-text-args: [none] [dictionary],
    stretch-to-next: [bool],
    spacing: [none] [length] [relative],
    bottom-box: [bool],
) --> [content]
```

| Argument | Type | Default Value | Description |
| --- | --- | --- | --- |
| `body` | [none] [content] | [none] | The lower rectangle containing the body of the box. |
| `heading` | [none] [content] | [none] | The upper rectangle which defines the heading of the box.
| `heading-box-args` | [none] [dictionary] | [none] | Arguments given to the box-type function that creates the heading. |
| `heading-text-args` | [none] [dictionary] | [none] | Arguments given to the `text` function which creates the heading. |
| `body-size` | [none] [length] | [none] | Size of the body. |
| `body-box-args` | [none] [dictionary] | [none] | Arguments given to the box-type function that creates the body. |
| `body-text-args` | [none] [dictionary] | [none] | Arguments given to the `text` function which creates the body. |
| `stretch-to-next` | [bool] | [false] | The vertical size of the box is stretched such that it fills out the remainder of the vertical space. |
| `spacing` | [none] | [none] | Only useful when specifying `stretch-to-next`. Controls spacing towards next block. |
| `bottom-box` | [bool] | [false] | The box should be aligned towards the bottom of the page. |

<div class="warning-block">
    <h2>Warning</h2>
    <p>The <code>stretch-to-next</code> should not be used on a block which is already maximal by itself.
    Doing so will most likely result in glitches.
    </p>
</div>

### Example
```typst
#common-box(
    heading: "peace-of-posters - Create scientific posters",
)
```

## Title Box
The title box is the main heading of the poster.
It can be customized and adjusted with many parameters and offers some level of flexibility by
pre-designing it within a [theme](../themes).
```typst
#title-box(
    title: [content],
    subtitle: [none] [content],
    authors: [none] [content],
    institutes: [none] [content],
    keywords: [none] [content],
    logo: [none] [content],
    background: [none] [content],
    text-relative-width: [relative],
    spacing: [relative],
    title-size: [none] [length],
    subtitle-size: [none] [length],
    authors-size: [none] [length],
    institutes-size: [none] [length],
    keywords-size: [none] [length],
)
```

| Argument | Type | Default Value | Description |
| --- | --- | --- | --- |
| `title` | [content] | | Title of the poster. |
| `subtitle` | [none] [content] | [none] | Subtitle of the poster. |
| `authors` | [none] [content] | [none] | Authors contributing to this poster. |
| `institutes` | [none] [content] | [none] | Institutes to which the authors are related. |
| `keywords` | [none] [content] | [none] | Keywords describing the contents of this poster. |
| `logo` | [none] [content] | [none] | A logo (such as a university sigil) which will be displayed on the right of title, subtitle, authors, etc. |
| `background` | [none] [content] | [none] | Background image of the title box. This will be stretched over the entire box and any text will be displayed on top. Can be used together with a logo. |
| `text-relative-width` | [relative] | 80% | The width of the text next to the logo. |
| `spacing` | [relative] [length] | `5%` | Spacing to the next box. |
| `title-size` | [none] [length] | [none] | Size of the title. |
| `subtitle-size` | [none] [length] | [none] | Size of the subtitle section. |
| `authors-size` | [none] [length] | [none] | Size of the authors section. |
| `institutes-size` | [none] [length] | [none] | Size of the institutes section. |
| `keywords-size` | [none] [length] | [none] | Size of the keywords section. |

### Example
```typst
#title-box(
    "Creating nice posters with peace of mind ...",
    subtitle: "... is a piece of cake.",
)
```

## Column Box
```typst
#column-box(
    body: [content],
    ..args
) --> [content]
```
All arguments align with `common-box` but the `column-box` requires at least a body.

## Bottom Box
A box that will be placed at the bottom of the page.
It is also possible to specify a logo and text-width of the remaining content.
```typst
#bottom-box(
    body: [content],
    text-relative-width: [relative],
    logo: [none] [content],
    ..args
) --> [content]
```
| Argument | Type | Default Value | Description |
| --- | --- | --- | --- |
| `body` | [content] | | Body of the bottom box. |
| `text-relative-width` | [relative] | `70%` | Space left of the logo where text can be displayed. |
| `logo` | [none] [content] | [none] | The content which should be used as logo. Usually specified by an [image](https://typst.app/docs/reference/visualize/image/). It will be aligned towards the right side of the box. |

## Bibliography Box

<div class="warning-block">
    <h2>Warning</h2>
    <p>This function is currently not working due to unwieldy file-path handling.
    See <a href="https://github.com/typst/typst/issues/971">#971</a> for more details.</p>
</div>

```typst
#bibliography-box(
    bib-file: [str],
    text-size: [length],
    title: [none] [content],
    style: [str],
    stretch-to-next: [bool]
) --> [content]
```

| Argument | Type | Default Value | Description |
| --- | --- | --- | --- |
| `bib-file` | [str] | | Path to the bibliography file. |
| `text-size` | [length] | `24pt` | Font size of the bibliography. |
| `title` | [none] [content] | [none] | Title of the Bibliography Box. |
| `style` | [str] | `"ieee"` | Citation style. |
| `stretch-to-next` | [bool] | [false] | See [Common Box](#common-box). |

