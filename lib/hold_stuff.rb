<<<<<<< HEAD
  puts
  puts
  puts
  puts
  puts
  puts "                                           Welcome to <app_name>!!".center(ENV["COLUMNS"].to_i, "#")
  puts
  puts "                                           About P<app_name>..."
  puts
  puts "                                           You'll be asked to enter a word"
  puts "                                           <app_name> will fetch and deliver the highest rated definition"
  puts
  puts
  puts
end

# check to see is new or existing user, add new user to DB

def process_user
  # get user input
  puts "                                           What's your name?"
  name = gets.chomp.downcase
  # look for user in db
  if User.find_by(name: name)
      puts "                                           Welcome back #{name}!"
      puts ""
      puts ""
    else
      # user not found so create a new user
      User.create(name: name)
      puts"                                             Welcome to <app_name>, #{name}!"
      puts
      puts
      puts
  end
  name
end

#
# takes word from user
#
def process_word_query
  #
  # counter for loop that presents first <limit> words found in db
  #
  counter = 1
  limit = 2
  #
  # ask for word from user
  #
  puts "                                           Please enter a word."
=======
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

def process_word_query #search new word feature
  puts "Please enter a word."
>>>>>>> 9470a8c81dcbaeddc2f21bc2d175f68d62afbc8c


def another_word
  puts
  puts
  puts "                                            Would you like to try another word? Y/N"
  continue = gets.chomp.downcase
  wanna_continue(continue)
end

  def wanna_continue(continue)
  sleep(1)
  system('clear')
     if continue == "y"
       binding.pry
       process_word_query
       another_word
     elsif continue == "n"
       exit
     elsif continue == "q"
       exit
     else
       try_again
    end
end
