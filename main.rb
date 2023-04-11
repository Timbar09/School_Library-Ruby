require './person'
require './decorator'
require './book'
require './rental'

# Test decorators
puts 'Test decorators'

person = Person.new(22, 'maximilianus')
puts person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name

# Test book rentals by persons
puts 'Test book rentals by persons'

book = Book.new('The Hobbit', 'J.R.R. Tolkien')
book.add_rental(person, '2021-01-01')
puts book.rentals.map(&:person).map(&:name)
puts person.rentals.map(&:book).map(&:title)
