# require 'rest-client'
require 'json'
require 'pry'

result_hash = {}

def get_word_from_api(word)
  what_to_look_for = "http://api.urbandictionary.com/v0/define?term=#{word}"
  result_hash = JSON.parse(RestClient.get(what_to_look_for))
  result_hash
end
