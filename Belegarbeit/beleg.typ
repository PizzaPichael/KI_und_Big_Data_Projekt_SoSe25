#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 3cm),
  numbering: "1",
)

#set text(
  font: "New Computer Modern",
  size: 12pt,
)

#set par(
  justify: true,
  leading: 1.15em,
  first-line-indent: 1em,
)

#set heading(numbering: "1.")

#show heading: set block(below: 1.5em, above: 2em)

#align(
  center,
  text(17pt)[
    \
    \
    \
    \
    \
    *Positionserkennung im dreidimensionalen Raum mittels zwei dimensionaler Daten am Beispiel eines Tennisballsammel-Roboters* \
    \
    \
    KI und Big Data\
    Projektarbeit Sommersemester 2025\
    \
  ],
)

#grid(
  columns: 1fr,
  align(center)[
    Michael Kaup \
    s0585949 \
  ],
)

#pagebreak()

#outline()

#pagebreak()

#include "einfuehrung.typ"

#bibliography("bibliography.bib")

