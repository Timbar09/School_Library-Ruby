require_relative 'all_methods'

describe Classroom do
  context ': When creating a new classroom, it ' do
    classroom = Classroom.new('Math')
    student = Student.new(nil, classroom, 17, 'John Doe', true)

    it 'should create a classroom' do
      expect(classroom).to be_a(Classroom)
    end

    it 'should have a method add_student that adds a student to the classroom' do
      classroom.add_student(student)
      expect(classroom.students).to eql([student])
    end
  end
end
