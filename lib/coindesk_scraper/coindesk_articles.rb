 require 'open-uri'
 require 'nokogiri'
 require 'pry'
 
 class CoindeskScraper::Articles
 @@all = []
 attr_accessor :title, :time, :url
  
  # def self.get_page
  #   html = open("https://www.coindesk.com/")
  #   doc = Nokogiri::HTML(html)
  # end
  
  # def self.scrape
  #   @article = self.new
  #   doc = self.get_page
    
  # end
  
  def initialize
    save
  end
  
  def save
    self.class.all << self
  end
  
  def self.all
    @@all
  end
  
  def self.make_articles
    html = open("https://www.coindesk.com/")
    doc = Nokogiri::HTML(html)
    
    @top_article = self.new
    @top-article.title = doc.css("div#top-article div.meta h1").text
    @top-article.time = doc.css("div#top-article div.meta div.time time").attr("datetime").value
    @top-article.url = doc.css("div#top-article a.top-article").attr("href").value
    
    common1 = doc.css("div#featured-articles")
    
    common1.each do |x|
      @featured_articles = self.new
      @featured_articles.title = x.css("div.meta h3").text
      @featured_articles.time = x.css("div.meta div.time time").attr("datetime").value
      @featured_articles.url = x.css("a.top-article").attr("href").value
      end
    
    common2 = doc.css("div#article-streams")
    
    common2.each do |x|
      @article_streams = self.new
      @article_streams.title = x.css("div.meta h3").text
      @article_streams.time = x.css("div.meta div.time time").attr("datetime").value
      @article_streams.url = x.css("a.stream-article").attr("href").value
    end
   
 end
  
    
    
  
  
end