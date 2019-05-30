require_relative '../config/environment'
require_all 'lib'
require 'pry'

#turn off debug msgs
old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil

#clear screen
system('clear')

#call methods
welcome

####################### TO DO #################### vars are diff
<<<<<<< HEAD
$name = process_user
word = process_word_query
#binding.pry
#result_hash = get_word_from_api(word)


#binding.pry
=======
$current_user = process_user
present_menu
menu_selection(current_user)
# word = process_word_query
# result_hash = get_word_from_api


# binding.pry
>>>>>>> 9470a8c81dcbaeddc2f21bc2d175f68d62afbc8c
