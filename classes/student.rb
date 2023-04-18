require_relative './person'
require 'json'

class Student < Person
  attr_accessor :classroom

  def initialize(id, classroom, age, name, parent_permission)
    super(id, age, name)
    @classroom = classroom
    @parent_permission = parent_permission
  end

  def to_json
    {
      'type' => self.class.name,
      'id' => @id,
      'name' => @name,
      'age' => @age,
      'classroom' => @classroom,
      'parent_permission' => @parent_permission
    }
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end
end
