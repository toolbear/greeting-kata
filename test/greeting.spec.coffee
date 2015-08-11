describe '#greeting', ->
  Given -> @subject = require '..'
  Then  -> expect(@subject).to.exist
