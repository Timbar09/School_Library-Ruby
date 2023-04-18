class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date

    @book = book
    @book.rentals << self if @book.is_a?(Book)

    @person = person
    @person.rentals << self if @person.is_a?(Person)
  end

  def to_json(*_args)
    {
      'date' => @date,
      'book' => @book.to_json,
      'person' => @person.to_json
    }
  end
end
