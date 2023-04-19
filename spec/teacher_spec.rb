require_relative 'all_methods'

describe Teacher do
  context 'When testing the Teacher class, it' do
    mr_bob = Teacher.new(nil, 'Maths', 30, 'Bob')

    it 'should create a teacher' do
      expect(mr_bob).to be_a(Teacher)
    end

    it 'should have a method to_json' do
      expect(mr_bob.to_json).to be_a(Hash)
    end

    it 'should be able to use the library services' do
      expect(mr_bob.can_use_services?).to be true
    end
  end
end
