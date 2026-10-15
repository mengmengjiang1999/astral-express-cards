#import "frame.typ": frame
#let back-decorations(t) = {
  place(top + left, rect(width: t.width, height: 12mm, fill: t.colors.blush, stroke: none))
  frame(t)
}

#let back-card(c, t, asset) = {
  set page(width: t.width, height: t.height,
    margin: (top: 7mm, bottom: 8mm, left: 10mm, right: 10mm),
    fill: t.colors.paper, background: back-decorations(t))
  set text(font: t.font, lang: "zh", size: 7pt, fill: t.colors.ink)
  set par(leading: 0.3em, spacing: 0pt)
  align(center)[
    #text(size: t.sizes.brand, tracking: 1.3pt, fill: t.colors.heading, t.brand)
    #v(5mm)
    #grid(columns: (1fr, 4.5mm, 1fr), column-gutter: 1.2mm, align: horizon,
      line(length: 100%, stroke: 0.4pt + t.colors.blue),
      asset(t.flower, width: 4.5mm),
      line(length: 100%, stroke: 0.4pt + t.colors.blue),
    )
    #v(3mm)
    #text(size: t.sizes.closing, weight: "medium", fill: t.colors.heading, c.closing)
    #v(6mm)
    #text(size: t.sizes.paths, fill: t.colors.accent, c.back_paths.join("　·　"))
    #v(1fr)
    #text(size: t.sizes.footer, tracking: 1pt, fill: t.colors.muted, c.back_affiliation)
  ]
}
