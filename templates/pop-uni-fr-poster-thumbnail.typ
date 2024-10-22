#import "@preview/peace-of-posters:0.4.3" as pop

#set page("a5")
#pop.set_poster_layout(pop.layout_a3)
#set text(font: "Latin Modern Serif")

#pop.title_box(
  "peace-of-posters",
  authors: "Jonas Pleyer¹",
  institutes: "¹University of Freiburg",
  keywords: "Typst, Posters, Science",
  image: rect(height: 4em, width: 4em, fill: white, radius: 5pt)[#image("peace-dove.png")],
)

#columns(2,[
  #pop.column_box(heading: "Biology")[
    _The fundamental difference between phyics and biology is that there are no laws.
    There are only principles._
  ]
  #pop.column_box(stretch_to_next: true)[
    Minimal main routines in 2 languages.
    #linebreak()
    #box(stroke: 1pt + black, inset: 5pt, width: 90%)[
    ```c
    int main() {
      return 0;
    }
    ```]
    #box(stroke: 1pt + black, inset: 5pt, width: 90%)[
    ```rust
    fn main() {}
    ```]
  ]

  #colbreak()

  #pop.column_box(heading: "General Relativity", stretch_to_next: true)[
  Einstein's brilliant theory of general relativity
  starts with the field equations.
  $ G_(mu nu) + Lambda g_(mu nu) = kappa T_(mu nu) $
  And we can see that this leads to a box which stretches all to wards the bottom of the page.
  ]
])

#pop.bottom_box()[
  #columns(2)[
    #set text(14pt)
    github.com/jonapopleyer/peace-of-posters
    #colbreak()
    jonas.pleyer.org
  ]
]

