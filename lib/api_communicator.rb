# require 'rest-client'
require 'json'
require 'pry'

#word = "dank"

def get_word_from_api(word)
  what_to_look_for = 'http://api.urbandictionary.com/v0/define?term={word}'
  response_hash = JSON.parse(RestClient.get(what_to_look_for))
  r#esults = response_hash["results"]

  binding.pry
 end
# #http://api.urbandictionary.com/v0/define?term={word}
# 'http://api.urbandictionary.com/v0/define?term={"dank"}'
# http://api.urbandictionary.com/v0/define?term={dank}
