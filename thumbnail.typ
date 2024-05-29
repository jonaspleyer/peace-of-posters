#import "@preview/peace-of-posters:0.2.0" as sp

#set page("a5")
#sp.set_poster_layout(sp.layout_a3)

#sp.title_box(
  "peace-of-posters",
  authors: "Jonas Pleyer¹",
  institutes: "¹University of Freiburg",
  keywords: "Typst, Posters, Science",
  image: rect(height: 4em, width: 4em)[#set align(center+horizon);Title Image],
)

#columns(2,[
  #sp.column_box(heading: "Biology")[
    _The fundamental difference between phyics and biology is that there are no laws.
    There are only principles._
  ]
  #sp.column_box(stretch_to_next: true)[
    Minimal main routines in 2 languages.
    Can you guess them?
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

  #sp.column_box(heading: "General Relativity", stretch_to_next: true)[
  Einstein's brilliant theory of general relativity
  starts with the field equations.
  $ G_(mu nu) + Lambda g_(mu nu) = kappa T_(mu nu) $
  And we can see that this leads to a box which stretches all to wards the bottom of the page.
  ]
])

#sp.bottom_box()[
  #columns(2)[
    #set text(14pt)
    github.com/jonaspleyer/peace-of-posters
    #colbreak()
    jonas.pleyer.org
  ]
]

