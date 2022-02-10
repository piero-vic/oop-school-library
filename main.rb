#!/usr/bin/env ruby

require_relative './book'
require_relative './rental'
require_relative './student'
require_relative './teacher'

@people = []
@books = []
@rentals = []

def initial_prompt
  puts <<~HEREDOC
    Welcome to School Library App

    Please choose an option by entering a number:
    1 - List all books
    2 - List all people
    3 - Create a person
    4 - Create a book
    5 - Create a rental
    6 - List all rentals for a given person
    7 - Exit
  HEREDOC
  gets.chomp.to_i
end

def one_line_prompt(message)
  print message
  gets.chomp
end

# 1 - List all books
def list_books
  puts(@books.map { |b| "Title: #{b.title}, Author: #{b.author}" })
end

# 2 - List all people
def list_people
  puts(@people.map { |p| "[#{p.class.name}] Name: #{p.name}, ID: #{p.id}, Age: #{p.age}" })
end

# 3 - Create a person
def create_person
  selection = one_line_prompt('Do you want to create a student (1) or a teacher (2)? [input the number]: ').to_i

  unless [1, 2].include?(selection)
    puts "You gave me #{x} -- I have no idea what to do with that."
    return
  end

  age = one_line_prompt('Age: ').to_i
  name = one_line_prompt('Name: ')

  case selection
  when 1
    input = one_line_prompt('Has parent permission? [Y/N]: ')
    permission = %w[Y y Yes yes].include?(input)
    @people.push(Student.new(age, name, parent_permission: permission))
  when 2
    specialization = one_line_prompt('Specialization: ')
    @people.push(Teacher.new(specialization, age, name))
  end
end

# 4 - Create a book
def create_book
  title = one_line_prompt('Title: ')
  author = one_line_prompt('Author: ')
  @books.push(Book.new(title, author))
end

# 5 - Create a rental
def create_rental
  puts 'Select a book from the following list by number'
  puts(@books.map { |b, i| "#{i}) Title: #{b.title}, Author: #{b.author}" })
  book_index = gets.chomp.to_i

  puts 'Select a person from the following list by number (not id)'
  puts(@people.map { |p, i| "#{i}) [#{p.class.name}] Name: #{p.name}, ID: #{p.id}, Age: #{p.age}" })
  person_index = gets.chomp.to_i

  date = one_line_prompt('Date: ')

  @rentals.push(Rental.new(date, @people[person_index], @books[book_index]))
end

# 6 - List rentals
def list_rentals
  id = one_line_prompt('ID of person: ').to_i
  person = @people.filter { |p| p.id == id }.first
  puts 'Rentals:'
  puts(person.rentals.map { |r| "Date: #{r.date}, Book #{r.book.title} by #{r.book.author}" })
end

def main
  loop do
    x = initial_prompt
    case x
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals
    when 7
      break
    else
      puts "ERROR: #{x} - Invalid input"
    end
  end
end

main
