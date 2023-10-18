#import "themes.typ": *
#import "layouts.typ": *

#let stretch_box_to_bottom(box_function, spacing: 1.2em, ..r) = locate(loc => {
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
	let r1 = box_function(..r)
	for c_box in elems {
		r1 = style(styles => {
			let c_box_width = measure(c_box, styles).width
			let c_box_position = c_box.location().position()
			// If the box has 0pt width we expect to have found the bottom box
			// This is probably an error but works for now
			let bottom_y = c_box_position.y
			let dist = c_box_position.y - m_loc.y - spacing
			if c_box_width==0pt {
				box_function(..r, height: dist)
			} else if int(m_loc.x <= c_box_position.x + c_box_width)*int(c_box_position.x <= m_loc.x)==1 {
				box_function(..r, height: dist)
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
	heading_size: none,
	heading_box_args: none,
	heading_text_args: none,
	heading_box_function: none,
	body_size: none,
	body_box_args: none,
	body_text_args: none,
	body_box_function: none,
	stretch_to_bottom: false,
	spacing: none,
	bottom_box: false,
) = {
	locate(loc => {
		let pt = _state_poster_theme.at(loc)
		let pl = _state_poster_layout.at(loc)

		let spacing = if spacing==none {pl.at("spacing")} else {spacing}

		/// #####################################################
		/// ###################### HEADING ######################
		/// #####################################################
		// Sort out arguments for heading box
		let heading_box_args = heading_box_args
		if heading_box_args==none {
			heading_box_args = pt.at("heading_box_args", default: (:))
			if body==none {
				heading_box_args = pt.at("heading_box_args_with_body", default: heading_box_args)
			}
		}

		// Sort out arguments for heading text
		let heading_text_args = heading_text_args
		if heading_text_args==none {
			heading_text_args = pt.at("heading_text_args", default: (:))
			if body==none {
				heading_text_args = pt.at("heading_text_args_with_body", default: heading_text_args)
			}
		}

		// Define which function to use for heading box
		let heading_box_function = heading_box_function
		if heading_box_function==none {
			heading_box_function = pt.at("heading_box_function", default: rect)
		}

		// Determine the size of the heading
		let heading_size = pl.at("heading_size", default: heading_size)
		if heading_size!=none {
			heading_text_args.insert("size", heading_size)
		}

		/// CONSTRUCT HEADING IF NOT EMPTY
		let heading_box = box(width: 0%, height: 0%)
		if heading!=none {
			heading_box = heading_box_function(
				..heading_box_args,
			)[
				#set text(..heading_text_args)
				#heading
			]
		}

		/// #####################################################
		/// ####################### BODY ########################
		/// #####################################################
		// Sort out arguments for body box
		let body_box_args = body_box_args
		if body_box_args==none {
			body_box_args = pt.at("body_box_args", default: (:))
			if heading==none {
				body_box_args = pt.at("body_box_args_with_heading", default: body_box_args)
			}
		}

		// Sort out arguments for body text
		let body_text_args = body_text_args
		if body_text_args==none {
			body_text_args = pt.at("body_text_args", default: (:))
			if heading==none {
				body_text_args = pt.at("body_text_args_with_heading", default: body_text_args)
			}
		}

		// Define which function to use for body box
		let body_box_function = body_box_function
		if body_box_function==none {
			body_box_function = pt.at("body_box_function", default: rect)
		}

		// Determine the size of the body
		let body_size = pl.at("body_size", default: body_size)
		if body_size!=none {
			body_text_args.insert("size", body_size)
		}

		/// CONSTRUCT BODY IF NOT EMPTY
		let body_box = box(width: 0%, height: 0%)
		if body!=none {
			body_box = body_box_function(
				..body_box_args,
			)[
				#set text(..body_text_args)
				#body
			]
		}

		/// #####################################################
		/// ##################### COMBINE #######################
		/// #####################################################
		/// IF THIS BOX SHOULD BE STRETCHED TO THE NEXT POSSIBLE POINT WE HAVE TO ADJUST ITS SIZE
		if stretch_to_bottom==true {
			if body!=none {
				body_box = stretch_box_to_bottom(
					body_box_function,
					spacing: spacing,
					body,
					..body_box_args,
				)
			} else {
				heading_box = stretch_box_to_bottom(
					heading_box_function,
					spacing: spacing,
					heading,
					..heading_box_args,
				)
			}
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
#let title_box(
	title,
	subtitle: none,
	authors: none,
	institutes: none,
	keywords: none,
	image: none,
	text_relative_width: 80%,
	spacing: 5%,
	title_size: none,
	subtitle_size: none,
	authors_size: none,
	keywords_size: none,
) = {
	locate(loc => {
		let text_relative_width = text_relative_width
		/// Get theme and layout state
		let pl = _state_poster_layout.at(loc)

		/// Layout specific options
		let title_size = if title_size==none {pl.at("title_size")} else {title_size}
		let subtitle_size = if subtitle_size==none {pl.at("subtitle_size")} else {subtitle_size}
		let authors_size = if authors_size==none {pl.at("authors_size")} else {authors_size}
		let keywords_size = if keywords_size==none {pl.at("keywords_size")} else {keywords_size}

		/// Generate body of box
		let text_content = [
			#set text(size: title_size)
			#title\
			#set text(size: subtitle_size)
			#if subtitle!=none {[#subtitle\ ]}
			#v(1.25em, weak: true)
			#set text(size: authors_size)
			#if authors!=none {[#authors\ ]}
			#if institutes!=none {[#institutes\ ]}
			#if keywords!=none {[
				#v(1em, weak: true)
				#set text(size: keywords_size)
				#keywords
			]}
		]

		/// Expand to full width of no image is specified
		if image==none {
			text_relative_width=100%
		}

		/// Finally construct the main rectangle
		_common_box(heading:
			stack(dir: ltr,
				box(text_content, width: text_relative_width),
				align(right, box(image, width: 100% - spacing - text_relative_width))
			))
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

/// TODO
#let bibliography_box(bib_file, body_size: 24pt, title: none, style: "ieee", stretch_to_bottom: false) = {
	if title==none {
		title = "References"
	}
	column_box(heading: title, stretch_to_bottom: stretch_to_bottom)[
		#set text(size: body_size)
		#bibliography(bib_file, title: none, style: style)
	]
}
