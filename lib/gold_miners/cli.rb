# CLI Controller responsible for business logic/user interaction with app
class GoldMiners::CLI

  def call
    list_quotes
    menu
  end

  def list_quotes
    puts "QUOTES FROM TODAY'S SESSION ARE AVAILABLE FOR THE FOLLOWING:"
    puts "1. Ticker: NEM - Name: Newmont Mining"
    puts "2. Ticker: GG - Name: Goldcorp"
  end

  def menu
    puts "Enter a number for the stock you would like additional info on."
    puts "Type exit when finished."
    input = gets.to_i.strip

    while input != "exit"
      case input
      when input-1 == "1"
        puts "1. Ticker: NEM - Name: Newmont Mining - Price: 36.29 - Change: 1.68% - Volume: 2,404,011"
      when "2"
        puts "2. Ticker: GG - Name: Goldcorp - Price: 13.10 - Change: -0.53% - Volume: 1,955,126"
      else
        puts "Invalid entry. Please re-enter desired selection. Enter list to show all quotes or exit to finish."
      end
    end
  end
  
end
