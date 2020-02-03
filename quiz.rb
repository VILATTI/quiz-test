require './login'
require './parser'

class Quiz
  def run
    home_page = Login.new.run
    Parser.new(home_page).run
  end
end
