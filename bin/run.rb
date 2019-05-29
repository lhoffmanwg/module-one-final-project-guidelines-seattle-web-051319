require_relative '../config/environment'
require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"
require_relative "../lib/cli_methods.rb"

#turn off debug msgs
old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil

#clear screen
system('clear')

#call methods
welcome
#process_user
ingredient = process_recipe_query
get_recepies_from_api(ingredient)
