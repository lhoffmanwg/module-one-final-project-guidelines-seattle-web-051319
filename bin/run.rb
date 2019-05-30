require_relative '../config/environment'
require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"
require 'pry'

#turn off debug msgs
old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil

#clear screen
system('clear')

#call methods
welcome
current_user = process_user
word = process_word_query
result_hash = get_word_from_api


binding.pry
