{
  description = "Recursive Coalgebras for Total Functional Programming";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixpkgs-unstable;
    flake-utils.url = github:numtide/flake-utils;
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
          texEnv = (pkgs.texlive.combine {
            inherit (pkgs.texlive)
              latexmk
              git-latexdiff
              latexdiff #undeclared dep of ^^😩
              latexpand #undeclared dep of ^^😩

              llncs
              acmart
              biblatex-software
              xurl #undeclared dep of ^^
              biblatex-trad #^^ for acmnumeric
              # acmart (prbly) unconditional deps (nixpkgs doesn't know any of the deps but some are available anyway, e.g. natbib is in `collection-latex`)
              amsfonts
              amsmath
              kastrup #binhex
              booktabs
              caption
              comment
              cm-super
              cmap
              doclicense
              draftwatermark
              # environ
              # etoolbox
              fancyhdr
              float
              fontaxes
              geometry
              # graphics # graphicx
              # hyperref
              hyperxmp
              # iftex
              inconsolata
              libertine
              libertinus
              newtx
              txfonts
              ncctools # manyfoot
              microtype
              mmap
              # ms #what was this for? Bc this got split into several different packages in a new release…
              mweights
              natbib
              # oberdiek
              refcount
              setspace
              textcase
              totpages
              upquote
              trimspaces
              # xcolor
              # xkeyval
              xstring
              # end acmart deps
              fontawesome

              mathtools
              thmtools
              oberdiek # aliascnt
              newfile
              stackengine
              amscls
              # undeclared deps:
              xpatch
              # end
              fixme
              newunicodechar
              unicode-math
              fontspec
              collection-fontutils
              collection-luatex
              collection-latexrecommended
              luaotfload
              koma-script
              pgf
              tikz-cd
              forest

              beamer
              aobs-tikz
              textpos
              csquotes
              babel
              enumitem
              multirow

              biber
              biblatex
              texdoc
              graphics

              hyperref
              zref-clever
              chngcntr
              qrcode
              metafont

              catchfilebetweentags
              catchfile # ^^undeclared dep, somehow -_-
              #org-latex-preview
              dvipng
              # graphics # graphicx, color
              # base # inputenc, fontenc
              ulem
              # amsmath
              # amsfonts # amssymb
              # end org-latex-preview
              substr

              #agda.sty deps:
              iftex # for ifxetex, ifluatex
              xifthen
              xcolor
              polytable
              etoolbox
              environ
              l3packages # for xparse
              xkeyval
              # undeclared:
              ifmtarg
              lazylist
              # end

              # easychair deps
              # xcolor
              footmisc
              # hyperref
              # graphics # graphicx
              listings
              # base # latexsym
              # amscls # amsthm
              # mathtools # empheq
              # graphics # keyval
              lastpage
              # fancyhdr
              # end
            ;
            pkgFilter = pkg: pkgs.lib.elem pkg.tlType [ "run" "bin" "doc" ];
          });
      in
        {
          devShells.default = pkgs.mkShell {
            OSFONTDIR="${pkgs.libertinus}";
            buildInputs =
              [
                pkgs.pcre #used in Makefile for pcregrep
                texEnv
              ];
          };
        }
    );
}
