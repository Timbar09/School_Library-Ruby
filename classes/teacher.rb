require_relative './person'

class Teacher < Person
  attr_accessor :specialization, :name

  def initialize(id, specialization, age, name = 'Unknown')
    super(id, age, name)
    @specialization = specialization
  end

  def to_json(*_args)
    {
      'type' => self.class.name,
      'id' => @id,
      'name' => @name,
      'age' => @age,
      'specialization' => @specialization
    }
  end

  def can_use_services?
    true
  end
end
