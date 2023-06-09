require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'
require_relative './process_data'

class App
  attr_reader :books, :people, :rentals

  def initialize
    @data = ProcessData.new
    @books = @data.load_books
    @people = @data.load_people
    @rentals = @data.load_rentals
  end

  def new_person
    puts ''
    puts 'Do you want to:'
    puts '- Create a student (press 1) or a teacher (press 2)?'
    puts '- Go back to main menu (press 3)'
    puts ''
    print 'Enter your choice: '
    person_type = gets.chomp

    case person_type
    when '1' then new_student
    when '2' then new_teacher
    when '3' then nil
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
    puts ''
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    parent_permission = permission?

    student = Student.new(nil, nil, age, name, parent_permission)
    @people << student
    @data.store_person(student)
    puts ''
    puts 'Student created successfully!'
    puts '___________________________________________________________'
  end

  def new_teacher
    puts ''
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(nil, specialization, age, name)
    @people << teacher
    @data.store_person(teacher)
    puts ''
    puts 'Teacher created successfully!'
    puts '___________________________________________________________'
  end

  def new_book
    puts ''
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(nil, title, author)
    @books << book
    @data.store_book(book)
    puts ''
    puts 'Book created successfully'
    puts '___________________________________________________________'
  end

  def list_books
    puts ''
    puts "Books(#{books.length}):"
    if @books.empty?
      puts 'No books available!'
      puts '___________________________________________________________'
      return
    end

    @books.each_with_index do |book, index|
      puts "#{index + 1}) - Title: #{book.title}, Author: #{book.author}"
    end
    puts '___________________________________________________________'
  end

  def list_people
    puts ''
    puts "People(#{people.length}):"
    if @people.empty?
      puts 'No people available!'
      puts '___________________________________________________________'
      return
    end

    @people.each_with_index do |person, index|
      puts "#{index + 1}) - [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    puts '___________________________________________________________'
  end

  def new_rental
    puts 'Select a book from the following list by number'
    list_books
    puts ''
    puts 'Enter the number: '
    book_index = gets.chomp.to_i - 1
    puts ''

    puts 'Select a person from the following list by number (not id)'
    list_people
    puts ''
    puts 'Enter the number: '
    person_index = gets.chomp.to_i - 1
    puts ''

    print 'Enter date: '
    date = gets.chomp

    rental = Rental.new(date, @books[book_index], @people[person_index])
    @rentals << rental
    @data.store_rental(rental)
    puts ''
    puts 'Rental created successfully'
    puts '___________________________________________________________'
  end

  def list_rentals
    puts 'Enter ID of person from the list below: '
    list_people
    puts ''
    print 'ID: '
    person_id = gets.chomp.to_i
    person_rentals = @rentals.select { |rental| rental.person['id'] == person_id }
    puts "Rentals for #{person_id}:"
    puts ''
    if person_rentals.empty?
      puts 'No rentals for this ID!'
      puts '___________________________________________________________'
      return
    end

    person_rentals.each_with_index do |rental, index|
      the_rental = "Rental #{index + 1} - Book: #{rental.book['title']}"
      renter = "#{rental.book['author']}, Person: #{rental.person['name']}, Date: #{rental.date}"
      puts "#{the_rental} by #{renter}"
    end
    puts '___________________________________________________________'
  end
end
