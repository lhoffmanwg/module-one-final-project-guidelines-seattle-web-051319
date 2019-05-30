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
current_user = process_user
present_menu
menu_selection(current_user)
# word = process_word_query
# result_hash = get_word_from_api


# binding.pry
