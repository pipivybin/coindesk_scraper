
 class CoindeskScraper::Articles
 @@all = []
 attr_accessor :title, :time, :url
  
  def initialize
    save
  end
  
  def save
    self.class.all << self
  end
  
  def self.all
    @@all
  end
  
  def self.clear_all
    self.all.clear
  end
  

  
  def self.make_articles
    Scraping.scrape.each do
     |articlehash|  @article = self.new
      articlehash.each do
      |x, y| @article.send("#{x}=", y)
      end
    end
  end

 
def self.chosen_article(input)
  chosen = input.to_i
  link = self.all[chosen-1].url
  Scraping.scrapearticle(link)
end

end