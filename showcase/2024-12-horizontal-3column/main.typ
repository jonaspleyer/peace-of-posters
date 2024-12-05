#import "@preview/peace-of-posters:0.4.3" as pop

#set page("a0", margin: 1cm, flipped: true)
#pop.set-poster-layout(pop.layout-a0)
#pop.set-theme(pop.uni-fr)
#set text(size: pop.layout-a0.at("body-size"))
#let box-spacing = 1.2em
#set columns(gutter: box-spacing)
#set block(spacing: box-spacing)
#pop.update-poster-layout(spacing: box-spacing)

#pop.title-box(
    "Peace of Posters Template",
    authors: "Jonas Pleyer¹",
    institutes: "¹Freiburg Center for Data-Analysis and Modelling",
    keywords: "Peace, Dove, Poster, Science",
)

#columns(3, [
    #pop.column-box(heading: "General Relativity")[
        Einstein's brilliant theory of general relativity
        starts with the field equations).
        $ G_(mu nu) + Lambda g_(mu nu) = kappa T_(mu nu) $
        However, they have nothing to do with doves.
    ]

    #colbreak()

        #pop.column-box(heading: "Peace be with you")[
        #figure(caption: [
            'Doves [...] are used in many settings as symbols of peace, freedom or love.
            Doves appear in the symbolism of Judaism, Christianity, Islam and paganism, and of both
            military and pacifist groups.'
        ])[]
    ]

    #pop.column-box(heading: "Another one")[
        We are peaceful doves.
    ]

    #colbreak()

    #pop.column-box(heading: "Third Column")[]
])

#columns(3, [
    #pop.column-box(heading: "Col1")[]

    #colbreak()

    #pop.column-box(heading: "Col2")[]

    #colbreak()

    #pop.column-box(heading: "Col3", stretch-to-next: true)[
        This will be very very large!
    ]
])

#pop.bottom-box()[
    Peace of posters:
    https://jonaspleyer.github.io/peace-of-posters/
]

