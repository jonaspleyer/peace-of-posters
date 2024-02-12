// We begin by importing the `typst-scienceposters` package
#import "../../../../lib.typ": *

// Next, we specify some general settings formatting settings.
#set page("a0", margin: 1cm)
#set_poster_layout(layout_a0)
#set text(font: "Arial", size: layout_a0.at("body_size"))

#let box_spacing = 1.2em
#set columns(gutter: box_spacing)
#set block(spacing: box_spacing)
#update_poster_layout(spacing: box_spacing)

// After that we choose a predefined theme.
#set_theme(uni_fr)


// We can adjust any property of the theme via the `update_theme` method of the themes module.
// The poster consists of multiple boxes which can be adjusted by specifying column layouts.
// `typst-scienceposters` provideds some predefiend methods for creating a title-box, regular column-boxes in between, a bottom box and bibliography to finish it of.
#title_box(
    [`typst-scienceposters`],
    subtitle: [Scientific Posters for any Occasion],
    authors: [Jonas Pleyer#super("1")],
    institutes: [#super("1")Freiburg Center for Data-Analysis and Modelling],
    keywords: [Science, Poster, Typesetting, `typst`],
)

#columns(2, [
    #column_box(
        heading: [Left Column],
    )[
        Multi-Column layouts are supported out of the box by typsts `columns()` method.
    ]

    #colbreak()

    #column_box(
        stretch_to_next: true,
    )[
        We can also choose to not have a title for our boxes.
    ]
])

#column_box()[
    We can update the layout of the boxes in the middle of the document.
]

#_common_box(heading: [only heading])

#columns(2, [
    #colbreak()
    #column_box(
        heading: [Stretching],
        stretch_to_next: true
    )[
        And stretch boxes to the next lowest box (or bottom of the page)
    ]
])

#bottom_box()[
    Align them to the bottom.
]
