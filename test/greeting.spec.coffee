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
    When -> @result = @subject @names...

    context 'a couple', ->
      Given -> @names = ['Jill', 'Jane']
      Then  -> @result == 'Hello, Jill and Jane.'

    context 'a LOUD couple', ->
      Given -> @names = ['JILL', 'JANE']
      Then  -> @result == 'HELLO JILL AND JANE!'

    context 'a few or more', ->
      Given -> @names = ['Amy', 'Brian', 'Charlotte']
      Then  -> @result == 'Hello, Amy, Brian, and Charlotte.'

    context 'A CACOPHONY', ->
      Given -> @names = ['AMY', 'BRIAN', 'CHARLOTTE']
      Then  -> @result == 'HELLO AMY, BRIAN, AND CHARLOTTE!'

    describe 'grouping shouters and non-shouters', ->
      Given -> @names = ['Amy', 'BRIAN', 'Charlotte']
      Then  -> @result == 'Hello, Amy and Charlotte. AND HELLO BRIAN!'
