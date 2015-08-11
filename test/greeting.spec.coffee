describe '#greeting', ->
  Given -> @subject = require '..'
  When  -> @result = @subject @name

  describe 'simple greeting',  ->
    Given -> @name = 'Bob'
    Then  -> @result == 'Hello, Bob.'

  describe 'default greeting', ->
    context 'name omitted', ->
      When -> @result = @subject()
      Then -> @result == 'Hello, my friend.'

    context 'name null', ->
      Given -> @name = null
      Then  -> @result == 'Hello, my friend.'

  describe 'SHOUTED', ->
    Given -> @name = 'JERRY'
    Then  -> @result == 'HELLO JERRY!'

  describe 'multiple names', ->

    context 'a couple', ->
      When -> @result = @subject 'Jill', 'Jane'
      Then -> @result == 'Hello, Jill and Jane.'

    context 'few or more', ->
      When -> @result = @subject 'Amy', 'Brian', 'Charlotte'
      Then -> @result == 'Hello, Amy, Brian, and Charlotte.'
