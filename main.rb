#!/usr/bin/env ruby

require_relative './book'
require_relative './classroom'
require_relative './rental'
require_relative './student'
require_relative './teacher'

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

def main
  x = initial_prompt
  case x
  when 1
    puts '1 - List all books'
  when 2
    puts '2 - List all people'
  when 3
    puts '3 - Create a person'
  when 4
    puts '4 - Create a book'
  when 5
    puts '5 - Create a rental'
  when 6
    puts '6 - List all rentals for a given person'
  when 7
    puts '7 - Exit'
  else
    puts "ERROR: #{x} - Invalid input"
  end
end

main
