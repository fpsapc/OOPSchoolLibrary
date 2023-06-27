require_relative './book_methods'
require_relative './person_methods'
require_relative './rental_methods'
require_relative './storage'

class App
  def initialize(options)
    @options = options
    @book_methods = BookMethods.new
    @person_methods = PersonMethods.new
    @rentals_list = RentalMethods.new(@book_methods, @person_methods)
    @book_methods.books_list = Storage.load_data('books')
    @person_methods.people_list = Storage.load_data('Person')
    @rentals_list.rentals_list = Storage.load_data('Rental')
  end

  def select_option(user_choice)
    case user_choice
    when '1'
      @book_methods.list_all_books
    when '2'
      @person_methods.list_all_people
    when '3'
      @person_methods.create_person
      Storage.save_date('Person', @person_methods.people_list)
    when '4'
      @book_methods.create_book
      Storage.save_date('books', @book_methods.books_list)
    when '5'
      @rentals_list.create_rental
      Storage.save_date('Rental', @rentals_list.rentals_list)
    when '6'
      @rentals_list.list_all_rentals
    when '7'
      exit
    else
      puts 'Invalid option, please try again!'
    end
    @options.show_menu
  end
end