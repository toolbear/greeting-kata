greeting = (name) ->
  _name = name || 'my friend'
  if _name.toUpperCase() == _name
    "HELLO #{_name}!"
  else
    "Hello, #{_name}."

module.exports = greeting
