require_relative 'all_methods'

describe Person do
    context 'when creating a new person' do
        test_person = Person.new(nil, 20, 'John')
    
        it('should have an id') do
        expect(test_person.id).not_to be_nil
        end
    
        it('should have a name') do
        expect(test_person.name).to eq 'John'
        end
    
        it('should have an age') do
        expect(test_person.age).to eq 20
        end
    
        it('should have an empty array of rentals') do
        expect(test_person.rentals).to eq []
        end

        it('should have a method can_use_services') do
        expect(test_person.can_use_services?).to be true
        end
    end
end