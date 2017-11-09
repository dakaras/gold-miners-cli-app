# CLI Controller responsible for business logic/user interaction with app
class GoldMiners::CLI

  def call
    list_quotes
    menu
    finish
  end

  def list_quotes
    puts " "
    puts "QUOTES FROM TODAY'S SESSION ARE AVAILABLE FOR THE FOLLOWING GOLD MINING STOCKS:"
    puts "1. Ticker: NEM - Name: Newmont Mining"
    puts "2. Ticker: GG - Name: Goldcorp"
    puts " "
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter a number for the stock you would like additional info on."
      puts "Enter list to display all stocks."
      puts "Enter exit when finished."
      input = gets.strip.downcase
      case input
      when "1"
        puts " "
        puts "1. Ticker: NEM - Name: Newmont Mining - Price: 36.29 - Change: 1.68% - Volume: 2,404,011"
        puts " "
      when "2"
        puts " "
        puts "2. Ticker: GG - Name: Goldcorp - Price: 13.10 - Change: -0.53% - Volume: 1,955,126"
        puts " "
      when "list"
        puts " "
        list_quotes
        puts " "
      when "exit"
        break
      else
        puts " "
        puts "Invalid entry. Please re-enter desired selection. Enter list to display all stocks or exit to finish."
        puts " "
      end
    end
  end

  def finish
    puts " "
    puts "The program is now exiting. Thank you for using the Gold Miners CLI App!"
    puts " "
  end

end
