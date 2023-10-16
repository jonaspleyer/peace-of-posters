/// IMPORT THE POSTERS PACKAGE
#import "typst-posters/lib.typ": *

// Define overall formatting defaults for the document.
// These settings can be overwritten later on.
#set page(
    "a0",
    margin: 1.5cm,
)

#set text(
    font: "Arial",
	size: 33pt,
)

#let spacing = 1.2em
#set block(spacing: spacing)

// Define colors as given by coroprate design of uni freiburg
#let uni_dark_blue = rgb("#1d154d")

#set_theme(uni_fr)
#update_theme(
    heading_color: white,
)

/// START OF THE DOCUMENT
#title_box(
	[`cellular_raza` - Novel Flexibility in Design of Agent-Based Models in Cellular Systems],
	authors: "Jonas Pleyer¹, Christian Fleck¹",
	institutes: "¹Freiburg Center for Data-Analysis and Modeling",
    image: image("/UFR-Siegel-white.png"),
)

#column_box()[
	#set par(justify: true)
	#set align(center)
	Agent-Based Models (ABMs) allow researchers to describe complex cellular systems in a mechanistic manner but can also abstract over less-known processes.
	It is often desirable to exchange only parts of the model eg. changing the spatial representation of cells from a spherical interaction potential to an elliptical.
	Existing tools lack in flexibility and cannot change their internal representation of cells.
	To solve these problems we created `cellular_raza`, a novel library that offers previously unknown flexibility in model design while retaining excellent performance.
]

#columns(2, gutter: spacing)[
	#column_box(
		heading: [#set align(center);#image(height: 80pt, "images/cellular_raza_dark_mode.svg")],
	)[
		#columns(2, gutter: 0.5*spacing)[
			- New Agent-Based Modeling Tool
			- Extensive use of generics allows for unparalleled flexibility
			- Written in Rust
			- Parallelized (via OS-threads)
		
			#colbreak()
			- Produces deterministic results
			- Modularized
			- No inherent assumptions about cells or domain
			- User has complete control over every parameter and functionality
			- Free software (GPLv2.0)

		]
	]

	#column_box(heading: [Rust Traits are Cellular Properties], stretch_to_bottom: spacing)[
		This shows the abstract trait used to define cellular interactions via force mechanics.
        Users implement these traits to specify cellular behavior.
        #figure([
```rust
pub trait Interaction<Pos, Vel, Force, Inf = ()> {
    /// Get additional information of cellular properties (ie. for
    /// cell-specific interactions). For now, this can also be used
    /// to get the mass of the other cell-agent. In the future, we
    /// will probably provide a custom function for this.
    fn get_interaction_information(&self) -> Inf;

    /// Calculates the force (velocity-derivative) on the
    /// corresponding external position given external velocity.
    /// By providing velocities, we can calculate terms that are
    /// related to friction.
    fn calculate_force_between(
        &self,
        own_pos: &Pos,
        own_vel: &Vel,
        ext_pos: &Pos,
        ext_vel: &Vel,
        ext_info: &Inf,
    ) -> Option<Result<Force, CalcError>>;
}
```])
        Notice that even the types themselves such as position, force and velocity are generic, meaning this allows not only to switch between 2D and 3D but also to represent cells entirely differently as desired.
        The user is able and encouraged to modify and adjust these types as needed.
	]

	#colbreak()

	#column_box(heading: "Cell Sorting in 3D")[
		#figure(stack(dir: ltr,
			box([
                #image("images/cell_sorting_start.png", width: 49.5%)
                #place(top+left, dx: 10pt, dy: 10pt, rect(text("A", fill: white), fill: uni_dark_blue, inset: 10pt))
            ]),
            box(width: 1%),
			box([
                #image("images/cell_sorting_end.png", width: 49.5%)
                #place(top+left, dx: 10pt, dy: 10pt, rect(text("B", fill: white), fill: uni_dark_blue, inset: 10pt))
            ]),
		),
		caption: [
			Cells with species-specific interactions.
			The initially randomized state (A) organizes itself and separates the two species (B).
		])
	]

	#column_box(heading: [Branching patterns of _Bacillus subtilis_ in 2D & 3D])[
		#figure(stack(dir: ltr,
			box([
                #image("images/bacteria_cells_at_iter_0000088000.png", width: 49.5%)
                #place(top+left, dx: 10pt, dy: 10pt, rect(text("2D", fill: white), fill: uni_dark_blue, inset: 10pt))
            ]),
            box(width: 1%),
			box([
                #image("images/bacteria_population-3d-0000-cropped.png", width: 49.5%)
                #place(top+left, dx: 10pt, dy: 10pt, rect(text("3D", fill: white), fill: uni_dark_blue, inset: 10pt))
            ])
		), caption: [
            Spatio-Temporal patterns inspired by #cite("kawasakiModelingSpatioTemporalPatterns1997","matsushitaInterfaceGrowthPattern1998"). Cells ($~$500,000) consume extracellular nutrients, grow, divide and self-organize into a branched pattern.
			Brighter colors show higher nutrient concentrations.
		])
	]

	#column_box(heading: [Roadmap])[#columns(2)[
            - Stabilize user API
            - Develop additional backends
                - GPUs
                - MPI compatibility
            - Multi-Scale in time for different cellular properties
            - Optimize implementation of stochastic processes
            #colbreak()
            - Restarting Simulations
            - Advanced Error handling strategies and accuracy correction algorithms
            - Support common export formats (such as `*.vtk` files)
        ]]

	#bibliography_box("/cellular_raza.bib", title: "Sources", stretch_to_bottom: spacing)
]

#bottom_box(
	stack(dir: ltr, 
		box(width: 22.5%, [
            #set text(size: 30pt)
			bwHPC Symposium
			#linebreak()
			23.10.2023 - Mannheim
		]),
		box(width: 27.75%, height: 1.25em, align(center+horizon)[
			#set text(size: 35pt)
			#box(image(height: 30pt, "images/github-mark-white.png"))
			#link("https://github.com/jonaspleyer/")[github.com/jonaspleyer]
		]),
		box(width: 23.25%, align(center, image(height: 80pt, "images/cellular_raza_dark_mode.svg"))),
		box(width: 26.75%, height: 1.25em, align(center+horizon, [
			#set text(size: 35pt)
			#box(image(height: 30pt, "images/JonasPleyer-edited.jpeg"))
			#link("https/jonas.pleyer.org")[jonas.pleyer.org]
		])),
	),
	text_relative_width: 80%,
    logo: stack(dir: ltr,
        image(width: 0.3*(100% - 0.5*spacing - 80%), "fdm_logo.jpg", fit: "contain"),
        h(0.5*spacing),
        image(width: 0.7*(100% - 0.5*spacing - 80%), "UFR-Schriftzug-white.png", fit: "contain"),
    )
)
