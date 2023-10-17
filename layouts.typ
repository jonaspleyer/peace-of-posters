#let _default_layout = (
    "spacing": 1.2em,
    "body_box_args": (),
    "body_box_args_with_title": (),
    "body_box_function": rect,
    "heading_box_args": (),
    "heading_box_args_with_body": (),
    "heading_box_function": rect,
)

#let layout_a0 = _default_layout + (
    "body_size": 33pt,
    "heading_size": 50pt,
    "title_size": 75pt,
    "subtitle_size": 60pt,
    "authors_size": 50pt,
    "keywords_size": 40pt,
)

#let layout_a1 = _default_layout + (
    "body_size": 30pt,
    "heading_size": 45pt,
    "title_size": 70pt,
    "subtitle_size": 60pt,
    "authors_size": 45pt,
    "keywords_size": 36pt,
)

#let layout_a4 = _default_layout + (
    "body_size": 8pt,
    "heading_size": 12pt,
    "title_size": 18pt,
    "subtitle_size": 15pt,
    "authors_size": 12pt,
    "keywords_size": 10pt,
)

/// The default layout is for an a0 poster
#let _state_poster_layout = state("poster_layout", layout_a0)

#let update_layout(..args) = {
    for (arg, val) in args.named() {
        _state_poster_layout.update(pt => {
            pt.insert(arg, val)
            pt
        })
    }
}

#let set_layout(layout) = {
    _state_poster_layout.update(pt => {
        pt=layout
        pt
    })
}
