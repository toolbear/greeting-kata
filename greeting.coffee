greeting = (names...) ->
  [first, second, others..., last] = names

  if last
    greetNormally "#{names[0..-2].join(', ')}, and #{last}"
  else if second
    greetNormally "#{first} and #{second}"
  else if first
    if first.toUpperCase() == first
      greetLoudly first
    else
      greetNormally first
  else
    greetNormally 'my friend'

greetNormally = (combinedNames) -> "Hello, #{combinedNames}."
greetLoudly   = (combinedNames) -> "HELLO #{combinedNames}!"

module.exports = greeting
