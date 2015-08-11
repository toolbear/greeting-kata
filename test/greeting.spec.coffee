describe '#greeting', ->
  Given -> @subject = require '..'
  Then  -> expect(@subject).to.exist

  describe 'simple greeting',  ->
    When -> @result = @subject 'Bob'
    Then -> @result == 'Hello, Bob.'
