require_relative 'app'
require_relative 'menu'

def main
  app = App.new
  loop do
    menu = Menu.new
    menu.display_menu

    option = gets.chomp
    case option
    when '1'
      app.list_all_books
    when '2'
      app.list_all_people
    when '3'
      app.create_person
    when '4'
      app.create_book
    when '5'
      app.create_rental
    when '6'
      app.list_all_rentals_for_person_id
    when '7'
      puts 'Thank you for using this app!'
      exit
    else
      puts 'That is not a valid option'
    end
  end
end
main
