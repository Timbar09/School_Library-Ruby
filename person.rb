require '/nameable.rb'

class Person < Nameable
  @id_counter = 1

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = @id_counter
    @id_counter += 1
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_accessor :name, :age
  attr_reader :id

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
