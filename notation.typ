#let cat(C) = $bold(#C)$
#let Set = $cat("Set")$
#let Gr = $cat("Gr")$
#let Syn = $cat("Syn")$
#let SemAct = $cat("SemAct")$
#let Psh(C) = $bold("Psh") #C$
// 1.15em because Hiragino draws kana small on the em; the kern trims the
// full-width advance, which otherwise gaps before the argument.
#let yo = math.class("normal", box(
  text(font: "Noto Sans CJK JP", size: 1.15em, "よ") + h(-0.25em)))

#let Ob(C) = $"Ob"(#C)$
#let Hom(C, a, b) = $"Hom"_#C (#a, #b)$
#let Homs(a, b) = $"Hom"(#a, #b)$
#let Idn(a) = $"id"_#a$
#let op = $"op"$

#let disp(D) = $bold(upright(#D))$
#let total(D) = $integral #D$

#let prn(x) = $lr(( #x ))$
#let brc(x) = $lr({ #x })$
#let brk(x) = $lr([ #x ])$
#let sem(x) = $lr(bracket.l.stroked #x bracket.r.stroked)$
#let ceils(x) = $lr(⌈ #x ⌉)$
#let floors(x) = $lr(⌊ #x ⌋)$

#let tensor = $times.o.big$
#let ten = math.times.o
#let unit = $bold(1)$
#let lto = math.multimap
#let tol = math.class("relation", box(scale(x: -100%, reflow: true, $multimap$)))
#let amp = math.amp
#let oplus = math.plus.o
#let topG = $top$
#let botG = $bot$

#let oplusD(i, A) = $plus.o.big_(#i) #A$
#let ampD(i, A) = $and.big_(#i) #A$
#let bigamp = math.and.big
#let bigoplus = math.plus.o.big

#let later = math.triangle.stroked.small.r
// The dual, `earlier`: a mirrored `later`.
#let lhd = math.class("unary", box(scale(x: -100%, reflow: true, $triangle.stroked.small.r$)))
#let boxM = $square$
#let parr = math.class("binary", std.box(rotate(180deg, reflow: true, $amp$)))

#let negG(A) = $not #A$
#let DecG(A) = $"Dec" lr(chevron.l #A chevron.r)$

#let entails = $tack.r$
#let seq(G, A) = $#G tack.r #A$
#let isTy = $ "type"$
#let isCtx = $ "ctx"$

#let String = $"String"$
#let Char = $"Char"$
#let Alph = $Sigma$
#let star(A) = $#A^*$
#let first(A) = $"first"(#A)$
#let flast(A) = $"flast"(#A)$
#let nullable(A) = $"null"(#A)$
#let deriv(c, A) = $partial_#c #A$

#let carrier = $|dot|$
#let Split = $"Split"$
#let parts = $"parts"$
#let unsplit = $"unsplit"$
#let Fib = $cat("Fib")$

#let NN = $bb(N)$
#let ZZ = $bb(Z)$
#let to = math.arrow.r
#let iso = math.tilde.equiv
#let defeq = math.colon.eq
#let compose = $circle.small$
