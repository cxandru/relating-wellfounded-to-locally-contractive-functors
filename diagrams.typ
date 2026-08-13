// Native Fletcher diagrams replacing the generated TikZ/SVG figures.
#import "@preview/fletcher:0.5.8": diagram, node, edge
#import "notation.typ": *

#let label(body) = text(size: 0.82em, body)
#let native-diagram(..items) = align(center, diagram(
  spacing: (3.1em, 2.4em),
  node-inset: 4pt,
  ..items.pos(),
))

#let adjoint-triple-diagram() = native-diagram(
  node((0, 0), [$bold("Psh") cal(C)$]),
  node((2.15, 0), [$bold("Fam")(cal(C))$]),
  edge((2.15, 0), (0, 0), "->", label: label([$bold("Free")$]), bend: 38deg),
  edge((0, 0), (2.15, 0), "->", label: label([$U$])),
  edge((2.15, 0), (0, 0), "->", label: label([$bold("Cofree")$]), bend: -38deg),
)

#let algebra-square() = native-diagram(
  node((0, 0), [$F x$]), node((1, 0), [$F y$]),
  node((0, 1), [$x$]), node((1, 1), [$y$]),
  edge((0, 0), (1, 0), "->", label: label([$F f$])),
  edge((0, 1), (1, 1), "->", label: label([$f$])),
  edge((0, 0), (0, 1), "->", label: label([$alpha$])),
  edge((1, 0), (1, 1), "->", label: label([$beta$])),
)

#let strict-downset-diagram() = native-diagram(
  node((0.5, 0), [$x$]), node((0, 1), [$y_1$]), node((1, 1), [$y_2$]),
  edge((0, 1), (0.5, 0), "->"), edge((1, 1), (0.5, 0), "->", bend: 15deg),
  edge((1, 1), (0.5, 0), "->", bend: -15deg), edge((0, 1), (1, 1), "->"),
  node((0.5, 1.55), text(fill: luma(110))[$"deg" y_1, "deg" y_2 < "deg" x$]),
)

#let direct-category-diagram() = native-diagram(
  node((-1.15, 0), [$a$]), node((1.15, 0), [$b$]), node((0, 1), [$c$]), node((0, 2), [$d$]),
  node((-1.8, 0), text(fill: luma(110))[0]), node((-1.8, 1), text(fill: luma(110))[1]), node((-1.8, 2), text(fill: luma(110))[2]),
  edge((-1.15, 0), (0, 1), "->"), edge((1.15, 0), (0, 1), "->"),
  edge((0, 1), (0, 2), "->"),
)

#let hylomorphism-diagram() = native-diagram(
  node((0, 0), [$F X$]), node((1, 0), [$F B$]), node((0, 1), [$X$]), node((1, 1), [$B$]),
  edge((0, 1), (0, 0), "->", label: label([$c$])),
  edge((0, 0), (1, 0), "->", label: label([$F h$])),
  edge((1, 0), (1, 1), "->", label: label([$alpha$])),
  edge((0, 1), (1, 1), "-->", label: label([$h$])),
)

#let cospan-diagram() = native-diagram(
  node((0, 1), [$L$]), node((0.5, 0), [$M$]), node((1, 1), [$R$]),
  edge((0, 1), (0.5, 0), "->"), edge((1, 1), (0.5, 0), "->"),
)

#let parallel-pair-diagram() = native-diagram(
  node((0, 0), [$V$]), node((1, 0), [$E$]),
  edge((0, 0), (1, 0), "->", label: label([$s$]), bend: 15deg),
  edge((0, 0), (1, 0), "->", label: label([$t$]), bend: -15deg),
)
