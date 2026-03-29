#import "@preview/peace-of-posters:0.5.6": *
#import "@preview/hidden-bib:0.1.0": hidden-bibliography

#set page(width: 36in, height: 48in, margin: 1.5in, fill: white)
#set text(fill: black, font: "Montserrat")

#set-poster-layout(layout-a0)

#let black-white-theme = (
  "body-box-args": (
    inset: 0.6em,
    width: 100%,
    fill: white,
    stroke: none,
  ),
  "body-text-args": (
    fill: black,
  ),
  "heading-box-args": (
    inset: 0.6em,
    width: 100%,
    fill: white,
    stroke: none,
  ),
  "heading-text-args": (
    fill: black,
    weight: "bold",
  ),
  "title-box-args": (
    inset: 0.6em,
    width: 100%,
    fill: white,
    stroke: none,
  ),
  "title-text-args": (
    fill: white,
    weight: "bold",
  ),
)

#set-theme(black-white-theme)

#set text(size: layout-a0.at("body-size"))
#let box-spacing = 1.2em
#set columns(gutter: box-spacing)
#set block(spacing: box-spacing)
#update-poster-layout(spacing: box-spacing)

#title-box(
  "Semantic Category's Effects on the Human-Likeness of LLM Word Associations",
  authors: "Habbie Dem",
  institutes: "University of Toronto Mississauga",
  background: box(image("figures/solid-black-image.png", height: 21cm, width: 100%), inset: -2in, outset: 0in),
)
#v(0.5in)

#columns(2, [
  #column-box(
    heading: "INTRODUCTION",
  )[
    #set par(justify: true)
    #text(
      size: 30pt,
    )[*Semantic memory*, or "memory for word meanings, facts, concepts, and general world knowledge" @jonesModelsSemanticMemory2015, is as central to human language production as it is elusive. One of the foremost methods of investigating it are *free association tasks* - given a word, what is the first thing to come to mind? The answers to such prompts allow the creation of *semantic networks*, which can elucidate psycholinguistic phenomena through network-spreading experiments. But what can be shown through attempting such methods on LLMs? That is what the nascent field of *machine psychology* seeks to answer.]
  ]
  #v(-0.25in)

  #column-box(
    heading: "RESEARCH QUESTION",
  )[
    #set par(justify: true)
    #text(
      size: 45pt,
      style: "italic",
    )[How do the semantic associations of three LLMs (Mistral, Llama3 and Claude Haiku) differ from those of humans, particularly by semantic category?]
  ]
  #v(-0.25in)

  #set text(size: 30pt)

  #grid(
    columns: (1fr, 1fr),
    figure(
      image("figures/human.png", width: 100%),
      caption: [Semantic network constructed from human answers.],
    ),
    figure(
      image("figures/llama3.png", width: 100%),
      caption: [
        Semantic network constructed from Llama3's answers.
      ],
    ),
  )

  #grid(
    columns: (1fr, 1fr),
    figure(
      image("figures/mistral.png", width: 100%),
      caption: [
        Semantic network constructed from Mistral's answers.
      ],
    ),
    figure(
      image("figures/haiku.png", width: 100%),
      caption: [
        Semantic network constructed from Haiku's answers.
      ],
    ),
  )

  #set text(size: layout-a0.at("body-size"))

  #column-box(
    heading: [
      #set text(size: 40pt)
      REFERENCES
    ],
  )[
    #set text(size: 30pt)
    #set par(spacing: 1.2em)
    #hidden-bibliography(bibliography("bibliography.bib", style: "apa", title: none))
    Abramski et al. (2025). #emph[Scientific Data, 12]\(1\), 803. https://doi.org/qvng

    Jonauskaite et al. (2025). #emph[Journal of Open Psychology Data, 13]\(1\), 4. https://doi.org/qvnh

    Jones et al. (2015). #emph[The Oxford Handbook of Computational and Mathematical Psychology (p. 232–254)]. https://doi.org/d8vp
  ]

  #v(-0.25in)
  #colbreak()
  #set text(size: 30pt)
  #figure(
    image("figures/grouped_bar.png", width: 90%),
    caption: [
      A grouped bar chart featuring the average JSD for each model in each semantic category.
    ],
  )
  #set text(size: layout-a0.at("body-size"))

  #column-box(
    heading: [
      METHODS
    ],
  )[
    #set par(justify: true)
    *DATA:* LLM data was taken from the *"LLM World of Words" (LWOW)*, a large-scale English LLM free association database @abramskiLLMWorldWords2025.
    Although the LWOW contains over 12 000 cue words, this study focuses on the 62 from *Jonauskaite et al.'s #cite(<jonauskaiteFreeAssociationDatabase2025>, form: "year") human-generated free associations database*, the English answers of which make up this study's human data.

    *ANALYSES:* The first analysis focuses on the reweighed *Jensen-Shannon divergence (JSD)* between the probability distribution of a model's answers and that of the human responses.
    The second analysis explores *five distinct properties of each semantic network*, namely sparsity, connectedness, path-lengths, neighbourhood clustering and degree distributions.
  ]
  #v(-0.25in)

  #column-box(
    heading: "RESULTS",
  )[
    #set par(justify: true)
    *JSD*: The reweighed average JSD between humans and all models indicates a clear hierarchy in human-likeness, with *Mistral taking the lead (0.60), followed by Haiku (0.64) then Llama3 (0.77)*. An analysis by semantic category further reveals the order in which they affect human-likeness, from most to least human-like: *Animals, Basic Colours, Emotions, and Non-Basic Colours*.

    *NETWORKS*: The network analysis, done by running a linear mixed model for each property under investigation, revealed that *Llama3 had the most human-like network, followed by Mistral and Haiku*. Furthermore, the *Basic Colours* category resulted in the most human-like networks, followed by *Animals, Non-Basic Colours, and Emotions*.
  ]
  #v(-0.25in)

  #column-box(
    heading: "CONCLUSIONS",
  )[
    #set par(justify: true)
    LLMs struggle the most with recreating human semantic associations for *abstract concepts*. Moreover, their production of divergent semantic associations *does not imply similarly divergent semantic networks*.
  ]
  #v(-0.25in)

  #column-box(
    heading: "ACKNOWLEDGMENTS",
  )[
    Many thanks to Professors Barend Beekhuizen and Mai Ha Vu for their invaluable mentorship and assistance.
  ]
  #v(-0.25in)

])

#bottom-box(
  heading-box-args: (
    inset: 0.6em,
    stroke: none,
    // fill: rgb("#1E3765")
    // fill: rgb("#000000")
  ),
)[
  #text(weight: "regular", size: 45pt)[*Contact:* habbie.dem\@mail.utoronto.ca | habbie321.github.io]
]
