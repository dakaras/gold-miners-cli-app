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
    # puts "1. Ticker: NEM - Name: Newmont Mining"
    # puts "2. Ticker: GG - Name: Goldcorp"
    # calls on .make_quotes and then iterates over all of the quotes that gets created to print a list of quotes
    @quotes = GoldMiners::Scraper.new.make_quotes #creates an instance of Scraper class to store in instance variable
    @quotes.each.with_index(1) do |quote, i|
      puts "#{i}. Ticker: #{quote.ticker} Name: #{quote.name}"
    end
    puts " "
  end

  def menu
    input = nil 
    while input != "exit"
      puts "Enter a number for the stock you would like additional info on."
      puts "Enter list to display all stocks."
      puts "Enter exit when finished."
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i < 17
        quote = @quotes[input.to_i-1]
        puts " "
        puts "Ticker: #{quote.ticker} Name: #{quote.name} Price: #{quote.price} Volume: #{quote.volume}"
        puts " "
      elsif "list"
        puts " "
        list_quotes
        puts " "
      elsif "exit"
        break
      else
        puts " "
        puts "Invalid entry. Please re-enter desired selection. Enter list to display all stocks or exit to finish."
        puts " "
        input = gets.strip.downcase
      end
    end
  end

  def finish
    puts " "
    puts "The program is now exiting. Thank you for using the Gold Miners CLI App!"
    puts " "
  end

end
