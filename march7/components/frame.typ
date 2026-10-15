// Shared clipped-corner frame; decorations never reserve body space.
#let frame(t) = {
  place(top + left, dx: 3mm, dy: 3mm,
    rect(width: t.width - 6mm, height: t.height - 6mm, stroke: 0.5pt + t.colors.blue))
  place(top + left,
    polygon((8mm, 4mm), (t.width - 8mm, 4mm), (t.width - 4mm, 8mm),
      (t.width - 4mm, t.height - 8mm), (t.width - 8mm, t.height - 4mm),
      (8mm, t.height - 4mm), (4mm, t.height - 8mm), (4mm, 8mm),
      fill: none, stroke: 0.35pt + t.colors.pink))
}
