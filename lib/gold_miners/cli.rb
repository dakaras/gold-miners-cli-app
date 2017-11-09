# CLI Controller responsible for business logic/user interaction with app
class GoldMiners::CLI

  def call
    list_quotes
    menu
  end

  def list_quotes
    puts "QUOTES FROM TODAY'S SESSION ARE AVAILABLE FOR THE FOLLOWING GOLD MINING STOCKS:"
    puts "1. Ticker: NEM - Name: Newmont Mining"
    puts "2. Ticker: GG - Name: Goldcorp"
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter a number for the stock you would like additional info on."
      puts "Enter list to display all stocks."
      puts "Enter exit when finished."
      input = gets.strip.downcase’
      case input
      when input == "1"
        puts "1. Ticker: NEM - Name: Newmont Mining - Price: 36.29 - Change: 1.68% - Volume: 2,404,011"
      when "2"
        puts "2. Ticker: GG - Name: Goldcorp - Price: 13.10 - Change: -0.53% - Volume: 1,955,126"
      when "list"
        list_quotes
      else
        puts "Invalid entry. Please re-enter desired selection. Enter list to display all stocks or exit to finish."
      end
    end
  end

end
