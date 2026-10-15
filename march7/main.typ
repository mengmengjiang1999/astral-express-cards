#import "config/theme.typ": theme
#import "components/card.typ": card
#import "components/back.typ": back-card
#let character = json("config/character.json")
#let asset(path, ..options) = image(path, ..options)
#set document(title: "三月七｜星穹列车名片", author: "三月七")
#card(character, theme, asset)

#pagebreak()
#back-card(character, theme, asset)
