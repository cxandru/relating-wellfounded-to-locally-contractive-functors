// Theorem-style blocks for classifications imported from Forester's taxonomy.
#let _environment(kind, accent, body) = {
  block(
    width: 100%,
    inset: (left: 0.8em, right: 0.65em, top: 0.55em, bottom: 0.6em),
    stroke: (left: 1.5pt + accent),
    breakable: true,
    {
      set par(first-line-indent: 0em)
      text(weight: "bold", fill: accent)[#kind.]
      h(0.45em)
      body
    },
  )
}

#let definition(body) = _environment("Definition", rgb("#2e4a7a"), body)
#let theorem(body) = _environment("Theorem", rgb("#7a2e2e"), body)
#let lemma(body) = _environment("Lemma", rgb("#7a2e2e"), body)
