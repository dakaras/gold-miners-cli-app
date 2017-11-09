class Scraper
  attr_accessor :ticker, :name, :price, :change, :volume

  def get_page
    # instance method will be responsible for using Nokogiri and open-uri to grab the entire HTML document from cnbc.com
    doc = Nokogiri::HTML(open("https://www.cnbc.com/quotes/?symbol=gdx%2C%20abx%2C%20nem%2C%20gg%2C%20sand%2C%20gold%2C%20iag%2C%20rgld%2C%20fnv%2C%20ego%2C%20auy%2C%20aem%2C%20au%2C%20gfi%2C%20kgc%2C%20ng"))
  end

  def get_quotes
    # responsible for using a CSS selector to grab all of the HTML elements that contain a quote
    self.get_page.css(".quote-custom-strip")
  end

  def make_quotes
    # responsible for actually instantiating Quote objects and giving each quote object the correct attribute that we scraped
  end

  def print_quotes
    # calls on .make_quotes and then iterates over all of the quotes that gets created to print a list of quotes 
  end
end
