require_relative 'all_methods'

describe Book do
  context 'when creating a new book' do
    test_book = Book.new(nil, 'The Hobbit', 'J.R.R. Tolkien')

    it('should create a book') do
      expect(test_book).to be_a Book
    end

    it('should have a method to_json') do
      expect(test_book.to_json).to be_a Hash
    end

    it('should have a method add_rental') do
      expect(test_book.add_rental('John Doe', '2020-12-25')).to be_a Rental
    end
  end
end
