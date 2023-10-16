# Overview
`typst-posters` allows to create simple but elegant posters.
It does not make any assumptions about layout (eg. 2/3 column), size of the poster (eg. a0, a1) or orientation.
Its main functionality is provided by a handful of functions that create [boxes](documentation/boxes) with optional titles.
There are specific functions for defining title boxes and bottom boxes.
It provides predefined [themes](documentation/themes) which can be adjusted to customize the design of the boxes.

To find out what you can do today with `typst-posters`, have a look at the [showcased examples](showcase).

## Example
We begin by importing the `typst-posters` package
```
/// IMPORT THE POSTERS PACKAGE
#import "typst-posters/lib.typ": *
```
Next, we specify some general settings formatting settings.
```
#set page("a0", margin: 1.5cm,)
#set text(font: "Arial", size: 33pt)
```
After that we choose a predefined theme.
```
#set_theme(uni_fr)
```
We can adjust any property of the theme via the `update_theme` method of the [themes](documentation/themes) module.
The poster consists of multiple boxes which can be adjusted by specifying [column layouts](https://typst.app/docs/reference/layout/columns/).
`typst-posters` provideds some predefiend methods for creating a title-box, regular column-boxes in between, a bottom box and bibliography to finish it of.
```
#title_box(
	[Writing typst is fun],
	authors: [Jonas Pleyer#super(1)],
	institutes: [#super(1)Freiburg],
)

#column_box()[
	this box will have a 100% width by default.
    If we do not specify otherwise, no heading
    will be displayed.
]

#columns(2)[
    #column_box()[This box will have 50% width and is left],
    #column_box()[Again a 1/2 width box and left.]

    #columnbreak()

    #column_box()[We are moving towards the right-hand side.]
]

#bottom_box()[
    Acknowledgements: Chili, Cara
]
```
