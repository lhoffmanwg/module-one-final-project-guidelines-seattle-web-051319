require 'pry'

def welcome
  puts
  puts
  puts
  puts
  puts
  puts
  puts
  puts ENV["COLUMNS"]
  puts "Welcome to <app_name>!!".center(ENV["COLUMNS"].to_i, "#")
  puts
  puts "                                           About P<app_nmae>..."
  puts
  puts "                                           You'll be asked to enter a word"
  puts "                                           <app_name> will fetch and deliver the highest rated definition"
  puts
  puts
  puts
end

# def process_user #check if existing user, else create new record
#   puts "                                           What's your name?"
#   name = gets.chomp.downcase
#   if User.find_by(first_name: name)
#       puts "                                           Welcome back #{name}!"
#       puts ""
#       puts ""
#     else
#       User.create(first_name: name)
#       user_id = User.find_by(first_name: name).id
#       puts"                                             Welcome to <app_name>, #{name}!"
#       puts
#       puts
#       puts
#   end
#     user_id = User.find_by(first_name: name).id
#end

def process_word_query
  puts "                                           Please enter a word."
  word = gets.chomp.downcase
end

def results
  answer = true
  if answer = true
    puts
    puts
    puts
    puts
    puts
    puts
    puts
    puts
    puts "           YOUR WORD "
    puts
    puts "           DEFINITION "
    puts
    puts "           EXAMPLE "
    puts
    puts "            "

    another_word

  end
   answer = false
   if answer == false
    puts
    puts
    puts
    puts
    puts
    puts
    puts
    puts
    puts
    puts
    puts                                             "Sorry, we didn't find <interpolate word> in our dictionary"
    puts
    puts
    puts
    puts                                             "Would you like to try another word? Y/N"
    continue = gets.chomp.downcase
    wanna_continue(continue)
  end
end

def another_word
  puts
  puts
  puts "                                            Would you like to try another word? Y/N"
  continue = gets.chomp.downcase
  wanna_continue(continue)
end

 def wanna_continue(continue)
#   sleep(1)
#   system('clear')
     case continue
     when "y"
       process_word_query
       another_word
       answer = true
     when "n"
       exit
       answer = false
     when "q"
       exit
       answer = false
     else
       try_again
    end
 end

def try_again
  puts ""
  puts "                                              Sorry, I don't understand, please try again"
  puts ""
end
