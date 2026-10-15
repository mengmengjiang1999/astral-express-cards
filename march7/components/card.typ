#import "frame.typ": frame
#let decorations(t, asset) = {
  place(top + left, rect(width: 60mm, height: 16mm, fill: t.colors.blush, stroke: none))
  place(top + right, rect(width: 30mm, height: t.height, fill: t.colors.ice, stroke: none))
  frame(t)
  place(top + left, dx: 0.8mm, dy: 0.8mm, asset(t.flower, width: 5mm))
  place(bottom + right, dx: -5.2mm, dy: -4mm, asset(t.ticket, height: 8.5mm))
}

#let identity(c, t) = {
  v(3.8mm)
  text(size: t.sizes.name, weight: "medium", fill: t.colors.heading, c.name)
  v(4.8mm)
  text(size: t.sizes.role, fill: t.colors.accent, c.role)
  v(4mm)
  block(fill: t.colors.pink, inset: (x: 2.2mm, y: 0.8mm))[
    #text(size: t.sizes.affiliation, fill: t.colors.ink, c.affiliation)
  ]
  v(3mm)
  text(size: t.sizes.specialty, fill: t.colors.muted, c.specialty)
}

#let card(c, t, asset) = {
  set page(width: t.width, height: t.height,
    margin: (top: 7mm, bottom: 6mm, left: 7mm, right: 7mm),
    fill: t.colors.paper, background: decorations(t, asset))
  set text(font: t.font, lang: "zh", size: 7pt, fill: t.colors.ink)
  set par(leading: 0.3em, spacing: 0pt)
  text(size: t.sizes.brand, tracking: 1.3pt, fill: t.colors.heading, t.brand)
  v(1.2mm)
  grid(columns: (1fr, 19mm), column-gutter: 4mm,
    identity(c, t),
    [
      #block(inset: 0.8mm, stroke: 0.5pt + t.colors.blue, fill: t.colors.paper)[
        #asset(c.portrait, width: 17.4mm, height: 22.53mm, fit: "contain")
      ]
      #v(1.5mm)
      #text(size: t.sizes.roman, tracking: 0.7pt, fill: t.colors.heading, c.roman_name)
    ],
  )
}
