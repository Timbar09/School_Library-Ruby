require_relative 'all_methods'

describe Person do
  context ': When creating a new person, it ' do
    test_person = Person.new(nil, 20, 'John')

    it('should create a person') do
      expect(test_person).to be_a Person
    end

    it('should have a method can_use_services') do
      expect(test_person.can_use_services?).to be true
    end

    it('should have a method correct_name') do
      expect(test_person.correct_name).to eq 'John'
    end

    it('should have a method add_rental') do
      test_book = Book.new(nil, 'The Hobbit', 'J.R.R. Tolkien')
      test_person.add_rental(test_book, '2021/08/04')

      expect(test_person.rentals[0].book).to eq test_book
    end

    it('should have a method of_age?') do
      expect(test_person.send(:of_age?)).to be true
    end
  end
end
