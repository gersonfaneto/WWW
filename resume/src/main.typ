#import "@preview/octique:0.1.1": octique-inline

#let lang = sys.inputs.at("lang", default: "pt")
#let data_base = yaml("../data/shared.yaml")
#let data_lang = yaml("../data/" + lang + ".yaml")

#let data = data_base + data_lang

#let labels = (
  pt: (projects: "Projetos", experience: "Experiência", education: "Formação"),
  en: (projects: "Projects", experience: "Experience", education: "Education"),
).at(lang)

#let pretty-link(link-str) = link(link-str, link-str.replace("https://", ""))

#show link: set text(blue.darken(30%))
#set text(font: "Maple Mono")
#set par(leading: 1em, justify: true)

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

#set grid(columns: (1fr, 3fr), row-gutter: 1em)

= #labels.projects
#grid(..data.projects.map(e => (e.period, [*#e.name* \ #e.description])).flatten())

= #labels.experience
#grid(..data.experience.map(e => (e.period, [*#e.title, #e.employer* \ #e.description])).flatten())

= #labels.education
#grid(..data.education.map(e => (e.period, [*#e.title, #e.institution*])).flatten())
