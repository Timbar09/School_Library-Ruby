require_relative 'all_methods'

describe Teacher do
  context 'When testing the Teacher class, it' do
    mr_bob = Teacher.new(nil, 'Maths', 30, 'Bob')

    it 'should be an instance of Teacher' do
      expect(mr_bob).to be_a(Teacher)
    end

    it 'should have an id' do
      expect(mr_bob.id).to be_a(Integer)
    end

    it 'should have the correct name' do
      expect(mr_bob.correct_name).to eq('Bob')
    end

    it 'should be able to use the library services' do
      expect(mr_bob.can_use_services?).to be true
    end

    it 'should have the correct specialization' do
      expect(mr_bob.specialization).to eq('Maths')
    end

    it 'should have the correct age' do
      expect(mr_bob.age).to eq(30)
    end
  end
end
