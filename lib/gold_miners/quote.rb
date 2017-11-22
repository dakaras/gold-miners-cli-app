class GoldMiners::Quote
  attr_accessor :ticker, :name, :price, :volume, :low, :high
  @@all = []
  def initialize(ticker, name, price, volume, low, high)
    @ticker = ticker
    @name = name
    @price = price
    @volume = volume
    @low = low
    @high = high
    @@all << self
    # instances are created in Scraper.rb using .make_quotes but saved here in @@all when initialized
    # return value in initialize is always the created instance
  end

  def self.all
    # this class reader is called by .list_quotes to print a list of the instances generated in Scraper.rb
    @@all
  end
end
