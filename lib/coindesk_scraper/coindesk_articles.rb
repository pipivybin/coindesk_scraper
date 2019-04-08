 require 'open-uri'
 require 'nokogiri'
 require 'pry'
 
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
    html = open("https://www.coindesk.com/")
    doc = Nokogiri::HTML(html)
    
    @top_article = self.new
    @top_article.title = doc.css("div#top-article div.meta h1").text
    @top_article.time = doc.css("div#top-article div.meta div.time time").attr("datetime").value
    @top_article.url = doc.css("div#top-article a.top-article").attr("href").value
    
    feature = doc.css("a.feature")
    
    feature.each do |x|
      @featured_articles = self.new
      @featured_articles.title = x.css("div.meta h3").text
      @featured_articles.time = x.css("div.meta div.time time").attr("datetime").value
      @featured_articles.url = x.attr("href")
      end
    
    streams = doc.css("a.stream-article")
    
    streams.each do |x|
      @article_streams = self.new
      @article_streams.title = x.css("div.meta h3").text
      @article_streams.time = x.css("div.meta div.time time").attr("datetime").value
      @article_streams.url = x.attr("href")
    end

 end
 
 def self.chosen_article(input)
  chosen = input.to_i
  link = self.all[chosen-1].url
  doc = Nokogiri::HTML(open(link))
  if doc.css("div.meta h1").text == "" || nil
    puts "#{self.all[chosen-1].title}"
    puts ""
    puts "To find out more, please click the link: #{link}"
    puts ""
  else
    puts "#{doc.css("div.meta h1").text}"
    puts ""
    puts "#{doc.css("div.timestamp span").text}"
    puts ""
    puts "#{doc.css("div.entry-content").text.strip}"
    puts ""

  end
 end
  
    
    
  
  
end