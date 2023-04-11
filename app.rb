require './student'
require './teacher'
require './book'
require './rental'

class App
  attr_reader :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def new_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp

    case person_type
    when '1'
      new_student
    when '2'
      new_teacher
    else
      puts 'Invalid input'
      new_person
    end
  end

  def permission?
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase
    if parent_permission == 'y'
      true
    elsif parent_permission == 'n'
      false
    else
      puts 'Invalid input'
      permission?
    end
  end

  def new_student
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    parent_permissio = permission?

    @people << Student.new(age, name, parent_permission)
    puts 'Student created successfully'
  end

  def new_teacher
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    @people << Teacher.new(age, specialization, name)
    puts 'Teacher created successfully'
  end

  def new_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)
    puts 'Book created successfully'
  end