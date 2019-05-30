require 'pry'

####################################THIS IS THE WELCOME ########################

def welcome
  puts "Welcome to <app_name>!!".center(ENV["COLUMNS"].to_i, "#")
  puts
  puts "About P<app_nmae>..."
  puts
  puts "You'll be asked to enter a word"
  puts "<app_name> will fetch and deliver the highest rated definition"
end

def process_user #check if existing user, else create new record
  # Prompt current user for name
  puts "What's your name?"
  name = gets.chomp.downcase #this line is problematic because it downcases the name variable, and the user's name in creation
  
  current_user = User.find_by(name: name)

  # Checks if current user exists
  # if user name exists in User database
  if current_user
    # welcome user message
    puts "Welcome back #{name}!"
  else
    # create new user instance out of name, save to database
    current_user = User.create(name: name)
    # welcome new user message
    puts "Welcome to <app_name>, #{name}!"
  end 
    current_user
    # RETURNS CURRENT USER SO THAT WE CAN SEARCH DATA RELEVANT TO THIS ONE
    # WHEN CALLING THIS METHOD, SAVE VALUE TO A VARIABLE IN RUN.RB
end

def menu_selection(current_user)
  is_running = true
  while is_running
    present_menu
    user_selection = get_user_selection
    
    if user_selection == 1
      view_lexicon(current_user)
    elsif user_selection == 2
      # search for a word
    elsif user_selection == 3
      create_words(current_user)
    elsif user_selection == 4
      goodbye_message
    else # for all other possible selections
      puts "That was not a valid selection."
    end
  end
end

def present_menu
  puts
  puts "-----------------------"
  puts "SELECTION MENU"
  puts "1 - View lexicon"
  puts "2 - Search for a word <== NOT WORKING. DON'T ACTUALLY PICK THIS."
  puts "3 - Create a new word"
  puts "4 - Exit program"
  puts "-----------------------"
  puts
end

def get_user_selection
  puts "What next?"
  puts "Select a number."
  gets.chomp.to_i
end

def view_lexicon(current_user)
  if current_user.words.empty? == false
    current_user.print_lexicon
  else
    puts "You don't have any saved words to view yet."
  end
end

def create_words(current_user) 
  # add: check to see if any attributes are left blank, if so, reject creation
  puts 
  puts "CREATING A WORD"
  puts "-----------------------"
  puts "What is the new word you want to create?"
  headword = gets.chomp.downcase
  puts "What is the definition of #{headword.upcase}?"
  definition = gets.chomp
  puts "Give an example sentence using #{headword.upcase}"
  example = gets.chomp
  new_word = current_user.create_new_word(headword, definition, example)
  puts "You created a new word:"
  new_word.print_word_details
  puts
end

def goodbye_message
  puts "See ya."
  is_running = false
end

def process_word_query #search new word feature
  puts "Please enter a word."
  word = gets.chomp.downcase
end

def results(your_word, your_definition, example)
  if your_word != ""
    puts "YOUR WORD:  #{your_word}  "
    puts
    puts "DEFINITION:  #{your_definition}"
    puts
    puts "EXAMPLE: #{example}"
    puts
    puts "Would you like to save your word and it's details to your personal lexicon? Y/N"
    continue = gets.chomp.downcase
    wanna_continue(continue)

    #####please don't work on below code
    # if continue == "n"
    #   #wanna_continue(continue)
    # else
    #   result_hash = get_word_from_api
    #   process_api_hash(result_hash)
    #   puts "process_hash"
    #   binding.pry
    #   #another_word
    #   #Word.create(headword: your_word, definition: your_definition, example: example)
    # end
    # elsif your_word == ""
    ##############################################
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

###################please don't work on this stuff###########################
# def process_api_hash(result_hash)
#   word_ary_lex = []
#   result_hash.collect do |k,v|
#     v.each do |ary_data|

#       ary_data
#       binding.pry
#         ary_data.each do |detail, item|
#           your_definition = ary_data["definition"]
#           your_word = ary_data["word"]
#           your_example = ary_data["example"]
# binding.pry
#               Word.create(headword: your_word, definition: your_definition, example: example)

#             end
#           end
#       end
#     end
#   end

#word_ary_lex
#binding.pry
# end
##############################################################################
# def another_word
#   puts
#   puts
#   puts "                                            Would you like to try another word? Y/N"
#   continue = gets.chomp.downcase
#   wanna_continue(continue)
# end

#   def wanna_continue(continue)
#   sleep(1)
#   system('clear')
#      case continue
#        binding.pry
#      when "y"
#        process_word_query
#        another_word
#        #answer = true
#      when "n"
#        exit
#       # answer = false
#      when "q"
#        exit
#       # answer = false
#      else
#        try_again
#     end
#   end

# def try_again
#   puts ""
#   puts "                                              Sorry, I don't understand, please try again"
#   puts ""
# end
