// We begin by importing the `peace-of-posters` package
#import "../../../../lib.typ": *

// Next, we specify some general settings formatting settings.
#set page("a3", margin: 1cm)
#set-poster-layout(layout-a3)
#set text(font: "Arial", size: layout-a3.at("body-size"))

// Here we can redefine the title box and headings of our regular column boxes
#let title_box_func(body, ..args) = {
    rect(fill: black, inset: 1em)[#rect(body, ..args)]
}
#update-theme(
    title-box-args: (
        fill: rgb(150, 0, 150),
        inset: 1.2em
    ),
    title-box-function: title_box_func,
    heading-box-args: (
        fill: rgb(120, 0, 200),
        inset: 0.6em, width: 100%
    )
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
        #let title_box_func(body, ..args) = {
            rect(fill: black, inset: 1em)[
                #rect(body, ..args)
            ]
        }
        #update-theme(
            title-box-args: (
                fill: rgb(150, 0, 150),
                inset: 1.2em
            ),
            title-box-function: title_box_func,
            heading-box-args: (
                fill: rgb(120, 0, 200),
                inset: 0.6em, width: 100%
            )
        )
        ```
    ]

    #colbreak()

    #column-box()[We can also choose to not have a heading for our boxes.]
])
