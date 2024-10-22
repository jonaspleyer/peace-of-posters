#import "@preview/peace-of-posters:0.4.3" as pop

#set page("a0", margin: 1cm)
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
  image: image("peace-dove-thumbnail.png"),
)

#columns(2,[
  #pop.column-box(heading: "Columbidae")[
    'Columbidae is a bird family consisting of doves and pigeons.
    It is the only family in the order Columbiformes.'
    #cite(<wiki:Columbidae>)

    #figure(caption: [
      Pink-necked green pigeon #cite(<wiki:File:Treron_vernans_male_-_Kent_Ridge_Park.jpg>).
    ])[
      #image("Treron_vernans_male_-_Kent_Ridge_Park.jpg")
    ]
  ]

  #let hba = pop.uni-fr.heading-box-args
  #hba.insert("width", 60%)
  #let bba = pop.uni-fr.body-box-args
  #bba.insert("width", 60%)
  #bba.insert("inset", 0pt)

  #pop.column-box(
    heading: "Biological Information",
    body-box-args: bba,
    heading-box-args: hba
  )[
    #table(
      columns: (auto, 1fr),
      inset: 0.5cm,
      [Domain],[Eukaryota],
      [Kingdom],[Animalia],
      [Phylum],[Chordata],
      [Class],[Aves],
      [Clade],[Columbimorphae],
      [Order],[Columbiformes],
      [Family],[Columbidae],
      [Type genus],[Columba],
    )
  ]

  #pop.column-box()[
    #figure(caption: [Geographic range of the family #cite(<wiki:Columbidae>)])[
      #image("Pigeon_range.png")
    ]
  ]

  #colbreak()

  #pop.column-box(heading: "General Relativity")[
    Einstein's brilliant theory of general relativity
    starts with the field equations #cite(<Einstein1916>).
    $ G_(mu nu) + Lambda g_(mu nu) = kappa T_(mu nu) $
    However, they have nothing to do with doves.
  ]

  #pop.column-box(heading: "Peace be with you")[
    #figure(caption: [
      'Doves [...] are used in many settings as symbols of peace, freedom or love.
      Doves appear in the symbolism of Judaism, Christianity, Islam and paganism, and of both
      military and pacifist groups.'
      #cite(<wiki:Doves_as_symbols>).
    ])[
      #image("peace-dove.png")
    ]
  ]

  #pop.column-box(heading: "Etymology")[
    Pigeon is a French word that derives from the Latin pīpiō, for a 'peeping' chick,
    while dove is an ultimately Germanic word, possibly referring to the bird's diving flight.
    The English dialectal word culver appears to derive from Latin columba
    #cite(<wiki:Online_Etymology_Dictionary>).
    A group of doves is called a "dule", taken from the French word deuil ('mourning')
    #cite(<Lipton1991-qa>).
  ]

  #pop.column-box(heading: "Fill space with a box", stretch-to-next: true)[
    Notice that this box would not fill the entire space up to the bottom of the page but we
    can stretch it such that it does so anyway.

    #bibliography("bibliography.bib")
  ]
])

#pop.bottom-box()[
  What does the Dove say? $-->$ Ouuuhhhh - Oh ... Ouuuhhhhh - Oh
  #linebreak()
  #link("https://www.youtube.com/watch?v=dQw4w9WgXcQ")
]

