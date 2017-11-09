class Scraper

  def get_page
    doc = Nokogiri::HTML(open("https://www.cnbc.com/quotes/?symbol=gdx%2C%20abx%2C%20nem%2C%20gg%2C%20sand%2C%20gold%2C%20iag%2C%20rgld%2C%20fnv%2C%20ego%2C%20auy%2C%20aem%2C%20au%2C%20gfi%2C%20kgc%2C%20ng"))
  end

end
