require 'json'
require_relative 'person'
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
end