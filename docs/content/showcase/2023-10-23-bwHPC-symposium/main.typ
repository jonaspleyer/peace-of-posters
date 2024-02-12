/// IMPORT THE POSTERS PACKAGE
#import "typst-scienceposters/lib.typ": *

// Define overall formatting defaults for the document.
// These settings can be overwritten later on.
#set page(
    "a0",
    margin: 1.5cm,
)
#set_layout(layout_a0)
#set text(
    font: "Arial",
	size: layout_a0.at("body_size"),
)

#let spacing = 1.2em
#set block(spacing: spacing)
#set columns(gutter: spacing)
#update_layout(spacing, spacing)

#set_theme(uni_fr)

// Define colors as given by coroprate design of uni freiburg
#let uni_dark_blue = rgb("#1d154d")

/// START OF THE DOCUMENT
#title_box(
	[#box(inset: (bottom: -0.3em), image(height: 1.2em, "images/cellular_raza_dark_mode.svg")) - Novel Flexibility in Design of Agent-Based Models in Cellular Systems],
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
		heading: [Features],
	)[
		#columns(2, gutter: 0.5*spacing)[
			- Generic Progamming allows for unparalleled flexibility
			- Parallelized (via OS-threads and Domain-decomposition)
			- Produces deterministic results
		
			#colbreak()
			- Modular
			- No inherent assumptions
			- User has complete control over every parameter and functionality
			- Free software (GPLv2.0)

		]
	]

	#column_box(heading: "Scaling Behavior")[
		#figure(stack(dir: ltr, 
				box([#image("images/scaling_0.png")
				#place(top+left, rect(text("A", fill: white), fill: uni_dark_blue, inset: 10pt))], width: 49.5%),
				box(width: 1%),
				box([#image("images/scaling_1.png")
				#place(top+left, rect(text("B", fill: white), fill: uni_dark_blue, inset: 10pt))], width: 49.5%)
			),
			caption: [
				(A) Linear fit $f(x)=a x$ of scaling with increasing amounts of agents.
				(B) Amdahl's Law with up to $p=98.6%$ parallelized parts of the executed code resulting in a $21.5$ times speedup.
			])
		#align(right, text(size: 20pt)[
			#super("1")Workstation, AMD 3960X (24C/48T) \@3.8GHz-4.5GHz, 64Gb DDR4 3200MT/s\
			#super("2")Desktop, AMD 3700x (8C/16T) \@3.6GHz-4.4GHz, 32Gb DDR4 3200MT/s\
			#super("3")Laptop, Intel 12700H (6+8C/12+8T) 45W \@3.5GHz-4.7GHz 32Gb DDR5 4800MT/s
		])
	]

	#column_box(heading: [Cellular Properties as Rust Traits])[
		Abstract traits are used to define cellular interactions via force mechanics.
        Users implement traits and obtain full control over cellular behavior.
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
        // Notice that even the types themselves such as position, force and velocity are generic, meaning this allows not only to switch between 2D and 3D but also to represent cells entirely differently as desired.
        // The user is able and encouraged to modify and adjust these types as needed.
	]

	#column_box(
		heading: [Roadmap],
		stretch_to_bottom: true,
	)[#columns(2)[
		- Stabilize user API
		- Additional backends (GPUs, MPI)
		- Multi-Scale
		- Stochastic processes
		#colbreak()
		- Restarting simulations
		- Advanced error handling
		- Support common export formats (such as `*.vtk` files)
	]]

	#colbreak()

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
			Brighter colors indicate higher nutrient concentrations.
		])
	]

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
			The initially randomized state (A) organizes itself and the two species get separated (B).
		])
	]

	#column_box(heading: [Semi-Vertex Models])[
		#figure(stack(dir: ltr,
			box([
				#image("images/kidney_organoid_model-final.png", width: 49.5%)
				#place(top+left, dx: 10pt, dy: 10pt, rect(text("A", fill: uni_dark_blue), fill: white, inset: 10pt))
			]),
			box(width: 1%),
			box([
				#image("images/free_vertex_model_end.png", width: 49.5%)
				#place(top+left, dx: 10pt, dy: 10pt, rect(text("B", fill: uni_dark_blue), fill: white, inset: 10pt))
			])
		),
		caption: [
			Freely motile semi-vertex models with (A) 6 and (b) 4 vertices.
			Vertices attract each other but will be repelled once inside another cell.
		])
	]

	#bibliography_box("/cellular_raza.bib", title: "Sources", stretch_to_bottom: true)
]

#bottom_box(
	stack(dir: ltr, 
		box(width: 20.5%, [
            #set text(size: 30pt)
			bwHPC Symposium
			#linebreak()
			23.10.2023 - Mannheim
		]),
		box(width: 29.75%, height: 1.25em, align(center+horizon)[
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
