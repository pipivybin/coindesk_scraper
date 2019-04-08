require 'pry'

class CoindeskScraper::CLI
  
  def call 
    puts "Today's top 10 news are here!"
    puts ""
    make_list
    list
    menu
  end
  
  def make_list
    CoindeskScraper::Articles.make_articles
  end
  
  def list
    CoindeskScraper::Articles.all.each_with_index do |one_article, index|
      puts "No #{index+1}. #{one_article.title} - #{one_article.time} - #{one_article.url}"
    end
    puts ""
  end
  
  def menu
    loop do
      puts "Tell me what you would like to do next:"
      puts "- You can choose a number from the list to read more"
      puts "- You can review the list by typing list"
      puts "- Or you can type exit to exit"
      puts ""
      input = gets.strip.chomp.downcase
    
      if input == "exit"
        puts "Thank you for visiting us! You have a wonderful day!"
        CoindeskScraper::Articles.clear_all
        break
      elsif (1..CoindeskScraper::Articles.all.length) === input.to_i
        puts "Here's No.#{input.to_i} article for you!"
        puts ""
        CoindeskScraper::Articles.chosen_article(input)
      elsif input == "list"
        puts list
        
      else 
        puts "Please input a number between 1 - #{CoindeskScraper::Articles.all.length} or type exit."
        puts ""
        
      end
    end
  end
  
  
  
end