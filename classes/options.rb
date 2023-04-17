require_relative './app'

class Options
  def initialize
    @app = App.new
  end

  def options(option)
    case option
    when '1' then @app.list_books
    when '2' then @app.list_people
    when '3' then @app.new_person
    when '4' then @app.new_book
    when '5' then @app.new_rental
    when '6' then @app.list_rentals
    else
      puts 'That is not a valid option'
    end
  end
end