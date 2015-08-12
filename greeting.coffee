greeting = (names...) ->
  [shouters, normals] = _.chain(names)
    .reject(_.isUndefined)
    .reject(_.isNull)
    .partition((name) -> name.toUpperCase() == name)
    .value()

  switch
    when normals.length and shouters.length then "#{(greet greetNormally, normals...)} AND #{(greet greetLoudly, shouters...)}"
    when normals.length then (greet greetNormally, normals...)
    when shouters.length then (greet greetLoudly, shouters...)
    else (greet greetNormally)

greet = (greeter, names...) ->
  [first, second, others..., last] = names

  if last
    greeter "#{names[0..-2].join(', ')}, #{greeter.conjunction} #{last}"
  else if second
    greeter "#{first} #{greeter.conjunction} #{second}"
  else if first
    greeter first
  else
    greeter 'my friend'

greetNormally = (combinedNames) -> "Hello, #{combinedNames}."
greetNormally.conjunction = 'and'
greetLoudly   = (combinedNames) -> "HELLO #{combinedNames}!"
greetLoudly.conjunction = 'AND'

module.exports = greeting
