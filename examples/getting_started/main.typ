// We begin by importing the `peace-of-posters` package
#import "../../../../lib.typ": *

// Next, we specify some general settings formatting settings.
#set page("a0", margin: 1cm)
#set-poster-layout(layout-a0)
#set text(font: "Arial", size: layout-a0.at("body-size"))

#let box-spacing = 1.2em
#set columns(gutter: box-spacing)
#set block(spacing: box-spacing)
#update-poster-layout(spacing: box-spacing)

// After that we choose a predefined theme.
#set-theme(uni-fr)


// We can adjust any property of the theme via the `update-theme` method of the themes module.
// The poster consists of multiple boxes which can be adjusted by specifying column layouts.
// `peace-of-posters` provideds some predefiend methods for creating a title-box, regular column-boxes in between, a bottom box and bibliography to finish it of.
#title-box(
    [`peace-of-posters`],
    subtitle: [Scientific Posters for any Occasion],
    authors: [Jonas Pleyer#super("1")],
    institutes: [#super("1")Freiburg Center for Data-Analysis and Modelling],
    keywords: [Science, Poster, Typesetting, `typst`],
)

#columns(2, [
    #column-box(
        heading: [Left Column],
    )[
        Multi-Column layouts are supported out of the box by typsts `columns()` method.
    ]

    #colbreak()

    #column-box(
        stretch-to-next: true,
    )[
        We can also choose to not have a title for our boxes.
    ]
])

#column-box()[
    We can update the layout of the boxes in the middle of the document.
]

#common-box(heading: [only heading])

#columns(2, [
    #colbreak()
    #column-box(
        heading: [Stretching],
        stretch-to-next: true
    )[
        And stretch boxes to the next lowest box (or bottom of the page)
    ]
])

#bottom-box()[
    Align them to the bottom.
]
