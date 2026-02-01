#import "@preview/octique:0.1.1": octique-inline

#let lang = sys.inputs.at("lang", default: "en")
#let data_base = yaml("../data/shared.yaml")
#let data_lang = yaml("../data/" + lang + ".yaml")

#let data = data_base + data_lang

#let labels = (
  pt: (
    projects: "Projetos",
    experience: "Experiência",
    education: "Formação",
    languages: "Idiomas",
    certifications: "Certificações",
  ),
  en: (
    projects: "Projects",
    experience: "Experience",
    education: "Education",
    languages: "Languages",
    certifications: "Certifications",
  ),
).at(lang)

#let pretty-link(link-str) = link(link-str, link-str.replace("https://", ""))

#show link: set text(blue.darken(30%))

#set text(font: "Maple Mono")
#set par(leading: 1em, justify: true)

#show heading.where(level: 1): set block(below: 1em)

#box(
  height: 2.5cm,
  align(bottom, stack(
    dir: ltr,
    spacing: 1fr,
    text(2em, strong(data.author)),
    // image(data.image_path),
    grid(
      columns: 2,
      column-gutter: 0.5em,
      row-gutter: 1fr,
      octique-inline("device-mobile"), data.contact.phone,
      octique-inline("mail"), data.contact.email,
      octique-inline("home"), pretty-link(data.contact.website),
      octique-inline("mark-github"), pretty-link(data.contact.github),
    ),
  )),
)
#line(length: 100%)

#data.bio

#set grid(columns: (1fr, 3fr), row-gutter: 0.5em)

= \= #labels.projects

#grid(
  ..data.projects.map(p => (p.period, [*#p.name* \ #p.description])).flatten()
)

= \= #labels.experience

#grid(
  ..data.experience.map(e => (e.period, [*#e.title, #e.employer* \ #e.description])).flatten()
)

= \= #labels.education

#grid(
  ..data.education.map(e => (e.period, [*#e.title, #e.institution*])).flatten()
)

= \= #labels.languages

#stack(
  spacing: 1em,
  ..data.languages.map(l => [- *#l.name* :: #text(style: "italic", fill: gray.darken(20%), l.level)]),
)

= \= #labels.certifications

#stack(
  spacing: 1em,
  ..data.certifications.map(c => [- *#c.name* :: #text(style: "italic", fill: gray.darken(20%), c.institution)]),
)
