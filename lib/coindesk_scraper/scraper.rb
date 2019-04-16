class Scraping
  
  def self.scrape
    html = open("https://www.coindesk.com/")
    doc = Nokogiri::HTML(html)
    articles = []
    
    article1 = {}
    article1[:title] = doc.css("div#top-article div.meta h1").text
    article1[:time] = doc.css("div#top-article div.meta div.time time").attr("datetime").value
    article1[:url]  = doc.css("div#top-article a.top-article").attr("href").value
    articles << article1
    
    feature = doc.css("a.feature")
    feature.each do |x|
      article2 = {}
      article2[:title] = x.css("div.meta h3").text
      article2[:time] = x.css("div.meta div.time time").attr("datetime").value
      article2[:url] = x.attr("href")
      articles << article2
      end
    
    streams = doc.css("a.stream-article")
    streams.each do |x|
      article3 = {}
      article3[:title] = x.css("div.meta h3").text
      article3[:time] = x.css("div.meta div.time time").attr("datetime").value
      article3[:url] = x.attr("href")
      articles << article3
    end
    articles
  end
  
  def self.scrapearticle(link)
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
