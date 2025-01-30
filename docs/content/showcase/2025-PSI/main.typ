#import "../../../../lib.typ" as pop
#import "@preview/xarrow:0.3.0": xarrow

#set page("a1", margin: 2cm)
#pop.set-poster-layout(pop.layout-a1)
#pop.set-theme(pop.psi-ch)
#set text(font: "arial", size: pop.layout-a1.at("body-size"))
#let box-spacing = 1.2em
#set columns(gutter: box-spacing)
#set block(spacing: box-spacing)
#pop.update-poster-layout(spacing: box-spacing, heading-size: 30pt)

#pop.title-box(
    [
        #set text(fill: white)
        #image("psi_scd_banner_white.png", width: 35%)
        Predicting electronic screening for fast Koopmans spectral functionals
    ],
    authors: [
        #v(1cm)
        #set text(fill: black)
        Edward Linscott#super("1,2"),
        Yannick Schubert#super("3"),
        Sandra Luber#super("3"),
        and Nicola Marzari#super("1,2,4")
    ],
    institutes: [
        #set text(fill: black, weight: "regular")
        #super("1")Center for Scientific Computing, Theory and Data, Paul Scherrer Institute,
            Switzerland
        #super("2")National Centre for Computational Design and Discovery of Novel Materials
            (MARVEL), Paul Scherrer Institute, Switzerland
        #super("3")Department of Chemistry, University of Zurich, Switzerland
        #super("4")Theory and Simulation of Materials, École Polytechnique Fédérale de Lausanne,
            Switzerland"
    ],
  background: box(image("pink-yellow.png", height: 16cm, width: 100%), inset: -2cm, outset: 0pt),
  authors-size: 27pt,
  institutes-size: 19pt,
)

#columns(2,[
  #pop.column-box(heading: "Summary")[
    - Koopmans functionals are powerful orbital-density-dependent functionals that predict spectral
      properties as accurately as state-of-the-art GW@Dabo2010@Nguyen2018@Colonna2019@Linscott2023
    - they rely on parameters to capture electronic screening
    - we construct a ML framework to predict these parameters
    - minimal training data is required to achieve desirable accuracy
  ]

  #pop.column-box(heading: "1. What are screening parameters?")[
  $
    alpha_i = (angle.l n_i|epsilon^(-1) f_"Hxc"|n_i angle.r) / (angle.l n_i|f_"Hxc"|n_i angle.r)
  $
  - can be computed #emph[ab initio] @DeGennaro2022@Colonna2018@Colonna2022
  - are the vast majority of Koopmans' computational cost
  - must be accurate; if $psi_i (bold(r)) = sum_j U_(i j) phi_j (bold(r))$ then

    #set text(size: 0.8em)
    $
      Delta epsilon_(i in"occ") =
      sum_(j) alpha_j U_(i j)U_(j i)^dagger
      (-E_"Hxc" [rho - n_j]+E_"Hxc" [rho] - integral d bold(r) v_"Hxc" [rho](bold(r))  n_j (bold(r)))
    $
  ]

  #pop.column-box(heading: "2. How can machine learning help?")[
    #grid(columns: 8, column-gutter: 0.3em, row-gutter: 0.3em,
        image("CsSnI3_disordered.png", width: 100%),
        image("CsSnI3_disordered.png", width: 100%),
        image("CsSnI3_disordered.png", width: 100%),
        image("CsSnI3_disordered.png", width: 100%),
        image("CsSnI3_disordered.png", width: 100%),
        image("CsSnI3_disordered.png", width: 100%),
        image("CsSnI3_disordered.png", width: 100%),
        grid.cell(align: center + horizon, [...]),
        grid.cell(inset: 0.2em, align: center, fill: rgb("#dc005a"), colspan: 3, text(fill: white, "train", size: 0.5em, weight: "bold")),
        grid.cell(inset: 0.2em, align: center, fill: yellow, colspan: 5, text("predict", size: 0.5em, weight: "bold")),
  )
  #v(-0.5em)
  _or_ train on a small cell and deploy on a larger cell (N.B. not a general-purpose model)
  
  ]

  #pop.column-box(heading: "3. Our machine learning framework")[
    $ rho_i (bold(r)) arrow.r p^i_(n_1 n_2 l k_1 k_2) arrow.r alpha_i $
    #v(-0.5em)
    *Descriptors* are power spectrum decompositions@Bartok2013@Himanen2020 of orbital densities
    #set text(size: 0.8em)
    #v(-1.5em)
  $
    p^i_(n_1 n_2 l,k_1 k_2) = pi sqrt(8 / (2l+1)) sum_m c_(n_1 l m,k_1)^(i *) c_(n_2 l m,k_2)^i
  $
  $
    c^i_(n l m, k) & = integral dif bold(r) g_(n l) (r) Y_(l m)(theta,phi) n_i (
      bold(r) - bold(R)_i
    )
  $
    #set text(size: 1.25em)

    *Network* is just ridge regression!

  ]

  #pop.bibliography-box("docs/content/showcase/2025-PSI/references.bib", style: "docs/content/showcase/2025-PSI/brief.csl", body-size: 0.55em)

  #colbreak()

  #pop.column-box(heading: "4. Results")[
    - accurate to $cal("O")$(10 meV) _cf._ typical $E_g$ accuracy of $cal("O")$(100 meV)
    - speed-ups from $cal("O")$(10) to $cal("O")$(100) times!
    - ridge-regression on one snapshot more accurate than oneshot
    #grid(
      columns: 2,
      gutter: 0.2em,
      [*Accuracy*], [*Speed-up*],
      image("convergence_analysis_Eg_only.svg", width: 100%),
      v(0.4em) + image("speedup.svg", width: 83%),
      align(center, image("water_cls_calc_vs_pred_and_hist.svg", width: 98%)),
      align(center, image("CsSnI3_calc_vs_pred_and_hist.svg", width: 98%)),
      v(-25.8em) + text(size: 0.7em, "water"), v(-25.8em) + text(size: 0.7em, "CsSnI" + sub("3")) + v(25.1em),
      [*Transferability*], [],
      align(center, image("transferability_water.svg", width: 98%)),
      align(center, image("transferability_cssni3.svg", width: 98%)),
    )
    #v(-0.5em)
  ]

  #pop.column-box(heading: "5. Takeaways")[
  - lightweight ML can predict Koopmans screening parameters
  - more generally, predicting electronic response can be done efficiently with frozen-orbital approximations and ML
  - try it now with `koopmans`! (`koopmans-functionals.org`)
  ]
])

#v(-1em)

#pop.bottom-box(
    heading-box-args: (inset: 1cm, fill: rgb("#dc005a")),
    logo: grid(columns: 2, align: horizon + center, column-gutter: 3em, 
        image("marvel_white_on_transparent.png", height: 2em),
        image("snf_white_on_transparent.png", height: 2em),
    ),
)[
    #box(height: 2em)[#set text(size: 27pt, fill: white, weight: "bold")
    #align(horizon)[For more details, see Schubert _et al._, npj Computational Materials (2024)]]
]
