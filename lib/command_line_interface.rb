require 'pry'

# welcome user

def welcome
  puts
  puts
  puts
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
  puts "                                           What's your name?"
  name = gets.chomp.downcase
  if User.find_by(name: name)
      puts "                                           Welcome back #{name}!"
      puts ""
      puts ""
    else
      User.create(name: name)
      puts"                                             Welcome to <app_name>, #{name}!"
      puts
      puts
      puts
  end
  name
end

def process_word_query
  #user_id = User.find_by(name: name).id
  counter = 1
  limit = 2
  puts "                                           Please enter a word."
  word = gets.chomp.downcase
  result_hash = get_word_from_api(word)
  result_hash.each do |k,v|

      v.each do |ary_data|
            if counter > limit
              break
            else
              counter = counter + 1
            end
            your_definition = ary_data["definition"]
            your_word = ary_data["word"]
            your_example = ary_data["example"]
            process_results(your_definition, your_word, your_example)
      end
    end
end

def process_results(your_definition, your_word, your_example)
    puts
    puts
    puts
    puts
    puts
    puts
    puts
    puts
    puts "           YOUR WORD:  #{your_word}  "
    puts
    puts
    puts "           DEFINITION:  #{your_definition}"
    puts
    puts
    puts "           EXAMPLE: #{your_example}"
    puts
    puts
    puts
    puts "           Would you like to save your word and it's details to your personal lexicon? Y/N"
    puts
    puts
    puts
    puts
    puts
    puts
    puts
    continue = gets.chomp.downcase
    if continue == "n"
      another_word
    elsif continue == "y"
      # add word to database
      Word.create(headword: your_word, definition: your_definition, example: your_example)

      # get user and word ids and add record to join table
      uId = User.find_by(name: $name).id
      wId = Word.last.id
      UserWord.create(user_id: uId, word_id: wId)
    end
end

#
# when user says that they want to save their word and assc data, this is called to write to db
#
def process_api_hash(result_hash)
  result_hash.collect do |k,v|
    v.each do |ary_data|
          your_definition = ary_data["definition"]
          your_word = ary_data["word"]
          your_example = ary_data["example"]
      end
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

def try_again
  puts ""
  puts "                                              Sorry, I don't understand, please try again"
  puts ""
end
