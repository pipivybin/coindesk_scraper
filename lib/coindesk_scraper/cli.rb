class CoindeskScraper::CLI
  
  def call 
    puts "Today's top 10 news are here!"
    list
    menu
  end
  
  def list
    puts "No. Title - Time - URL"
  end
  
  def menu
    loop do
      puts "Tell me what you would like to do next:"
      puts "- You can choose a number from the list to read more"
      puts "- You can review the list by typing list"
      puts "- Or you can type exit to exit"
      input = gets.strip.chomp.downcase
    
      if input == "exit"
        puts "Thank you for visiting us! You have a wonderful day!"
        break
      elsif (1..10) === input.to_i
        puts "Here's No.#{input.to_i} article for you!"
      elsif input == "list"
        puts list
      else puts "Please input a number between 1 - 10 or type exit."
        
      end
    end
  end
  
  
  
end