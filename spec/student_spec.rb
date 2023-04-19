require_relative 'all_methods'

describe Student do
  context 'When testing the Student class, it' do
    physics = Classroom.new('Physics')
    parent_permission = true
    tokyo = Student.new(nil, physics, 16, 'Tokyo', parent_permission)

    it 'should create a new student' do
      expect(tokyo).to be_a(Student)
    end

    it 'should have an id' do
      expect(tokyo.id).to be_a(Integer)
    end

    it 'should have the correct name' do
      expect(tokyo.name).to eq('Tokyo')
    end

    it 'should have the correct age' do
      expect(tokyo.age).to eq(16)
    end

    it 'should have the correct parent permission' do
      expect(tokyo.can_use_services?).to be_truthy
    end

    it 'should have a classroom' do
      expect(tokyo.classroom).to be_a(Classroom)
    end
  end
end
