// We begin by importing the `peace-of-posters` package
#import "../../../../lib.typ": *

// Next, we specify some general settings formatting settings.
#set page("a3", margin: 1cm)
#set-poster-layout(layout-a3)
#set text(font: "Arial", size: layout-a3.at("body-size"))

#let box-spacing = 1.2em
#set columns(gutter: box-spacing)
#set block(spacing: box-spacing)

// Here we can redefine the title box and headings of our regular column boxes
#update-poster-layout(spacing: box-spacing)
#update-theme(
    title-box-args: (fill: rgb(150, 0, 150), inset: 1.2em),
    heading-box-args: (fill: rgb(120, 0, 200), inset: 0.6em, width: 100%)
)

#title-box(
    [`peace-of-posters`],
    subtitle: [Scientific Posters for any Occasion],
    authors: [Jonas Pleyer#super("1")],
    institutes: [#super("1")Freiburg Center for Data-Analysis and Modelling],
    keywords: [Science, Poster, Typesetting, `typst`],
)

#columns(2, [
    #column-box(heading: [Normal box with heading])[]

    #column-box(heading: [Code used to modify title and heading separately])[
        ```typst
        #update-poster-layout(spacing: box-spacing)
        #update-theme(
            title-box-args: (fill: rgb(150, 0, 150), inset: 1.2em),
            heading-box-args: (fill: rgb(120, 0, 200), inset: 0.6em, width: 100%)
        )
        ```
    ]

    #colbreak()

    #column-box()[We can also choose to not have a heading for our boxes.]
])
