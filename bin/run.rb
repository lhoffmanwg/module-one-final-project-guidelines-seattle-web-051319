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
current_user = process_user
menu_selection(current_user)

# binding.pry
