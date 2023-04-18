require_relative './person'

class Student < Person
  attr_accessor :classroom

  def initialize(id, classroom, age, name, parent_permission)
    super(id, age, name)
    @classroom = classroom
    @parent_permission = parent_permission
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end
end
