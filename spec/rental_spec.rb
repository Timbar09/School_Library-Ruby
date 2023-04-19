require_relative 'all_methods'

describe Rental do
    context 'when creating a new rental' do
        book = Book.new(nil, 'Title', 'Author')
        person = Person.new(nil, 20, 'John')

        test_rental = Rental.new('2020-01-01', book, person)

        it('should have a date') do
        expect(test_rental.date).to eq '2020-01-01'
        end

        it('should have a book') do
        expect(test_rental.book).to eq book
        end

        it('should have a person') do
        expect(test_rental.person).to eq person
        end

        it('should have a method to_json') do
        expect(test_rental.to_json).to be_a(Hash)
        end

        it('should have a method to_json with the correct keys') do
        expect(test_rental.to_json.keys).to eq %w[date book person]
        end

        it('book rentals should have this rental') do
        expect(book.rentals).to include(test_rental)
        end

        it('person rentals should have this rental') do
        expect(person.rentals).to include(test_rental)
        end
    end
end