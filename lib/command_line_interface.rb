def welcome
  puts "=========================================================="
  puts "Welcome to Lexi!!"
  puts
  puts "About Lexi..."
  puts
  puts "You'll be asked to enter a word,"
  puts "and Lexi will fetch and deliver the highest rated definition"
  puts "=========================================================="
end

def process_user #check if existing user, else create new record
  puts 
  puts "What's your name?"
  name = gets.chomp.downcase.capitalize

  current_user = User.find_by(name: name)

  # Checks if current user exists
  # if user name exists in User database
  system "clear"
  if current_user
    # welcome user message
    puts "Welcome back, #{name}!"
  else
    # create new user instance out of name, save to database
    current_user = User.create(name: name)
    # welcome new user message
    puts "Welcome to Lexi, #{name}!"
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
      # see word from lexicon
    elsif user_selection == 2
      process_word_query(current_user)
    elsif user_selection == 3
      create_words(current_user)
    elsif user_selection == 4
      puts "B.Y.E."
      is_running = false
    else # for all other possible selections
      invalid_input
    end
  end
end

def present_menu
  puts
  puts "~~~~~~~~~~~~~~~~~~~~~~~"
  puts
  puts "SELECTION MENU"
  puts
  puts "1 - View your lexicon"
  puts "2 - Search for a word"
  puts "3 - Create a new word"
  puts "4 - Exit program"
  puts
  puts "~~~~~~~~~~~~~~~~~~~~~~~"
  puts
end

def get_user_selection
  puts "What next?"
  puts "Select a number."
  gets.chomp.to_i
end

def view_lexicon(current_user)
  system "clear"
  puts "YOUR CURRENT LEXICON"
  puts "--------------------"
  if current_user.words.empty? == false
    current_user.print_lexicon
    # select a word you want to see more about
  else
    puts "You don't have any saved words to view yet."
  end
end

def create_words(current_user)
  # add: check to see if any attributes are left blank, if so, reject creation
  system "clear"
  
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

def process_word_query(current_user) # search a new word
  system "clear"
  
  puts "Please enter a word."
  input = gets.chomp.downcase
  # searches local database first
  word = Word.find_by headword: input
  if word != nil
      word.print_word_details
  else
      search_api(input, current_user)
  end
end
  # take user's input <word> and query urban_dictionary db via api, 
  # put the resulting hash that api returns into result_hash

  # search_local_db

# diplays the word, definition and exapmle to user
def search_api(word, current_user)
  result_hash = get_word_from_api(word)
  if result_hash["list"].length != 0
    # J - Return by Most Thumbs Up
    thumb_count = 0
    top_rated_entry = nil

    # takes the complete hash returned by the api 
    # processes it to find multiple definitions, words, example keys 
    # and grabs their associated values
    result_hash["list"].each do |ary_data| #iterate through each hash/entry
      if ary_data["thumbs_up"] > thumb_count
        thumb_count = ary_data["thumbs_up"]
        top_rated_entry = ary_data
      end 
    end
    binding.pry
    your_definition = top_rated_entry["definition"]
    your_word = top_rated_entry["word"]
    your_example = top_rated_entry["example"]
    # J- I think we can refactor this line below. 
    # It's looking similar to Word.print_word_details
    results(your_word, your_definition, your_example, current_user)
  else
    puts
    puts "This word don't exist!"
    puts
  end
end

def results(your_word, your_definition, your_example, current_user)
  puts
  puts "      WORD :   #{your_word.upcase}"
  puts "DEFINITION :   #{your_definition}"
  puts "   EXAMPLE :   #{your_example}"
  puts 
  # J - GOAL : Would like to save word via user_word creation
  
  puts "Would you like to save your word and it's details to your personal lexicon? Y/N"
  
  continue = gets.chomp.downcase
  
  if continue == "y" # saves word to user
    new_word = Word.create(headword: your_word, definition: your_definition, example: your_example)
    UserWord.create(user_id: current_user.id, word_id: new_word.id)
    current_user.reload
  elsif continue == "n" # asks user if they'd like to make another search
    puts "Would you like to search a different word? Y/N"
    response = gets.chomp.downcase
    if response == "y"
      process_word_query(current_user) # asks user to enter another word to search
    elsif response = "n"
      menu_selection(current_user) # returns user to menu
    else # if given inappropriate response
      invalid_input
    end
  else
    invalid_input
  end
end

def invalid_input
  puts "That was not a valid selection. Try again."
end

