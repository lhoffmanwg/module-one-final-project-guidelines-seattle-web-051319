require 'pry'

####################################THIS IS THE WELCOME ########################

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
  puts "                                           About P<app_nmae>..."
  puts
  puts "                                           You'll be asked to enter a word"
  puts "                                           <app_name> will fetch and deliver the highest rated definition"
  puts
  puts
  puts
end

def process_user #check if existing user, else create new record
  puts "                                           What's your name?"
  name = gets.chomp.downcase
  if User.find_by(name: name)
      puts "                                           Welcome back #{name}!"
      puts ""
      puts ""
    else
      User.create(name: name)
      user_id = User.find_by(name: name).id
      puts"                                             Welcome to <app_name>, #{name}!"
      puts
      puts
      puts
  end
    user_id = User.find_by(name: name).id
end

def process_word_query
  puts "                                           Please enter a word."
  word = gets.chomp.downcase
  get_word_from_api(word)
end

def results(result_hash)
  result_hash.collect do |k,v|
    v.each do |ary_data|
      ary_data
          your_definition = ary_data["definition"]
          your_word = ary_data["word"]
          your_example = ary_data["example"]
          binding.pry
         end
      end

  if your_word != ""
    binding.pry
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
    puts "           DEFINITION:  #{your_definition}"
    puts
    puts "           EXAMPLE: #{example}"
    puts
    puts "           Would you like to save your word and it's details to your personal lexicon? Y/N"
    response = gets.chomp.downcase
    write_to_lex(response)
    if continue == "n"
      wanna_continue(continue)
    else
      result_hash = get_word_from_api
      process_api_hash(result_hash)
      puts "process_hash"
      binding.pry
      #another_word
      #Word.create(headword: your_word, definition: your_definition, example: example)
    end
    elsif your_word == ""
      binding.pry
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
#--------------when user says that they want to save their word and assc data, this is called to write to db.
def process_api_hash(result_hash, response)
  result_hash.collect do |k,v|
    v.each do |ary_data|
          your_definition = ary_data["definition"]
          your_word = ary_data["word"]
          your_example = ary_data["example"]
          if response = "y"
            Word.create(headword: your_word, definition: your_definition, example: example)
          end
      end
   end
 end

def process_api_two(result_hash) # need to merge this into the process_api_hash
  result_hash.collect do |k,v|
    v.each do |ary_data|
          your_definition = ary_data["definition"]
          your_word = ary_data["word"]
          your_example = ary_data["example"]
          puts your_definition
          puts your_word
          puts your_example
      end
   end
end

def write_to_lex(response, your_word, your_definition, your_example)
  if response = "y"
    Word.create(headword: your_word, definition: your_definition, example: example)
end

######## DUPLICATE #####################
# def results(result_hash)
#   result_hash.collect do |k,v|
#     v.each do |ary_data|
#       ary_data
#           your_definition = ary_data["definition"]
#           your_word = ary_data["word"]
#           your_example = ary_data["example"]
#           binding.pry
#          end
#       end

# def results(result_hash)
#   result_hash.collect do |k,v|
#     v.each do |ary_data|
#       ary_data
#           your_definition = ary_data["definition"]
#           your_word = ary_data["word"]
#           your_example = ary_data["example"]
#           binding.pry
#           end
#       end


def another_word
  puts
  puts
  puts "                                            Would you like to try another word? Y/N"
  continue = gets.chomp.downcase
  wanna_continue(continue)
end
############################### BROKEN ###############################################
  # def wanna_continue(continue)
  # sleep(1)
  # system('clear')
  #    case continue
  #      binding.pry
  #    when "y"
  #      process_word_query
  #      another_word
  #      #answer = true
  #    when "n"
  #      exit
  #     # answer = false
  #    when "q"
  #      exit
  #     # answer = false
  #    else
  #      try_again
  #   end
  # end

def try_again
  puts ""
  puts "                                              Sorry, I don't understand, please try again"
  puts ""
end
end
