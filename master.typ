#import "notation.typ": *
#import "diagrams.typ": *
#import "environments.typ": *

#set document(title: "Guarded Recursion over Direct Categories", author: "Steven Schaefer")
#set page(paper: "us-letter", margin: (x: 1in, y: 1in), numbering: "1")
#set text(font: "New Computer Modern", size: 11pt, lang: "en")
#set par(justify: true, leading: 0.58em, first-line-indent: 1.15em)
#show math.equation: set text(font: "New Computer Modern Math")
#show heading: it => it + { set par(first-line-indent: 0em); [] }
#show link: it => underline(text(fill: rgb("#1e5a96"), it))

= Guarded Recursion over Direct Categories

#outline(depth: 3)

== Categorical foundations

=== Total category <note-00fi>

#definition[
The #emph[total category] $total(overline(cal(D)))$ of a
displayed category $overline(cal(D))$ over $cal(C)$
collects the displayed data into a single category. Its objects are
pairs of an object $x$ of $cal(C)$ with an object $overline(x)$ over it, and its morphisms $(x, overline(x))
to (y, overline(y))$ are pairs of a morphism $f : x
to y$ with a displayed morphism $overline(f)$ over
$f$.

Projecting out the first components is a functor $total(overline(cal(D))) to cal(C)$. The constructions presented
displayed — #link(<note-00f7>)[algebras],
#link(<note-00fb>)[Eilenberg–Moore categories] — get their
#emph[forgetful functor] for free as this projection.

]

=== Algebras as a displayed category <note-00f7>

Fix an endofunctor $F : cal(C) to cal(C)$. The $F$-algebras form
a displayed category $bold("AlgStr")(F)$ over $cal(C)$.

Over an object $x$, a displayed object of $bold("AlgStr")(F)$ is
a structure map $alpha in cal(C) (F x , x)$ Over $f : x to y$,
a displayed morphism from $alpha$ to $beta$ is the #emph[proposition]
that $f$ is an algebra homomorphism: $alpha compose f = F f
compose beta $

#algebra-square()

The #link(<note-00fi>)[total category] $bold("Alg")(F) = total(bold("AlgStr")(F))$ is the category of $F$-algebras.

=== Coalgebras as a displayed category <note-00f9>

Fix an endofunctor $F : cal(C) to cal(C)$. Coalgebras require no
new construction: a coalgebra is an #link(<note-00f7>)[algebra] in the
opposite category. Define $bold("CoalgStr")(F) =
bold("AlgStr")(F^op),$ a displayed category over
$cal(C)^op$, where $F^op :
cal(C)^op to cal(C)^op$ is $F$ acting
on the opposite category.

Concretely, over an object $x$ a displayed object is a structure map
$gamma in cal(C) (x , F x)$

The category of coalgebras is the opposite of the
#link(<note-00fi>)[total category]: $bold("Coalg")(F) = (total(bold("CoalgStr")(F)))^op$ The outer opposite returns
morphisms to the direction of $cal(C)$: a morphism $(x, gamma )
to (y, delta )$ is a map $f : x to y$ with $f compose
delta = gamma compose F f$

=== Initial algebra <note-00f8>

#definition[ Fix an endofunctor $F : cal(C) to cal(C)$. An
#emph[initial $F$-algebra], written $mu F$, is an initial object of
the #link(<note-00f7>)[category of algebras] $bold("Alg")(F)$.

Unfolding the universal property: an initial algebra is an algebra
$(mu F, bold("in"))$ such that every algebra $(x, alpha )$
admits a unique morphism $bold("fold") alpha : mu F to x$
satisfying $bold("in") compose (bold("fold") alpha ) =
F(bold("fold") alpha ) compose alpha $

]

=== Terminal coalgebra <note-00fa>

#definition[ Fix an endofunctor $F : cal(C) to cal(C)$. A
#emph[terminal $F$-coalgebra], written $nu F$, is a terminal object of
the #link(<note-00f9>)[category of coalgebras] $bold("Coalg")(F)$
— equivalently, an #link(<note-00f8>)[initial algebra] for
$F^op$.

Unfolding the universal property: a terminal coalgebra is a coalgebra
$(nu F, bold("out"))$ such that every coalgebra $(x, gamma )$
admits a unique morphism $bold("unfold") gamma : x to nu F$
satisfying $(bold("unfold") gamma ) compose bold("out") =
gamma compose F(bold("unfold") gamma )$

]

=== The Eilenberg–Moore category as a displayed category <note-00fb>

Fix a monad $(T, eta , mu )$ on $cal(C)$. Its
Eilenberg–Moore category arises in two displayed layers. The first
layer is the #link(<note-00f7>)[displayed category of algebras]
$bold("AlgStr")(T)$ of the underlying endofunctor.

The second layer, $bold("EMStr")(T)$, is displayed over the
#link(<note-00fi>)[total category] $bold("Alg")(T)$. Over an
algebra $(x, alpha)$ the displayed objects are the
#emph[propositions] that $alpha$ satisfies the monad algebra laws:
$eta_(x) compose alpha = Idn(x)$ and
$mu_(x) compose alpha = T alpha compose alpha$.

The Eilenberg–Moore category is the total category of the tower:
$bold("EM")(T) = total(bold("EMStr")(T))$

=== The co-Eilenberg–Moore category as a displayed category
<note-00fc>

A comonad on $cal(C)$ #emph[is] a monad $W$ on
$cal(C)^op$. Everything about its coalgebras is then
inherited from the #link(<note-00fb>)[Eilenberg–Moore construction],
instantiated at the opposite category — nothing is defined twice.

Algebras of $W$ over $cal(C)^op$ are
#link(<note-00f9>)[coalgebras] $gamma in cal(C)(x, W x)$ of the
underlying endofunctor. The algebra laws in the opposite category
become the comonad laws: $gamma compose epsilon_(x) =
Idn(x)$ and $gamma compose delta_(x) = gamma
compose W gamma$.

The co-Eilenberg–Moore category is the opposite of the total category:
$bold("coEM")(W) = (bold("EM")(W))^op$

=== The adjoint triple between presheaves and families <note-00fd>

A #emph[family] over $cal(C)$ is a set $A(x)$ for each object $x$,
with no action of morphisms. Families form a category
$bold("Fam")(cal(C))$: a morphism $A to B$ is a function
$A(x) to B(x)$ for each $x$.

Forgetting the restriction maps of a presheaf gives a functor $U :
Psh(cal(C)) to bold("Fam")(cal(C))$. It has both a
left and a right adjoint, $bold("Free") tack.l U tack.l
bold("Cofree")$.

#adjoint-triple-diagram()

The two adjoints demonstrate different means of forcing a family to be
functorial. The right adjoint universally quantifies over morphisms
in: $bold("Cofree")(A)(x) = product _(y) cal(C)(y, x) to
A(y)$, with restriction along $f$ given by precomposition. The left
adjoint instead quantifies existentially over morphisms out:
$bold("Free")(A)(x) = sum _(y) cal(C)(x, y) times A(y)$,
with restriction acting on the first component. (For $bold("Free")$
we ask that $cal(C)$ have a #emph[set] of objects, so that this sum is
a set and thus $bold("Free")$ defines a #emph[presheaf].)

=== The comparison functor of an adjunction <note-00gd>

#definition[ An adjunction $F tack.l U$ with $F : cal(C) to
cal(D)$ and $U : cal(D) to cal(C)$ induces a monad $T = U
compose F$ on $cal(C)$. Write $epsilon : F compose U
arrow.r.double bold("Id")$ for the #emph[counit] of the
adjunction. Every object $d$ of $cal(D)$ then induces a $T$-algebra
carried by the object $U d$, witnessed by the map $U epsilon _(d) : U
F U d to U d$

This assignment extends to a functor into the
#link(<note-00fb>)[Eilenberg–Moore category], $K : cal(D) to
bold("EM")(T),$ the #emph[comparison functor] of the adjunction.

Dually, an adjunction induces a comonad on the other side and a
comparison into the #link(<note-00fc>)[co-Eilenberg–Moore
category]. When these comparisons are equivalences we say that the
adjunction $F tack.l U$ is #link(<note-00ff>)[(co)monadic].

]

=== Monadicity and comonadicity <note-00ff>

#definition[ An adjunction $F tack.l U$ with $F : cal(C) to
cal(D)$ and $U : cal(D) to cal(C)$ induces a monad $T = U
compose F$ on $cal(C)$, and a #link(<note-00gd>)[comparison
functor] $K : cal(D) to bold("EM")(T)$ sending each object
of $cal(D)$ to the $T$-algebra it carries.

The functor $U$ is #emph[monadic] when $K$ is an equivalence: the
adjunction exhibits $cal(D)$ as objects of $cal(C)$ equipped with
algebraic structure for $T$, the #link(<note-00fb>)[Eilenberg–Moore
category].

#emph[Comonadicity] is monadicity in the opposite category: a left
 adjoint $L : cal(D) to cal(C)$ with right adjoint $R$ induces a
 comonad $W = L compose R$ on $cal(C)$, a comparison $cal(D)
 to bold("coEM")(W)$ into the
 #link(<note-00fc>)[co-Eilenberg–Moore category], and $L$ is comonadic
 when this comparison is an equivalence.

]

=== Presheaves are monadic and comonadic over families <note-00fe>

#theorem[ The #link(<note-00fd>)[adjoint triple] $bold("Free")
tack.l U tack.l bold("Cofree")$ induces a monad $T = U compose
bold("Free")$ and a comonad $W = U compose bold("Cofree")$
on $bold("Fam")(cal(C))$.

Both #link(<note-00gd>)[comparison functors] are equivalences:
presheaves are the #link(<note-00fb>)[Eilenberg–Moore algebras] of $T$
and the #link(<note-00fc>)[co-Eilenberg–Moore coalgebras] of $W$:

$ Psh(cal(C)) iso bold("EM")(T), quad
  Psh(cal(C)) iso bold("coEM")(W). $

So presheaves are both #link(<note-00ff>)[monadic and comonadic] over
families.

Reading the algebra structure concretely: a $T$-algebra on a family
$A$ is a map $sum _(y) cal(C) (x , y) times A(y) to A(x)$
for each $x$, subject to the monad algebra laws — that is, exactly a
functorial action of restriction.

The comonadic reading is the same structure seen from the element's
side: a $W$-coalgebra is a map $A(x) to product _(y) cal(C) (y
, x) to A(y)$, giving each value its restriction along every
morphism into $x$. Where the monad says restriction #emph[acts on]
values, the comonad says a value #emph[already carries] all of its
restrictions — and the coalgebra laws say it does so coherently.

]


== Direct categories and modalities

=== Direct categories <note-00fg>

#definition[ A #emph[well-founded order] is a set $D$ with a
proposition-valued transitive relation $<$ admitting no infinite
descent: every element is accessible. Write $a <= b$ for $(a < b) or
(a = b)$.

A #emph[direct structure] on a category $cal(C)$ over $(D, <)$ is a
functor $"deg" : cal(C) to (D, <= )$ into the
well-founded order viewed as a poset category. The functor organizes
two pieces of data at once: an ordering on the objects, and the
invariant that morphisms respect it — $f : x to y$ forces
$"deg" x <= "deg" y$.

A direct structure equips the objects with a well-founded strict
relation $x < y arrow.l.r.double "deg" x < "deg" y$
Intuitively, direct categories are the right generalization of
well-foundedness to the categorical setting: a direct category is
essentially one whose underlying graph is a directed acyclic graph,
layered by degree, so that data at an object may be defined by
recursion from data at all objects strictly below it. The degrees
order the objects, while the morphisms of $cal(C)$ say #emph[how] an
object sits over its predecessors.

#direct-category-diagram()

]

=== Well-founded posets are thin direct categories <note-00fh>

Every poset forms a thin category. Similarly, if the poset is
well-founded then it induces a thin #link(<note-00fg>)[direct
category].

=== Sieves <note-00fj>

#definition[ A #emph[sieve] on an object $x$ of $cal(C)$ is a
subobject of the representable presheaf $yo x$: a presheaf
$S$ with a monic morphism $S to yo x$. Sieves
generalize the notion of an #emph[ideal] from ring theory to category
theory.

A morphism $f : y to x$ #emph[belongs] to $S$ when it lies in the
image of the inclusion at $y$. Because $S$ is a presheaf and the
inclusion is natural, membership is closed under precomposition:
precomposing a member $f$ with any $g : z to y$ again gives a
member of $S$. A sieve is thus a "downward-closed" collection of
morphisms into $x$.

Sieves on $x$ are ordered by #emph[refinement]: $S subset.eq T$ when
every morphism belonging to $S$ belongs to $T$.

]

=== Proper and maximal sieves <note-00fk>

#definition[ The representable $yo x$ is itself a
#link(<note-00fj>)[sieve] on $x$. A sieve on $x$ is #emph[proper] when
it is not equal to the representable.

Say that a proper sieve is #emph[maximal] when it contains all other
proper sieves as a sub-sieve.

]

=== The strict downset sieve of a direct category <note-00fl>

#definition[ Let $cal(C)$ carry a #link(<note-00fg>)[direct
structure]. The #emph[strict downset] of an object $x$ is the presheaf
of maps $f : y to x$ whose domain has strictly smaller degree
than $x$; restriction is by precomposition, which preserves strictness
because degrees are non-decreasing.

#strict-downset-diagram()

The evident inclusion $bold("StrictDown")(x) to yo
x$ makes $bold("StrictDown")(x)$ a #link(<note-00fj>)[sieve] on
$x$. It is moreover a #link(<note-00fk>)[proper] sieve, as it excludes
the identity.

]

=== Maximality of the strict downset among proper sieves <note-00fm>

#theorem[ Call a #link(<note-00fg>)[direct structure]
#emph[reflecting] when every morphism between objects of equal degree
is a split epimorphism. In a reflecting direct category, every
non-invertible-in-degree morphism strictly raises degree, and the
#link(<note-00fl>)[strict downset] is as large as a proper sieve can
be:

If the direct structure is reflecting, then every
#link(<note-00fk>)[proper sieve] $S$ on $x$ refines into the strict
downset: $S subset.eq bold("StrictDown")(x)$

For suppose $f : y to x$ belongs to $S$ and has equal degree. By
reflection $f$ has a section; closure under precomposition then forces
the identity of $x$ to belong to $S$, contradicting properness. So
every member of $S$ strictly raises degree, which is membership in
$bold("StrictDown")(x)$.

]

=== Later on presheaves <note-00fn>

#definition[ The #emph[later] modality on presheaves is given at each
object by mapping out of the #link(<note-00fl>)[strict downset]:
    $(later P) (x) = (Psh(cal(C)))(bold("StrictDown")(x), P)$ An element of $later P$ at
$x$ is a coherent choice of $P$-elements for all objects strictly
smaller than $x$.

Restriction in $later P$ along $f : y to x$ precomposes with the
induced map $bold("StrictDown")(y) to
bold("StrictDown")(x)$. At an object of minimal degree the strict
downset is empty, so $later P$ is trivial there.

Via functoriality, every presheaf restricts to smaller indices: the
map $bold("next") : P to later P$ sends an element $p$ over
$x$ to the family of all its restrictions along morphisms from
strictly lower objects.

]

=== Earlier on presheaves <note-00fo>

#definition[ #link(<note-00fn>)[Later] takes a #emph[limit] over
smaller indices. Dually, the #emph[earlier] modality takes a colimit
over larger indices: an element of $lhd P$ at $x$ is a $P$-element
sitting at some object $y$ strictly above $x$, carried down along a
chosen morphism $x to y$.

Earlier is left adjoint to later: $lhd tack.l later$

Under this adjunction, $bold("next") : P to later P$
corresponds to $bold("prev") : lhd P to P$.

]

=== Weighted limits <note-00q1>

#definition[ A #emph[weight] for a diagram $F : cal(J) to cal(D)$ is a
functor $W : cal(J) to Set$. The limit of $F$ #emph[weighted by $W$]
is an object $wlim(W) F$ of $cal(D)$ with

    $ cal(D)(d, wlim(W) F) iso [cal(J), Set](W, cal(D)(d, F(-))) $

naturally in $d$, where $cal(D)(d, F(-))$ is the hom-diagram $cal(J)
to Set$ sending $j$ to $cal(D)(d, F(j))$. Ordinary limits are the case
$W = Delta unit$.
]

Every weighted limit is an ordinary (conical) limit: restricting $F$
along the projection $bold("Fst") : bold("Element")(W) to cal(J)$ from
the category of elements of $W$ gives a diagram over which a cone is
exactly a $W$-weighted cone on $F$:

$ wlim(W) F iso lim (F compose bold("Fst")). $

For presheaves — the case $cal(J) = cal(C)^op$ and $cal(D) = Set$,
where a weight is again a presheaf — such a limit is by the above an
ordinary limit in $Set$, and so always exists:

$ wlim(W) P iso lim_((c, w) in bold("Element")(W)^op) P(c) =
(Psh(cal(C)))(W, P). $

=== Nerves and later <note-00p0>

#definition[ A functor $V : cal(C) to Psh(cal(C))$ can be read as a
family of #link(<note-00q1>)[weights], one weight $V(c)$ for each
object $c$. Its #emph[nerve] collects the resulting weighted limits
into a single presheaf:

    $ bold("Nerve")(V) : Psh(cal(C)) to Psh(cal(C)), quad bold("Nerve")(V)(P)(c) = wlim(V(c)) P = (Psh(cal(C)))(V(c),
P). $

Thus a section of $bold("Nerve")(V)(P)$ over $c$ is a coherent way
to evaluate every element of the weight $V(c)$ in $P$.
Functoriality of $V$ makes this assignment contravariant in $c$, so it
is again a presheaf.

]

Now read the strict-downset functor $bold("StrictDown") : cal(C) to
Psh(cal(C))$ of a #link(<note-00fg>)[direct category] this way,
weighting by the presheaf $bold("StrictDown")(x)$ at each object $x$.
The #link(<note-00fn>)[later modality] is precisely its nerve:

$ later P &= bold("Nerve")(bold("StrictDown"))(P), \
later P (x) &= wlim(bold("StrictDown")(x)) P = (Psh(cal(C)))(bold("StrictDown")(x), P)
iso lim_((y, f) in bold("Element")(bold("StrictDown")(x))^op) P(y). $

So $later P$ is computed with a genuine
limit in $Set$.

When $x$ has a #link(<note-00gf>)[predecessor] $rho :
p to x$, the weight is representable:
$bold("StrictDown")(x) iso yo p$. Yoneda then
simplifies the weighted limit:
$later P (x) iso (Psh(cal(C)))(yo p, P) iso P(p)$. For the
#link(<note-00g6>)[topos of trees], $p = n$ is the predecessor of
$n+1$; later is therefore the familiar shift.

=== Predecessors simplify later <note-00gf>

A #emph[predecessor] of $x$ is a top element of its
#link(<note-00fl>)[strict downset]: a strict morphism $rho : p to
x$ through which every strict morphism into $x$ factors
uniquely. Equivalently, $bold("StrictDown")(x) iso
yo p$ — the downset is representable.

The Yoneda lemma then collapses #link(<note-00fn>)[later] to
evaluation: $later P (x) = Psh(cal(C))(bold("StrictDown")(x), P) iso Psh(cal(C))(yo p, P) iso P(p),$ with
$bold("next")$ becoming restriction along $rho$. The name is from
the naturals: every strict map into $n+1$ factors through $n to
n+1$, so on $omega$ — the #link(<note-00g6>)[topos of trees] — later
is just the shift: $later P (0) iso top$ and $later P
(n+1) iso P(n)$. A #link(<note-00fp>)[Löb] step is then a
base value together with a rule producing the value at $n+1$ from the
value at $n$.

When this predecessor exists, we can give a simpler description of
later, as in the topos of trees, but this may not be possible in all
direct categories.


== Guarded recursion

=== Locally contractive endofunctors <note-00fq>

#definition[ Write $X arrow.r.double Y$ for the presheaf of morphisms
$X to Y$. An endofunctor $F$ on presheaves is #emph[locally
contractive] when its action on morphisms factors through
#link(<note-00fn>)[later]: there is a map $F_delta : later (X
arrow.r.double Y) to (F X arrow.r.double F Y)$

]

=== Hylomorphisms <note-00ft>

#definition[ Fix an endofunctor $F : cal(C) to cal(C)$, a
#link(<note-00f9>)[coalgebra] $c : X to F X$ and an
#link(<note-00f7>)[algebra] $alpha : F B to B$. A
#emph[hylomorphism], or #emph[coalgebra-to-algebra morphism], from $c$
to $alpha$ is a morphism $h : X to B$ satisfying the hylo
equation $h = c compose F h compose alpha $

#hylomorphism-diagram()

This is divide and conquer as an equation: $c$ splits a problem into
an $F$-shape of subproblems, $F h$ solves them, and $alpha$ recombines
the answers.

]

=== The coalgebra-to-algebra profunctor <note-00fv>

#definition[ #link(<note-00ft>)[Hylomorphisms] organize into a
profunctor $bold("Hylo") : bold("Coalg")(F)^op
times bold("Alg")(F) to Set,$ sending a
#link(<note-00f9>)[coalgebra] and an #link(<note-00f7>)[algebra] to
the set of hylomorphisms between them.

A coalgebra is #link(<note-00fu>)[recursive] exactly when
$bold("Hylo")(c, -)$ is constantly a singleton, and an algebra is
corecursive exactly when $bold("Hylo")(-, alpha )$ is. Saying
that #emph[all] values of $bold("Hylo")$ are singletons says every
divide-and-conquer specification over $F$ has a unique solution.

]

=== Recursive coalgebras and corecursive algebras <note-00fu>

#definition[ A #link(<note-00f9>)[coalgebra] $c : X to F X$ is
#emph[recursive] when for #emph[every] #link(<note-00f7>)[algebra]
$alpha : F B to B$ there is exactly one
#link(<note-00ft>)[hylomorphism] $X to B$. Recursion out of $X$
is then total and deterministic: any way of recombining answers yields
a uniquely-defined function.

Recursiveness is the coalgebraic form of well-foundedness. The
coalgebra decomposes each element into subproblems; recursiveness says
this decomposition terminates, without ever mentioning an
ordering. Alexandru, Urbat, and Wißmann
@alexandruIntrinsicallyCorrectAlgorithms2026 develop intrinsically
correct algorithms from exactly this notion.

Dually, an algebra $alpha$ is #emph[corecursive] when every coalgebra
admits exactly one hylomorphism into it. An #link(<note-00f8>)[initial
algebra] gives a recursive coalgebra (its inverse, by Lambek's lemma),
and a #link(<note-00fa>)[terminal coalgebra] gives a corecursive
algebra.

]

=== Local contractivity makes every coalgebra recursive <note-00fw>

#theorem[ If $F$ is a #link(<note-00fq>)[locally contractive]
endofunctor on presheaves over a #link(<note-00fg>)[direct category],
then every value of the #link(<note-00fv>)[profunctor]
$bold("Hylo")$ is a singleton: every coalgebra is
#link(<note-00fu>)[recursive] and every algebra is corecursive.

The proof is one application of #link(<note-00fp>)[Löb]. A
hylomorphism from $c$ to $alpha$ is a fixed point of the assignment
sending $h$ to $c compose F h compose alpha$ on the presheaf
$X arrow.r.double B$ of morphisms. Local contractivity factors this
assignment through $later (X arrow.r.double B)$, so Löb provides a
fixed point and provides it uniquely.

]

=== Fixed points of locally contractive functors are unique
<note-00ge>

#theorem[ Let $F$ be a #link(<note-00fq>)[locally contractive]
endofunctor on presheaves over a #link(<note-00fg>)[direct category],
and suppose $X$ is #emph[any] fixed point of $F$: an object with an
isomorphism $alpha : F X iso X$. Then $(X, alpha )$ is an
#link(<note-00f8>)[initial algebra] $mu F$, and simultaneously $(X,
alpha ^(-1))$ is a #link(<note-00fa>)[terminal coalgebra] $nu F$.

Both claims follow from #link(<note-00fw>)[every value of the
hylomorphism profunctor being a singleton]. For initiality of $(X,
alpha )$: a map to an algebra $(B, beta )$ satisfying the
initiality square is the same thing as a
#link(<note-00ft>)[hylomorphism] from the coalgebra $(X, alpha
^(-1))$ to $(B, beta )$, and there is exactly one of
those. Terminality follows similarly.

Thus for locally contractive $F$, we have an initial-final coincidence
$mu F iso nu F$, and guarded domain equations have
#emph[unique] solutions.

]

=== Löb induction for presheaves on a direct category <note-00fp>

#theorem[ Let $cal(C)$ be a #link(<note-00fg>)[direct category] and
$P$ a presheaf on it. Every map from later $P$ to $P$ has a unique
fixed point: a global element of $P$ equal to the result of one
guarded unfolding.

The hypothesis says: the value of $P$ at any object is determined by
its values over the strict past — $phi.alt$ turns a coherent
family over the #link(<note-00fl>)[strict downset] of $x$ into a value
at $x$. The proof is recursion along the well-founded $<$: at each
$x$, the section already constructed over the past assembles into an
element of $(later P)(x)$, and $phi.alt$ extends it to
$x$.

]

=== Later on families <note-00fr>

#definition[ Conjugation with the #link(<note-00fd>)[adjunction
between presheaves and families] $U tack.l bold("Cofree")$ lets us
induce a later construction on families from the one on presheaves,
$later _(bold("Fam")) = U compose later compose
bold("Cofree") : bold("Fam")(cal(C)) to
bold("Fam")(cal(C))$

Concretely, later on families evaluates to

$ later _(bold("Fam")) A(x) iso product _((y, f) : y
  to x, y < x) A(y). $

]

=== Löb induction on families <note-00fs>

#theorem[ Like #link(<note-00fr>)[later on families], the recursion
principle for families is inherited from that on presheaves. Given a
family $A$ and a step from the later family over $A$ to $A$ at every
object, the construction is a chain of adjoint transpositions: it
moves through the cofree presheaf, uses #link(<note-00fp>)[Löb
induction for presheaves], and transposes back to a family-level fixed
point.

Just as for presheaves, the fixed point constructed above is
#emph[unique]: the two transpositions are bijections, and the
presheaf-level fixed point is already unique.

]


== Instances and applications
These are some slapped together examples of using guarded recursion in this direct category framing.

=== Streams in the topos of trees <note-00g6>

Presheaves on $omega$ — the topos of trees @birkedalFirstStepsSGDT2012
— are the usual setting for this kind of guarded reasoning:
step-indexing, later, and Löb in their classical form.

There one solves #emph[guarded domain equations]. Streams over a set
$A$ satisfy $bold("Str") iso A times later bold("Str"),$
and since $X to A times later X$ is #link(<note-00fq>)[locally
contractive], the equation has a #link(<note-00ge>)[unique solution],
and #link(<note-00fw>)[every coalgebra unfolds uniquely].

=== Löb induction on the walking parallel pair <note-00ga>

The walking parallel pair — objects $V, E$ with two parallel morphisms
$s, t : V to E$ — is a direct category with $"deg" V =
0$ and $"deg" E = 1$, the smallest one that is not
#link(<note-00fh>)[thin]. Presheaves on it are directed multigraphs.

#parallel-pair-diagram()

#link(<note-00fn>)[Later] computes to $later P (V) iso top$
 and $later P (E) iso P(V) times P(V)$, one factor
 #emph[per parallel morphism] — a plurality no poset can produce — and
 $bold("next")$ sends an edge to its pair of endpoints: it is the
 boundary map.

By naturality, a #link(<note-00fp>)[Löb] step $later P to P$ is a
choice of vertex together with a self-loop at it, and its fixed point
is that self-loop.

=== Löb induction on the walking cospan <note-00gb>

The walking cospan $L to M arrow.l R$ is a thin direct category —
$"deg" L = "deg" R = 0$ and $"deg" M = 1$ —
and the smallest one whose past #emph[branches]. Presheaves on it are
spans of sets.

#cospan-diagram()

#link(<note-00fn>)[Later] at the apex joins the two legs, $later P
 (M) iso P(L) times P(R)$

=== The category of thinnings <note-00g8>

#definition[ A #emph[scope] is a list of variable names, and a
#emph[thinning] is an order-preserving embedding of one scope into
another, as in McBride's #emph[Everybody's Got To Be Somewhere]
@mcbrideEverybodysGotToBeSomewhere2018.

Scopes exist to scope #emph[terms]: over a scope $italic("xs")$, one
may define terms for describing a #link(<note-00g9>)[first-order
unification algorithm] $t ::= bold("var")\ x bar.v
bold("leaf") bar.v bold("fork")\ t\ t,$ with $x$ a
variable of $italic("xs")$, and a thinning embedding the terms over
its source into the terms over its target.

The category is #link(<note-00fg>)[direct] with degree given by the
length of the scope. It is #emph[not] #link(<note-00fh>)[thin], as
there are two thinnings from $([A])$ to $([A , A])$.

]

=== Unification by Löb induction over thinnings <note-00g9>

First-order unification, following McBride's structurally recursive
unification algorithm @mcbrideFirstorderUnification2003. The algorithm
is built using #link(<note-00fs>)[Löb induction on families] over the
#link(<note-00g8>)[category of thinnings] with the well-founded
measure given by size of the scope.

=== Primality by Löb induction <note-00g7>

Define "$n$ is prime" by trial division — dividing only by
#emph[primes]: $n$ is prime when $n >= 2$ and no prime $p < n$ divides
it. This is a correct characterization but not a structural
definition: the predicate at $n$ quantifies over the predicate at
every smaller number.

It is exactly a guarded definition over $omega$. The motive at $n$ is
a #emph[decided proposition]; #link(<note-00fr>)[later on families]
hands the step the decided propositions of all $p < n$, and it decides
$P_n$ by checking that $n >= 2$ and that no prime $p < n$ divides $n$.

=== Euclid's algorithm by Löb induction <note-00fz>

Compute the greatest common divisor of $m$ and $n$, following
Alexandru, Urbat, and Wißmann
@alexandruIntrinsicallyCorrectAlgorithms2026. Over pairs measured by
their second component, the functor of subproblems is given by $H X
(m, 0) = top$ and $H X (m, n) = X(n, m "mod" n)$ for $n
> 0$; it is #link(<note-00fq>)[locally contractive] because $m
"mod" n < n$.

The coalgebra tests $n$. The algebra carries the correctness: at $(m,
0)$ it yields $m$ with a proof that it is a greatest common divisor,
and at $(m, n)$ it transports a gcd of $(n, m "mod" n)$
to one of $(m, n)$.

The #link(<note-00fw>)[hylomorphism] of this coalgebra and algebra is
Euclid's algorithm together with its correctness; its unfolding is
$"gcd" (m, 0) = m$ and $"gcd" (m, n) =
"gcd" (n, m "mod" n)$, and $"gcd" (12,
8) = 4$ by evaluation.

=== Quicksort by Löb induction <note-00g0>

Sort a finite #emph[multiset] — so that "same contents" is an equation
of bags — following intrinsically correct sorting
@alexandruIntrinsicallyCorrectSorting2025
@alexandruIntrinsicallyCorrectAlgorithms2026. Over bags measured by
size, a pivot decomposition either establishes that the bag is empty
or splits it into lower and upper bags, both strictly smaller than the
original bag.

The coalgebra partitions at a pivot. The algebra concatenates sorted
lists by sending $(l, r)$ to $l$ followed by $p$ followed by $r$,
spending the bounds at the seams and the recombination equation on the
contents.

The #link(<note-00fw>)[hylomorphism] of this coalgebra and algebra is
quicksort, sorted and content-preserving by the type of its result —
and by #link(<note-00fu>)[uniqueness], #emph[any] function satisfying
the recurrence is this one.

=== Binary search by Löb induction <note-00g1>

Decide whether a query $q$ occurs in a sorted list. Over lists
measured by length, the functor of subproblems either answers outright
with a membership witness or a refutation, or hands over a strictly
shorter list together with an equivalence $q in italic("xs")
arrow.l.r.double q in italic("ys")$. It is #link(<note-00fq>)[locally
contractive] by the length certificate.

The coalgebra splits at the midpoint: if $q = italic("mid")$, it is
found; if $q < italic("mid")$, the search continues in $italic("lo")$;
and if $q > italic("mid")$, it continues in $italic("hi")$.

The #link(<note-00fw>)[hylomorphism] of this coalgebra and algebra is
binary search: on a concrete list it evaluates to a membership witness
with its index, or to a refutation.

=== Karatsuba multiplication by Löb induction <note-00g2>

Multiply $x$ and $y$ using three half-size multiplications instead of
four. Split both numbers at a half-width base $B$: $x = x_0 + B dot
x_1$ and $y = y_0 + B dot y_1$. Over pairs of numbers measured by a
bound on their digit count, the functor of subproblems requests the
three products $X(x_0, y_0)$, $X(x_1, y_1)$, and $X(x_1 + x_0,
y_1 + y_0)$, each at a strictly smaller digit bound —
#link(<note-00fq>)[locally contractive] by that certificate.

The coalgebra performs the split. The motive at $(x, y)$ is $sum
_(p) (p = x dot y)$ — a number with a proof that it is the product —
so the recursive results arrive as $z_0 = x_0 y_0,z_2 = x_1 y_1,z_(11)
= (x_1 + x_0)(y_1 + y_0),$ each with its proof, and the algebra
recombines them through Karatsuba's identity $x dot y = z_2 dot B^2 +
(z_(11) - z_2 - z_0) dot B + z_0,$ its one proof obligation.

The #link(<note-00fw>)[hylomorphism] of this coalgebra and algebra is
the multiplier: it evaluates on numerals, correct by the type of its
result.

=== Towers of Hanoi by Löb induction <note-00g3>

Move $n$ disks from one peg to another using a third. The functor of
subproblems is given by $H X (0) = top$ and $H X (n+1) = X(n)
times X(n)$; it is #link(<note-00fq>)[locally contractive] because
its argument appears only at the strictly smaller stage.

The coalgebra decomposes a problem — pegs labelled source, target,
spare — at $n+1$ into the two rotated subproblems: the tower moves to
the spare peg, then onto the relocated largest disk. The algebra joins
a pair of move lists by placing the move of that disk between them.

The #link(<note-00fw>)[hylomorphism] of this coalgebra and algebra is
the solution; its unfolding moves a tower of $n$ disks, then the
largest disk, then a tower of $n$ disks again. Taking lengths gives
the move count $2^n - 1$ by induction.

=== The Ackermann function by Löb induction <note-00g4>

The Ackermann function $A(0, n) = n+1, quad A(m+1, 0) = A(m, 1),
quad A(m+1, n+1) = A(m, A(m+1, n))$ is total but not primitive
recursive, and its recursion is not structural: the #emph[result] of
the inner call indexes the outer call.

#link(<note-00fs>)[Löb induction on families] over $NN times NN$
 with the #emph[lexicographic] order shows it terminates.

=== Selective ordered semirings <note-00gg>

#definition[ An #emph[ordered semiring] is a set with two monoid
structures: an idempotent, commutative #emph[choice] $plus.o$ with
unit $bb(0)$, and a #emph[combination] $times.o$ with unit $bb(1)$,
distributing over choice and annihilated by $bb(0)$. Idempotent choice
induces an order, $x subset.eq y arrow.l.r.double x plus.o y = x,$
under which $plus.o$ is the meet and $bb(0)$ the top element.

It is #emph[selective] when choice always takes one of its arguments:
$x plus.o y = x quad "or"quad x plus.o y = y$ Selectivity is
what makes optima #emph[witnessed]: a value assembled by repeated
choice is literally one of the candidates offered, so a certificate
for the chosen candidate is a certificate for the result.

For #link(<note-00g5>)[shortest paths], read $plus.o$ as "take the
better route", $times.o$ as "extend a route by an edge", $bb(0)$ as
unreachable and $bb(1)$ as the free route. Min-plus on costs gives
shortest distances; the Boolean semiring (or, and) gives reachability.

]

=== Shortest paths by Löb induction <note-00g5>

Given a finite weighted graph, with weights drawn from a
#link(<note-00gg>)[sufficiently nice semiring], we compute
single-source shortest paths. The analysis is a family of subgraphs of
the input, varying in time. Initially nothing is explored beyond the
source itself; as time passes, edges are traversed, and each reached
vertex is annotated with the shortest path found from the source.

Graphs are presheaves on the walking #link(<note-00ga>)[parallel
pair], so #emph[time-varying] graphs are presheaves on the
#link(<note-00fg>)[direct category] obtained as the product of the
parallel pair with $omega$. #link(<note-00fs>)[Löb induction] over
this base describes the computation.

As written, the recursion is driven by an amount of fuel, which we
instantiate with the size of the input graph. This external supply of
fuel is a bit unsatisfying, and I wonder if we may hope to internalize
things in a better manner in the future.


== Derivatives and grammars

=== Earlier and Brzozowski derivatives <note-00fy>

On grammars, the #link(<note-00fo>)[earlier] modality is a sum over
proper extensions of the input: $(lhd X) (v) = sum _(w != epsilon)
X (w dot v)$ Writing $D_w$ for the #emph[Brzozowski derivative],
$(D_w B) (v) = B (w dot v)$, this says $lhd X = plus.o.big _(w
!= epsilon) D_w X$: earlier is the total derivative.

=== Later, interpreted on grammars <note-00fx>

A grammar assigns to each string $w$ a set $B(w)$ of parses — a
family over strings. Strings with the proper-suffix ordering give a
well-founded poset, and thus a #link(<note-00fg>)[direct
category]. Semantically, the #link(<note-00fn>)[later] modality is

$ (later B)(w) = product _(u < w) B(u), $

a product over the #emph[proper suffixes] of $w$. An element of $later
B$ at $w$ is a $B$-parse for every strictly shorter remainder of the
input: “$B$, after consuming at least one character.” Internally, this
is the dependent product of $B$ over all non-empty prefixes of the
input.

#bibliography("references.bib", title: [References], style:
 "association-for-computing-machinery")
