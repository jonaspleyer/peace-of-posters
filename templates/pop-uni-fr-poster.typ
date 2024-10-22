#import "@preview/peace-of-posters:0.4.3" as pop

#show: pop.a0_poster

#pop.title_box(
  "My very fancy Title goes here",
  authors: "Jonas Pleyer¹",
  institutes: "¹Freiburg Center for Data-Analysis and Modelling",
  keywords: "Awesome, Posters, Science",
  image: rect(height: 6em, width: 100%)[#set align(center+horizon);My Image goes here],
)

#columns(2,[
  #pop.column_box(heading: "My First Box")[There is nothing here yet]
  #pop.column_box()[
  This box does not have a heading.

  But it is still very cool!
  ]

  #colbreak()

  #pop.column_box(heading: "General Relativity", stretch_to_next: true)[
  Einstein's brilliant theory of general relativity
  starts with the field equations.
  $ G_(mu nu) + Lambda g_(mu nu) = kappa T_(mu nu) $
  ]
])

#pop.bottom_box()[This is a box at the bottom]

