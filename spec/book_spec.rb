require_relative 'all_methods'

describe Book do
  context 'when creating a new book' do

    test_book = Book.new(nil, 'The Hobbit', 'J.R.R. Tolkien')

    it('should have an id') do
      expect(test_book.id).not_to be_nil
    end

    it('should have a title') do
      expect(test_book.title).to eq 'The Hobbit'
    end

    it('should have an author') do
      expect(test_book.author).to eq 'J.R.R. Tolkien'
    end

    it('should have an empty array of rentals') do
      expect(test_book.rentals).to eq []
    end

    it('should have a method to_json') do
      expect(test_book.to_json).to be_a Hash
    end
  end
end