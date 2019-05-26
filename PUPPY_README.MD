
SETUP

Run 'bundle install'
Run 'gem install rest-client' (if you get a rest client error)

DIRECTORY STRUCTURE (directories/files I changed or added)

.bin\run.rb
  launches app, makes initial method calls
.db\migrate
   future home of migration files and db
.lib\api_communicator
  interacts with API
.lib\command_line_interface
  welcomes user, prompts for info
.lib\<class_name>.rb  
  future home of our class files
