require_relative 'book'
require_relative 'teacher'
require_relative 'student'
require_relative 'rental'

class App
  attr_accessor :book_lists, :user_lists, :rental_lists

  def initialize
    @book_lists = []
    @user_lists = []
    @rental_lists = []
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp
    case person_type
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid option'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    puts 'Has parent permission? [y/n]'
    parent_permission = gets.chomp
    parent_permission = case parent_permission.downcase
                        when 'y'
                          true
                        else
                          false
                        end
    puts 'Classroom:'
    classroom = gets.chomp
    add_new_student(classroom, age, name, parent_permission)
    puts 'Person created successfully'
  end

  def add_new_student(classroom, age, name, parent_permission)
    student = Student.new(classroom, age, name, parent_permission)
    @user_lists.push(student)
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    add_new_teacher(specialization, age, name, parent_permission: true)
    puts 'Person created successfully'
  end

  def add_new_teacher(specialization, age, name, parent_permission: true)
    teacher = Teacher.new(specialization, age, name, parent_permission)
    @user_lists.push(teacher)
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    add_new_book(title, author)
    puts 'Book created successfully'
  end

  def add_new_book(title, author)
    book = Book.new(title, author)
    @book_lists.push(book)
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @book_lists.each_with_index do |book, index|
      puts "#{index}) Title: '#{book.title}', Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    @user_lists.each_with_index do |user, index|
      puts "#{index}) [#{user.class}] Name: #{user.name}, ID: #{user.id}, Age: #{user.age}"
    end
    user_index = gets.chomp.to_i
    print 'Date [yyyy/mm/dd]: '
    date = gets.chomp
    add_new_rental(date, book_index, user_index)
    puts 'Rental created successfully'
  end

  def add_new_rental(date, book, person)
    rental = Rental.new(date, @book_lists[book], @user_lists[person])
    @rental_lists.push(rental)
  end

  def list_all_people
    @user_lists.each do |user|
      puts "Type: #{user.class}, Name: #{user.name}, ID: #{user.id}, Age: #{user.age}"
    end
  end

  def list_all_books
    @book_lists.each do |book|
      puts "Title: '#{book.title}', Author: #{book.author}"
    end
  end

  def list_all_rentals_for_person_id
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rental_lists.each do |rental|
      puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
    end
  end
end
