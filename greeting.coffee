greeting = (first, second) ->
  unless second
    name = first || 'my friend'
    if name.toUpperCase() == name
      "HELLO #{name}!"
    else
      "Hello, #{name}."
  else
    "Hello, #{first} and #{second}."

module.exports = greeting
