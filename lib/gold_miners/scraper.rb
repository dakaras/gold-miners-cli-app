class GoldMiners::Scraper #scope accessor creates namespace
  attr_accessor :ticker, :name, :price, :volume, :low, :high

  def get_page
    # instance method will be responsible for using Nokogiri and open-uri to grab the entire HTML document from cnbc.com
    doc = Nokogiri::HTML(open("https://www.cnbc.com/quotes/?symbol=gdx%2C%20abx%2C%20nem%2C%20gg%2C%20sand%2C%20gold%2C%20iag%2C%20rgld%2C%20fnv%2C%20ego%2C%20auy%2C%20aem%2C%20au%2C%20gfi%2C%20kgc%2C%20ng"))
  end

  def get_quotes
    # instance method will be responsible for using a CSS selector to return XML elements as an array that contain all the attributes needed for a quote
      self.get_page.css(".quote-custom-strip")
  end

  def make_quotes
    # instance method will be responsible for iterating over XML array in .get_quotes
    # to instantiate Quote objects with corresponding properties, returned as an array of 16 instances.
    get_quotes.map do |doc|
      quote = GoldMiners::Scraper.new
      quote.ticker = doc.css("span.symbol").text
      quote.name = doc.css("h1").text
      quote.price = doc.css("span.last").text.split("")[0..4].join.gsub("%", "")
      quote.volume = doc.css("span.volume").text.split("")[0..6].join
      quote.low = doc.css(".low").text
      quote.high = doc.css(".high").text
      quote
    end
  end

end
# quote.ticker = doc.css(".quote-custom-strip").first.css("span.symbol").text
# quote.name = doc.css(".quote-custom-strip").first.css("h1").text
# quote.price = doc.css(".quote-custom-strip").first.css("span.last").text.split("")[0..4].join
# quote.volume = doc.css(".quote-custom-strip").first.css("span.volume").text
