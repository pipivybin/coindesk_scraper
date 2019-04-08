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
    
    common1 = doc.css("div#featured-articles")
    
    common1.css("div.meta h3").each do |x|
      @featured_articles = self.new
      @featured_articles.title = x.text
      @featured_articles.time = common1.css("div.meta div.time time").attr("datetime").value
      @featured_articles.url = common1.css("a.feature").attr("href").value
      end
    
    common2 = doc.css("div#article-streams")
    
    common2.css("div.meta h3").each do |x|
      @article_streams = self.new
      @article_streams.title = x.text
      @article_streams.time = common2.css("div.meta div.time time").attr("datetime").value
      @article_streams.url = common2.css("a.stream-article").attr("href").value
    end

 end
 
 def self.chosen_article(input)
  chosen = input.to_i
  link = self.all[chosen-1].url
  
  doc = Nokogiri::HTML(open(link))
  puts "#{doc.css("div.meta h1").text}"
  puts ""
  puts "#{doc.css("i.far.fa-clock span").text}"
  puts ""
  puts "#{doc.css("section.article-content").text}"
  puts ""
  
 end
  
    
    
  
  
end