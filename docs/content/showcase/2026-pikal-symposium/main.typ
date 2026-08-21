#import "@preview/peace-of-posters:0.6.0": *
#import "@preview/cetz:0.5.2"
#import "@preview/cades:0.3.1": qr-code
#import "@preview/fontawesome:0.6.2": fa-icon
#import "@preview/meander:0.4.4"


#set text(font: "Arial", fill: black, size: 40pt)

#set page("a0", margin: 1cm)

#let box-spacing = 0.5cm
#set columns(gutter: box-spacing)
#update-poster-layout(title-size: 102pt, heading-size: 60pt, body-size: 40pt)

#let pu-color = rgb("#CFB991")
#let pu-theme = (
  "body-box-args": (
    fill: white,
    inset: 0.3in,
    stroke: pu-color,
    width: 100%
  ),
  "heading-box-args": (
    inset: 0.25in,
    fill: pu-color,
    width: 100%
  ),
  "heading-text-args": (fill: black, ),
  "title-text-args": (
    weight: "regular",
  ),
  "title-box-args": (
    fill: white,
    stroke: none
  ),
)
#set-theme(pu-theme)


// Title Section: grid to place title in between QR code and logos, plus center it
#grid(columns: (auto, auto, auto), 
qr-code("https://lyopronto2.geddes.rcac.purdue.edu", width: 4in),
align(center)[
  #set par(leading: 0.9cm, spacing: 0.9cm)
  #title-box( 
    [LyoPronto v2:],
    subtitle: [Code Verification, Equipment Capability Modeling, and More],
    // background: image(),
    // authors: [Isaac Wheeler, Vivek Narsimhan, Alina Alexeenko\*   alexeenk\@purdue.edu],

    // institutes: "Purdue University, Davidson School of Chemical Engineering",
  )
  #line(length: 90%) 
#strong[Isaac Wheeler], Vivek Narsimhan, Alina Alexeenko\* #h(10%) alexeenk\@purdue.edu \
Purdue University, Davidson School of Chemical Engineering],
align(center)[#image("figures/PU_logo.png", width:5in) #image("figures/LyoHUB_logo.png", width: 5in)],
)

#columns(2, gutter: 0.5in)[
  #column-box(heading: "Introduction")[
    - LyoPRONTO first published in 2019 @shivkumarLyoPRONTOOpenSourceLyophilization2019
      - #fa-icon("python") Python script/package
      - Web interface (written in JavaScript) hosted by Purdue \
        `https://lyopronto.geddes.rcac.purdue.edu`
    - Now:
      - Python package hosted on GitHub #fa-icon("github")
      `pip install git+https://github.com/LyoHUB/LyoPRONTO`

      - Julia package `LyoPronto.jl` has additional tools
      - Web interface written in Python, hosted at Purdue but with a Docker container that can deploy anywhere \
      `https://lyopronto2.geddes.rcac.purdue.edu`

  ]

  #column-box(heading: "Equipment Capability Compact Model", )[
    - Compact model: interpolates across CFD results validated with experiments @kazarinCompactModelLyophilizer2022
    - Provided now in web interface, implemented in `LyoPronto.jl`
    #align(center, image("figures/lyophilizer_dims.svg", width: 80%,))
    - With $V_"chamber"$, $D_"duct"$, $delta_"valve"$, $L_"duct"$, predicts $a$ and $b$ for the choked flow limit: $accent(m, dot)_"sub" = a + b p_"chamber" $
    - $a$ and $b$ can be plugged in to LyoPRONTO's design space 
  ]

  #column-box(heading: "Microwave Model", stretch-to-next: true)[
    - Microwave model from @wheelerMechanisticModelsExperimental2026 is implemented in `LyoPronto.jl`
    - Can be used to simulate microwave-assisted lyophilization
    - Three empirical parameters: product absorption $B_"f"$, vial absorption $B_"vw"$, radial heat transfer $K_"vw-f"$; fit to experiment
    #align(center, image("figures/2DVials_LC-DIF_dom.svg", width: 75%))
  ]

  #colbreak()
  #column-box(heading: "Software Verification")[
    #set box(fill: rgb("#f0f0f0"), stroke: none, inset: 0.5em)
    - Draw on software engineering best practices
    - Unit testing: tests which run single functions of the code, checking that it behaves correctly 
    #box(
      ```python 
      def test_mass_conservation(example_conditions):
          output = simulate(example_conditions)
          assert water_mass_initial == total_flux(output)
      ```)
    - Integration testing: tests that multiple small pieces give correct results when used together
    #box(
      ```python 
      def test_correct_plots(input_filename):
          params = read_input(input_filename)
          output = simulate(params)
          plots = generate_plots(output)
          assert len(plots) == 3 # 3 plots generated
      ```)
    - Continuous integration (CI): at every code change, run the full suite of tests to ensure that no functions were broken
    - LyoPRONTO now uses CI with a suite of tests!
  ]
  #column-box(heading: `LyoPronto.jl`+": Multi-Experiment Fitting", )[
    
    #meander.reflow({
      import meander: *
    placed(
      top + right, cetz.canvas({
      let arrow = (mark: (end: ">", scale: 2, weight: 30pt))
      let topy = 10
      let halfwid = 2
      let colsep = 5
      let Kvc = rgb("#fa8585")
      let Rpc = rgb("#b2baff")
      import cetz.draw: *
      circle((halfwid, topy), name: "Kv", radius: (halfwid, 1), fill: Kvc)
      content("Kv", $K_v$)
      for i in (1, 2, 3) {
        circle((halfwid+i*colsep, topy), name: "Rp"+str(i), radius: (halfwid, 1), fill: Rpc)
        content("Rp"+str(i), [$R_p$ #str(i)])
      }

      for i in (1, 2, 3, 4) {
        rect((0+(i - 1)*colsep, 2), (halfwid*2+(i - 1)*colsep, 7.5), name:"mexp" + str(i), fill: gray)
        content((name: "mexp"+str(i), anchor:"center"), align(center, [Model \ vs. \ Exp #i], ))
        line((halfwid,topy - 1), (name:"mexp" + str(i), anchor: "north"), stroke: Kvc + 3pt, ..arrow)
      }
      line((name: "Rp1", anchor: "south"), (name:"mexp1", anchor: "north"), stroke: Rpc + 3pt, ..arrow)
      for i in (1, 2, 3) {
        line((name: "Rp" + str(i), anchor: "south"), (name:"mexp" + str(i+1), anchor: "north"), stroke: Rpc + 3pt, ..arrow)
      }
      rect((1*colsep, -2), (2*colsep+2*halfwid, 0), name: "err", radius: 0.5, fill: orange)
      content("err", [Squared Error])

      for i in (1, 2, 3, 4) {
        line((name: "mexp" + str(i), anchor: "south"), (name:"err", anchor: "north"), stroke: orange + 3pt, ..arrow)
      }
      })
    )

    container()
    content[
    Consider : 
    - 4 experiments 
    - 3 different formulations
    - Same lyophilizer & vials
    - $K_v$ & $R_p$ unknown
    - Thermocouple or other process data available 

    - Least squares *fit to all 4 cycles* can give less uncertainty in $K_v$ than fitting to each one separately
    - With Julia, can take derivatives of the squared error with respect to $K_v$ and each parameter of $R_p$ to find the minimum: more rigor than manual tuning 
    ]
    })

  ]
  
  #column-box(heading: "Future Work", )[
    - Design a way to carry out multi-experiment fitting with the web interface (including specifying thermocouples, etc.)
    - Add microwave model simulation & fitting to web interface
    - Add existing secondary drying models
    - More LLM-legible documentation of the code, for agent use

  ]
  #column-box(heading: "References & Acknowledgements", stretch-to-next: true)[
    #set text(size:32pt)
    #set par(leading: 0.5em, spacing: 0.6em)
    The original LyoPRONTO Python code was written by Gayathri Shivkumar & Petr Kazarin, with a web interface by Ivan Soroko. David Bernal and Yirang Park are contributing to ongoing development of the Python version.
    #bibliography(title: none, "refs.bib")
  ]


]