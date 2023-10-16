# Some boxes here and there

<div style="background: linear-gradient(83deg,#7cd5ff,#a6fbca 33%,#fff37c 66%,#ffa49d)">
Test
</div>

## Common Box
```typst
_common_box(
    body: [none] [content],
	heading: [none] [content],
	body_color: [none] [color],
	body_background: [none] [color],
	heading_color: [none] [color],
	heading_background: [none] [color],
	stretch_to_bottom: false,
	bottom_box: false,
) --> [content]
```

## Column Box
```typst
column_box(
	body,
	..args
) --> [content]
```

## Bottom Box
```typst
bottom_box(
    content,
    text_relative_width: 70%,
    logo: none,
    ..args
) --> [content]
```

## Bibliography Box
```typst
bibliography_box(
    bib_file,
    text_size: 24pt,
    title: none,
    style: "ieee",
    stretch_to_bottom: false
) --> [content]
```
