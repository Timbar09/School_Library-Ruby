require 'json'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class ProcessData
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def store_person(person)
    if File.size?('./data/people.json')
      person_file = JSON.parse(File.read('./data/people.json')) << person.to_json

      File.write('./data/people.json', JSON.pretty_generate(person_file))
    else
      File.write('./data/people.json', JSON.pretty_generate([person.to_json]))
    end
  end

  def store_book(book)
    if File.size?('./data/books.json')
      book_file = JSON.parse(File.read('./data/books.json')) << book.to_json

      File.write('./data/books.json', JSON.pretty_generate(book_file))
    else
      File.write('./data/books.json', JSON.pretty_generate([book.to_json]))
    end
  end

  def store_rental(rental)
    if File.size?('./data/rentals.json')

      rental_file = JSON.parse(File.read('./data/rentals.json')) << rental.to_json

      File.write('./data/rentals.json', JSON.pretty_generate(rental_file))
    else
      File.write('./data/rentals.json', JSON.pretty_generate([rental.to_json]))
    end
  end

  def load_people
    return unless File.size?('./data/people.json')

    people = JSON.parse(File.read('./data/people.json'))
    people.each do |person|
      case person['type']
      when 'Student'
        @people << Student.new(person['id'], person['classroom'], person['age'], person['name'],
                               person['parent_permission'])
      when 'Teacher'
        @people << Teacher.new(person['id'], person['specialization'], person['age'], person['name'])
      end
    end

    @people
  end

  def load_books
    return unless File.size?('./data/books.json')

    books = JSON.parse(File.read('./data/books.json'))
    books.each do |book|
      @books << Book.new(book['id'], book['title'], book['author'])
    end

    @books
  end

  def load_rentals
    return unless File.size?('./data/rentals.json')

    rentals = JSON.parse(File.read('./data/rentals.json'))
    rentals.each do |rental|
      @rentals << Rental.new(rental['date'], rental['book'], rental['person'])
    end

    @rentals
  end
end
