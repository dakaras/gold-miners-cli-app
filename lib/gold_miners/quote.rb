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
  end

  def self.all
    @@all
  end 
end
