// We begin by importing the `peace-of-posters` package
#import "../../../../lib.typ" as pop

// Next, we specify some general settings formatting settings.
#set page("a4", margin: 1cm)
#pop.set-poster-layout(pop.layout-a4)

#grid(
    gutter: pop.layout-a4.spacing,
    columns: (2fr, 3fr),
    box(width: 100%)[
        #pop.column-box(heading: "Left Column")[This is a box on the left]
    ],
    box(width: 100%)[
        #pop.column-box(heading: "Right Column")[This is a bit bigger on the right]
    ],
    box(width: 100%)[
        #pop.column-box(heading: "Stretch it", stretch-to-next: true)[
            This stretches all the way to the bottom of the page
        ]
    ],
)

#pop.bottom-box()[At the bottom]
