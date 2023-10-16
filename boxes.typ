#import "themes.typ": *

#let stretch_rectangle_to_bottom(..r, spacing: 1.2em) = locate(loc => {
    // Get current y location
    let m_loc = loc.position()
	// [My location: #m_loc#linebreak()]
	// Find bottom boxes
	let elems = query(<COLUMN_BOX>, loc).filter(c_box => {
		let c_loc = c_box.location().position()
		// TODO this is NOT complete (missing criteria for x-coordinate)
		// Probably many bugs left to find
		int(c_loc.y > m_loc.y)*int(c_loc.x <= m_loc.x)==1
	})

	// If none was found we create one which is empty instead
	let n = 0
	let r1 = rect(..r)
	for c_box in elems {
		r1 = style(styles => {
			let c_box_width = measure(c_box, styles).width
			let c_box_position = c_box.location().position()
			// If the box has 0pt width we expect to have found the bottom box
			// This is probably an error but works for now
			let bottom_y = c_box_position.y
			let dist = c_box_position.y - m_loc.y - spacing
			if c_box_width==0pt {
				rect(..r, height: dist)
			} else if int(m_loc.x <= c_box_position.x + c_box_width)*int(c_box_position.x <= m_loc.x)==1 {
				rect(..r, height: dist)
			} else {
				r1
			}
		})
	}
	r1
})

// A common box that makes up all other boxes
#let _common_box(
	body: none,
	heading: none,
	body_color: none,
	body_background: none,
	heading_color: none,
	heading_background: none,
	stretch_to_bottom: false,
	bottom_box: false,
) = {
	locate(loc => {
		let pt = _state_poster_theme.at(loc)

		/// INITIALIZE ALL DEFAULT VALUES
		let heading_color = heading_color
		let heading_background = heading_background
		let body_color = body_color
		let body_background = body_background

		/// SET ALL DEFAULT VALUES DEFINED BY THE CURRENT THEME
		if heading_color==none {heading_color = pt.at("heading_color")}
		if heading_background==none {heading_background = pt.at("heading_background")}
		if body_color==none {body_color = pt.at("body_color")}
		if body_background==none {body_background = pt.at("body_background")}

		/// CONSTRUCT HEADING IF NOT EMPTY
		let heading_box = box(width: 0%, height: 0%)
		if heading!=none {
			heading_box = rect(
				width: 100%,
				fill: heading_background,
				inset: 18pt,
				stroke: heading_background,
			)[
				#set text(fill: heading_color, size: 50pt)
				#set text(size: 50pt)
				#heading
			]
		}

		/// CONSTRUCT BODY IF NOT EMPTY
		let body_box = box(width: 0%, height: 0%)
		if body!=none {
			body_box = rect(
				body,
				width: 100%,
				inset: 18pt,
			)
		}

		/// IF THIS BOX SHOULD BE STRETCHED TO THE NEXT POSSIBLE POINT WE HAVE TO ADJUST ITS SIZE
		if stretch_to_bottom!=false {
			body_box = stretch_rectangle_to_bottom(
				body,
				width: 100%,
				inset: 18pt,
				spacing: stretch_to_bottom,
			)
		}
		box([#stack(dir:ttb,
			heading_box,
			body_box,
		)<COLUMN_BOX>])
	})
}


// Write a function to creata a box with heading
#let column_box(
	body,
	..args
) = {
    _common_box(body: body, ..args)
}

// Function to display the title of the document
#let title_box(title, heading_color: none, heading_background: none, subtitle: none, authors: none, institutes: none, keywords: none, image: none, text_relative_width: 80%, spacing: 5%, inset: 20pt) = {
	locate(loc => {
		let pt = _state_poster_theme.at(loc)

		let heading_color = if heading_color==none {pt.at("heading_color")} else {heading_color}
		let heading_background = if heading_background==none {pt.at("heading_background")} else {heading_background}

		let content = [
			#set text(fill: heading_color, size: 75pt)
			#title\
			#set text(size: 60pt)
			#if subtitle!=none {[#subtitle\ ]}
			#v(1.25em, weak: true)
			#set text(size: 50pt)
			#if authors!=none {[#authors\ ]}
			#if institutes!=none {[#institutes\ ]}
			#if keywords!=none {[
				#v(1em, weak: true)
				#set text(size: 40pt)
				#keywords
			]}
		]
		if image==none {
			text_relative_width=100%
		}
		rect(
			fill: heading_background,
			width: 100%,
			inset: inset,
			stroke: heading_background,
		)[
			#stack(dir: ltr,
				box(content, width: text_relative_width),
				align(right, box(image, width: 100% - spacing - text_relative_width))
			)
		]
	})
}

#let bottom_box(body, text_relative_width: 70%, logo: none, ..args) = {
	let body = [
        #set align(top+left)
		#if logo==none {
			box(width: 100%, body)
		} else {
			stack(dir: ltr,
				box(width: text_relative_width, body),
				align(right+horizon, logo),
			)
		}
	]
	let r = _common_box(heading: body, bottom_box: true, ..args)
	align(bottom, r)
}

#let bibliography_box(bib_file, text_size: 24pt, title: none, style: "ieee", stretch_to_bottom: false) = {
	if title==none {
		title = "References"
	}
	column_box(heading: title, stretch_to_bottom: stretch_to_bottom)[
		#set text(size: text_size)
		#bibliography(bib_file, title: none, style: style)
	]
}
