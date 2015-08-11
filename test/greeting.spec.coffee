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
