class GoldMiners::Scraper
  attr_accessor :ticker, :name, :price, :volume

  def get_page
    # instance method will be responsible for using Nokogiri and open-uri to grab the entire HTML document from cnbc.com
    doc = Nokogiri::HTML(open("https://www.cnbc.com/quotes/?symbol=gdx%2C%20abx%2C%20nem%2C%20gg%2C%20sand%2C%20gold%2C%20iag%2C%20rgld%2C%20fnv%2C%20ego%2C%20auy%2C%20aem%2C%20au%2C%20gfi%2C%20kgc%2C%20ng"))
  end

  def get_quotes
    # instance method will be responsible for using a CSS selector to grab all of the HTML elements that contain a quote
      self.get_page.css(".quote-custom-strip")
  end

  def make_quotes
    # instance method will be responsible for actually instantiating Quote objects and giving each quote object the correct attribute that we scraped
    get_quotes.map do |doc|
      quote = GoldMiners::Scraper.new
      quote.ticker = doc.css("span.symbol").text
      quote.name = doc.css("h1").text
      quote.price = doc.css("span.last").text.split("")[0..4].join
      quote.volume = doc.css("span.volume").text
      quote
    end
  end

end
# quote.ticker = doc.css(".quote-custom-strip").first.css("span.symbol").text
# quote.name = doc.css(".quote-custom-strip").first.css("h1").text
# quote.price = doc.css(".quote-custom-strip").first.css("span.last").text.split("")[0..4].join
# quote.volume = doc.css(".quote-custom-strip").first.css("span.volume").text
