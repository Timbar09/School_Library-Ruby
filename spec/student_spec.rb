require_relative 'all_methods'

describe Student do
  context ': When testing the Student class, it' do
    physics = Classroom.new('Physics')
    parent_permission = true
    tokyo = Student.new(nil, physics, 16, 'Tokyo', parent_permission)

    it 'should create a student' do
      expect(tokyo).to be_a(Student)
    end

    it 'should have a method to_json' do
      expect(tokyo.to_json).to be_a(Hash)
    end

    it 'should have a method play_hooky' do
      expect(tokyo.play_hooky).to eq '¯(ツ)/¯'
    end

    it 'should have a method add_classroom' do
      tokyo.add_classroom(physics)
      expect(tokyo.classroom).to eq physics
    end
  end
end
