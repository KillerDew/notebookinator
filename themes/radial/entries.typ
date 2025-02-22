#import "./colors.typ": *
#import "./icons/icons.typ"
#import "./components/title.typ" as components
#import "/utils.typ"
#import "./metadata.typ": entry-type-metadata

// TODO: make an actual cover
#let cover(ctx: (:)) = [
  #set align(center)
  #context counter(page).step()
  *Radial Cover*
]

#let frontmatter-entry(ctx: (:), body) = {
  show: page.with(
    header: components.title(ctx.title),
    footer: align(right, context counter(page).display()),
  )
  body
}
#let add(x,y) = x+y
#let body-entry(ctx: (:), body) = {
  let metadata = entry-type-metadata.at(ctx.type)
  show: page.with(header: components.title(
    beginning: image.decode(
      utils.change-icon-color(raw-icon: metadata.icon, fill: white),
      height: 1em,
    ),
    end: ctx.date.display("[year]/[month]/[day]"),
    color: metadata.color,
    ctx.title,
  ), footer: [
    #line(length: 100%)
    #align(left, [
      *Designed by:* #ctx.author #h(1fr) 
      #link((page:3, x:1pt, y:1pt))[Table of Contents] \
      *Witnessed by:* #ctx.witness
      #h(1fr) #context counter(page).display()
    ])
  ])
  body
}

#let appendix-entry(ctx: (:), body) = {
  show: page.with(
    header: components.title(ctx.title),
    footer: align(right, context counter(page).display()),
  )

  body
}
