require_relative './rental'

class Book
  attr_accessor :title, :author, :rentals, :id

  def initialize(id, title, author)
    @id = id || Random.rand(1..1000)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end
end
