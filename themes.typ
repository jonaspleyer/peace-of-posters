#let _state_poster_theme = state("poster_theme", (
    // TODO do we really want this option?
    // "block_spacing": 1.2em,
    "body_color": black,
    "body_background": white,
    "heading_color": white,
    "heading_background": rgb(25, 61, 112),
))

#let uni_fr = (
    "body_color": black,
    "body_background": white,
    "heading_color": white,
    "heading_background": rgb("#1d154d"),
)

#let update_theme(..args) = {
    for (arg, val) in args.named() {
        _state_poster_theme.update(pt => {
            pt.insert(arg, val)
            pt
        })
    }
}

#let set_theme(theme) = {
    _state_poster_theme.update(pt => {
        pt=theme
        pt
    })
}
