// Local Variables:
// typst-preview--master-file: "/home/earendil/kl/ss26/wfc/wfc/main.typ"
// End:

#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import "@preview/ctheorems:1.1.3" as ctheorems : *

#show: thmrules.with(qed-symbol: $square$)

// preamble from [ctheorems – Typst Universe](https://typst.app/universe/package/ctheorems)
// (I hate preambles)

#let theorem = thmbox("theorem", "Theorem", fill: rgb("#eeffee"))
#let corollary = thmplain(
  "corollary",
  "Corollary",
  base: "theorem",
  titlefmt: strong
)
#let definition = thmbox("definition", "Definition", inset: (x: 1.2em, top: 1em))

#let example = thmplain("example", "Example").with(numbering: none)
#let proof = thmproof("proof", "Proof")

// Adapted from: https://github.com/hooyuser/typst_math_notes/blob/7c1fd7dcafb4cf4257bf62c43e5240f92e0aad21/0.1.0/commutative-diagrams.typ#L7
#let commutative_diagram(math_content, ..args) = align(center)[
  #v(1em, weak: true)
  #diagram(label-size: 0.8em, math_content, ..args)#v(1em, weak: true)
]

#let adjunction_pair(
    C,
    D,
    L,
    R,
) = commutative_diagram({
    let (p_C, p_D, p_adj) = ((0, 0), (1, 0), (0.5, 0))
    node(p_C, C)
    node(p_D, D)
    node(p_adj, $bot$)
    edge(p_C, p_D, L, "->", bend: +35deg)
    edge(p_C, p_D, R, "<-", bend: -35deg)
})
// end adapted from
#let adjunction_triple(
    C,
    D,
    L,
    LR,
    R,
) = commutative_diagram({
    let (p_C, p_D, p_adj1,p_adj2) = ((0, 0), (2, 0), (1, -0.4),(1, 0.4))
    node(p_C, C)
    node(p_D, D)
    node(p_adj1, $bot$)
    node(p_adj2, $bot$)
    edge(p_C, p_D, L, "<-", bend: +50deg)
    edge(p_C, p_D, LR, "->",label-side: center)
    edge(p_C, p_D, R, "<-", bend: -50deg)
})


#let Fam = $"Set"^A$
#let Psh = $"Set"^((A, ≤))$
#let Endo(cat) = $"Endo"\(#cat\)$
#let cofree = $G$
#let forget = $U$
#let rest(X,r) = $#X |_(#r)$

= The setting

Fix a set $A$ . Also fix a well-founded (i.e. supporting wellfounded elimination) transitive relation $<$ on it, with $≤$ its reflexive closure. Then there are some definitions to consider

== The downset /  よ-embedding / suboject classifier $Ω$. 
We define the downset for $≤$ as $↓ i = { j | j ≤ i } = よ i$.

Notes: could you also write $↓ ≔ ∏_(i ∈ A) { j | j ≤ i } = よ$ or $↓ = ∏_(i ∈ A) Σ_(j ∈ A) j ≤ i$.

We define the downset for $<$ as $↡ i = { j | j < i }$. This is not a Yoneda embedding. As a family: $(↡ i)_j = j < i$ i.e. $↡ i = · < i$. Or sth like $(↡ i)_j = cases({*} quad & i < j, ∅ & "else")$


== Wellfounded functors

The lens thorough which we view wellfounded functors is the following. Consider an endofunctor $F : Endo(Fam)$.

$
F : Fam → Fam \
 #rotate(90deg, reflow: true)[$≃$] \
F : (i:I) × Fam → Fam \
↓ quad ↑ \
F_< : (i:I) × "Set"^(<i) → "Set"
$
We say $F$ is wellfounded when it is equivalent to a family $F_<$ (is this a correct formulation?).

== Cofree Presheaf

#adjunction_pair(Psh,Fam,forget,cofree)

#adjunction_triple(Psh,Fam,$F$,forget,cofree)

== Refresher : Limits in $"Set"$

#theorem([@maclaneCategoriesWorkingMathematician1978 V.1.1])[
    $"Set"$ is complete.
]
#proof[
    Let $D : J → "Set"$ be a diagram. We claim the limiting cone to have apex $"Cone"(*,D)$, i.e. the _set_ of all cones for $D$.
    Writing this out one gets $"Cone"(*,D) = Δ_* ⇒ D = { (x)_(j ∈ J) ∈ product_(j ∈ J) D_0 j | ∀ a : j → j' . D_1 a (x_j) = x_j'}$. I.e. "$J$-tuples" of sets pulled back / equalized to contain only those elements that are succesfully chased through all diagrams in $"Set"$ induced by $D_1$. 
]

== Later Modality
=== On PShfs
We define $(▸ X)_i ≔ "lim" (#rest($X$,$↡ i$))$ .

=== On Families
We define $(▸ X)_i ≔ "lim" (#rest($X$,$↡ i$))$ . What's the difference? Well, on families $#rest($X$,$↡ i$) = X^(↡ i)$ i.e. $product_(↡ i)X$, and $"lim" (#rest($X$,$↡ i$)) = product_(↡ i)X$.

#bibliography("works.bib")
